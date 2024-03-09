#/bin/bash
set -e

export KBUILD_BUILD_USER=Sundram
export KBUILD_BUILD_HOST=Actions

# Export compiler path
export PATH="$CLANG_PATH/bin:$PATH"

# Build the kernel
make O=out ARCH=arm64 tulip_defconfig
make O=out ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CC=clang LD=ld.lld AS=llvm-as AR=llvm-ar OBJDUMP=llvm-objdump READELF=llvm-readelf -j$(nproc)

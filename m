From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 21:47:55 +0200
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add
 qemu_riscv64_virt_defconfig
In-Reply-To: <20180831143853.24340-1-mark.corbin@embecosm.com>
References: <20180831143853.24340-1-mark.corbin@embecosm.com>
Message-ID: <20180902214755.139a1b23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Fri, 31 Aug 2018 15:38:53 +0100, Mark Corbin wrote:
> Add RISC-V 64-bit defconfig for QEMU virt machine.
> 
> Tested with QEMU 2.12.1

Here you say 2.12.1, in the readme.txt file you say 2.12.92. I assume
one or the other has a typo :-)

>  board/qemu/riscv64-virt/linux.config | 24 ++++++++++++++++++++++++
>  board/qemu/riscv64-virt/readme.txt   | 22 ++++++++++++++++++++++
>  configs/qemu_riscv64_virt_defconfig  | 24 ++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)

Please add an entry in the DEVELOPERS file. When you will do a patch
series with the base RISC-V support:

 - The patch introducing the RISC-V support should add an entry in the
   DEVELOPERS file for you, the arch/Config.in.riscv file and other
   files introduced by this first patch.

 - The patch introducing the RISC-V qemu defconfig should add more
   items to the DEVELOPERS file entry, to list the files related to
   this defconfig.

> diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
> new file mode 100644
> index 0000000000..be563c969e
> --- /dev/null
> +++ b/board/qemu/riscv64-virt/readme.txt
> @@ -0,0 +1,22 @@
> +Run the emulation with:
> +
> +  qemu-system-riscv64 -M virt -kernel <path-to-bl>/bbl -append "root=/dev/vda ro console=ttyS0" -drive file=<path-to-buildroot>/output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
> +
> +The Buildroot generated vmlinux image will need to be combined with the Berkeley Boot Loader (BBL) as follows:
> +
> +  export RISCV=<path-to-buildroot>/output/host
> +  export PATH=$PATH:$RISCV/bin
> +  git clone https://github.com/riscv/riscv-pk
> +  cd riscv-pk
> +  mkdir build
> +  cd build
> +  ../configure \
> +    --host=riscv64-buildroot-linux-gnu \
> +    --with-payload=<path-to-buildroot>/output/images/vmlinux
> +  make

Then we want to create a package for the BBL, in boot/riscv-pk/. See
boot/boot-wrapper-aarch64/ for an example of bootloader wraps the
kernel image. It depends on the kernel build in Config.in:

config BR2_TARGET_BOOT_WRAPPER_AARCH64
        bool "boot-wrapper-aarch64"
        depends on BR2_aarch64
        depends on BR2_LINUX_KERNEL

And then in the .mk file, we ensure the Linux kernel is built before:

BOOT_WRAPPER_AARCH64_DEPENDENCIES = linux

And we pass the path to the kernel tree (which it needs to get the
kernel image):

BOOT_WRAPPER_AARCH64_CONF_OPTS = \
        --with-kernel-dir=$(LINUX_DIR) \

> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +
> +# Linux headers same as kernel, a 4.15 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="riscv-linux-4.15"

This is a branch, so its contents can change anytime. Please use a tag,
of if there's not tag, a full SHA1 designating a specific commit.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux.config"
> +
> +# Binutils configuration
> +BR2_BINUTILS_VERSION_2_30_X=y

This should not be needed, because you prevent using binutils 2.28 and
2.29 anyway.

Could you fix those comments, and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

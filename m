From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 20:45:13 +0100
Subject: [Buildroot] [PATCH] configs/rock64: new defconfig
In-Reply-To: <20190203204119.31934-1-michal.lyszczek@bofc.pl>
References: <20190203204119.31934-1-michal.lyszczek@bofc.pl>
Message-ID: <20190205204513.20daa598@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution! Please see a number of comments below.

On Sun,  3 Feb 2019 21:41:19 +0100
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

>  board/pine64/rock64/build-uboot-itb.patch | 14 ++++
>  board/pine64/rock64/extlinux.conf         |  4 +
>  board/pine64/rock64/genimage.cfg          | 23 ++++++
>  board/pine64/rock64/post-build.sh         |  9 +++
>  board/pine64/rock64/readme.txt            | 93 +++++++++++++++++++++++
>  configs/rock64_defconfig                  | 34 +++++++++
>  6 files changed, 177 insertions(+)

Please add an entry in the DEVELOPERS file for this new board.
> diff --git a/board/pine64/rock64/build-uboot-itb.patch b/board/pine64/rock64/build-uboot-itb.patch
> new file mode 100644
> index 0000000000..72baa2218f
> --- /dev/null
> +++ b/board/pine64/rock64/build-uboot-itb.patch

We want all patches to have a description + Signed-off-by, and be
generated with "git format-patch". Also, you could please put this
patch in:

	board/pine64/rock64/patches/uboot/

and use BR2_GLOBAL_PATCH_DIR=board/pine64/rock64/patches/ ?


> diff --git a/board/pine64/rock64/post-build.sh b/board/pine64/rock64/post-build.sh
> new file mode 100755
> index 0000000000..26b53cba8e
> --- /dev/null
> +++ b/board/pine64/rock64/post-build.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +BOARD_DIR="$(dirname $0)"
> +
> +$MKIMAGE -n rk3328 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
> +cat $BINARIES_DIR/u-boot-tpl.img $BINARIES_DIR/u-boot-spl.bin > $BINARIES_DIR/u-boot-tpl-spl.img

OK. It's weird that the U-Boot build process doesn't do all of this,
but I see board/amarula/vyasa/post-build.sh. At some point, it might
make sense to move this logic inside uboot.mk itself. But OK, it's not
really necessary for just two boards.


> diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
> new file mode 100644
> index 0000000000..c00d8dc25e
> --- /dev/null
> +++ b/configs/rock64_defconfig
> @@ -0,0 +1,34 @@
> +BR2_aarch64=y
> +BR2_KERNEL_HEADERS_4_19=y

Please use:

  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

instead

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rock64/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rock64/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.19"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-rock64"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"

Normally, we want to use fixed versions for such low-level software
components. But I see we don't have an option to select a specific
upstream version. In the mean time, could you do like
arm_juno_defconfig, and use Git to fetch from upstream a specific
version of ATF ? Or alternatively, add an option to select a specific
upstream version.

> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ayufan-rock64/linux-u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2017.09-rockchip-ayufan-1035-gd646df03ac"
> +BR2_TARGET_UBOOT_PATCH="board/pine64/rock64/build-uboot-itb.patch"

As said above, use BR2_GLOBAL_PATCH_DIR instead.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock64-rk3328"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin tpl/u-boot-tpl.bin"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Other than that, looks good!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

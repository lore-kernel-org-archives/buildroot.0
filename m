From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 21:23:50 +0200
Subject: [Buildroot] [PATCH 1/1] Added support for LeMaker BananaPi M2
 Plus board.
In-Reply-To: <1503492342-3805-1-git-send-email-mike.harmony@snapav.com>
References: <1503492342-3805-1-git-send-email-mike.harmony@snapav.com>
Message-ID: <20170823212350.030828c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Aug 2017 08:45:42 -0400, Mike Harmony wrote:
> Signed-off-by: Mike Harmony <mike.harmony@snapav.com>

Thanks for this new iteration! A few comments below, it's almost ready
to go.

> diff --git a/board/lemaker/m2-plus/post-build.sh b/board/lemaker/m2-plus/post-build.sh
> new file mode 100755
> index 0000000..fb4b6e9
> --- /dev/null
> +++ b/board/lemaker/m2-plus/post-build.sh
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +# Remove all but the brcmfmac43362 firmware files
> +find $TARGET_DIR/lib/firmware/brcm -type f -not -name "brcmfmac43362*" -delete

Your defconfig does not enable any firmware related package, so this
seems useless.

> +BOARD_DIR="$(dirname $0)"
> +MKIMAGE=$HOST_DIR/usr/bin/mkimage
> +BOOT_CMD=$BOARD_DIR/boot.cmd
> +BOOT_CMD_H=$BINARIES_DIR/boot.scr
> +
> +# U-Boot script
> +$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H

You can remove this, and use BR2_TARGET_UBOOT_BOOT_SCRIPT instead.

> diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
> new file mode 100644
> index 0000000..c2bae51
> --- /dev/null
> +++ b/configs/bananapi_m2_plus_defconfig
> @@ -0,0 +1,33 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_KERNEL_HEADERS_4_12=y
> +BR2_BINUTILS_VERSION_2_27_X=y
> +BR2_GCC_VERSION_5_X=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Please remove those four lines, and keep the default toolchain
configuration. However, make sure to use:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y

> +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Plus"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/lemaker/m2-plus/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/lemaker/m2-plus/genimage.cfg board/bananapi/m2-plus/boot.cmd"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://git.kernel.org/torvalds/t/linux-4.13-rc5.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-bananapi-m2-plus"
> +BR2_PACKAGE_IPERF3=y

Please remove this package, we want minimal configurations.

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_RESBLKS=0

Please drop this option, it is not needed.

> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"

The final 2017.07 has been published in July, could you use that
instead of this release candidate ?

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Sinovoip_BPI_M2_Plus"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_GENEXT2FS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_TARGET_ROOTFS_EXT2_BLOCKS=61440

This last option no longer exists in Buildroot, so please drop it. The
replacement is BR2_TARGET_ROOTFS_EXT2_SIZE, but the default value of
60MB should be sufficient.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

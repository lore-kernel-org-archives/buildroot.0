From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:40:36 +0100
Subject: [Buildroot] [PATCH 1/1] configs/bananapi_m1_plus_defconfig: new
 defconfig
In-Reply-To: <20210120172815.3395049-1-fskoneczny@gmail.com>
References: <20210120172815.3395049-1-fskoneczny@gmail.com>
Message-ID: <20210123214036.720c3a3f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Filip,

Thanks a lot for this patch! Overall it looks very good, and I only
have a few comments, see below.

On Wed, 20 Jan 2021 18:28:15 +0100
Filip Skoneczny <fskoneczny@gmail.com> wrote:


> diff --git a/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch b/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
> new file mode 100644
> index 0000000000..75a86f0357
> --- /dev/null
> +++ b/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
> @@ -0,0 +1,37 @@
> +From 58bae4096a7bf8d5d3bfbddb82cb37dd0561c938 Mon Sep 17 00:00:00 2001
> +From: Filip Skoneczny <fskoneczny@gmail.com>
> +Date: Sun, 10 Jan 2021 19:07:14 +0100
> +Subject: [PATCH] ARM: dts: sun7i: bananapi-m1-plus: Disable OOB IRQ for brcm
> + wifi module
> +
> +    Based on 23bc805.
> +    BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908438

Could you add your Signed-off-by line to this patch ?


> diff --git a/board/sinovoip/m1-plus/post-build.sh b/board/sinovoip/m1-plus/post-build.sh
> new file mode 100755
> index 0000000000..a335310dbc
> --- /dev/null
> +++ b/board/sinovoip/m1-plus/post-build.sh
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +# Remove all but the brcmfmac43362 firmware files
> +find $TARGET_DIR/lib/firmware/brcm -type f -not -name "brcmfmac43362*" -delete
> +
> +BOARD_DIR="$(dirname $0)"
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +BOOT_CMD=$BOARD_DIR/boot.cmd
> +BOOT_CMD_H=$BINARIES_DIR/boot.scr
> +
> +# U-Boot script
> +$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H

Could you use BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT and
BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE instead ?

> diff --git a/board/sinovoip/m1-plus/post-image.sh b/board/sinovoip/m1-plus/post-image.sh
> new file mode 100755
> index 0000000000..9cca1b1789
> --- /dev/null
> +++ b/board/sinovoip/m1-plus/post-image.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?

Could you use support/scripts/genimage.sh instead ? See other
defconfigs that are doing this.


> diff --git a/configs/bananapi_m1_plus_defconfig b/configs/bananapi_m1_plus_defconfig
> new file mode 100644
> index 0000000000..cdc3e96515
> --- /dev/null
> +++ b/configs/bananapi_m1_plus_defconfig
> @@ -0,0 +1,47 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +BR2_GLOBAL_PATCH_DIR="board/sinovoip/m1-plus/patches"
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

Why is wide-char supported needed ?

> +BR2_TARGET_GENERIC_HOSTNAME="bananapi"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pi!"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

Is this needed for automatic loading of modules ?

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_OVERLAY="board/sinovoip/m1-plus/rootfs_overlay"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/sinovoip/m1-plus/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sinovoip/m1-plus/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.3"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sinovoip/m1-plus/linux-wifi.fragment"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapi-m1-plus"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_ALSA_UTILS=y
> +# BR2_PACKAGE_ALSA_UTILS_ALSAMIXER is not set
> +BR2_PACKAGE_ALSA_UTILS_AMIXER=y
> +BR2_PACKAGE_ALSA_UTILS_APLAY=y

We usually don't enable stuff such as alsa-utils in our defconfigs, to
keep them somewhat minimal.

> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
> +BR2_PACKAGE_IW=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m1_plus"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MKPASSWD=y

Why is this option needed ?

> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Could you adjust the above things, and send an updated version? It
should then be ready for merging.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

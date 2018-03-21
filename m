From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Mar 2018 15:55:53 +0100
Subject: [Buildroot] [PATCH 1/1] Add LicheePi Zero support
In-Reply-To: <866e1f31-97ad-0df3-42e7-521a4a2ad60e@wanadoo.fr>
References: <866e1f31-97ad-0df3-42e7-521a4a2ad60e@wanadoo.fr>
Message-ID: <20180321155553.36692b0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

On Tue, 20 Mar 2018 19:27:35 +0100, Michel Stempin wrote:
> From b27c30f03f0355f8401ecedacd8f5378c3a6cf02 Mon Sep 17 00:00:00 2001
> From: Michel Stempin <michel.stempin@wanadoo.fr>
> Date: Tue, 20 Mar 2018 19:23:13 +0100
> Subject: [PATCH 1/1] Add LicheePi Zero support

This looks odd. Could you use "git send-email" to send your patches ?

More comments below.


> diff --git a/board/licheepi/post-build.sh b/board/licheepi/post-build.sh
> new file mode 100755
> index 0000000..dda2987
> --- /dev/null
> +++ b/board/licheepi/post-build.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +BOARD_DIR="$( dirname "${0}" )"
> +MKIMAGE="${HOST_DIR}/bin/mkimage"
> +MKSWAP="${HOST_DIR}/sbin/mkswap"
> +BOOT_CMD="${BOARD_DIR}/boot.cmd"
> +BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
> +
> +# U-Boot script
> +"${MKIMAGE}" -C none -A arm -T script -d "${BOOT_CMD}" "${BOOT_CMD_H}"

This should be done using BR2_TARGET_UBOOT_BOOT_SCRIPT.

> +
> +# Swap
> +sed -i '/^\/swap/d' "${TARGET_DIR}/etc/fstab"
> +echo "/swap		none		swap	defaults	0	0" >> "${TARGET_DIR}/etc/fstab"

Why do you need to tweak this in the fstab ?

> diff --git a/board/licheepi/post-image.sh b/board/licheepi/post-image.sh

You can use support/scripts/genimage.sh instead.


> diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
> new file mode 100644
> index 0000000..4b7e7ac
> --- /dev/null
> +++ b/configs/licheepi_zero_defconfig
> @@ -0,0 +1,75 @@
> +# Target options
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Toolchain
> +# External Linaro ARM 2017.11 toolchain
> +BR2_TOOLCHAIN_EXTERNAL=y

Please use the internal toolchain in the defconfig, like we do in all
other defconfigs.

> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
> +BR2_TARGET_GENERIC_ROOT_PASSWD="licheepi"
> +# Run a getty (login prompt) after boot on ttyS0 @ 115200 bps
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> +# Custom scripts for image creation
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/licheepi/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/licheepi/post-image.sh"
> +
> +# Kernel
> +# Custom 4.14.14 kernel based on stable linux.4.14.y from Lichee-Pi Github repository
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/linux"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="zero-4.14.y"

This looks like a branch and not a tag or commit. You should use a tag
or commit so that the build is reproducible.

> +# In-tree kernel configuration
> +BR2_LINUX_KERNEL_DEFCONFIG="licheepi_zero"
> +# AllWinner V3s-based DTS
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
> +
> +# Target packages
> +
> +# E2fsprogs package for resize2fs
> +BR2_PACKAGE_E2FSPROGS=y
> +BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y

We don't install this package in most defconfigs, so I think you should
remove it.

> +
> +#?Hardware handling
> +# Firmare
> +# Linux-firmware
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +# Wifi firmware
> +# Realtek 87xx for rtl8723bs support
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
> +
> +# Dhcpcd package DHCP client for Wi-Fi
> +BR2_PACKAGE_DHCPCD=y
> +
> +# WPA_supplicant package for Wi-Fi Authentication
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
> +
> +# Filesystem images
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Bootloaders
> +# Custom U-Boot from Lichee-Pi Github repository
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/u-boot"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v3s-current"

Same question: is this a branch or a tag name ?

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> +
> +#?Host utilities
> +# Required host utilities for building an SDCard image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_DTC=y

DTC is not needed. It might be needed by U-Boot, but in this case, you
should use BR2_TARGET_UBOOT_NEEDS_DTC=y.

> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

This last line will no longer be needed once you use
BR2_TARGET_UBOOT_BOOT_SCRIPT.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

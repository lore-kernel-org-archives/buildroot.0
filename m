From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 May 2019 15:26:21 +0200
Subject: [Buildroot] [PATCH] board: friendlyarm: Add initial support for
 NanoPc T4
In-Reply-To: <20190516075010.14219-1-shyam.saini@amarulasolutions.com>
References: <20190516075010.14219-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190516152621.57ece57b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 May 2019 13:20:10 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> This initial support includes:
> 	Linux 5.1-rc1

Why not use the final 5.1 release ?

> diff --git a/DEVELOPERS b/DEVELOPERS
> index e4a089e6f5..ec1dde20e7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2048,6 +2048,8 @@ F:     board/orangepi/orangepi-rk3399/
>  F:     configs/orangepi_rk3399_defconfig
>  F:	board/olimex/a33_olinuxino/
>  F:	configs/olimex_a33_olinuxino_defconfig
> +F:	board/friendlyarm/nanopc-t4/
> +F:	configs/nanopc_t4_defconfig

Alphabetic ordering is preferred.


> +Files created in output directory
> +=================================
> +output/images/

One empty line to separate the section title from the section contents
would be nice.

> +??? bl31.bin
> +??? bl31.elf
> +??? Image
> +??? rk3399-nanopc-t4.dtb
> +??? rootfs.ext2
> +??? rootfs.ext4 -> rootfs.ext2
> +??? rootfs.tar
> +??? sdcard.img
> +??? u-boot.bin
> +??? u-boot.itb
> +??? u-boot-spl-dtb.bin
> +??? u-boot-spl-dtb.img
> +
> +Creating bootable SD card:
> +=========================
> +
> +Simply invoke (as root)
> +
> +  # dd if=output/images/sdcard.img of=/dev/sdX && sync
> +
> +Where X is your SD card device
> +
> +Serial console
> +--------------

Ditto.

> diff --git a/configs/nanopc_t4_defconfig b/configs/nanopc_t4_defconfig
> new file mode 100644
> index 0000000000..a55b754d0f
> --- /dev/null
> +++ b/configs/nanopc_t4_defconfig
> @@ -0,0 +1,55 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a72_a53=y
> +
> +# Linux headers same as kernel, a 5.0 series
> +BR2_KERNEL_HEADERS_5_0=y

So 5_1 preferably.

> +#Firmware

Space before firmware, for consistency.

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="980ca75ae0438b4a1847d044605c492f3c844f88"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopc-t4-rk3399"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="v5.1-rc1"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopc-t4"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
> +BR2_TARGET_GENERIC_HOSTNAME="NanoPc T4"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPc T4!"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopc-t4/genimage.cfg"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopc-t4/post-build.sh"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

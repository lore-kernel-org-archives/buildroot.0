From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 21:32:21 +0200
Subject: [Buildroot] [PATCH] configs/kontron_pitx_imx8m: new defconfig
In-Reply-To: <20210629100630.1963-1-heiko.thiery@gmail.com>
References: <20210629100630.1963-1-heiko.thiery@gmail.com>
Message-ID: <20210629193221.GJ2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-06-29 12:06 +0200, Heiko Thiery spake thusly:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
[--SNIP--]
> diff --git a/board/kontron/pitx-imx8m/post-image.sh b/board/kontron/pitx-imx8m/post-image.sh
> new file mode 100755
> index 0000000000..66351f250f
> --- /dev/null
> +++ b/board/kontron/pitx-imx8m/post-image.sh
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +support/scripts/genimage.sh -c $(dirname $0)/genimage.cfg
> +exit $?

The shell will exit with the return status of the last command it
executed. So using 'exit $?' as the last line of a shell script is
superfluous. I dropped it.

Applied to master with the above change, thanks.

Regards,
Yann E. MORIN.

> diff --git a/board/kontron/pitx-imx8m/readme.txt b/board/kontron/pitx-imx8m/readme.txt
> new file mode 100644
> index 0000000000..7c85dd4377
> --- /dev/null
> +++ b/board/kontron/pitx-imx8m/readme.txt
> @@ -0,0 +1,74 @@
> +Kontron pitx-imx8m
> +==================
> +
> +https://www.kontron.com/produkte/pitx-imx8m/p155258
> +
> +
> +How to build it
> +===============
> +
> +Configure buildroot:
> +
> +  $ make kontron_pitx_imx8m_defconfig
> +
> +Change settings to fit your needs (optional):
> +
> +  $ make menuconfig
> +
> +Compile everything and buildr the rootfs image:
> +
> +  $ make
> +
> +
> +Result of the build
> +===================
> +
> +After building, the output/images directory contains:
> +
> +  output/images/
> +    ??? bl31.bin
> +    ??? boot.scr
> +    ??? ddr_fw.bin
> +    ??? Image
> +    ??? imx8-boot-sd.bin
> +    ??? imx8mq-kontron-pitx-imx8m.dtb
> +    ??? lpddr4_pmu_train_fw.bin
> +    ??? rootfs.ext2
> +    ??? rootfs.ext4 -> rootfs.ext2
> +    ??? rootfs.tar
> +    ??? sdcard.img
> +    ??? signed_hdmi_imx8m.bin
> +    ??? u-boot.bin
> +    ??? u-boot.itb
> +    ??? u-boot-nodtb.bin
> +    ??? u-boot-spl.bin
> +    ??? u-boot-spl-ddr.bin
> +
> +
> +Flashing the SD card image
> +==========================
> +
> +To install the image on a SDCard simply copy sdcard.img to the storage (e.g. SD, eMMC)
> +
> +  $ sudo dd if=output/images/sdcard.img of=<your-sd-device>
> +
> +
> +Preparing the board
> +===================
> +
> + * Connect a serial line to the board
> + * Insert the SD card
> + * Make sure the boot source selection DIP switches are set correctly
> +  * SW1 1-4 OFF
> +  * SW1 2-3 OFF
> + * Power-up the board
> +
> +
> +Booting the board
> +=================
> +
> +By default the bootloader will search for the first valid image, starting
> +with the internal eMMC. To make sure the bootloader loads bootscript from
> +the correct location (SD card) set the boot_targets environment variable:
> +
> +  $ setenv boot_targets mmc1
> diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
> new file mode 100644
> index 0000000000..4053e1e398
> --- /dev/null
> +++ b/configs/kontron_pitx_imx8m_defconfig
> @@ -0,0 +1,54 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV3=y
> +
> +# System
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/kontron/pitx-imx8m/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/kontron/pitx-imx8m/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pitx-imx8mq.dtb"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
> +
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
> +BR2_PACKAGE_FIRMWARE_IMX=y
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +
> +# Bootloader
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://gitlab.kontron.com/imx/u-boot-imx/-/archive/PITX-IMX8M-R12/u-boot-imx-PITX-IMX8M-R12.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pitx-imx8m"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
> +BR2_TARGET_UBOOT_SPL=y
> +
> +# Required host tools to create the SD/eMMC image
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_IMX_MKIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/kontron/pitx-imx8m/boot.cmd"
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

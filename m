From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 22:44:17 +0200
Subject: [Buildroot] [PATCH 1/1] New board - EVB SoCrates based on
 Altera Cyclone 5
In-Reply-To: <20170801201013.27685-1-michal.lyszczek@gmail.com>
References: <20170801201013.27685-1-michal.lyszczek@gmail.com>
Message-ID: <20170801224417.5f45e92c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for this new version. See a few comments below.

On Tue,  1 Aug 2017 22:10:13 +0200, Micha? ?yszczek wrote:
> From: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> Configuration contains:
>   - binary uboot SPL

Is it really "binary" now ?

> diff --git a/board/altera/socrates_cyclone5/boot-env.txt b/board/altera/socrates_cyclone5/boot-env.txt
> new file mode 100644
> index 0000000..30c55a1
> --- /dev/null
> +++ b/board/altera/socrates_cyclone5/boot-env.txt
> @@ -0,0 +1,3 @@
> +source_env=fatload mmc 0:1 0x2000000 boot.scr; source 0x2000000
> +bootcmd=run source_env; run start
> +bootdelay=1
> diff --git a/board/altera/socrates_cyclone5/boot.txt b/board/altera/socrates_cyclone5/boot.txt
> new file mode 100644
> index 0000000..0a70ff3
> --- /dev/null
> +++ b/board/altera/socrates_cyclone5/boot.txt
> @@ -0,0 +1,7 @@
> +setenv linux_load_address 0x100000
> +setenv linux_dtb_load_address 0x100
> +setenv linux_load 'mmc rescan; fatload mmc 0:1 ${linux_load_address} zImage; fatload mmc 0:1 ${linux_dtb_load_address} linux.dtb'
> +
> +setenv bootargs 'console=ttyS0,115200 root=/dev/mmcblk0p3 rw rootwait'
> +
> +setenv start 'run linux_load; bootz ${linux_load_address} - ${linux_dtb_load_address}'

It's a bit weird to have both an environment and a boot script here,
no? Why is the start command being defined in the boot script, but
called from the bootcmd defined in the environment ? While the
source_env command is defined *and* used in the environment ?

This looks like it could be improved a bit.

> diff --git a/board/altera/socrates_cyclone5/create_sdcard.sh b/board/altera/socrates_cyclone5/create_sdcard.sh
> new file mode 100755
> index 0000000..70ca865
> --- /dev/null
> +++ b/board/altera/socrates_cyclone5/create_sdcard.sh
> @@ -0,0 +1,43 @@
> +#!/bin/bash
> +#
> +# Script generates sdcard image for altera cyclone5 (socrates board)
> +
> +# $1 - image directory (output/images)
> +
> +BOARD_DIR="$(dirname $0)"
> +IMAGES_DIR="$1"
> +GENIMAGE_CFG="$BOARD_DIR/genimage.cfg"
> +GENIMAGE_TMP="$BUILD_DIR/genimage.tmp"
> +
> +###
> +# create preloader image that consists of 4 64k images
> +#
> +
> +truncate -s64k "$IMAGES_DIR/u-boot-spl.bin.crc"
> +dd if="$IMAGES_DIR/u-boot-spl.bin.crc" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=0
> +dd if="$IMAGES_DIR/u-boot-spl.bin.crc" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=1
> +dd if="$IMAGES_DIR/u-boot-spl.bin.crc" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=2
> +dd if="$IMAGES_DIR/u-boot-spl.bin.crc" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=3
> +
> +###
> +# append real uboot at the end of preloader to create complete uboot
> +# image
> +#
> +
> +cat "$IMAGES_DIR/preloader.bin" "$IMAGES_DIR/u-boot.img" > \
> +    "$IMAGES_DIR/boot_partition.img"

What about doing all of this using genimage ?

You put u-boot-spl.bin.crc at offset 0, 64K, 128K and 196 KB, and you
put u-boot.img at offset 256 KB.

This way you can drop your post-image script and use
support/scripts/genimage.sh.

> diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
> new file mode 100644
> index 0000000..6c77017
> --- /dev/null
> +++ b/board/altera/socrates_cyclone5/genimage.cfg
> @@ -0,0 +1,39 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"linux.dtb",
> +			"boot.scr"
> +		}
> +	}
> +	size = 10321920

Why this size exactly ?


> diff --git a/board/altera/socrates_cyclone5/linux-4.1.config b/board/altera/socrates_cyclone5/linux-4.1.config
> new file mode 100644
> index 0000000..295bdb8
> --- /dev/null
> +++ b/board/altera/socrates_cyclone5/linux-4.1.config

There is no usable/useful defconfig for the platform in Altera's Github
Linux repository ?

> diff --git a/board/altera/socrates_cyclone5/linux.dts b/board/altera/socrates_cyclone5/linux.dts
> new file mode 100644
> index 0000000..f915f44
> --- /dev/null
> +++ b/board/altera/socrates_cyclone5/linux.dts

Is this going to be upstream, or at least in Altera Github repository
at some point ? We really don't want to be carrying .dts files forever,
so we want to see that there is a path towards getting the platform
supported without forcing Buildroot to carry the .dts.


> diff --git a/board/altera/socrates_cyclone5/readme.txt b/board/altera/socrates_cyclone5/readme.txt
> new file mode 100644
> index 0000000..8630be1
> --- /dev/null
> +++ b/board/altera/socrates_cyclone5/readme.txt
> @@ -0,0 +1,52 @@
> +EBV SoCrates Evaluation Board
> +
> +Intro
> +=====
> +
> +More information about board can be found here:

about *this* board

> +https://rocketboards.org/foswiki/Documentation/EBVSoCratesEvaluationBoard

> +Pins 6:8 on P18 selector is used to determine boot device. To boot socrates from
> +sdcard set these pins to value 0x5 (101b). Rest pins are used to determine how
> +to configure FPGA and are not associate with booting into Linux kernel.

Rest pins -> Remaining pins

associate -> associated

> diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
> new file mode 100644
> index 0000000..1225b27
> --- /dev/null
> +++ b/configs/socrates_cyclone5_defconfig
> @@ -0,0 +1,37 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_NEON=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

Please drop, keep the default.

> +BR2_KERNEL_HEADERS_4_1=y

Please:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y

instead.

> +BR2_GCC_VERSION_5_X=y
> +BR2_GCC_ENABLE_LTO=y

Please drop those two options, keep the default.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/socrates_cyclone5/create_sdcard.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-4.1.33-ltsi_17.07.02_pr"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/altera/socrates_cyclone5/linux-4.1.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/altera/socrates_cyclone5/linux.dts"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="10M"

This seems like a really small size. Why not keep the default of 60M ?

> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2017.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_socrates"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC=y
> +BR2_TARGET_UBOOT_ENVIMAGE=y
> +BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/altera/socrates_cyclone5/boot-env.txt"
> +BR2_TARGET_UBOOT_ENVIMAGE_SIZE="8192"
> +BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> +BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/altera/socrates_cyclone5/boot.txt"
> +BR2_PACKAGE_HOST_GENIMAGE=y

You also need:

BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y

because your genimage.cfg describes a VFAT filesystem.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

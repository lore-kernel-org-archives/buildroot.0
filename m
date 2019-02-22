From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 22 Feb 2019 13:54:11 -0700
Subject: [Buildroot] [PATCH] configs/zynq_zybo: remove defconfig
In-Reply-To: <20190222204442.4785-1-thomas.petazzoni@bootlin.com>
References: <20190222204442.4785-1-thomas.petazzoni@bootlin.com>
Message-ID: <CADvTj4oyc=3ThQ++0CcS+wiYuQrc0sB=67aBamPdPiZjYGMv1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 22, 2019 at 1:44 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This defconfig was added in October 2016 and was never updated since
> then. It currently fails to build because U-Boot is too old and
> doesn't build with host-openssl in version 1.1.x.
You can probably just replace uboot with this version
https://github.com/Xilinx/u-boot-xlnx/tree/xilinx-v2018.3 for xilinx
devices like these.
>
> On February 13, 2019, the original submitter was notified, but didn't
> reply, so let's remove the defconfig for this platform.
>
> Fixes:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/165766194
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .gitlab-ci.yml                    |  1 -
>  DEVELOPERS                        |  4 --
>  board/digilent/zybo/genimage.cfg  | 29 ------------
>  board/digilent/zybo/post-image.sh | 18 --------
>  board/digilent/zybo/readme.txt    | 76 -------------------------------
>  board/digilent/zybo/system.bit    |  0
>  board/digilent/zybo/uEnv.txt      |  5 --
>  configs/zynq_zybo_defconfig       | 30 ------------
>  8 files changed, 163 deletions(-)
>  delete mode 100644 board/digilent/zybo/genimage.cfg
>  delete mode 100755 board/digilent/zybo/post-image.sh
>  delete mode 100644 board/digilent/zybo/readme.txt
>  delete mode 100644 board/digilent/zybo/system.bit
>  delete mode 100644 board/digilent/zybo/uEnv.txt
>  delete mode 100644 configs/zynq_zybo_defconfig
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 2f0ebaa25c..c373d4a791 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -276,7 +276,6 @@ warpboard_defconfig: { extends: .defconfig }
>  zynq_microzed_defconfig: { extends: .defconfig }
>  zynq_zc706_defconfig: { extends: .defconfig }
>  zynq_zed_defconfig: { extends: .defconfig }
> -zynq_zybo_defconfig: { extends: .defconfig }
>  zynqmp_zcu106_defconfig: { extends: .defconfig }
>  tests.boot.test_atf.TestATFAllwinner: { extends: .runtime_test }
>  tests.boot.test_atf.TestATFMarvell: { extends: .runtime_test }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7dd996decc..4e59287a4c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1925,10 +1925,6 @@ F:       package/python-flask-jsonrpc/
>  F:     package/python-flask-login/
>  F:     package/qt5/qt5charts/
>
> -N:     Sebastien Van Cauwenberghe <svancau@gmail.com>
> -F:     board/digilent/zybo/
> -F:     configs/zynq_zybo_defconfig
> -
>  N:     Semyon Kolganov <semenak94@mail.ru>
>  F:     package/fmt/
>  F:     package/libbson/
> diff --git a/board/digilent/zybo/genimage.cfg b/board/digilent/zybo/genimage.cfg
> deleted file mode 100644
> index f39186d07b..0000000000
> --- a/board/digilent/zybo/genimage.cfg
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -image boot.vfat {
> -  vfat {
> -    files = {
> -      "BOOT.BIN",
> -      "uEnv.txt",
> -      "system.bit",
> -      "zynq-zybo.dtb",
> -      "u-boot-dtb.img",
> -      "uImage"
> -    }
> -  }
> -  size = 32M
> -}
> -
> -image sdcard.img {
> -  hdimage {
> -  }
> -
> -  partition boot {
> -    partition-type = 0xC
> -    bootable = "true"
> -    image = "boot.vfat"
> -  }
> -
> -  partition rootfs {
> -    partition-type = 0x83
> -    image = "rootfs.ext4"
> -  }
> -}
> diff --git a/board/digilent/zybo/post-image.sh b/board/digilent/zybo/post-image.sh
> deleted file mode 100755
> index 619cb9019e..0000000000
> --- a/board/digilent/zybo/post-image.sh
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -#!/bin/sh
> -
> -BOARD_DIR="$(dirname $0)"
> -GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> -GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> -OUTPUT_DIR="${O}/images"
> -
> -rm -rf "${GENIMAGE_TMP}"
> -
> -cp board/digilent/zybo/uEnv.txt ${BINARIES_DIR}
> -cp board/digilent/zybo/system.bit ${BINARIES_DIR}
> -
> -genimage                               \
> -       --rootpath "${TARGET_DIR}"     \
> -       --tmppath "${GENIMAGE_TMP}"    \
> -       --inputpath "${BINARIES_DIR}"  \
> -       --outputpath "${BINARIES_DIR}" \
> -       --config "${GENIMAGE_CFG}"
> diff --git a/board/digilent/zybo/readme.txt b/board/digilent/zybo/readme.txt
> deleted file mode 100644
> index 4e7454c50d..0000000000
> --- a/board/digilent/zybo/readme.txt
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -Digilent Zybo
> -=============
> -
> -This is the Buildroot board support for the Digilent Zybo. The Zybo is
> -a development board based on the Xilinx Zynq-7000 based All-Programmable
> -System-On-Chip.
> -
> -Zybo information including schematics, reference designs, and manuals are
> -available from http://store.digilentinc.com/zybo-zynq-7000-arm-fpga-soc-trainer-board/ .
> -
> -If you want a custom FPGA bitstream to be loaded by U-Boot, copy it as
> -system.bit in board/digilent/zybo/.
> -
> -Steps to create a working system for Zybo:
> -
> -1) make zynq_zybo_defconfig
> -2) make
> -3) write your SD Card with the sdcard.img file using dd by doing
> -  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> -4) insert the SD Card and power up your Zybo
> -5) Expect serial console on the second USB serial port exposed by the board
> -
> -The expected output:
> -
> - U-Boot SPL 2016.05 (May 20 2016 - 16:16:24)
> - mmc boot
> - Trying to boot from MMC1
> - reading system.dtb
> - spl_load_image_fat_os: error reading image system.dtb, err - -1
> - reading u-boot-dtb.img
> - reading u-boot-dtb.img
> -
> -
> - U-Boot 2016.05 (May 20 2016 - 16:16:24 +0200)
> -
> - Model: Zynq ZYBO Development Board
> - Board: Xilinx Zynq
> - I2C:   ready
> - DRAM:  ECC disabled 512 MiB
> - MMC:   sdhci at e0100000: 0
> - SF: Detected S25FL128S_64K with page size 256 Bytes, erase size 64 KiB, total 16 MiB
> - In:    serial at e0001000
> - Out:   serial at e0001000
> - Err:   serial at e0001000
> - Model: Zynq ZYBO Development Board
> - Board: Xilinx Zynq
> - Net:   ZYNQ GEM: e000b000, phyaddr 0, interface rgmii-id
> - I2C EEPROM MAC address read failed
> -
> - Warning: ethernet at e000b000 (eth0) using random MAC address - 56:64:dd:a7:6d:94
> - eth0: ethernet at e000b000
> - ...
> -
> -Resulting system
> -----------------
> -Once the build process is finished you will have an image called "sdcard.img"
> -in the output/images/ directory.
> -
> -The first partition is a FAT32 partition created at the beginning of the SD Card
> -that contains the following files :
> -    /BOOT.BIN
> -    /zynq-zybo.dtb
> -    /uEnv.txt
> -    /system.bit
> -    /uImage
> -    /u-boot-dtb.img
> -
> -The second partition is an ext4 partition that contains the root filesystem.
> -
> -You can alter the booting procedure by modifying the uEnv.txt file
> -in first partition of the SD card. It is a plain text file in format
> -<key>=<value> one per line:
> -
> -kernel_image=myimage
> -modeboot=myboot
> -myboot=...
> diff --git a/board/digilent/zybo/system.bit b/board/digilent/zybo/system.bit
> deleted file mode 100644
> index e69de29bb2..0000000000
> diff --git a/board/digilent/zybo/uEnv.txt b/board/digilent/zybo/uEnv.txt
> deleted file mode 100644
> index 1042538a5d..0000000000
> --- a/board/digilent/zybo/uEnv.txt
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -bootargs=root=/dev/mmcblk0p2 rootwait rw rootfstype=ext4
> -fpga_image=system.bit
> -fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image}; then echo Booting FPGA from ${fpga_image}; fpga info 0 && fpga loadb 0 0x1000000 $filesize; else echo FPGA image ${fpga_image} was not found, skipping...; fi;
> -kernel_image=uImage
> -sdboot=echo Booting from SD...; run fpgaboot; fatload mmc 0 0x1000000 ${kernel_image} && fatload mmc 0 0x2000000 zynq-zybo.dtb && bootm 0x1000000 - 0x2000000
> diff --git a/configs/zynq_zybo_defconfig b/configs/zynq_zybo_defconfig
> deleted file mode 100644
> index ee6fa060b6..0000000000
> --- a/configs/zynq_zybo_defconfig
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -BR2_arm=y
> -BR2_cortex_a9=y
> -BR2_ARM_ENABLE_NEON=y
> -BR2_ARM_ENABLE_VFP=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/digilent/zybo/post-image.sh"
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.4"
> -BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> -BR2_LINUX_KERNEL_UIMAGE=y
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zybo"
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zybo"
> -BR2_TARGET_UBOOT_NEEDS_DTC=y
> -BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
> -BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
> -BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

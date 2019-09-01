From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Sep 2019 11:36:28 +0200
Subject: [Buildroot] [git commit] configs/ts4800: remove defconfig
Message-ID: <20190901093512.38A4288976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc395142b907b98e831208733afb0e19af8d2226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig has been failing to build since we switched the default
gcc version to gcc 8.x, as the Linux kernel version is too old and
doesn't contain the necessary fixes to build with gcc >= 8.x.

Despite several pings to the original submitter of the defconfig
(which is not listed in MAINTAINERS), no fix has been sent, so it is
time to drop this defconfig before the 2019.08 release.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/278489442

Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                          |  1 -
 board/technologic/ts4800/genimage.cfg   | 37 ------------------------
 board/technologic/ts4800/linux.fragment |  3 --
 board/technologic/ts4800/post-image.sh  | 19 -------------
 board/technologic/ts4800/readme.txt     | 50 ---------------------------------
 configs/ts4800_defconfig                | 22 ---------------
 6 files changed, 132 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 28824cc722..0024e33ae0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -318,7 +318,6 @@ solidrun_macchiatobin_marvell_defconfig: { extends: .defconfig }
 stm32f429_disco_defconfig: { extends: .defconfig }
 stm32f469_disco_defconfig: { extends: .defconfig }
 toradex_apalis_imx6_defconfig: { extends: .defconfig }
-ts4800_defconfig: { extends: .defconfig }
 ts4900_defconfig: { extends: .defconfig }
 ts5500_defconfig: { extends: .defconfig }
 ts7680_defconfig: { extends: .defconfig }
diff --git a/board/technologic/ts4800/genimage.cfg b/board/technologic/ts4800/genimage.cfg
deleted file mode 100644
index 2070cc5040..0000000000
--- a/board/technologic/ts4800/genimage.cfg
+++ /dev/null
@@ -1,37 +0,0 @@
-image boot.vfat {
-        vfat {
-                files = {
-                        "zImage",
-                        "imx51-ts4800.dtb"
-                }
-        }
-        size = 8M
-}
-
-image sdcard.img {
-        hdimage {
-        }
-
-        partition mbrboot {
-                in-partition-table = "no"
-                image = "mbrboot.bin"
-                offset = 0
-        }
-
-        partition uboot {
-                partition-type = 0xda
-                image = "u-boot.bin"
-                size = 256k
-        }
-
-        partition kernel {
-                partition-type = 0xC
-                image = "boot.vfat"
-        }
-
-        partition rootfs {
-                partition-type = 0x83
-                image = "rootfs.ext4"
-                size = 256M
-        }
-}
diff --git a/board/technologic/ts4800/linux.fragment b/board/technologic/ts4800/linux.fragment
deleted file mode 100644
index 0451c86365..0000000000
--- a/board/technologic/ts4800/linux.fragment
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_TOUCHSCREEN_TS4800=y
-CONFIG_TS4800_WATCHDOG=y
-CONFIG_TS4800_IRQ=y
diff --git a/board/technologic/ts4800/post-image.sh b/board/technologic/ts4800/post-image.sh
deleted file mode 100755
index cc8e5da352..0000000000
--- a/board/technologic/ts4800/post-image.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/bash
-#
-# Copyright (C) 2015 Savoir-faire Linux
-# Post image generation script.
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP=${BUILD_DIR}/.genimage_tmp
-
-rm -rf ${GENIMAGE_TMP}
-
-${HOST_DIR}/bin/genimage \
-        --config ${GENIMAGE_CFG} \
-        --rootpath ${TARGET_DIR} \
-        --tmppath ${GENIMAGE_TMP} \
-        --inputpath $BINARIES_DIR \
-        --outputpath $BINARIES_DIR
-
-exit $?
diff --git a/board/technologic/ts4800/readme.txt b/board/technologic/ts4800/readme.txt
deleted file mode 100644
index 20b50e9de2..0000000000
--- a/board/technologic/ts4800/readme.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Technologic Systems TS-4800
-===========================
-
-This document explains how to set up a basic Buildroot system for the
-Technologic Systems TS-4800 System on Module.
-
-The TS-4800 is a TS-SOCKET macrocontroller board based on the Freescale
-i.MX515 ARM Cortex-A8 CPU running at 800MHz. The TS-4800 features 10/100
-Ethernet, high speed USB host and device (OTG), microSD card, and 256MB
-XNAND drive.  More details on the board here:
-	http://wiki.embeddedarm.com/wiki/TS-4800
-
-The TS-4800 is supported by mainline Linux as of 4.5 and by U-boot as of
-v2016-07. The defconfig includes a custom 1st level bootloader located
-in boot/ts4800-mbrboot. This one scans the SD card's partition table to
-find partition having the 0xDA type, corresponding to U-boot.
-
-To build the default configuration you only have to:
-
-	$ make ts4800_defconfig
-	$ make
-
-The ouput looks like:
-	output/images/
-	????????? boot.vfat
-	????????? imx51-ts4800.dtb
-	????????? mbrboot.bin
-	????????? rootfs.ext2
-	????????? rootfs.ext4 -> rootfs.ext2
-	????????? rootfs.tar
-	????????? sdcard.img
-	????????? u-boot.bin
-	????????? zImage
-
-The provided post-image script generates an image file containing 3
-partitions for U-boot, Linux kernel + device tree and rootfs
-respectively:
-	$ fdisk output/images/sdcard.img
-	                   Device Boot Start    End Blocks Id  System
-	output/images/sdcard.img1          1    512    256 da  Non-FS data
-	output/images/sdcard.img2        513  16896   8192  c  W95 FAT32 (LBA)
-	output/images/sdcard.img3      16897 541184 262144 83  Linux
-
-This image can be directly written to an SD card.
-
-	$ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
-
-In order to test the image on TS-4800 board, a TS baseboard, such as
-TS-8xxx the serie, is needed to provide power, console header, RJ45
-connector etc.
diff --git a/configs/ts4800_defconfig b/configs/ts4800_defconfig
deleted file mode 100644
index 0999ebcad0..0000000000
--- a/configs/ts4800_defconfig
+++ /dev/null
@@ -1,22 +0,0 @@
-BR2_arm=y
-BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4800/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technologic/ts4800/linux.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-ts4800"
-BR2_PACKAGE_BUSYBOX_WATCHDOG=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_TS4800_MBRBOOT=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="ts4800"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y

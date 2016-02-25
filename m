From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 23:31:36 +0100
Subject: [Buildroot] [git commit] configs: pandaboard: bump u-boot to
	2015.10 and kernel to 4.3
Message-ID: <20160302202758.59CD07FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=000b972f49bcf9ed35417bb787a4440f22b12f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

VFPv3 and NEON was enabled and a readme.txt file was added.

Fixes bug #7580.

Tested on Pandaboard ES.

[Peter: use EABIhf]
Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pandaboard/readme.txt  | 76 ++++++++++++++++++++++++++++++++++++++++++++
 configs/pandaboard_defconfig | 41 ++++++++----------------
 2 files changed, 90 insertions(+), 27 deletions(-)

diff --git a/board/pandaboard/readme.txt b/board/pandaboard/readme.txt
new file mode 100644
index 0000000..8741349
--- /dev/null
+++ b/board/pandaboard/readme.txt
@@ -0,0 +1,76 @@
+Pandaboard
+==========
+
+This file documents the Buildroot support for the Pandaboard, a
+low-power, low-cost single-board computer development platform based
+on the Texas Instruments OMAP4 system on a chip (SoC).
+
+Configuring and building Buildroot
+----------------------------------
+
+Start from the defconfig:
+
+  $ make pandaboard_defconfig
+
+You can edit build options the usual way:
+
+  $ make menuconfig
+
+When you are happy with the setup, run:
+
+  $ make
+
+The result of the build with the default settings should be these files:
+
+  output/images
+  ????????? MLO
+  ????????? omap4-panda-a4.dtb
+  ????????? omap4-panda.dtb
+  ????????? omap4-panda-es.dtb
+  ????????? rootfs.ext2
+  ????????? u-boot.img
+  ????????? zImage
+
+Setting up your SD card
+-----------------------
+
+*Important*: pay attention which partition you are modifying so you don't
+accidentally erase the wrong file system, e.g your host computer or your
+external storage!
+
+In the default setup you need to create two partitions on your SD card:
+a boot partition and a rootfs partition.
+
+The ROM code from OMAP processors need the SD card to be formatted with
+a special geometry in the partition table. To do that, you can use the
+shell script below (this script was extracted from
+http://elinux.org/Panda_How_to_MLO_%26_u-boot).
+
+#!/bin/sh
+DRIVE=$1
+if [ -b "$DRIVE" ] ; then
+	dd if=/dev/zero of=$DRIVE bs=1024 count=1024
+	SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
+	echo DISK SIZE - $SIZE bytes
+	CYLINDERS=`echo $SIZE/255/63/512 | bc`
+	echo CYLINDERS - $CYLINDERS
+	{
+	echo ,9,0x0C,*
+	echo ,,,-
+	} | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE
+	mkfs.vfat -F 32 -n "boot" ${DRIVE}1
+	mke2fs -j -L "rootfs" ${DRIVE}2
+fi
+
+The next step is to mount the sdcard's first partition and copy MLO
+and u-boot.img to it.
+
+  $ sudo mkdir -p /mnt/sdcard
+  $ sudo mount /dev/sdX1 /mnt/sdcard
+  $ sudo cp MLO u-boot.img /mnt/sdcard
+  $ sudo umount /mnt/sdcard
+
+The last step is to copy the rootfs image to the sdcard's second
+partition using 'dd':
+
+  $ sudo dd if=rootfs.ext2 of=/dev/sdX2 bs=1M conv=fsync
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 93ec1b0..76b4caa 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -1,37 +1,24 @@
-# Architecture
 BR2_arm=y
 BR2_cortex_a9=y
-
-# system
-BR2_TARGET_GENERIC_GETTY=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
-
-# filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-# BR2_TARGET_ROOTFS_TAR is not set
-
-# Linux headers same as kernel, a 3.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
-
-# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.3"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
-BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
-BR2_LINUX_KERNEL_APPENDED_DTB=y
-BR2_LINUX_KERNEL_USE_INTREE_DTS=y
-# might need omap4-panda or omap4-panda-a4 instead
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es"
-
-# Bootloaders
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es omap4-panda omap4-panda-a4"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap4_panda"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_BOARDNAME="omap4_panda"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
-BR2_TARGET_UBOOT_LATEST_VERSION=n
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2012.07"

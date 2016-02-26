From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 15:56:12 +0100
Subject: [Buildroot] [git commit] pandabord: use genimage to generate sdcard
	image
Message-ID: <20160302202758.6B0547FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16fc95d5a1409432bde812edb26f0850e66023bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop the manual sdcard generation description from the readme.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pandaboard/genimage.cfg  | 26 +++++++++++++++++++++++
 board/pandaboard/post-image.sh | 16 ++++++++++++++
 board/pandaboard/readme.txt    | 48 ++++++++----------------------------------
 configs/pandaboard_defconfig   |  3 +++
 4 files changed, 54 insertions(+), 39 deletions(-)

diff --git a/board/pandaboard/genimage.cfg b/board/pandaboard/genimage.cfg
new file mode 100644
index 0000000..f30033f
--- /dev/null
+++ b/board/pandaboard/genimage.cfg
@@ -0,0 +1,26 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img"
+		}
+	}
+	size = 8M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/pandaboard/post-image.sh b/board/pandaboard/post-image.sh
new file mode 100755
index 0000000..9cca1b1
--- /dev/null
+++ b/board/pandaboard/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/pandaboard/readme.txt b/board/pandaboard/readme.txt
index e18ae52..1e4820b 100644
--- a/board/pandaboard/readme.txt
+++ b/board/pandaboard/readme.txt
@@ -28,49 +28,19 @@ The result of the build with the default settings should be these files:
   ????????? omap4-panda.dtb
   ????????? omap4-panda-es.dtb
   ????????? rootfs.ext4
+  ????????? sdcard.img
   ????????? u-boot.img
   ????????? zImage
 
-Setting up your SD card
------------------------
+How to write the SD card
+------------------------
 
-*Important*: pay attention which partition you are modifying so you don't
-accidentally erase the wrong file system, e.g your host computer or your
-external storage!
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
 
-In the default setup you need to create two partitions on your SD card:
-a boot partition and a rootfs partition.
+Copy the bootable "sdcard.img" onto an SD card with "dd":
 
-The ROM code from OMAP processors need the SD card to be formatted with
-a special geometry in the partition table. To do that, you can use the
-shell script below (this script was extracted from
-http://elinux.org/Panda_How_to_MLO_%26_u-boot).
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 
-#!/bin/sh
-DRIVE=$1
-if [ -b "$DRIVE" ] ; then
-	dd if=/dev/zero of=$DRIVE bs=1024 count=1024
-	SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
-	echo DISK SIZE - $SIZE bytes
-	CYLINDERS=`echo $SIZE/255/63/512 | bc`
-	echo CYLINDERS - $CYLINDERS
-	{
-	echo ,9,0x0C,*
-	echo ,,,-
-	} | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE
-	mkfs.vfat -F 32 -n "boot" ${DRIVE}1
-	mke2fs -j -L "rootfs" ${DRIVE}2
-fi
-
-The next step is to mount the sdcard's first partition and copy MLO
-and u-boot.img to it.
-
-  $ sudo mkdir -p /mnt/sdcard
-  $ sudo mount /dev/sdX1 /mnt/sdcard
-  $ sudo cp MLO u-boot.img /mnt/sdcard
-  $ sudo umount /mnt/sdcard
-
-The last step is to copy the rootfs image to the sdcard's second
-partition using 'dd':
-
-  $ sudo dd if=rootfs.ext4 of=/dev/sdX2 bs=1M conv=fsync
+Where /dev/sdX is the device node of your SD card (may be /dev/mmcblkX
+instead depending on setup).
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index c217d3b..7ae1a50 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pandaboard/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.3"
@@ -23,3 +24,5 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap4_panda"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y

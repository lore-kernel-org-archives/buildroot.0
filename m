From: David Lechner <david@lechnology.com>
Date: Tue,  1 Nov 2016 22:15:54 -0500
Subject: [Buildroot] [PATCH v2 2/4] board/lego/ev3: Create images using
	genimage
In-Reply-To: <1478056556-30242-1-git-send-email-david@lechnology.com>
References: <1478056556-30242-1-git-send-email-david@lechnology.com>
Message-ID: <1478056556-30242-3-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a script to create SD card and flash images for LEGO MINDSTORMS
EV3 using the genimage tool.

The default kernel config had to be modifed to add support for squashfs
and to add a ram disk.

Signed-off-by: David Lechner <david@lechnology.com>
---
 board/lego/ev3/genimage.cfg   | 57 ++++++++++++++++++++++++++++++
 board/lego/ev3/linux.fragment |  7 ++++
 board/lego/ev3/post-image.sh  | 14 ++++++++
 board/lego/ev3/readme.txt     | 80 ++++++++++---------------------------------
 configs/lego_ev3_defconfig    | 10 +++++-
 5 files changed, 105 insertions(+), 63 deletions(-)
 create mode 100644 board/lego/ev3/genimage.cfg
 create mode 100644 board/lego/ev3/linux.fragment
 create mode 100755 board/lego/ev3/post-image.sh

diff --git a/board/lego/ev3/genimage.cfg b/board/lego/ev3/genimage.cfg
new file mode 100644
index 0000000..6b8546c
--- /dev/null
+++ b/board/lego/ev3/genimage.cfg
@@ -0,0 +1,57 @@
+# LEGO MINDSTORMS EV3 can boot from a 16MB flash or from a microSD card.
+# The U-Boot bootloader from the flash is always used, even when booting
+# from a microSD card.
+
+# The Flash image
+
+flash nor-16M-256 {
+	pebsize = 4096
+	numpebs = 4096
+	minimum-io-unit-size = 256
+}
+
+image flash.bin {
+	flash {
+	}
+	flashtype = "nor-16M-256"
+	partition uboot {
+		image = "u-boot.bin"
+		size = 320K
+	}
+	partition uimage {
+		image = "uImage"
+		size = 3M
+		offset = 0x50000
+	}
+	partition rootfs {
+		image = "rootfs.squashfs"
+		size = 9600K
+		offset = 0x350000
+	}
+}
+
+# The SD card image
+
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 4M
+	}
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/lego/ev3/linux.fragment b/board/lego/ev3/linux.fragment
new file mode 100644
index 0000000..5593636
--- /dev/null
+++ b/board/lego/ev3/linux.fragment
@@ -0,0 +1,7 @@
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=32768
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZ4=y
+CONFIG_SQUASHFS_LZO=y
+CONFIG_SQUASHFS_XZ=y
diff --git a/board/lego/ev3/post-image.sh b/board/lego/ev3/post-image.sh
new file mode 100755
index 0000000..81626dc
--- /dev/null
+++ b/board/lego/ev3/post-image.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
diff --git a/board/lego/ev3/readme.txt b/board/lego/ev3/readme.txt
index 7d9ec4f..c075af5 100644
--- a/board/lego/ev3/readme.txt
+++ b/board/lego/ev3/readme.txt
@@ -25,9 +25,13 @@ How it works
 Boot process :
 --------------
 
-The u-boot on-board the EV3 brick has provision to boot a Linux kernel from the
-external ?SD card. It will try to load a uImage from the first ?SD card
-partition, which must be formatted with a FAT filesystem.
+The EV3 boots from an EEPROM. This loads whatever is on the built-in 16MB flash
+(usually U-Boot) and runs it. The U-Boot from the official LEGO firmware and
+mainline U-Boot will attempt to boot a Linux kernel from the external ?SD card.
+It will try to load a uImage (and optional boot.scr) from the first ?SD card
+partition, which must be formatted with a FAT filesystem. If no ?SD is found or
+it does not contain a uImage file, then the EV3 will boot the uImage from the
+built-in 16MB flash.
 
 How to build it
 ===============
@@ -54,74 +58,26 @@ Result of the build
 After building, you should obtain this tree:
 
     output/images/
+    ??? boot.vfat
+    ??? flash.bin
     ??? rootfs.ext2
     ??? rootfs.ext3 -> rootfs.ext2
+    ??? rootfs.squashfs
+    ??? sdcard.img
+    ??? u-boot.bin
     ??? uImage
 
-Prepare your SDcard
-===================
-
-The following ?SD card layout is recommended:
-
-- First partition formatted with a FAT filesystem, containing the uImage.
-- Second partition formatted as ext2 or ext3, containing the root filesystem.
-
-Create the SDcard partition table
-----------------------------------
-
-Determine the device associated to the SD card :
-
-  $ cat /proc/partitions
-
-Let's assume it is /dev/mmcblk0 :
-
-  $ sudo fdisk /dev/mmcblk0
-
-Delete all previous partitions by creating a new disklabel with 'o', then
-create the new partition table, using these options, pressing enter after each
-one:
-
-  * n p 1 2048 +10M t c
-  * n p 2 22528 +256M
-
-Using the 'p' option, the SD card's partition must look like this :
-
-Device          Boot  Start     End  Blocks  Id System
-/dev/mmcblk0p1         2048   22527   10240   c  W95 FAT32 (LBA)
-/dev/mmcblk0p2        22528  546815  262144  83  Linux
-
-Then write the partition table using 'w' and exit.
-
-Make partition one a DOS partition :
-
-  $ sudo mkfs.vfat /dev/mmcblk0p1
-
-Install the binaries to the SDcard
-----------------------------------
-
-Remember your binaries are located in output/images/, go inside that directory :
-
-  $ cd output/images
-
-Copy the Linux kernel:
-
-  $ sudo mkdir /mnt/sdcard
-  $ sudo mount /dev/mmcblk0p1 /mnt/sdcard
-  $ sudo cp uImage /mnt/sdcard
-  $ sudo umount /mnt/sdcard
-
-Copy the rootfs :
-
-  $ sudo dd if=rootfs.ext3 of=/dev/mmcblk0p2 bs=1M
-  $ sync
+Installation
+============
 
-It's Done!
+You can use either flash.bin or the sdcard.img. To load flash.bin, use the
+official Lego Mindstorms EV3 programming software firmware update tool to load
+the image. To use sdcard.img, use a disk writing tool such as Etcher or dd to
+write the image to the ?SD card.
 
 Finish
 ======
 
-Eject your ?SD card, insert it in your Lego EV3, and power it up.
-
 To have a serial console, you will need a proper USB to Lego serial port
 adapter plugged into the EV3 sensors port 1.
 See:
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 1521fa7..ea76d59 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -8,7 +8,7 @@ BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
-
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
 # Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
@@ -18,11 +18,14 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/ev3dev/ev3dev-kernel.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.4.19-15-ev3dev-ev3_1"
 BR2_LINUX_KERNEL_DEFCONFIG="ev3dev"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lego/ev3/linux.fragment"
 BR2_LINUX_KERNEL_UIMAGE=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_3=y
+BR2_TARGET_ROOTFS_SQUASHFS=y
+BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # U-Boot
@@ -31,3 +34,8 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
+
+# host
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4

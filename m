From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Sun, 18 Dec 2016 22:35:26 +0100
Subject: [Buildroot] [PATCH] BeagleBoard X15: new board
In-Reply-To: <20161215223730.4890-1-theo.debrouwere@skynet.be>
References: <20161215223730.4890-1-theo.debrouwere@skynet.be>
Message-ID: <20161218213526.16032-1-theo.debrouwere@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Theo Debrouwere <Theo.Debrouwere@gmail.com>

This configuration provides a basic setup for using Buildroot
to create a sd-card image a BeagleBoard X15 board.

Signed-off-by: Theo Debrouwere <Theo.Debrouwere@gmail.com>
---
 board/beagleboardx15/genimage.cfg  | 26 ++++++++++++++++++++
 board/beagleboardx15/post-image.sh | 15 ++++++++++++
 board/beagleboardx15/readme.txt    | 49 ++++++++++++++++++++++++++++++++++++++
 configs/beagleboardx15_defconfig   | 23 ++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 board/beagleboardx15/genimage.cfg
 create mode 100755 board/beagleboardx15/post-image.sh
 create mode 100644 board/beagleboardx15/readme.txt
 create mode 100644 configs/beagleboardx15_defconfig

diff --git a/board/beagleboardx15/genimage.cfg b/board/beagleboardx15/genimage.cfg
new file mode 100644
index 0000000..5432026
--- /dev/null
+++ b/board/beagleboardx15/genimage.cfg
@@ -0,0 +1,26 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img"
+		}
+	}
+	size = 4M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+                image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 1G
+	}
+}
diff --git a/board/beagleboardx15/post-image.sh b/board/beagleboardx15/post-image.sh
new file mode 100755
index 0000000..f52682f
--- /dev/null
+++ b/board/beagleboardx15/post-image.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+    --rootpath "${TARGET_DIR}" \
+    --tmppath "${GENIMAGE_TMP}" \
+    --inputpath "${BINARIES_DIR}" \
+    --outputpath "${BINARIES_DIR}" \
+    --config "${GENIMAGE_CFG}"
diff --git a/board/beagleboardx15/readme.txt b/board/beagleboardx15/readme.txt
new file mode 100644
index 0000000..56ebca8
--- /dev/null
+++ b/board/beagleboardx15/readme.txt
@@ -0,0 +1,49 @@
+BeagleBoard X15
+
+Intro
+=====
+This config currently supports the beagleboard x15,
+and generates a barebone image.
+
+The image must be flashed to a SD card to be used.
+
+How to build it
+===============
+
+  $ make beagleboardx15_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build a sdcard image:
+
+  $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+  output/images/
+  ??? am57xx-beagle-x15.dtb
+  ??? am57xx-beagle-x15-revb1.dtb
+  ??? boot.vfat
+  ??? MLO
+  ??? rootfs.ext2
+  ??? rootfs.ext4
+  ??? rootfs.tar
+  ??? sdcard.img
+  ??? u-boot.img
+  ??? u-boot-spl.bin
+  ??? zImage
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
new file mode 100644
index 0000000..89f0081
--- /dev/null
+++ b/configs/beagleboardx15_defconfig
@@ -0,0 +1,23 @@
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboardx15/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am57xx-beagle-x15 am57xx-beagle-x15-revb1"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.9.3

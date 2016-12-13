From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 13 Dec 2016 23:52:37 +0300
Subject: [Buildroot] [PATCH 2/2] orangepi: add basic support for
	orangepi-one board
In-Reply-To: <20161213205237.7119-1-geomatsi@gmail.com>
References: <20161213205237.7119-1-geomatsi@gmail.com>
Message-ID: <20161213205237.7119-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Board support package includes the following components:
- mainline u-boot 2016.09.01
- mainline kernel 4.9

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-one/boot.cmd      |  8 +++++++
 board/orangepi/orangepi-one/genimage.cfg  | 36 +++++++++++++++++++++++++++++++
 board/orangepi/orangepi-one/post-build.sh | 11 ++++++++++
 board/orangepi/orangepi-one/post-image.sh | 14 ++++++++++++
 board/orangepi/orangepi-one/readme.txt    | 29 +++++++++++++++++++++++++
 configs/orangepi_one_defconfig            | 29 +++++++++++++++++++++++++
 6 files changed, 127 insertions(+)
 create mode 100644 board/orangepi/orangepi-one/boot.cmd
 create mode 100644 board/orangepi/orangepi-one/genimage.cfg
 create mode 100755 board/orangepi/orangepi-one/post-build.sh
 create mode 100755 board/orangepi/orangepi-one/post-image.sh
 create mode 100644 board/orangepi/orangepi-one/readme.txt
 create mode 100644 configs/orangepi_one_defconfig

diff --git a/board/orangepi/orangepi-one/boot.cmd b/board/orangepi/orangepi-one/boot.cmd
new file mode 100644
index 0000000..ab616e6
--- /dev/null
+++ b/board/orangepi/orangepi-one/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-one.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-one/genimage.cfg b/board/orangepi/orangepi-one/genimage.cfg
new file mode 100644
index 0000000..4640ff2
--- /dev/null
+++ b/board/orangepi/orangepi-one/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the OrangePi PC
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-orangepi-one.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+		size = 1040384 # 1MB - 8192
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
diff --git a/board/orangepi/orangepi-one/post-build.sh b/board/orangepi/orangepi-one/post-build.sh
new file mode 100755
index 0000000..46e8905
--- /dev/null
+++ b/board/orangepi/orangepi-one/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+# post-build.sh for OrangePi One taken from CubieBoard's post-build.sh
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/orangepi/orangepi-one/post-image.sh b/board/orangepi/orangepi-one/post-image.sh
new file mode 100755
index 0000000..359b4c9
--- /dev/null
+++ b/board/orangepi/orangepi-one/post-image.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/board/orangepi/orangepi-one/readme.txt b/board/orangepi/orangepi-one/readme.txt
new file mode 100644
index 0000000..e650f82
--- /dev/null
+++ b/board/orangepi/orangepi-one/readme.txt
@@ -0,0 +1,29 @@
+OrangePi One
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi One. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepi_one_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
new file mode 100644
index 0000000..a486d0e
--- /dev/null
+++ b/configs/orangepi_one_defconfig
@@ -0,0 +1,29 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_One"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi One"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-one/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-one/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-one"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.10.2

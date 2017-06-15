From: Chakra Divi <2chakrass@gmail.com>
Date: Thu, 15 Jun 2017 22:54:25 +0530
Subject: [Buildroot] [PATCH] board: Add nanopi-m1 Support
Message-ID: <1497547465-15445-1-git-send-email-chakra@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for nanopi-m1 board
with below features
- U-Boot 2017.07-rc1
- Linux 4.11
- Default packages from buildroot

Created a new folder nanopi under buildroot
board; any new board for nanopi can be added
here

Signed-off-by: Chakra Divi <chakra@openedev.com>
---
 board/nanopi/nanopi-m1/boot.cmd      |    8 ++++++++
 board/nanopi/nanopi-m1/genimage.cfg  |   36 ++++++++++++++++++++++++++++++++++
 board/nanopi/nanopi-m1/post-build.sh |    1 +
 board/nanopi/nanopi-m1/post-image.sh |    1 +
 board/nanopi/nanopi-m1/readme.txt    |   29 +++++++++++++++++++++++++++
 board/nanopi/post-build.sh           |   11 +++++++++++
 board/nanopi/post-image.sh           |   14 +++++++++++++
 configs/nanopi_m1_defconfig          |   29 +++++++++++++++++++++++++++
 8 files changed, 129 insertions(+)
 create mode 100644 board/nanopi/nanopi-m1/boot.cmd
 create mode 100644 board/nanopi/nanopi-m1/genimage.cfg
 create mode 120000 board/nanopi/nanopi-m1/post-build.sh
 create mode 120000 board/nanopi/nanopi-m1/post-image.sh
 create mode 100644 board/nanopi/nanopi-m1/readme.txt
 create mode 100755 board/nanopi/post-build.sh
 create mode 100755 board/nanopi/post-image.sh
 create mode 100644 configs/nanopi_m1_defconfig

diff --git a/board/nanopi/nanopi-m1/boot.cmd b/board/nanopi/nanopi-m1/boot.cmd
new file mode 100644
index 0000000..b4d612e
--- /dev/null
+++ b/board/nanopi/nanopi-m1/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-m1.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/nanopi/nanopi-m1/genimage.cfg b/board/nanopi/nanopi-m1/genimage.cfg
new file mode 100644
index 0000000..23c9c7d
--- /dev/null
+++ b/board/nanopi/nanopi-m1/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the NanoPi M1
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-nanopi-m1.dtb",
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
diff --git a/board/nanopi/nanopi-m1/post-build.sh b/board/nanopi/nanopi-m1/post-build.sh
new file mode 120000
index 0000000..cd7f116
--- /dev/null
+++ b/board/nanopi/nanopi-m1/post-build.sh
@@ -0,0 +1 @@
+../post-build.sh
\ No newline at end of file
diff --git a/board/nanopi/nanopi-m1/post-image.sh b/board/nanopi/nanopi-m1/post-image.sh
new file mode 120000
index 0000000..ae6294f
--- /dev/null
+++ b/board/nanopi/nanopi-m1/post-image.sh
@@ -0,0 +1 @@
+../post-image.sh
\ No newline at end of file
diff --git a/board/nanopi/nanopi-m1/readme.txt b/board/nanopi/nanopi-m1/readme.txt
new file mode 100644
index 0000000..8b10e4b
--- /dev/null
+++ b/board/nanopi/nanopi-m1/readme.txt
@@ -0,0 +1,29 @@
+NanoPi M1
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi M1. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make nanopi_m1_defconfig
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
diff --git a/board/nanopi/post-build.sh b/board/nanopi/post-build.sh
new file mode 100755
index 0000000..a544a19
--- /dev/null
+++ b/board/nanopi/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/nanopi/post-image.sh b/board/nanopi/post-image.sh
new file mode 100755
index 0000000..359b4c9
--- /dev/null
+++ b/board/nanopi/post-image.sh
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
diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
new file mode 100644
index 0000000..b1443f8
--- /dev/null
+++ b/configs/nanopi_m1_defconfig
@@ -0,0 +1,29 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/nanopi/nanopi-m1/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nanopi/nanopi-m1/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
1.7.9.5

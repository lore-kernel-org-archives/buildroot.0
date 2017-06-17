From: Chakra Divi <2chakrass@gmail.com>
Date: Sun, 18 Jun 2017 00:45:08 +0530
Subject: [Buildroot] [PATCH v2] board: Add a13_olinuxino Support
Message-ID: <1497726908-1702-1-git-send-email-chakra@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for a13_olinuxino board
with below features
- U-Boot 2017.05
- Linux 4.11.5
- Default packages from buildroot

Signed-off-by: Chakra Divi <chakra@openedev.com>
---
Changes for v2:
- Add missing readme.txt

 .gitlab-ci.yml                           |    1 +
 board/olimex/a13_olinuxino/boot.cmd      |    7 +++++
 board/olimex/a13_olinuxino/genimage.cfg  |   34 +++++++++++++++++++++++
 board/olimex/a13_olinuxino/post-build.sh |    9 ++++++
 board/olimex/a13_olinuxino/readme.txt    |   43 +++++++++++++++++++++++++++++
 configs/olimex_a13_olinuxino_defconfig   |   44 ++++++++++++++++++++++++++++++
 6 files changed, 138 insertions(+)
 create mode 100644 board/olimex/a13_olinuxino/boot.cmd
 create mode 100644 board/olimex/a13_olinuxino/genimage.cfg
 create mode 100755 board/olimex/a13_olinuxino/post-build.sh
 create mode 100644 board/olimex/a13_olinuxino/readme.txt
 create mode 100644 configs/olimex_a13_olinuxino_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 45c9b87..fe2c7fe 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -127,6 +127,7 @@ nitrogen6sx_defconfig: *defconfig
 nitrogen6x_defconfig: *defconfig
 nitrogen7_defconfig: *defconfig
 odroidc2_defconfig: *defconfig
+olimex_a13_olinuxino_defconfig: *defconfig
 olimex_a20_olinuxino_lime2_defconfig: *defconfig
 olimex_a20_olinuxino_lime_defconfig: *defconfig
 olimex_a20_olinuxino_lime_mali_defconfig: *defconfig
diff --git a/board/olimex/a13_olinuxino/boot.cmd b/board/olimex/a13_olinuxino/boot.cmd
new file mode 100644
index 0000000..4dd1c7b
--- /dev/null
+++ b/board/olimex/a13_olinuxino/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun5i-a13-olinuxino.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/olimex/a13_olinuxino/genimage.cfg b/board/olimex/a13_olinuxino/genimage.cfg
new file mode 100644
index 0000000..6f6b0b0
--- /dev/null
+++ b/board/olimex/a13_olinuxino/genimage.cfg
@@ -0,0 +1,34 @@
+image boot.vfat {
+        vfat {
+                files = {
+                        "zImage",
+                        "sun5i-a13-olinuxino.dtb",
+                        "boot.scr"
+                }
+        }
+        size = 64M
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
+        partition boot {
+                partition-type = 0xC
+                bootable = "true"
+                image = "boot.vfat"
+        }
+
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/olimex/a13_olinuxino/post-build.sh b/board/olimex/a13_olinuxino/post-build.sh
new file mode 100755
index 0000000..a8bf8ec
--- /dev/null
+++ b/board/olimex/a13_olinuxino/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+# args from BR2_ROOTFS_POST_SCRIPT_ARGS
+# $4    path of boot.cmd
+
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD="${4}"
+BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
+
+$MKIMAGE -A arm -O linux -T script -C none -d "${BOOT_CMD}" "${BOOT_CMD_H}"
diff --git a/board/olimex/a13_olinuxino/readme.txt b/board/olimex/a13_olinuxino/readme.txt
new file mode 100644
index 0000000..382f1d7
--- /dev/null
+++ b/board/olimex/a13_olinuxino/readme.txt
@@ -0,0 +1,43 @@
+A13-OLinuXino
+
+Intro
+=====
+This default configuration will allow you to start experimenting with the
+buildroot environment for the A13-OLinuXino. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+A13-OLinuXino Link:
+https://www.olimex.com/Products/OLinuXino/A13/A13-OLinuXino/open-source-hardware
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make olimex_a13_olinuxino_defconfig 
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+Result of the build
+-------------------
+Image ready to be written to your micro SDcard
+
+How to write the SD card
+========================
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to a micro 
+SD card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Notes:
+  - replace 'sdX' with the actual device with your micro SDcard,
+  - you may need to be root to do that (use 'sudo').
+
+Eject the SD card, insert it in the A13-OLinuXino board, and power it up.
diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
new file mode 100644
index 0000000..f1397e8
--- /dev/null
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -0,0 +1,44 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a8=y
+
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="a13-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A13-OLinuXino"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun5i-a13-olinuxino"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a13_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a13_olinuxino/genimage.cfg board/olimex/a13_olinuxino/boot.cmd"
+
+# Additional tools
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
1.7.9.5

From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  7 Jan 2018 23:11:30 +0300
Subject: [Buildroot] [PATCH 2/2] orangepi: drop custom post-build and
 post-image scripts
In-Reply-To: <20180107201130.12952-1-geomatsi@gmail.com>
References: <20180107201130.12952-1-geomatsi@gmail.com>
Message-ID: <20180107201130.12952-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently in Orange Pi boards post-build script is used only to generate
U-Boot boot script and post-image script is used only to generate sdcard
image according to genimage configuration. However both those tasks can
now be handled by generic Buildroot tools:
- BR2_TARGET_UBOOT_BOOT_SCRIPT config options
- support/scripts/genimage.sh script

This patch drops custom scripts replacing them
by generic Buildroot tools.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-lite/post-build.sh    |  1 -
 board/orangepi/orangepi-lite/post-image.sh    |  1 -
 board/orangepi/orangepi-one/post-build.sh     |  1 -
 board/orangepi/orangepi-one/post-image.sh     |  1 -
 board/orangepi/orangepi-pc-plus/post-build.sh |  1 -
 board/orangepi/orangepi-pc-plus/post-image.sh |  1 -
 board/orangepi/orangepi-pc/post-build.sh      |  1 -
 board/orangepi/orangepi-pc/post-image.sh      |  1 -
 board/orangepi/orangepi-zero/post-build.sh    |  1 -
 board/orangepi/orangepi-zero/post-image.sh    |  1 -
 board/orangepi/post-build.sh                  | 11 -----------
 board/orangepi/post-image.sh                  | 14 --------------
 configs/orangepi_lite_defconfig               |  6 ++++--
 configs/orangepi_one_defconfig                |  6 ++++--
 configs/orangepi_pc_defconfig                 |  6 ++++--
 configs/orangepi_pc_plus_defconfig            |  6 ++++--
 configs/orangepi_zero_defconfig               |  6 ++++--
 17 files changed, 20 insertions(+), 45 deletions(-)
 delete mode 120000 board/orangepi/orangepi-lite/post-build.sh
 delete mode 120000 board/orangepi/orangepi-lite/post-image.sh
 delete mode 120000 board/orangepi/orangepi-one/post-build.sh
 delete mode 120000 board/orangepi/orangepi-one/post-image.sh
 delete mode 120000 board/orangepi/orangepi-pc-plus/post-build.sh
 delete mode 120000 board/orangepi/orangepi-pc-plus/post-image.sh
 delete mode 120000 board/orangepi/orangepi-pc/post-build.sh
 delete mode 120000 board/orangepi/orangepi-pc/post-image.sh
 delete mode 120000 board/orangepi/orangepi-zero/post-build.sh
 delete mode 120000 board/orangepi/orangepi-zero/post-image.sh
 delete mode 100755 board/orangepi/post-build.sh
 delete mode 100755 board/orangepi/post-image.sh

diff --git a/board/orangepi/orangepi-lite/post-build.sh b/board/orangepi/orangepi-lite/post-build.sh
deleted file mode 120000
index cd7f11645b..0000000000
--- a/board/orangepi/orangepi-lite/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-lite/post-image.sh b/board/orangepi/orangepi-lite/post-image.sh
deleted file mode 120000
index ae6294fa38..0000000000
--- a/board/orangepi/orangepi-lite/post-image.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-one/post-build.sh b/board/orangepi/orangepi-one/post-build.sh
deleted file mode 120000
index cd7f11645b..0000000000
--- a/board/orangepi/orangepi-one/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-one/post-image.sh b/board/orangepi/orangepi-one/post-image.sh
deleted file mode 120000
index ae6294fa38..0000000000
--- a/board/orangepi/orangepi-one/post-image.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc-plus/post-build.sh b/board/orangepi/orangepi-pc-plus/post-build.sh
deleted file mode 120000
index cd7f11645b..0000000000
--- a/board/orangepi/orangepi-pc-plus/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc-plus/post-image.sh b/board/orangepi/orangepi-pc-plus/post-image.sh
deleted file mode 120000
index ae6294fa38..0000000000
--- a/board/orangepi/orangepi-pc-plus/post-image.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc/post-build.sh b/board/orangepi/orangepi-pc/post-build.sh
deleted file mode 120000
index cd7f11645b..0000000000
--- a/board/orangepi/orangepi-pc/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc/post-image.sh b/board/orangepi/orangepi-pc/post-image.sh
deleted file mode 120000
index ae6294fa38..0000000000
--- a/board/orangepi/orangepi-pc/post-image.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero/post-build.sh b/board/orangepi/orangepi-zero/post-build.sh
deleted file mode 120000
index cd7f11645b..0000000000
--- a/board/orangepi/orangepi-zero/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero/post-image.sh b/board/orangepi/orangepi-zero/post-image.sh
deleted file mode 120000
index ae6294fa38..0000000000
--- a/board/orangepi/orangepi-zero/post-image.sh
+++ /dev/null
@@ -1 +0,0 @@
-../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/post-build.sh b/board/orangepi/post-build.sh
deleted file mode 100755
index 07e04df4d5..0000000000
--- a/board/orangepi/post-build.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
-# 2013, Carlo Caione <carlo.caione@gmail.com>
-
-BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/bin/mkimage
-BOOT_CMD=$BOARD_DIR/boot.cmd
-BOOT_CMD_H=$BINARIES_DIR/boot.scr
-
-# U-Boot script
-$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/orangepi/post-image.sh b/board/orangepi/post-image.sh
deleted file mode 100755
index 359b4c9e7c..0000000000
--- a/board/orangepi/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index 30e4b1ebb1..0f9a8e098b 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -4,8 +4,6 @@ BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-lite/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-lite/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
@@ -28,7 +26,11 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-lite/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-lite/genimage.cfg"
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 507e4deda4..0cd3ece2d2 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -4,8 +4,6 @@ BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_One"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi One"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-one/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-one/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
@@ -23,7 +21,11 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-one/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-one/genimage.cfg"
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 02bcfa2ece..2d895c9ba9 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -4,8 +4,6 @@ BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-pc/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-pc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
@@ -23,7 +21,11 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index b06b9b1005..70056d75ec 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -5,8 +5,6 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC Plus"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-pc-plus/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-pc-plus/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
@@ -25,10 +23,14 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc-plus/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc-plus/genimage.cfg"
 
 # wireless driver and firmware
 BR2_PACKAGE_RTL8189FS=y
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 142b648fa8..5d4ec14e28 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -6,8 +6,6 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-zero/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-zero/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
@@ -26,10 +24,14 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
 
 # wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
-- 
2.11.0

From: Fabio Estevam <festevam@gmail.com>
Date: Sat,  6 Aug 2016 01:11:15 -0300
Subject: [Buildroot] [PATCH v2] configs: Add support for warp7 board
Message-ID: <1470456675-20134-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Add support for warp7, which is a board based on NXP i.MX7S processor.

More information about warp7 can be found at:
https://www.element14.com/community/docs/DOC-79058

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Use BR2_cortex_a7 instead of BR2_cortex_a9

 board/warp7/genimage.cfg  | 41 ++++++++++++++++++++++++++++++++
 board/warp7/post-image.sh | 14 +++++++++++
 board/warp7/readme.txt    | 59 +++++++++++++++++++++++++++++++++++++++++++++++
 configs/warp7_defconfig   | 36 +++++++++++++++++++++++++++++
 4 files changed, 150 insertions(+)
 create mode 100644 board/warp7/genimage.cfg
 create mode 100755 board/warp7/post-image.sh
 create mode 100644 board/warp7/readme.txt
 create mode 100644 configs/warp7_defconfig

diff --git a/board/warp7/genimage.cfg b/board/warp7/genimage.cfg
new file mode 100644
index 0000000..562a4a4
--- /dev/null
+++ b/board/warp7/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal SD card image for the Warp board
+#
+# We mimic the .sdcard Freescale's image format for i.MX7S:
+# * the microSD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx7s-warp.dtb",
+      "zImage"
+    }
+  }
+  size = 16M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.imx"
+    offset = 1024
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/warp7/post-image.sh b/board/warp7/post-image.sh
new file mode 100755
index 0000000..b4ac460
--- /dev/null
+++ b/board/warp7/post-image.sh
@@ -0,0 +1,14 @@
+#!/usr/bin/env bash
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
diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
new file mode 100644
index 0000000..7c1dd9e
--- /dev/null
+++ b/board/warp7/readme.txt
@@ -0,0 +1,59 @@
+*****************
+Warp i.MX7S board
+*****************
+
+This file documents the Buildroot support for the Warp i.MX7S board.
+
+Build
+=====
+
+First, configure Buildroot for the Warp i.MX7S board:
+
+  make warp7_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - imx7s-warp.dtb
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.imx
+  - zImage
+
+Create a bootable SD card
+=========================
+
+In the U-Boot prompt lauch:
+
+=> ums 0 mmc 0
+
+This will mount the eMMC content in the host PC as a mass storage device.
+
+To determine the device associated to the eMMC card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on the eMMC card. Launch the following
+command:
+
+sudo dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/warp7/genimage.cfg.
+
+Boot the Warp i.MX7S board
+==========================
+
+To boot your newly created system:
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
new file mode 100644
index 0000000..695aad7
--- /dev/null
+++ b/configs/warp7_defconfig
@@ -0,0 +1,36 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 4.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Freescale/linux-fslc.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fe8d6628372fb1508df93e3851d197c61e9da0ec"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="warp7"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Freescale/u-boot-fslc.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ae973bc45dd60b9eeff2729b46498b58625fd5f2"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/warp7/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# required tools to create the eMMC image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4

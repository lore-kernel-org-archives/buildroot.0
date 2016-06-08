From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:26:56 +0200
Subject: [Buildroot] [git commit] configs: new configuration for i.MX25 PDK
Message-ID: <20160608212701.CC8A8819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88b4fca2ae4c7a6e9bdd53e5a0aa51b7516e5a29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for i.MX25 PDK board using U-boot 2016.05 and
kernel 4.6.1.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx25pdk/genimage.cfg  | 41 ++++++++++++++++++++++++++
 board/freescale/imx25pdk/post-image.sh | 16 ++++++++++
 board/freescale/imx25pdk/readme.txt    | 54 ++++++++++++++++++++++++++++++++++
 configs/mx25pdk_defconfig              | 34 +++++++++++++++++++++
 4 files changed, 145 insertions(+)

diff --git a/board/freescale/imx25pdk/genimage.cfg b/board/freescale/imx25pdk/genimage.cfg
new file mode 100644
index 0000000..9386e32
--- /dev/null
+++ b/board/freescale/imx25pdk/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal SD card image for the Freescale's i.MX25 PDK board
+#
+# We mimic the .sdcard Freescale's image format for i.MX25:
+# * the SD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx25-pdk.dtb",
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
diff --git a/board/freescale/imx25pdk/post-image.sh b/board/freescale/imx25pdk/post-image.sh
new file mode 100755
index 0000000..8757355
--- /dev/null
+++ b/board/freescale/imx25pdk/post-image.sh
@@ -0,0 +1,16 @@
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
+
+exit $?
diff --git a/board/freescale/imx25pdk/readme.txt b/board/freescale/imx25pdk/readme.txt
new file mode 100644
index 0000000..a154b99
--- /dev/null
+++ b/board/freescale/imx25pdk/readme.txt
@@ -0,0 +1,54 @@
+**************************
+Freescale i.MX25 PDK board
+**************************
+
+This file documents the Buildroot support for the Freescale i.MX25 PDK board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX25 PDK board:
+
+  make mx25pdk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - imx25-pdk.dtb
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.imx
+  - zImage
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/imx25pdk/genimage.cfg.
+
+Boot the i.MX25 PDK board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- put a USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/mx25pdk_defconfig b/configs/mx25pdk_defconfig
new file mode 100644
index 0000000..d682f0f
--- /dev/null
+++ b/configs/mx25pdk_defconfig
@@ -0,0 +1,34 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx25pdk/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx25pdk"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx25-pdk"

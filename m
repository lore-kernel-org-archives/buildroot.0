From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:01:01 +0200
Subject: [Buildroot] [git commit branch/next] configs: new configuration for
	NXP i.MX7 SabreSD
Message-ID: <20160513200411.4227181E92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=205f80b89491358e978700436b988c1e2b9a70ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx7dsdb/genimage.cfg    | 41 ++++++++++++++++++++++++
 board/freescale/imx7dsdb/post-image.sh   | 16 ++++++++++
 board/freescale/imx7dsdb/readme.txt      | 54 ++++++++++++++++++++++++++++++++
 configs/freescale_imx7dsabresd_defconfig | 36 +++++++++++++++++++++
 4 files changed, 147 insertions(+)

diff --git a/board/freescale/imx7dsdb/genimage.cfg b/board/freescale/imx7dsdb/genimage.cfg
new file mode 100644
index 0000000..aa6ae9e
--- /dev/null
+++ b/board/freescale/imx7dsdb/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal microSD card image for the Freescale's i.MX7D SDB board
+#
+# We mimic the .sdcard Freescale's image format for i.MX7D:
+# * the microSD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx7d-sdb.dtb",
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
diff --git a/board/freescale/imx7dsdb/post-image.sh b/board/freescale/imx7dsdb/post-image.sh
new file mode 100755
index 0000000..8757355
--- /dev/null
+++ b/board/freescale/imx7dsdb/post-image.sh
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
diff --git a/board/freescale/imx7dsdb/readme.txt b/board/freescale/imx7dsdb/readme.txt
new file mode 100644
index 0000000..c72e9a9
--- /dev/null
+++ b/board/freescale/imx7dsdb/readme.txt
@@ -0,0 +1,54 @@
+***************************
+Freescale i.MX7D SDB board
+***************************
+
+This file documents the Buildroot support for the Freescale i.MX7D SDB board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX7D SDB board:
+
+  make freescale_imx7dsabresd_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - imx7d-sdb.dtb
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
+  dd if=./output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/imx7dsdb/genimage.cfg.
+
+Boot the i.MX7D SDB board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
new file mode 100644
index 0000000..6768041
--- /dev/null
+++ b/configs/freescale_imx7dsabresd_defconfig
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
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.0.0_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.0.0_ga"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx7dsdb/post-image.sh"

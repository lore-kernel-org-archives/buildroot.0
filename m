From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 May 2016 16:28:31 -0300
Subject: [Buildroot] [PATCH v2 3/3] imx53loco: Use common script for
	generating sdcard image
In-Reply-To: <1464290911-30595-1-git-send-email-festevam@gmail.com>
References: <1464290911-30595-1-git-send-email-festevam@gmail.com>
Message-ID: <1464290911-30595-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the common script used by other i.mx boards to generate the sdcard image.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 board/freescale/imx53loco/create-boot-sd.sh |  1 -
 board/freescale/imx53loco/genimage.cfg      | 42 +++++++++++++++++++++++++++++
 board/freescale/imx53loco/post-image.sh     | 16 +++++++++++
 configs/mx53loco_defconfig                  |  6 +++++
 4 files changed, 64 insertions(+), 1 deletion(-)
 delete mode 120000 board/freescale/imx53loco/create-boot-sd.sh
 create mode 100644 board/freescale/imx53loco/genimage.cfg
 create mode 100644 board/freescale/imx53loco/post-image.sh

diff --git a/board/freescale/imx53loco/create-boot-sd.sh b/board/freescale/imx53loco/create-boot-sd.sh
deleted file mode 120000
index d45d639..0000000
--- a/board/freescale/imx53loco/create-boot-sd.sh
+++ /dev/null
@@ -1 +0,0 @@
-../create-boot-sd.sh
\ No newline at end of file
diff --git a/board/freescale/imx53loco/genimage.cfg b/board/freescale/imx53loco/genimage.cfg
new file mode 100644
index 0000000..b56c168
--- /dev/null
+++ b/board/freescale/imx53loco/genimage.cfg
@@ -0,0 +1,42 @@
+# Minimal microSD card image for the Freescale's i.MX53 QSB board
+#
+# We mimic the .sdcard Freescale's image format for i.MX53:
+# * the microSD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx53-qsb.dtb",
+      "imx53-qsrb.dtb",
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
diff --git a/board/freescale/imx53loco/post-image.sh b/board/freescale/imx53loco/post-image.sh
new file mode 100644
index 0000000..8757355
--- /dev/null
+++ b/board/freescale/imx53loco/post-image.sh
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
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index e461f7a..b62172c 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -11,7 +11,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx53loco/patches/"
 
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
 # Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx53loco/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-- 
1.9.1

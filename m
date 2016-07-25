From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Jul 2016 18:47:10 -0300
Subject: [Buildroot] [PATCH v2] configs/warpboard: Generate an sdcard image
Message-ID: <1469483230-18747-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Generate an sdcard.img image to make it easier the deployment of a
Buildroot image.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Adjust the prefix in the Subject
- Adjust the README file to include the eMMC sdcard.img flashing procedure
and the new files (rootfs.ext4 and sdcard.img)

 board/freescale/warpboard/README        | 14 +++++++----
 board/freescale/warpboard/genimage.cfg  | 41 +++++++++++++++++++++++++++++++++
 board/freescale/warpboard/post-image.sh | 16 +++++++++++++
 configs/warpboard_defconfig             | 10 ++++++++
 4 files changed, 76 insertions(+), 5 deletions(-)
 create mode 100644 board/freescale/warpboard/genimage.cfg
 create mode 100644 board/freescale/warpboard/post-image.sh

diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
index 7e6bdc5..871d5cd 100644
--- a/board/freescale/warpboard/README
+++ b/board/freescale/warpboard/README
@@ -9,7 +9,9 @@ Build all components:
 
 You will find in ./output/images/ the following files:
   - imx6sl-warp.dtb
+  - rootfs.ext4
   - rootfs.tar
+  - sdcard.img
   - u-boot.imx
   - zImage
 
@@ -42,14 +44,16 @@ Update uboot
 Update linux & rootfs
 =====================
 
-Run the 'ums' command from the U-Boot prompt to mount the eMMC as mass
-storage and update zImage, device tree (imx6sl-warp.dtb) and rootfs
-file (rootfs.tar) :
+Run the 'ums' command from the U-Boot prompt to mount the eMMC as USB mass
+storage:
 
 => ums 0 mmc 0
 
-Put the zImage and DTB files in the warp-vfat partition and extract as
-root the rootfs.tar tarball in the warp-rootfs partition.
+And then flash the sdcard.img into the eMMC:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the eMMC content. Use it with care! ***
 
 Using bluetooth
 ================
diff --git a/board/freescale/warpboard/genimage.cfg b/board/freescale/warpboard/genimage.cfg
new file mode 100644
index 0000000..a22aa2a
--- /dev/null
+++ b/board/freescale/warpboard/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal SD card image for the Warp board
+#
+# We mimic the .sdcard Freescale's image format for i.MX6SL:
+# * the microSD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx6sl-warp.dtb",
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
diff --git a/board/freescale/warpboard/post-image.sh b/board/freescale/warpboard/post-image.sh
new file mode 100644
index 0000000..8757355
--- /dev/null
+++ b/board/freescale/warpboard/post-image.sh
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
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 8dfe52e..562dc33 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -37,3 +37,13 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # host utility
 BR2_PACKAGE_HOST_DFU_UTIL=y
 BR2_PACKAGE_HOST_IMX_USB_LOADER=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/warpboard/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# required tools to create the eMMC image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.9.1

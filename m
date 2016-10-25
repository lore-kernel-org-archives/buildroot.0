From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 12:36:08 +0200
Subject: [Buildroot] [git commit] configs/warp7: Use common script for
	generating boot image
Message-ID: <20161025103622.1E20581909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8513ffee43f473e8134fa48755837722926123b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the common board/freescale/common/post-image.sh script instead of
a custom one.

As the final image binary is called "sdcard.img" update the documentation
accordingly.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/warp7/genimage.cfg  | 41 -----------------------------------------
 board/warp7/post-image.sh | 14 --------------
 board/warp7/readme.txt    |  8 ++++----
 configs/warp7_defconfig   |  2 +-
 4 files changed, 5 insertions(+), 60 deletions(-)

diff --git a/board/warp7/genimage.cfg b/board/warp7/genimage.cfg
deleted file mode 100644
index 6d963ac..0000000
--- a/board/warp7/genimage.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-# Minimal eMMC image for the Warp board
-#
-# We mimic the .sdcard Freescale's image format for i.MX7S:
-# * the eMMC card must have 1 kB free space at the beginning,
-# * U-Boot is dumped as is,
-# * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
-#
-
-image boot.vfat {
-  vfat {
-    files = {
-      "imx7s-warp.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
-}
-
-image emmc.img {
-  hdimage {
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.imx"
-    offset = 1024
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 8M
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/warp7/post-image.sh b/board/warp7/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/warp7/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
index 00325e7..47458e9 100644
--- a/board/warp7/readme.txt
+++ b/board/warp7/readme.txt
@@ -19,7 +19,7 @@ You will find in output/images/ the following files:
   - imx7s-warp.dtb
   - rootfs.ext4
   - rootfs.tar
-  - emmc.img
+  - sdcard.img
   - u-boot.imx
   - zImage
 
@@ -37,11 +37,11 @@ To determine the device associated to the eMMC have a look in the
 
   cat /proc/partitions
 
-Buildroot prepares a bootable "emmc.img" image in the output/images/
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
 directory, ready to be dumped into the eMMC. Launch the following
 command:
 
-sudo dd if=output/images/emmc.img of=/dev/<your-emmc-device>
+sudo dd if=output/images/sdcard.img of=/dev/<your-emmc-device>
 
 *** WARNING! This will destroy all the eMMC content. Use it with care! ***
 
@@ -77,7 +77,7 @@ Use the default environment variables:
 => saveenv
 => ums 0 mmc 0
 
-sudo dd if=output/images/emmc.img of=/dev/<your-emmc-device>
+sudo dd if=output/images/sdcard.img of=/dev/<your-emmc-device>
 
 Put warp7 back in eMMC boot mode by placing switch 2 in the lower position
 and reboot the board.
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 63a9592..31251f4 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -38,7 +38,7 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
 BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/warp7/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 

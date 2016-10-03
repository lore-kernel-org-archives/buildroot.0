From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:14:30 +0200
Subject: [Buildroot] [git commit] configs/imx6ulpico: Use common script for
	image generation
Message-ID: <20161003211434.9ABFA819CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e091135be670b7b3a9a72312cff3ac30aed8d3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using the common board/freescale/common/post-image.sh can lead
to some good amount of simplification.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/technexion/imx6ulpico/genimage.cfg  | 41 -------------------------------
 board/technexion/imx6ulpico/post-image.sh | 14 -----------
 configs/imx6ulpico_defconfig              |  2 +-
 3 files changed, 1 insertion(+), 56 deletions(-)

diff --git a/board/technexion/imx6ulpico/genimage.cfg b/board/technexion/imx6ulpico/genimage.cfg
deleted file mode 100644
index 9e67105..0000000
--- a/board/technexion/imx6ulpico/genimage.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-# Minimal eMMC card image for the Technexion's i.MX6UL Pico board
-#
-# We mimic the .sdcard Freescale's image format for i.MX6UL:
-# * the eMMC must have 1 kB free space at the beginning,
-# * U-Boot is dumped as is,
-# * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
-#
-
-image boot.vfat {
-  vfat {
-    files = {
-      "imx6ul-pico-hobbit.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
-}
-
-image sdcard.img {
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
diff --git a/board/technexion/imx6ulpico/post-image.sh b/board/technexion/imx6ulpico/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/technexion/imx6ulpico/post-image.sh
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
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 67058f8..d94478a 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -45,6 +45,6 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # filesystem / image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technexion/imx6ulpico/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y

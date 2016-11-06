From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:41:46 +0100
Subject: [Buildroot] [git commit branch/next] configs/imx28evk: Use the
	common mxs genimage script
Message-ID: <20161106214220.D5598818BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfd3b84813e8b12b0b9f6044b0ada20e0ccddaee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use the common mxs genimage script instead of a custom one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx28evk/genimage.cfg  | 29 -----------------------------
 board/freescale/imx28evk/post-image.sh | 14 --------------
 configs/freescale_imx28evk_defconfig   |  2 +-
 3 files changed, 1 insertion(+), 44 deletions(-)

diff --git a/board/freescale/imx28evk/genimage.cfg b/board/freescale/imx28evk/genimage.cfg
deleted file mode 100644
index 4df432f..0000000
--- a/board/freescale/imx28evk/genimage.cfg
+++ /dev/null
@@ -1,29 +0,0 @@
-image kernel.vfat {
-	vfat {
-		files = {
-		"zImage", "imx28-evk.dtb"
-		}
-	}
-	size = 16M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-	partition boot {
-		partition-type = 0x53
-		image = "u-boot.sd"
-		offset = 1M
-		size = 16M
-	}
-
-	partition kernel {
-		partition-type = 0xC
-		image = "kernel.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-	}
-}
diff --git a/board/freescale/imx28evk/post-image.sh b/board/freescale/imx28evk/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/freescale/imx28evk/post-image.sh
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
diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index 790c338..08d5bd9 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -31,4 +31,4 @@ BR2_TARGET_ROOTFS_EXT4=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx28evk/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"

From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  6 Nov 2016 17:12:15 -0200
Subject: [Buildroot] [PATCH 2/2] configs/imx28evk: Use the common mxs
	genimage script
In-Reply-To: <1478459535-20024-1-git-send-email-festevam@gmail.com>
References: <1478459535-20024-1-git-send-email-festevam@gmail.com>
Message-ID: <1478459535-20024-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the common mxs genimage script instead of a custom one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx28evk/genimage.cfg  | 29 -----------------------------
 board/freescale/imx28evk/post-image.sh | 14 --------------
 configs/freescale_imx28evk_defconfig   |  2 +-
 3 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 board/freescale/imx28evk/genimage.cfg
 delete mode 100755 board/freescale/imx28evk/post-image.sh

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
-- 
2.7.4

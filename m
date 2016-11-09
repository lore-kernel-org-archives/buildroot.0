From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:33:33 +0100
Subject: [Buildroot] [git commit branch/next] olimex_imx233_olinuxino: use
	the common mxs genimage script
Message-ID: <20161109213337.AB7DD807A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58cf64bf66c7024626f6636206d4a363bfc2e255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../imx233_olinuxino/genimage-imx233_olinuxino.cfg | 29 ----------------------
 board/olimex/imx233_olinuxino/post-image.sh        | 17 -------------
 configs/olimex_imx233_olinuxino_defconfig          |  2 +-
 3 files changed, 1 insertion(+), 47 deletions(-)

diff --git a/board/olimex/imx233_olinuxino/genimage-imx233_olinuxino.cfg b/board/olimex/imx233_olinuxino/genimage-imx233_olinuxino.cfg
deleted file mode 100644
index 751fe86..0000000
--- a/board/olimex/imx233_olinuxino/genimage-imx233_olinuxino.cfg
+++ /dev/null
@@ -1,29 +0,0 @@
-image kernel.vfat {
-  vfat {
-    files = {
-      "imx23-olinuxino.dtb",
-      "uImage"
-    }
-  }
-  size = 5M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-  partition boot {
-    	partition-type = 0x53
-    	image = "u-boot.sd"
-	size = 16M
-  }
-
-  partition kernel {
-    partition-type = 0xC
-    image = "kernel.vfat"
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext2"
-  }
-}
diff --git a/board/olimex/imx233_olinuxino/post-image.sh b/board/olimex/imx233_olinuxino/post-image.sh
deleted file mode 100755
index 948d770..0000000
--- a/board/olimex/imx233_olinuxino/post-image.sh
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-BOARD_NAME="$(basename ${BOARD_DIR})"
-GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index e0a7b08..1040e5e 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -46,5 +46,5 @@ BR2_TARGET_UBOOT_FORMAT_SD=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/imx233_olinuxino/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
 

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:37 -0300
Subject: [Buildroot] [PATCH 12/15] board/imx233_olinuxino: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-13-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let's rework the board and config files to use the
recently added genimage infra, which generates the
SD card image directly.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 board/olimex/imx233_olinuxino/post-image.sh | 14 --------------
 configs/olimex_imx233_olinuxino_defconfig   |  3 ++-
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/board/olimex/imx233_olinuxino/post-image.sh b/board/olimex/imx233_olinuxino/post-image.sh
index 703cbe7ee2f7..d12854938f65 100755
--- a/board/olimex/imx233_olinuxino/post-image.sh
+++ b/board/olimex/imx233_olinuxino/post-image.sh
@@ -1,20 +1,6 @@
 #!/bin/sh
 
-BOARD_DIR="$(dirname $0)"
-BOARD_NAME="$(basename ${BOARD_DIR})"
-GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
 # Create symlink to "rename" kernel image
 ln -sf uImage.imx23-olinuxino ${BINARIES_DIR}/uImage
 
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
 exit $?
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index f74f42222ac5..aa81fa995f55 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -30,6 +30,8 @@ BR2_PACKAGE_ZD1211_FIRMWARE=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/olimex/imx233_olinuxino/post-image.sh"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # U-Boot
@@ -42,7 +44,6 @@ BR2_TARGET_UBOOT_FORMAT_SD=y
  
 # To generate SD Image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/imx233_olinuxino/post-image.sh"
 
-- 
2.7.0

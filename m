From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:32 -0300
Subject: [Buildroot] [PATCH 07/15] board/arietta-g25: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-8-git-send-email-ezequiel@vanguardiasur.com.ar>
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
 board/acmesystems/arietta-g25/post-image.sh     | 16 ----------------
 configs/acmesystems_arietta_g25_128mb_defconfig |  4 ++--
 configs/acmesystems_arietta_g25_256mb_defconfig |  4 ++--
 3 files changed, 4 insertions(+), 20 deletions(-)
 delete mode 100755 board/acmesystems/arietta-g25/post-image.sh

diff --git a/board/acmesystems/arietta-g25/post-image.sh b/board/acmesystems/arietta-g25/post-image.sh
deleted file mode 100755
index c82b189f9c89..000000000000
--- a/board/acmesystems/arietta-g25/post-image.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index 061cb8bd99d5..1b5618373484 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -21,10 +21,10 @@ BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
 
 # Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/acmesystems/arietta-g25/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index 2d62837c2c32..954376c14757 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -21,10 +21,10 @@ BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
 
 # Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/acmesystems/arietta-g25/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.0

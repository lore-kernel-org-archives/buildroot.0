From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:29 -0300
Subject: [Buildroot] [PATCH 04/15] board/wandboard: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-5-git-send-email-ezequiel@vanguardiasur.com.ar>
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
 board/wandboard/post-image.sh | 16 ----------------
 configs/wandboard_defconfig   |  5 +++--
 2 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100755 board/wandboard/post-image.sh

diff --git a/board/wandboard/post-image.sh b/board/wandboard/post-image.sh
deleted file mode 100755
index 95cbfa489705..000000000000
--- a/board/wandboard/post-image.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/usr/bin/env bash
-
-GENIMAGE_CFG="board/wandboard/genimage.cfg"
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
-
-RET=${?}
-exit ${RET}
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index cf71eb2d689b..c76bef0d41a4 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -3,10 +3,11 @@ BR2_cortex_a9=y
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT=
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/wandboard/genimage.cfg"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_USE_DEFCONFIG=y
-- 
2.7.0

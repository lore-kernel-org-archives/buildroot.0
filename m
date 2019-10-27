From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:22:26 +0100
Subject: [Buildroot] [git commit] configs/wandboard: drop custom post-image
 script
Message-ID: <20191027111554.3923489012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0828e6a7daf74844253b8f3c25955e4e55c0bfcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/wandboard/post-image.sh | 15 ---------------
 configs/wandboard_defconfig   |  3 ++-
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/board/wandboard/post-image.sh b/board/wandboard/post-image.sh
deleted file mode 100755
index 18e76aa40d..0000000000
--- a/board/wandboard/post-image.sh
+++ /dev/null
@@ -1,15 +0,0 @@
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
-
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index d2f72f734f..c3e04af53e 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -7,7 +7,8 @@ BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/wandboard/genimage.cfg"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y

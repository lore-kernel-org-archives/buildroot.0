From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:20:43 +0100
Subject: [Buildroot] [git commit] configs/beagleboardx15: drop custom
 post-image script
Message-ID: <20191027111553.D820A8906A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f383ac3f0a737f49bb839908d3dd0e4208c27fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beagleboardx15/post-image.sh | 15 ---------------
 configs/beagleboardx15_defconfig   |  3 ++-
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/board/beagleboardx15/post-image.sh b/board/beagleboardx15/post-image.sh
deleted file mode 100755
index f52682f5d5..0000000000
--- a/board/beagleboardx15/post-image.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-    --rootpath "${TARGET_DIR}" \
-    --tmppath "${GENIMAGE_TMP}" \
-    --inputpath "${BINARIES_DIR}" \
-    --outputpath "${BINARIES_DIR}" \
-    --config "${GENIMAGE_CFG}"
diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
index 393b29eef0..039a07b11e 100644
--- a/configs/beagleboardx15_defconfig
+++ b/configs/beagleboardx15_defconfig
@@ -1,7 +1,8 @@
 BR2_arm=y
 BR2_cortex_a15=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboardx15/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboardx15/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"

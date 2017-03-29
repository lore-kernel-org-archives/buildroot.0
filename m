From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Wed, 29 Mar 2017 10:51:19 -0400
Subject: [Buildroot] [RFC 3/4] configs/raspberrypi3_defconfig: set
	BR2_GENIMAGE_CFG_FILES
In-Reply-To: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170329145120.11863-4-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the new BR2_GENIMAGE_CFG_FILES Kconfig symbol to reduce
boilerplate and use the generic genimage wrapper.

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
---
 board/raspberrypi/post-image.sh | 16 ----------------
 configs/raspberrypi3_defconfig  |  1 +
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index b2bb070..6d8e62c 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -1,10 +1,5 @@
 #!/bin/sh
 
-BOARD_DIR="$(dirname $0)"
-BOARD_NAME="$(basename ${BOARD_DIR})"
-GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
 case "${2}" in
 	--add-pi3-miniuart-bt-overlay)
 	if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
@@ -17,14 +12,3 @@ __EOF__
 	fi
 	;;
 esac
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
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index de0c42d..a6deff4 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -35,3 +35,4 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
+BR2_GENIMAGE_CFG_FILES="board/raspberrypi3/genimage-raspberrypi3.cfg"
-- 
2.9.3

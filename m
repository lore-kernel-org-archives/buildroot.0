From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:07 +0000
Subject: [Buildroot] [PATCH 6/8] board/raspberrypi: post-image --rootfs
 option
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <20190129132309.3455-7-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to change the rootfs. This option is useful if you would
like to create an image using something other than ext4.

Usage: --rootfs=example
Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 board/raspberrypi/genimage-raspberrypi-generic.cfg | 2 +-
 board/raspberrypi/post-image.sh                    | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi-generic.cfg b/board/raspberrypi/genimage-raspberrypi-generic.cfg
index 8bdd553a34..96020a5ddc 100644
--- a/board/raspberrypi/genimage-raspberrypi-generic.cfg
+++ b/board/raspberrypi/genimage-raspberrypi-generic.cfg
@@ -24,6 +24,6 @@ image sdcard.img {
 
   partition rootfs {
     partition-type = 0x83
-    image = "rootfs.ext4"
+    image = "{ROOTFS}"
   }
 }
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 7e39399187..77118deafd 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -7,6 +7,7 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-raspberrypi-generic.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 INCLUDE_OVERLAYS=false
+ROOTFS="rootfs.ext4"
 
 if [ -e ${BOARD_DIR}/${BOARD_NAME}.conf ]
 then
@@ -58,6 +59,9 @@ __EOF__
 		--file=*)
 		FILES+=("${arg:7}")
 		;;
+		--rootfs=*)
+		ROOTFS="${arg:9}"
+		;;
 	esac
 
 done
@@ -87,8 +91,9 @@ do
 	FILES[$i]=$(echo "\"${FILES[$i]}\"," | sed -e 's/[\/&]/\\&/g')
 done
 SEDCMD_BOOTFILES=" -e 's/{BOOT_FILES}/${FILES[*]}/' "
+SEDCMD_ROOTFS=" -e 's/{ROOTFS}/${ROOTFS}/' "
 
-eval "sed ${SEDCMD_BOOTFILES} ${GENIMAGE_CFG}" > ${BUILD_DIR}/genimage.cfg
+eval "sed ${SEDCMD_BOOTFILES} ${SEDCMD_ROOTFS} ${GENIMAGE_CFG}" > ${BUILD_DIR}/genimage.cfg
 
 rm -rf "${GENIMAGE_TMP}"
 
-- 
2.11.0

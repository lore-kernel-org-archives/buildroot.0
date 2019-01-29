From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:08 +0000
Subject: [Buildroot] [PATCH 7/8] board/raspberrypi: post-image --skip-sdimg
 option
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <20190129132309.3455-8-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to disable the sd-card.img.
This is useful for when youre not building any compatible rootfs.

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 board/raspberrypi/genimage-raspberrypi-generic.cfg | 2 ++
 board/raspberrypi/post-image.sh                    | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/genimage-raspberrypi-generic.cfg b/board/raspberrypi/genimage-raspberrypi-generic.cfg
index 96020a5ddc..91f5039fb8 100644
--- a/board/raspberrypi/genimage-raspberrypi-generic.cfg
+++ b/board/raspberrypi/genimage-raspberrypi-generic.cfg
@@ -12,6 +12,7 @@ image boot.vfat {
   size = 32M
 }
 
+{SDIMG_START}
 image sdcard.img {
   hdimage {
   }
@@ -27,3 +28,4 @@ image sdcard.img {
     image = "{ROOTFS}"
   }
 }
+{SDIMG_END}
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 77118deafd..dbcaf3b1f8 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -8,6 +8,7 @@ GENIMAGE_CFG="${BOARD_DIR}/genimage-raspberrypi-generic.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 INCLUDE_OVERLAYS=false
 ROOTFS="rootfs.ext4"
+SEDCMD_SDIMG=" -e '/{SDIMG_.*}/d' "
 
 if [ -e ${BOARD_DIR}/${BOARD_NAME}.conf ]
 then
@@ -62,6 +63,9 @@ __EOF__
 		--rootfs=*)
 		ROOTFS="${arg:9}"
 		;;
+		--skip-sdimg)
+		SEDCMD_SDIMG=" -e '/{SDIMG_START}/,/{SDIMG_END}/d' "
+		;;
 	esac
 
 done
@@ -93,7 +97,7 @@ done
 SEDCMD_BOOTFILES=" -e 's/{BOOT_FILES}/${FILES[*]}/' "
 SEDCMD_ROOTFS=" -e 's/{ROOTFS}/${ROOTFS}/' "
 
-eval "sed ${SEDCMD_BOOTFILES} ${SEDCMD_ROOTFS} ${GENIMAGE_CFG}" > ${BUILD_DIR}/genimage.cfg
+eval "sed ${SEDCMD_BOOTFILES} ${SEDCMD_ROOTFS} ${SEDCMD_SDIMG} ${GENIMAGE_CFG}" > ${BUILD_DIR}/genimage.cfg
 
 rm -rf "${GENIMAGE_TMP}"
 
-- 
2.11.0

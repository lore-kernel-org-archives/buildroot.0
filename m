From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Aug 2016 00:03:22 +0200
Subject: [Buildroot] [PATCH v1] raspberrypi3: fix serial console (add
	enable_uart=1)
Message-ID: <1470953002-31897-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- enhance post-image.sh script to add 'enable_uart=1' to config.txt on request
- add BR2_ROOTFS_POST_SCRIPT_ARGS="--add-rpi3-config-enable-uart" in raspberrypi3_defconfig

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 board/raspberrypi/post-image.sh | 13 +++++++++++++
 board/raspberrypi/readme.txt    |  6 +++++-
 configs/raspberrypi3_defconfig  |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 73ffd65..3dc5902 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -5,6 +5,19 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
+case "${2}" in
+	--add-rpi3-config-enable-uart)
+	if ! grep -qE 'enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+		echo "Adding 'enable_uart=1' to config.txt."
+		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+
+# fixes rpi3 console
+enable_uart=1
+__EOF__
+	fi
+	;;
+esac
+
 # Mark the kernel as DT-enabled
 mkdir -p "${BINARIES_DIR}/kernel-marked"
 ${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index a170f8f..d101816 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -58,7 +58,7 @@ After building, you should obtain this tree:
     +-- rpi-firmware/
     |   +-- bootcode.bin
     |   +-- cmdline.txt
-    |   +-- config.txt
+    |   +-- config.txt              [3]
     |   +-- fixup.dat
     |   `-- start.elf
     +-- sdcard.img
@@ -69,6 +69,10 @@ After building, you should obtain this tree:
 
 [2] This is the mkknlimg DT-marked kernel.
 
+[3] For Pi 3 an additional 'enable_uart=1' will be added to fix
+    (serial) console output. Alternatives are 'dtoverlay=pi3-miniuart-bt'
+    or 'dtoverlay=pi3-disable-bt'.
+
 How to write the SD card
 ========================
 
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 4eb5333..62f47da 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -34,3 +34,4 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-rpi3-config-enable-uart"
-- 
2.8.1

From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Sat, 15 Jul 2017 14:50:29 +0200
Subject: [Buildroot] [PATCH v2 1/4] board/raspberrypi/post-image.sh: add
	multi arg support
Message-ID: <1500123032-9198-1-git-send-email-erik.stromdahl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add possibility to supply multiple arguments to
post-image.sh

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
Changes v1 -> v2:
  - Fixed bad print in patch 2
  - Fixed commit comment and removed parenthesis in patch 4
    (comment from Ricardo Martincoski)

 board/raspberrypi/post-image.sh | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index de97299..4f136f6 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -5,39 +5,43 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-case "${2}" in
-	--add-pi3-miniuart-bt-overlay)
-	if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-		echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
-		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+for arg in "$@"
+do
+	case "${arg}" in
+		--add-pi3-miniuart-bt-overlay)
+		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+			echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
+			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
 # fixes rpi3 ttyAMA0 serial console
 dtoverlay=pi3-miniuart-bt
 __EOF__
-	fi
-	;;
-	--aarch64)
-	# Run a 64bits kernel (armv8)
-	sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
-	if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+		fi
+		;;
+		--aarch64)
+		# Run a 64bits kernel (armv8)
+		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
+		if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
 # enable 64bits support
 arm_control=0x200
 __EOF__
-	fi
+		fi
 
-	# Enable uart console
-	if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+		# Enable uart console
+		if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
 # enable rpi3 ttyS0 serial console
 enable_uart=1
 __EOF__
-	fi
-	;;
+		fi
+		;;
 esac
 
+done
+
 rm -rf "${GENIMAGE_TMP}"
 
 genimage                           \
-- 
2.7.4

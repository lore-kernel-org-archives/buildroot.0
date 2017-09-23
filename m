From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 23 Sep 2017 19:30:05 -0400
Subject: [Buildroot] [PATCH 1/3] raspberrypi: post-image.sh handles many
	arguments
In-Reply-To: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
References: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170923233007.13772-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This post-image script now handles many optional arguments given
through the command-line.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 board/raspberrypi/post-image.sh | 42 ++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index de972998b0..1b49f0ea30 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -5,38 +5,42 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-case "${2}" in
-	--add-pi3-miniuart-bt-overlay)
-	if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-		echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
-		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+shift
+while [ $# -ne 0 ]; do
+	case "${1}" in
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
-esac
+		fi
+		;;
+	esac
+	shift
+done
 
 rm -rf "${GENIMAGE_TMP}"
 
-- 
2.13.2

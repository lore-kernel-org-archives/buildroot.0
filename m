From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:08:03 +0200
Subject: [Buildroot] [git commit] board/raspberrypi/post-image.sh: add multi
	arg support
Message-ID: <20170927200048.76D5180F88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39576d0f735108dbbd48a5aa517ed01c053abc4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add possibility to supply multiple arguments to
post-image.sh

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
[Arnout: indent esac, suggested by Ga??l PORTAY]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/raspberrypi/post-image.sh | 42 ++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index de97299..3900a15 100755
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
-esac
+		fi
+		;;
+	esac
+
+done
 
 rm -rf "${GENIMAGE_TMP}"
 

From: Charlie Turner <cturner@igalia.com>
Date: Tue, 10 Mar 2020 11:22:27 +0000
Subject: [Buildroot] [PATCH 2/2] board/raspberrypi: add post-image option
 for VC4 overlay.
In-Reply-To: <20200310112227.16175-1-cturner@igalia.com>
References: <20200310112227.16175-1-cturner@igalia.com>
Message-ID: <20200310112227.16175-2-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is often necessary to add a device tree overlay for the VC4 V3D
driver. On a Raspberry Pi 4 for example, if you enable the Gallium VC4
Mesa driver, you must add dtoverlay=vc4-fkms-v3d to the kernel command
line for it to work correctly. There are times when adding vc4-kms-v3d
is also required. This option allows post-image scripts to add either
option conveniently depending on their specific configuration.

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 board/raspberrypi/post-image.sh | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 9dbd98ef9b..4ffda4bf49 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -11,7 +11,7 @@ for arg in "$@"
 do
 	case "${arg}" in
 		--add-miniuart-bt-overlay)
-		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+		if ! grep -qE '^dtoverlay=miniuart-bt' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
 			echo "Adding 'dtoverlay=miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
 			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
@@ -36,6 +36,18 @@ __EOF__
 		gpu_mem="${arg:2}"
 		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
 		;;
+		--vc4-modesetting-overlay=*)
+		overlay=${arg##*=}
+		if ! grep -qE "^dtoverlay=vc4-.*-v3d" "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+			echo "Adding 'dtoverlay=vc4-${overlay}-v3d' to config.txt."
+			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+
+dtoverlay=vc4-${overlay}-v3d
+__EOF__
+		else
+			sed -e "/^dtoverlay=vc4-.*-v3d/s,=.*,=vc4-${overlay}-v3d," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
+		fi
+		;;
 	esac
 
 done
-- 
2.20.1

From: Rostislav Lisovy <rostislav.lisovy@r7-engineering.com>
Date: Sun, 27 Oct 2019 03:25:59 +0100
Subject: [Buildroot] [PATCH] board/raspberrypi: Make it possible to pass
 "enable_uart=1"
Message-ID: <15b0e769d506b247c8d6fa8e2056f06d89e22be8.camel@r7-engineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use "--enable-uart" in BR2_ROOTFS_POST_SCRIPT_ARGS to enable
the "miniuart". This makes sense in case the
"--add-pi3-miniuart-bt-overlay" is not used, thus the PL011
is being used for the BT/BLE module and the miniuart for console.

Signed-off-by: Rostislav Lisovy <rostislav.lisovy@r7-engineering.com>
---
 board/raspberrypi/post-image.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-
image.sh
index 70447cd48b..e2efd46d3b 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -45,6 +45,16 @@ __EOF__
 		gpu_mem="${arg:2}"
 		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i
"${BINARIES_DIR}/rpi-firmware/config.txt"
 		;;
+		--enable-uart)
+		# Enable uart console
+		if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-
firmware/config.txt"; then
+			cat << __EOF__ >> "${BINARIES_DIR}/rpi-
firmware/config.txt"
+
+# enable rpi3 ttyS0 serial console
+enable_uart=1
+__EOF__
+		fi
+		;;
 	esac
 
 done

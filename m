From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Fri, 14 Jul 2017 08:48:49 +0200
Subject: [Buildroot] [PATCH 2/4] board/raspberrypi/post-image.sh: add VC4
	DTB overlay support
In-Reply-To: <1500014931-5599-1-git-send-email-erik.stromdahl@gmail.com>
References: <1500014931-5599-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <1500014931-5599-2-git-send-email-erik.stromdahl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option for adding the vc4-fkms-v3d dtoverlay in config.txt.
This will enable the VC4 GPU.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 board/raspberrypi/post-image.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 4f136f6..be5ed9c 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -38,6 +38,17 @@ enable_uart=1
 __EOF__
 		fi
 		;;
+		--add-vc4-fkms-v3d-overlay)
+		# Enable VC4 overlay
+		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+			echo "Adding 'dtoverlay=vc4-fkms-v3d' to config.txt (fixes ttyAMA0 serial console)."
+			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+
+# Add VC4 GPU support
+dtoverlay=vc4-fkms-v3d
+__EOF__
+		fi
+		;;
 esac
 
 done
-- 
2.7.4

From: Christophe Blaess <mailist@logilin.fr>
Date: Mon, 28 Oct 2019 10:01:50 +0100
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi/post-build.sh: let HDMI
 console depends on generic getty option
Message-ID: <20191028090150.15099-1-mailist@logilin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christophe Blaess <christophe.blaess@logilin.fr>

When the BR2_TARGET_GENERIC_GETTY option is disabled, the inittab line
running getty on serial console is commented out. But the line running
the HDMI console on Raspberry Pi is still enabled. With this patch the
HDMI getty line is removed.

Signed-off-by: Christophe Blaess <christophe.blaess@logilin.fr>
---
 board/raspberrypi/post-build.sh | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
index 5e5eb71100..4d07dc01eb 100755
--- a/board/raspberrypi/post-build.sh
+++ b/board/raspberrypi/post-build.sh
@@ -5,7 +5,11 @@ set -e
 
 # Add a console on tty1
 if [ -e ${TARGET_DIR}/etc/inittab ]; then
-    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
-	sed -i '/GENERIC_SERIAL/a\
+    # Remove tty1 line from previous build.
+    sed -i '/^tty1::/d' ${TARGET_DIR}/etc/inittab
+    if grep -q '^BR2_TARGET_GENERIC_GETTY=y$' ${BR2_CONFIG}; then
+        # Add tty1 line after serial console.
+        sed -i '/GENERIC_SERIAL/a\
 tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
+    fi
 fi
-- 
2.17.1

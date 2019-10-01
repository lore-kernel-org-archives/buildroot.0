From: Christophe Blaess <mailist@logilin.fr>
Date: Tue,  1 Oct 2019 14:50:28 +0200
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi/post-build.sh: avoid HDMI
 login when getty disabled
Message-ID: <20191001125028.5094-1-mailist@logilin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christophe Blaess <christophe.blaess@logilin.fr>

When the "Run a getty after boot" option is disabled, the inittab line
starting getty on serial console is commented out. But the line running
an HDMI login on Raspberry Pi is still enabled.
With this patch the HDMI line is removed.

Co-authored-by: Christophe Blaess <christophe.blaess@logilin.fr>
Co-authored-by: Stephen Bos <stephen.bos@hagergroup.com>

Signed-off-by: Christophe Blaess <christophe.blaess@logilin.fr>
---
 board/raspberrypi/post-build.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
index 5e5eb71100..7f4e1cc8bf 100755
--- a/board/raspberrypi/post-build.sh
+++ b/board/raspberrypi/post-build.sh
@@ -3,9 +3,11 @@
 set -u
 set -e
 
-# Add a console on tty1
 if [ -e ${TARGET_DIR}/etc/inittab ]; then
-    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
-	sed -i '/GENERIC_SERIAL/a\
+	# Remove tty1 line
+	sed -i '/^tty1::/d' ${TARGET_DIR}/etc/inittab
+	# Add a tty1 line if GENERIC_SERIAL is present (and not commented)
+	sed -i '/^[^#].*GENERIC_SERIAL/a\
 tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
 fi
+
-- 
2.17.1

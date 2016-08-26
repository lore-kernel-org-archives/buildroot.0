From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Aug 2016 11:52:20 +0200
Subject: [Buildroot] [PATCH 2/2] board/raspberrypi/post-build.sh: only tweak
	/etc/inittab if available
In-Reply-To: <1472205140-739-1-git-send-email-peter@korsgaard.com>
References: <1472205140-739-1-git-send-email-peter@korsgaard.com>
Message-ID: <1472205140-739-2-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed out in bug #9161, we don't always have an inittab file (if
systemd or no init is used), so the post build script should only try to
tweak it if present.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/post-build.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
index 7eae14a..5e5eb71 100755
--- a/board/raspberrypi/post-build.sh
+++ b/board/raspberrypi/post-build.sh
@@ -4,6 +4,8 @@ set -u
 set -e
 
 # Add a console on tty1
-grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
-sed -i '/GENERIC_SERIAL/a\
+if [ -e ${TARGET_DIR}/etc/inittab ]; then
+    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+	sed -i '/GENERIC_SERIAL/a\
 tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
+fi
-- 
2.8.1

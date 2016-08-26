From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Aug 2016 11:52:19 +0200
Subject: [Buildroot] [PATCH 1/2] board/minnowboard/post-build.sh: only tweak
	/etc/inittab if available
Message-ID: <1472205140-739-1-git-send-email-peter@korsgaard.com>
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
 board/minnowboard/post-build.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/minnowboard/post-build.sh b/board/minnowboard/post-build.sh
index 1406a50..45f7b52 100755
--- a/board/minnowboard/post-build.sh
+++ b/board/minnowboard/post-build.sh
@@ -5,6 +5,8 @@
 cp -v board/minnowboard/grub-${2}.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
 
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

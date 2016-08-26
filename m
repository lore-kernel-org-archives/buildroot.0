From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 15:37:17 +0200
Subject: [Buildroot] [git commit] board/minnowboard/post-build.sh: only
	tweak /etc/inittab if available
Message-ID: <20160826133723.AB61D803DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=707465da72c617982eb5cf2b8c04cbde4bd3768a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out in bug #9161, we don't always have an inittab file (if
systemd or no init is used), so the post build script should only try to
tweak it if present.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

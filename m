From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:00:27 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 board/wandboard/post-build.sh: create boot.scr at TARGET_DIR/boot
Message-ID: <20200506051931.057EB8D59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b01679eac36f4408e950687e2e002708ca3190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

There is no reason to create boot.scr at board/wandboard and later
install it at TARGET_DIR/boot, leaving a stale file behind.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f14e95b3ff76a4a052a1d1a3fa6ac67fd5a3e911)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/wandboard/post-build.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
index 43e091c5d7..6ddc113702 100755
--- a/board/wandboard/post-build.sh
+++ b/board/wandboard/post-build.sh
@@ -2,7 +2,7 @@
 
 BOARD_DIR="$(dirname $0)"
 
-$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
--n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
+install -d -m 755 $TARGET_DIR/boot
 
-install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
+	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr

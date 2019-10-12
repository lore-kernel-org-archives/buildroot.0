From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 20:30:41 -0300
Subject: [Buildroot] [PATCH] board/wandboard/post-build.sh: create boot.scr
 at TARGET_DIR/boot
Message-ID: <20191012233041.29984-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

There is no reason to create boot.scr at board/wandboard and later
install it at TARGET_DIR/boot, leaving a stale file behind.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 board/wandboard/post-build.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
index 43e091c5d7..17aa9eefaf 100755
--- a/board/wandboard/post-build.sh
+++ b/board/wandboard/post-build.sh
@@ -2,7 +2,9 @@
 
 BOARD_DIR="$(dirname $0)"
 
+install -d -m 755 $TARGET_DIR/boot
+
 $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
--n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
+-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr
 
-install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+chmod 644 $TARGET_DIR/boot/boot.scr
-- 
2.18.1

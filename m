From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 15:42:30 +0200
Subject: [Buildroot] [git commit]
 board/boundarydevices/common/post-build.sh: fix U-Boot naming
Message-ID: <20180719133857.CA80E813E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ef69d824547caabc51b1bfa92948427419a4803
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upgrade.cmd script expects the binary to be named
u-boot.<uboot_defconfig>.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/boundarydevices/common/post-build.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/board/boundarydevices/common/post-build.sh b/board/boundarydevices/common/post-build.sh
index b8abb26540..d97c8d7b6a 100755
--- a/board/boundarydevices/common/post-build.sh
+++ b/board/boundarydevices/common/post-build.sh
@@ -6,6 +6,7 @@
 #
 
 BOARD_DIR="$(dirname $0)"
+UBOOT_DEFCONFIG="$(grep BR2_TARGET_UBOOT_BOARD_DEFCONFIG ${BR2_CONFIG} | sed 's/.*\"\(.*\)\"/\1/')"
 
 # bd u-boot looks for standard bootscript
 install -m 0644 -D $BINARIES_DIR/boot.scr $TARGET_DIR/boot/
@@ -14,9 +15,9 @@ $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
 -n "boot script" -d $BOARD_DIR/6x_bootscript.txt $TARGET_DIR/6x_bootscript
 
 # u-boot / update script for bd upgradeu command
-if [ -e $BINARIES_DIR/u-boot.imx ];
-then
-    install -D -m 0644 $BINARIES_DIR/u-boot.imx $TARGET_DIR/u-boot.imx
+if [ -e $BINARIES_DIR/u-boot.imx ]; then
+    install -D -m 0644 $BINARIES_DIR/u-boot.imx \
+        $TARGET_DIR/u-boot.$UBOOT_DEFCONFIG
     $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
     -n "upgrade script" -d $BOARD_DIR/upgrade.cmd $TARGET_DIR/upgrade.scr
     # legacy 6x_upgrade script

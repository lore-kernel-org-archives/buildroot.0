From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 15:42:55 +0200
Subject: [Buildroot] [git commit] board/boundarydevices: add i.MX8MQ support
 to post-build.sh
Message-ID: <20180719133857.DF7D388EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d34f36806398a5d469f440eaf897b40f1336206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use proper ARCH for mkimage command
- Use different U-Boot binary name depending on ARCH

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/boundarydevices/common/post-build.sh | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/board/boundarydevices/common/post-build.sh b/board/boundarydevices/common/post-build.sh
index e30efe8b88..161ec0643f 100755
--- a/board/boundarydevices/common/post-build.sh
+++ b/board/boundarydevices/common/post-build.sh
@@ -8,13 +8,22 @@
 BOARD_DIR="$(dirname $0)"
 UBOOT_DEFCONFIG="$(grep BR2_TARGET_UBOOT_BOARD_DEFCONFIG ${BR2_CONFIG} | sed 's/.*\"\(.*\)\"/\1/')"
 
+if grep -Eq "^BR2_aarch64=y$" ${BR2_CONFIG}; then
+	MKIMAGE_ARCH=arm64
+	UBOOT_BINARY=imx8-boot-sd.bin
+else
+	MKIMAGE_ARCH=arm
+	UBOOT_BINARY=u-boot.imx
+fi
+
 # bd u-boot looks for standard bootscript
-install -m 0644 -D $BINARIES_DIR/boot.scr $TARGET_DIR/boot/
+$HOST_DIR/bin/mkimage -A $MKIMAGE_ARCH -O linux -T script -C none -a 0 -e 0 \
+    -n "boot script" -d $BOARD_DIR/boot.cmd $TARGET_DIR/boot/boot.scr
 
 # u-boot / update script for bd upgradeu command
-if [ -e $BINARIES_DIR/u-boot.imx ]; then
-    install -D -m 0644 $BINARIES_DIR/u-boot.imx \
+if [ -e $BINARIES_DIR/$UBOOT_BINARY ]; then
+    install -D -m 0644 $BINARIES_DIR/$UBOOT_BINARY \
         $TARGET_DIR/u-boot.$UBOOT_DEFCONFIG
-    $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
-    -n "upgrade script" -d $BOARD_DIR/upgrade.cmd $TARGET_DIR/upgrade.scr
+    $HOST_DIR/bin/mkimage -A $MKIMAGE_ARCH -O linux -T script -C none -a 0 -e 0 \
+        -n "upgrade script" -d $BOARD_DIR/upgrade.cmd $TARGET_DIR/upgrade.scr
 fi

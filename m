From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 09:32:50 +0200
Subject: [Buildroot] [PATCH 2/5] board/boundarydevices: update post-build.sh
 for i.MX8MQ platforms
In-Reply-To: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
Message-ID: <20180719073253.22433-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Making sure to use proper ARCH for mkimage command
- Remove obsolete 6x_bootscript/6x_upgrade references
- Copy bootloader as u-boot.<defconfig_name>

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/boundarydevices/common/post-build.sh | 28 ++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/board/boundarydevices/common/post-build.sh b/board/boundarydevices/common/post-build.sh
index b8abb26540..161ec0643f 100755
--- a/board/boundarydevices/common/post-build.sh
+++ b/board/boundarydevices/common/post-build.sh
@@ -6,20 +6,24 @@
 #
 
 BOARD_DIR="$(dirname $0)"
+UBOOT_DEFCONFIG="$(grep BR2_TARGET_UBOOT_BOARD_DEFCONFIG ${BR2_CONFIG} | sed 's/.*\"\(.*\)\"/\1/')"
+
+if grep -Eq "^BR2_aarch64=y$" ${BR2_CONFIG}; then
+	MKIMAGE_ARCH=arm64
+	UBOOT_BINARY=imx8-boot-sd.bin
+else
+	MKIMAGE_ARCH=arm
+	UBOOT_BINARY=u-boot.imx
+fi
 
 # bd u-boot looks for standard bootscript
-install -m 0644 -D $BINARIES_DIR/boot.scr $TARGET_DIR/boot/
-# legacy 6x_bootscript script
-$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
--n "boot script" -d $BOARD_DIR/6x_bootscript.txt $TARGET_DIR/6x_bootscript
+$HOST_DIR/bin/mkimage -A $MKIMAGE_ARCH -O linux -T script -C none -a 0 -e 0 \
+    -n "boot script" -d $BOARD_DIR/boot.cmd $TARGET_DIR/boot/boot.scr
 
 # u-boot / update script for bd upgradeu command
-if [ -e $BINARIES_DIR/u-boot.imx ];
-then
-    install -D -m 0644 $BINARIES_DIR/u-boot.imx $TARGET_DIR/u-boot.imx
-    $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
-    -n "upgrade script" -d $BOARD_DIR/upgrade.cmd $TARGET_DIR/upgrade.scr
-    # legacy 6x_upgrade script
-    $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
-    -n "upgrade script" -d $BOARD_DIR/6x_upgrade.txt $TARGET_DIR/6x_upgrade
+if [ -e $BINARIES_DIR/$UBOOT_BINARY ]; then
+    install -D -m 0644 $BINARIES_DIR/$UBOOT_BINARY \
+        $TARGET_DIR/u-boot.$UBOOT_DEFCONFIG
+    $HOST_DIR/bin/mkimage -A $MKIMAGE_ARCH -O linux -T script -C none -a 0 -e 0 \
+        -n "upgrade script" -d $BOARD_DIR/upgrade.cmd $TARGET_DIR/upgrade.scr
 fi
-- 
2.18.0

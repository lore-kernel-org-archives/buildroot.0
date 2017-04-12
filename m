From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:00 +0200
Subject: [Buildroot] [PATCH 26/53] boards: replace $HOST_DIR/usr/ with
	$HOST_DIR/ in scripts
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-27-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

This is a mechanical change with
git grep -l 'HOST_DIR}\?/usr/' board | xargs sed -i 's%\(HOST_DIR}\?\)/usr/%\1/%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/boundarydevices/common/post-build.sh | 4 ++--
 board/chromebook/snow/mksd.sh              | 4 ++--
 board/chromebook/snow/sign.sh              | 6 +++---
 board/cubietech/cubieboard2/post-build.sh  | 2 +-
 board/firefly/firefly-rk3288/post-image.sh | 2 +-
 board/lemaker/bananapro/post-build.sh      | 2 +-
 board/linksprite/pcduino/post-build.sh     | 2 +-
 board/nanopi-neo/post-build.sh             | 2 +-
 board/nexbox/a95x/post-build.sh            | 2 +-
 board/olimex/a20_olinuxino/post-build.sh   | 2 +-
 board/orangepi/post-build.sh               | 2 +-
 board/pc/post-image.sh                     | 2 +-
 board/solidrun/mx6cubox/post-build.sh      | 2 +-
 board/technologic/ts4800/post-image.sh     | 2 +-
 board/technologic/ts4900/post-image.sh     | 2 +-
 board/udoo/neo/post-build.sh               | 2 +-
 board/wandboard/post-build.sh              | 2 +-
 17 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/board/boundarydevices/common/post-build.sh b/board/boundarydevices/common/post-build.sh
index f68fa0e61b..8f1d44496f 100755
--- a/board/boundarydevices/common/post-build.sh
+++ b/board/boundarydevices/common/post-build.sh
@@ -8,13 +8,13 @@
 BOARD_DIR="$(dirname $0)"
 
 # bd u-boot looks for bootscript here
-$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
 -n "boot script" -d $BOARD_DIR/6x_bootscript.txt $TARGET_DIR/6x_bootscript
 
 # u-boot / update script for bd upgradeu command
 if [ -e $BINARIES_DIR/u-boot.imx ];
 then
     install -D -m 0644 $BINARIES_DIR/u-boot.imx $TARGET_DIR/u-boot.imx
-    $HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
+    $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
     -n "upgrade script" -d $BOARD_DIR/6x_upgrade.txt $TARGET_DIR/6x_upgrade
 fi
diff --git a/board/chromebook/snow/mksd.sh b/board/chromebook/snow/mksd.sh
index b6302aa86f..cba1578ec8 100755
--- a/board/chromebook/snow/mksd.sh
+++ b/board/chromebook/snow/mksd.sh
@@ -14,8 +14,8 @@
 # cgpt does not create protective MBR, and the kernel refuses to read
 # GPT unless there's some kind of MBR in sector 0. So we need parted
 # to write that single sector before doing anything with the GPT.
-cgpt=$HOST_DIR/usr/bin/cgpt
-parted=$HOST_DIR/usr/sbin/parted
+cgpt=$HOST_DIR/bin/cgpt
+parted=$HOST_DIR/sbin/parted
 kernel=$BINARIES_DIR/uImage.kpart
 rootfs=$BINARIES_DIR/rootfs.ext2
 
diff --git a/board/chromebook/snow/sign.sh b/board/chromebook/snow/sign.sh
index 39005ed635..e8f111ff0a 100755
--- a/board/chromebook/snow/sign.sh
+++ b/board/chromebook/snow/sign.sh
@@ -5,9 +5,9 @@
 # The resulting file is called uImage.kpart.
 
 BOARD_DIR=$(dirname $0)
-mkimage=$HOST_DIR/usr/bin/mkimage
-futility=$HOST_DIR/usr/bin/futility
-devkeys=$HOST_DIR/usr/share/vboot/devkeys
+mkimage=$HOST_DIR/bin/mkimage
+futility=$HOST_DIR/bin/futility
+devkeys=$HOST_DIR/share/vboot/devkeys
 
 run() { echo "$@"; "$@"; }
 die() { echo "$@" >&2; exit 1; }
diff --git a/board/cubietech/cubieboard2/post-build.sh b/board/cubietech/cubieboard2/post-build.sh
index 465d493c08..d0a07a8171 100755
--- a/board/cubietech/cubieboard2/post-build.sh
+++ b/board/cubietech/cubieboard2/post-build.sh
@@ -3,7 +3,7 @@
 # 2013, Carlo Caione <carlo.caione@gmail.com>
 
 BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 BOOT_CMD=$BOARD_DIR/boot.cmd
 BOOT_CMD_H=$BINARIES_DIR/boot.scr
 
diff --git a/board/firefly/firefly-rk3288/post-image.sh b/board/firefly/firefly-rk3288/post-image.sh
index 1dd30a6e7e..d89bc7e550 100755
--- a/board/firefly/firefly-rk3288/post-image.sh
+++ b/board/firefly/firefly-rk3288/post-image.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 
 BOARD_DIR="$(dirname $0)"
 GENIMAGE_CFG="${BOARD_DIR}/sd-image.cfg"
diff --git a/board/lemaker/bananapro/post-build.sh b/board/lemaker/bananapro/post-build.sh
index fb4b6e99e1..a335310dbc 100755
--- a/board/lemaker/bananapro/post-build.sh
+++ b/board/lemaker/bananapro/post-build.sh
@@ -4,7 +4,7 @@
 find $TARGET_DIR/lib/firmware/brcm -type f -not -name "brcmfmac43362*" -delete
 
 BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 BOOT_CMD=$BOARD_DIR/boot.cmd
 BOOT_CMD_H=$BINARIES_DIR/boot.scr
 
diff --git a/board/linksprite/pcduino/post-build.sh b/board/linksprite/pcduino/post-build.sh
index 268c107193..e1e1877671 100755
--- a/board/linksprite/pcduino/post-build.sh
+++ b/board/linksprite/pcduino/post-build.sh
@@ -3,7 +3,7 @@
 # 2013, Carlo Caione <carlo.caione@gmail.com>
 
 BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 BOOT_CMD=$BOARD_DIR/boot.cmd
 BOOT_CMD_H=$BINARIES_DIR/boot.scr
 
diff --git a/board/nanopi-neo/post-build.sh b/board/nanopi-neo/post-build.sh
index e6791e71ab..9759efb568 100755
--- a/board/nanopi-neo/post-build.sh
+++ b/board/nanopi-neo/post-build.sh
@@ -4,7 +4,7 @@
 # 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
 
 BOARD_DIR="$( dirname "${0}" )"
-MKIMAGE="${HOST_DIR}/usr/bin/mkimage"
+MKIMAGE="${HOST_DIR}/bin/mkimage"
 BOOT_CMD="${BOARD_DIR}/boot.cmd"
 BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
 
diff --git a/board/nexbox/a95x/post-build.sh b/board/nexbox/a95x/post-build.sh
index 9f4cc04518..f8706f2dff 100755
--- a/board/nexbox/a95x/post-build.sh
+++ b/board/nexbox/a95x/post-build.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 
 $MKIMAGE -C none -A arm64 -T script -d $BOARD_DIR/boot.txt $BINARIES_DIR/boot.scr
 
diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
index ac8d4df184..e2d863aaf5 100755
--- a/board/olimex/a20_olinuxino/post-build.sh
+++ b/board/olimex/a20_olinuxino/post-build.sh
@@ -3,7 +3,7 @@
 # $2    path of boot.cmd
 # $3    output directory for boot.scr
 
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 
 $MKIMAGE -A arm -O linux -T script -C none -d $2 $3/boot.scr
 
diff --git a/board/orangepi/post-build.sh b/board/orangepi/post-build.sh
index a544a19560..07e04df4d5 100755
--- a/board/orangepi/post-build.sh
+++ b/board/orangepi/post-build.sh
@@ -3,7 +3,7 @@
 # 2013, Carlo Caione <carlo.caione@gmail.com>
 
 BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 BOOT_CMD=$BOARD_DIR/boot.cmd
 BOOT_CMD_H=$BINARIES_DIR/boot.scr
 
diff --git a/board/pc/post-image.sh b/board/pc/post-image.sh
index 3b51409c24..c88ecb1dc2 100755
--- a/board/pc/post-image.sh
+++ b/board/pc/post-image.sh
@@ -16,7 +16,7 @@ __EOF__
 else
   BOOT_TYPE=bios
   # Copy grub 1st stage to binaries, required for genimage
-  cp -f ${HOST_DIR}/usr/lib/grub/i386-pc/boot.img ${BINARIES_DIR}
+  cp -f ${HOST_DIR}/lib/grub/i386-pc/boot.img ${BINARIES_DIR}
 fi
 
 BOARD_DIR="$(dirname $0)"
diff --git a/board/solidrun/mx6cubox/post-build.sh b/board/solidrun/mx6cubox/post-build.sh
index 07c480e616..43e091c5d7 100755
--- a/board/solidrun/mx6cubox/post-build.sh
+++ b/board/solidrun/mx6cubox/post-build.sh
@@ -2,7 +2,7 @@
 
 BOARD_DIR="$(dirname $0)"
 
-$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
 -n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
 
 install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/technologic/ts4800/post-image.sh b/board/technologic/ts4800/post-image.sh
index 167dea812c..cc8e5da352 100755
--- a/board/technologic/ts4800/post-image.sh
+++ b/board/technologic/ts4800/post-image.sh
@@ -9,7 +9,7 @@ GENIMAGE_TMP=${BUILD_DIR}/.genimage_tmp
 
 rm -rf ${GENIMAGE_TMP}
 
-${HOST_DIR}/usr/bin/genimage \
+${HOST_DIR}/bin/genimage \
         --config ${GENIMAGE_CFG} \
         --rootpath ${TARGET_DIR} \
         --tmppath ${GENIMAGE_TMP} \
diff --git a/board/technologic/ts4900/post-image.sh b/board/technologic/ts4900/post-image.sh
index 1e90cded72..cb966d883b 100755
--- a/board/technologic/ts4900/post-image.sh
+++ b/board/technologic/ts4900/post-image.sh
@@ -9,7 +9,7 @@ GENIMAGE_TMP=$BUILD_DIR/.genimage_tmp
 
 rm -rf $GENIMAGE_TMP
 
-${HOST_DIR}/usr/bin/genimage \
+${HOST_DIR}/bin/genimage \
         --config ${GENIMAGE_CFG} \
         --rootpath $TARGET_DIR \
         --tmppath $GENIMAGE_TMP \
diff --git a/board/udoo/neo/post-build.sh b/board/udoo/neo/post-build.sh
index 07c480e616..43e091c5d7 100755
--- a/board/udoo/neo/post-build.sh
+++ b/board/udoo/neo/post-build.sh
@@ -2,7 +2,7 @@
 
 BOARD_DIR="$(dirname $0)"
 
-$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
 -n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
 
 install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
index 07c480e616..43e091c5d7 100755
--- a/board/wandboard/post-build.sh
+++ b/board/wandboard/post-build.sh
@@ -2,7 +2,7 @@
 
 BOARD_DIR="$(dirname $0)"
 
-$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
 -n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
 
 install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
-- 
2.11.0

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 15:23:13 +0200
Subject: [Buildroot] [git commit] boards: replace $HOST_DIR/usr/ with
	$HOST_DIR/ in scripts
Message-ID: <20170705141335.441527FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31be2ec220c8ad6e1f98d9fb705034cc288de597
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

This is a mechanical change with
git grep -l 'HOST_DIR}\?/usr/' board | xargs sed -i 's%\(HOST_DIR}\?\)/usr/%\1/%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/common/post-build.sh | 4 ++--
 board/chromebook/snow/mksd.sh              | 4 ++--
 board/chromebook/snow/sign.sh              | 6 +++---
 board/firefly/firefly-rk3288/post-image.sh | 2 +-
 board/friendlyarm/nanopi-neo/post-build.sh | 2 +-
 board/lemaker/bananapro/post-build.sh      | 2 +-
 board/linksprite/pcduino/post-build.sh     | 2 +-
 board/nexbox/a95x/post-build.sh            | 2 +-
 board/olimex/a13_olinuxino/post-build.sh   | 2 +-
 board/orangepi/post-build.sh               | 2 +-
 board/pc/post-image.sh                     | 2 +-
 board/solidrun/mx6cubox/post-build.sh      | 2 +-
 board/technologic/ts4800/post-image.sh     | 2 +-
 board/technologic/ts4900/post-image.sh     | 2 +-
 board/udoo/neo/post-build.sh               | 2 +-
 board/wandboard/post-build.sh              | 2 +-
 16 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/board/boundarydevices/common/post-build.sh b/board/boundarydevices/common/post-build.sh
index f68fa0e..8f1d444 100755
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
index b6302aa..cba1578 100755
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
index 39005ed..e8f111f 100755
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
diff --git a/board/firefly/firefly-rk3288/post-image.sh b/board/firefly/firefly-rk3288/post-image.sh
index 1dd30a6..d89bc7e 100755
--- a/board/firefly/firefly-rk3288/post-image.sh
+++ b/board/firefly/firefly-rk3288/post-image.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 
 BOARD_DIR="$(dirname $0)"
 GENIMAGE_CFG="${BOARD_DIR}/sd-image.cfg"
diff --git a/board/friendlyarm/nanopi-neo/post-build.sh b/board/friendlyarm/nanopi-neo/post-build.sh
index e6791e7..9759efb 100755
--- a/board/friendlyarm/nanopi-neo/post-build.sh
+++ b/board/friendlyarm/nanopi-neo/post-build.sh
@@ -4,7 +4,7 @@
 # 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
 
 BOARD_DIR="$( dirname "${0}" )"
-MKIMAGE="${HOST_DIR}/usr/bin/mkimage"
+MKIMAGE="${HOST_DIR}/bin/mkimage"
 BOOT_CMD="${BOARD_DIR}/boot.cmd"
 BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
 
diff --git a/board/lemaker/bananapro/post-build.sh b/board/lemaker/bananapro/post-build.sh
index fb4b6e9..a335310 100755
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
index 268c107..e1e1877 100755
--- a/board/linksprite/pcduino/post-build.sh
+++ b/board/linksprite/pcduino/post-build.sh
@@ -3,7 +3,7 @@
 # 2013, Carlo Caione <carlo.caione@gmail.com>
 
 BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 BOOT_CMD=$BOARD_DIR/boot.cmd
 BOOT_CMD_H=$BINARIES_DIR/boot.scr
 
diff --git a/board/nexbox/a95x/post-build.sh b/board/nexbox/a95x/post-build.sh
index 9f4cc04..f8706f2 100755
--- a/board/nexbox/a95x/post-build.sh
+++ b/board/nexbox/a95x/post-build.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 
 $MKIMAGE -C none -A arm64 -T script -d $BOARD_DIR/boot.txt $BINARIES_DIR/boot.scr
 
diff --git a/board/olimex/a13_olinuxino/post-build.sh b/board/olimex/a13_olinuxino/post-build.sh
index 79dcfc9..aa2a76b 100755
--- a/board/olimex/a13_olinuxino/post-build.sh
+++ b/board/olimex/a13_olinuxino/post-build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
+MKIMAGE=$HOST_DIR/bin/mkimage
 
 $MKIMAGE -A arm -O linux -T script -C none \
 	 -d board/olimex/a13_olinuxino/boot.cmd \
diff --git a/board/orangepi/post-build.sh b/board/orangepi/post-build.sh
index a544a19..07e04df 100755
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
index 3b51409..c88ecb1 100755
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
index 07c480e..43e091c 100755
--- a/board/solidrun/mx6cubox/post-build.sh
+++ b/board/solidrun/mx6cubox/post-build.sh
@@ -2,7 +2,7 @@
 
 BOARD_DIR="$(dirname $0)"
 
-$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
 -n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
 
 install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/technologic/ts4800/post-image.sh b/board/technologic/ts4800/post-image.sh
index 167dea8..cc8e5da 100755
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
index 1e90cde..cb966d8 100755
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
index 07c480e..43e091c 100755
--- a/board/udoo/neo/post-build.sh
+++ b/board/udoo/neo/post-build.sh
@@ -2,7 +2,7 @@
 
 BOARD_DIR="$(dirname $0)"
 
-$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
 -n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
 
 install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
index 07c480e..43e091c 100755
--- a/board/wandboard/post-build.sh
+++ b/board/wandboard/post-build.sh
@@ -2,7 +2,7 @@
 
 BOARD_DIR="$(dirname $0)"
 
-$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
 -n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
 
 install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr

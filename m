From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Fri, 22 Jan 2016 12:53:39 -0300
Subject: [Buildroot] [PATCH 2/3] board/firefly_rk3288: add new board
In-Reply-To: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <1453478020-311-3-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

More info about the board:
http://en.t-firefly.com/en/firenow/firefly_rk3288/specifications/

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 board/firefly/firefly-rk3288/build_sd_image.sh | 18 ++++++++++++
 board/firefly/firefly-rk3288/extlinux.conf     |  6 ++++
 board/firefly/firefly-rk3288/post-image.sh     |  6 ++++
 board/firefly/firefly-rk3288/pre-image.sh      |  3 ++
 board/firefly/firefly-rk3288/readme.txt        | 40 ++++++++++++++++++++++++++
 board/firefly/firefly-rk3288/sd-image.cfg      | 22 ++++++++++++++
 6 files changed, 95 insertions(+)
 create mode 100755 board/firefly/firefly-rk3288/build_sd_image.sh
 create mode 100644 board/firefly/firefly-rk3288/extlinux.conf
 create mode 100755 board/firefly/firefly-rk3288/post-image.sh
 create mode 100755 board/firefly/firefly-rk3288/pre-image.sh
 create mode 100644 board/firefly/firefly-rk3288/readme.txt
 create mode 100644 board/firefly/firefly-rk3288/sd-image.cfg

diff --git a/board/firefly/firefly-rk3288/build_sd_image.sh b/board/firefly/firefly-rk3288/build_sd_image.sh
new file mode 100755
index 0000000..ae7fde1
--- /dev/null
+++ b/board/firefly/firefly-rk3288/build_sd_image.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+
+set -ue
+
+D=board/firefly/firefly-rk3288
+CFG=${D}/sd-image.cfg
+
+T=$(mktemp -d)
+mkdir -p $T/{root,tmp}
+
+$HOST_DIR/usr/bin/genimage		\
+	--rootpath $T/root/			\
+	--tmppath $T/tmp/			\
+	--inputpath $BINARIES_DIR/	\
+	--outputpath $BINARIES_DIR/	\
+	--config ${CFG}				\
+
+rm -rf $T
diff --git a/board/firefly/firefly-rk3288/extlinux.conf b/board/firefly/firefly-rk3288/extlinux.conf
new file mode 100644
index 0000000..65092d2
--- /dev/null
+++ b/board/firefly/firefly-rk3288/extlinux.conf
@@ -0,0 +1,6 @@
+default firefly-rk3288
+
+label firefly-rk3288
+kernel /boot/uImage
+devicetree /boot/rk3288-firefly.dtb
+append console=ttyS2,115200n8 earlyprintk init=/sbin/init root=/dev/mmcblk0p1 rootwait
diff --git a/board/firefly/firefly-rk3288/post-image.sh b/board/firefly/firefly-rk3288/post-image.sh
new file mode 100755
index 0000000..98c2778
--- /dev/null
+++ b/board/firefly/firefly-rk3288/post-image.sh
@@ -0,0 +1,6 @@
+board=board/firefly/firefly-rk3288
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+
+$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
+
+${board}/build_sd_image.sh
diff --git a/board/firefly/firefly-rk3288/pre-image.sh b/board/firefly/firefly-rk3288/pre-image.sh
new file mode 100755
index 0000000..7770f6b
--- /dev/null
+++ b/board/firefly/firefly-rk3288/pre-image.sh
@@ -0,0 +1,3 @@
+board=board/firefly/firefly-rk3288
+
+install -m 0644 -D $board/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/firefly/firefly-rk3288/readme.txt b/board/firefly/firefly-rk3288/readme.txt
new file mode 100644
index 0000000..d621085
--- /dev/null
+++ b/board/firefly/firefly-rk3288/readme.txt
@@ -0,0 +1,40 @@
+Firefly RK3288
+
+How to build it
+===============
+
+  $ make firefly_rk3288_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build rootfs image:
+
+  $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+  output/images/
+  ??? rk3288-firefly.dtb
+  ??? rootfs.ext2
+  ??? rootfs.ext4 -> rootfs.ext2
+  ??? sdcard.img
+  ??? u-boot-dtb.img
+  ??? u-boot-spl-dtb.bin
+  ??? u-boot-spl-dtb.img
+  ??? uImage
+
+Prepare your SDCard
+===================
+
+Buildroot generates a ready-to-use SD card image that you can flash directly to
+the card. The image will be in output/images/sdcard.img.
+You can write this image directly to an SD card device (i.e. /dev/xxx):
+
+  $ dd if=output/images/sdcard.img of=/dev/xxx
+
+Finally, you can insert the SD card to the Firefly RK3288 board and boot it.
diff --git a/board/firefly/firefly-rk3288/sd-image.cfg b/board/firefly/firefly-rk3288/sd-image.cfg
new file mode 100644
index 0000000..a9eb9f0
--- /dev/null
+++ b/board/firefly/firefly-rk3288/sd-image.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot-spl-dtb {
+    in-partition-table = "no"
+    image = "u-boot-spl-dtb.img"
+    offset = 32K
+  }
+
+  partition u-boot-dtb {
+    in-partition-table = "no"
+    image = "u-boot-dtb.img"
+    offset = 128K
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+    size = 512M
+  }
+}
-- 
2.7.0

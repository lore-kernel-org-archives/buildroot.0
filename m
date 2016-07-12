From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:48 +0200
Subject: [Buildroot] [PATCH 4/5] add files required to build sd card image
	and doc
In-Reply-To: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
References: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468312009-22124-5-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add files required to build a sd card image file for convenience and a
readme.txt with instructions.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 board/ti/am335x-evm/genimage.cfg  | 29 ++++++++++++++++++
 board/ti/am335x-evm/post-image.sh | 22 ++++++++++++++
 board/ti/am335x-evm/readme.txt    | 63 +++++++++++++++++++++++++++++++++++++++
 board/ti/am335x-evm/uEnv.txt      |  3 ++
 4 files changed, 117 insertions(+)
 create mode 100644 board/ti/am335x-evm/genimage.cfg
 create mode 100755 board/ti/am335x-evm/post-image.sh
 create mode 100644 board/ti/am335x-evm/readme.txt
 create mode 100644 board/ti/am335x-evm/uEnv.txt

diff --git a/board/ti/am335x-evm/genimage.cfg b/board/ti/am335x-evm/genimage.cfg
new file mode 100644
index 0000000..a3f8dea
--- /dev/null
+++ b/board/ti/am335x-evm/genimage.cfg
@@ -0,0 +1,29 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"zImage",
+			"uEnv.txt",
+			"am335x-evm.dtb",
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+                image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 512M
+	}
+}
diff --git a/board/ti/am335x-evm/post-image.sh b/board/ti/am335x-evm/post-image.sh
new file mode 100755
index 0000000..6b16f40
--- /dev/null
+++ b/board/ti/am335x-evm/post-image.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+# post-image.sh for ti am335x-evm
+# based on post-image from beagleboard
+# 2014, Marcin Jabrzyk <marcin.jabrzyk@gmail.com>
+# 2016, Lothar Felten <lothar.felten@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+
+# copy the uEnv.txt to the output/images directory
+cp board/ti/am335x-evm/uEnv.txt $BINARIES_DIR/uEnv.txt
+
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+    --rootpath "${TARGET_DIR}" \
+    --tmppath "${GENIMAGE_TMP}" \
+    --inputpath "${BINARIES_DIR}" \
+    --outputpath "${BINARIES_DIR}" \
+    --config "${GENIMAGE_CFG}"
diff --git a/board/ti/am335x-evm/readme.txt b/board/ti/am335x-evm/readme.txt
new file mode 100644
index 0000000..2281a66
--- /dev/null
+++ b/board/ti/am335x-evm/readme.txt
@@ -0,0 +1,63 @@
+Texas Instuments AM335x Evaluation Module (TMDXEVM3358)
+
+Description
+===========
+
+This configuration will build a complete image for the AM335x-EVM, including
+SGX530 graphics acceleation support (only included in the 3354/8/9) and Qt5.
+
+The configuration is based on the ti-processor-sdk-02.00.00.00.
+
+Device tree blobs for the evm-sk, and beaglebone variants are built too.
+
+
+How to build it
+===============
+
+Select the default configuration for the am335x-evm target:
+$ make am335x-evm_defconfig
+
+Optional: modify the configuration:
+$ make menuconfig
+
+Build:
+$ make
+
+
+Result of the build
+===================
+output/images/
+??? am335x-boneblack.dtb
+??? am335x-bone.dtb
+??? am335x-evm.dtb
+??? am335x-evmsk.dtb
+??? boot.vfat
+??? MLO
+??? rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? u-boot.img
+??? uEnv.txt
+??? zImage
+
+To copy the image file to the sdcard use dd:
+dd if=output/images/sdcard.img of=/dev/XXX
+
+
+Tested hardware
+===============
+am335x-evm (rev. 1.1A):
+/usr/bin/sha512sum
+/usr/lib/qt/examples/opengl/hellowindow/hellowindow 
+/usr/bin/OGLES2MagicLantern
+
+beagleboneblack (rev. A5A): 
+/usr/bin/sha512sum
+/usr/lib/qt/examples/opengl/hellowindow/hellowindow 
+/usr/bin/OGLES2MagicLantern
+
+beaglebone (rev. A6):
+/usr/bin/sha512sum
+
+
+2016, Lothar Felten <lothar.felten@gmail.com>
diff --git a/board/ti/am335x-evm/uEnv.txt b/board/ti/am335x-evm/uEnv.txt
new file mode 100644
index 0000000..e09fff5
--- /dev/null
+++ b/board/ti/am335x-evm/uEnv.txt
@@ -0,0 +1,3 @@
+bootpart=0:1
+bootdir=
+uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
-- 
1.9.1

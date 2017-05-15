From: Lothar Felten <lothar.felten@gmail.com>
Date: Mon, 15 May 2017 11:41:30 +0200
Subject: [Buildroot] [PATCH 1/1] Add separate genimage.cfg for beaglebone qt5
Message-ID: <1494841290-15493-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The beaglebone_qt5_defconfig uses an older kernel version which does not
provide a devce tree for the beagle bone green.
post-image selects genimage_qt5.cfg for beaglebone_qt5_defconfig, genimage.cfg
otherwise

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 board/beaglebone/genimage_qt5.cfg | 32 ++++++++++++++++++++++++++++++++
 board/beaglebone/post-image.sh    | 10 +++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 board/beaglebone/genimage_qt5.cfg

diff --git a/board/beaglebone/genimage_qt5.cfg b/board/beaglebone/genimage_qt5.cfg
new file mode 100644
index 0000000..ba60297
--- /dev/null
+++ b/board/beaglebone/genimage_qt5.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"zImage",
+			"uEnv.txt",
+			"am335x-evm.dtb",
+			"am335x-evmsk.dtb",
+			"am335x-bone.dtb",
+			"am335x-boneblack.dtb",
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
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/beaglebone/post-image.sh b/board/beaglebone/post-image.sh
index f0c2bc7..bfc41f2 100755
--- a/board/beaglebone/post-image.sh
+++ b/board/beaglebone/post-image.sh
@@ -8,7 +8,15 @@ BOARD_DIR="$(dirname $0)"
 # copy the uEnv.txt to the output/images directory
 cp board/beaglebone/uEnv.txt $BINARIES_DIR/uEnv.txt
 
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+# the qt5 defconfig does not provide a dt for beaglebone green
+# check if the qt5_defconfig was used:
+DEFCONFIG=$(grep BR2_DEFCONFIG ${BR2_CONFIG})
+
+case $DEFCONFIG in
+	*beaglebone_qt5_defconfig*) GENIMAGE_CFG="${BOARD_DIR}/genimage_qt5.cfg";;
+	*) GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg";;
+esac
+
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
-- 
1.9.1

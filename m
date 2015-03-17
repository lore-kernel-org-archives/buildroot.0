From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 17 Mar 2015 18:51:59 -0400
Subject: [Buildroot] [PATCH 5/5] board/wandboard: add a genimage config
In-Reply-To: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <1426632719-4807-6-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a "genimage.cfg" genimage config file for the Wandboard.
The final generated "sdcard.img" image is ready to use and contains the
setup explained in the board readme.txt file: U-Boot, its environment,
and an Ext4 rootfs partition.

The defconfig and readme file have been slightly changed to enable this
feature.

Tested on a Wandboard Solo.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 board/wandboard/genimage.cfg | 22 ++++++++++++++++++++++
 board/wandboard/readme.txt   |  3 ++-
 configs/wandboard_defconfig  |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 board/wandboard/genimage.cfg

diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
new file mode 100644
index 0000000..15783f0
--- /dev/null
+++ b/board/wandboard/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.imx"
+    offset = 1024
+  }
+
+  partition u-boot-env {
+    in-partition-table = "no"
+    image = "uboot-env.bin"
+    offset = 393216
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+    size = 512M
+  }
+}
diff --git a/board/wandboard/readme.txt b/board/wandboard/readme.txt
index 4dd9c2c..88842b0 100644
--- a/board/wandboard/readme.txt
+++ b/board/wandboard/readme.txt
@@ -2,7 +2,8 @@ Minimal board support for the Wandboard
 
 Wandboard's homepage is here: http://www.wandboard.org/
 
-This config is only tested with the dual core wandboard.
+Note: Buildroot already prepared an "sdcard.img" image ready to boot, but this 
+document explains how to do it manually.
 
 Installing:
 
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 0a6ba50..c0da795 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -4,6 +4,7 @@ BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.0.101"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_MEDIA_GENIMAGE_CFG="board/wandboard/genimage.cfg"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-- 
2.3.3

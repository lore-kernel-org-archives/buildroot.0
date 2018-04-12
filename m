From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:39:43 +0200
Subject: [Buildroot] [git commit] board/freescale/common/imx: add i.MX8
 genimage template
Message-ID: <20180412204905.D69968855D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f50b000e741a135293aef642e680987cf516b3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a genimage template file that is used for i.MX8
platforms in the common i.MX post-image script.

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../common/imx/genimage.cfg.template_imx8          | 40 ++++++++++++++++++++++
 board/freescale/common/imx/post-image.sh           |  4 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
new file mode 100644
index 0000000000..fdb645014a
--- /dev/null
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -0,0 +1,40 @@
+# Minimal SD card image for the Freescale iMX8 boards
+#
+# We mimic the .sdcard Freescale's image format:
+# * the SD card must have 33 kB free space at the beginning,
+# * U-Boot is integrated into imx8-boot-sd.bin and is dumped as is,
+# * a FAT partition at offset 32MB is containing Image and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      %FILES%
+    }
+  }
+  size = 32M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition imx-boot {
+    in-partition-table = "no"
+    image = "imx8-boot-sd.bin"
+    offset = 33K
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 70d2c9c600..264c8a4bcb 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -32,7 +32,9 @@ linux_image()
 
 genimage_type()
 {
-	if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_spl"
 	else
 		echo "genimage.cfg.template"

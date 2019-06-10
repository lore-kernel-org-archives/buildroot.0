From: Joris Offouga <offougajoris@gmail.com>
Date: Mon, 10 Jun 2019 21:41:42 +0200
Subject: [Buildroot] [PATCH v2 1/3] boards/freescale/common: Introduce
 template_no_boot_part_spl
Message-ID: <20190610194144.25958-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This includes the no_boot_part_spl templates which use a /boot
included in rootfs.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
changes v1 -> v2
 - remove no_boot_part feature
 - rename commit 
 - add tested-by 
 - fix comment for template header file
 
 .../genimage.cfg.template_no_boot_part_spl    | 30 +++++++++++++++++++
 board/freescale/common/imx/post-image.sh      |  4 +++
 2 files changed, 34 insertions(+)
 create mode 100644 board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl

diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
new file mode 100644
index 0000000000..9cdecc6ce0
--- /dev/null
+++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
@@ -0,0 +1,30 @@
+# Minimal SD card image for the Freescale boards Template for SPL Boot
+#
+# We mimic the .sdcard Freescale's image format:
+# * the SD card must have 1 kB free space at the beginning,
+# * SPL is at the offset expected by ROM,
+# * U-Boot is at the offset expected by SPL,
+# * The first partition is expected to be an ext2 and have a /boot directory.
+#
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition spl {
+    in-partition-table = "no"
+    image = "SPL"
+    offset = 1024
+  }
+
+  partition u-boot-img {
+    in-partition-table = "no"
+    image = "u-boot.img"
+    offset = 69K
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index d07ad2ef5d..12756c63d5 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -38,6 +38,10 @@ genimage_type()
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
+		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
+		    echo "genimage.cfg.template_no_boot_part_spl"
+		fi
 	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_spl"
 	else
-- 
2.17.1

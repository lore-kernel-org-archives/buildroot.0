From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 23:36:37 +0200
Subject: [Buildroot] [git commit] boards/freescale/common: Introduce
 genimage.cfg.template_no_boot_part_spl
Message-ID: <20190610215434.2FE5F8F7BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc1761790fdef8802a70f83c889f47193a3e0ed0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Modern U-Boot assumes a layout where the first partition is an ext2 and
the kernel and dtb can be found in /boot. In other words, a layout
without boot partition.

Add a genimage.cfg template for the freescale defconfigs with such a
layout.

For now, only the layout with SPL+u-boot.img is added. It's unlikely that
the u-boot.imx approach will be used.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../imx/genimage.cfg.template_no_boot_part_spl     | 30 ++++++++++++++++++++++
 board/freescale/common/imx/post-image.sh           |  4 +++
 2 files changed, 34 insertions(+)

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

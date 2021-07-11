From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Jul 2021 17:19:52 -0300
Subject: [Buildroot] [PATCH 1/3] imx/post-image.sh: Support
 BR2_LINUX_KERNEL_INSTALL_TARGET=y for non-SPL
Message-ID: <20210711201954.2142662-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, only SPL is supported when BR2_LINUX_KERNEL_INSTALL_TARGET=y
is selected.

Support non-SPL case too.

This is needed for booting imx7d-sabresd, for example.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../common/imx/genimage.cfg.template_no_boot_part | 15 +++++++++++++++
 board/freescale/common/imx/post-image.sh          |  2 ++
 2 files changed, 17 insertions(+)
 create mode 100644 board/freescale/common/imx/genimage.cfg.template_no_boot_part

diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
new file mode 100644
index 000000000000..edc34d0fcd12
--- /dev/null
+++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
@@ -0,0 +1,15 @@
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "%UBOOTBIN%"
+    offset = 1024
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 0c2ef53dc643..3bb482debda0 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -47,6 +47,8 @@ genimage_type()
 	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
 		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		    echo "genimage.cfg.template_no_boot_part_spl"
+		else
+		    echo "genimage.cfg.template_no_boot_part"
 		fi
 	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_spl"
-- 
2.25.1

From: Joris Offouga <offougajoris@gmail.com>
Date: Tue,  9 Jul 2019 11:57:02 +0200
Subject: [Buildroot] [PATCH 1/2] board/freescale: Introduce UBOOTBIN in spl
 template
Message-ID: <20190709095703.24229-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For board like imx7d-pico u-boot.img change to u-boot-dtb.img in U-Boot v2019.07
so replace hard code u-boot.img with variable

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 .../common/imx/genimage.cfg.template_no_boot_part_spl         | 4 ++--
 board/freescale/common/imx/genimage.cfg.template_spl          | 4 ++--
 board/freescale/common/imx/post-image.sh                      | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
index 9cdecc6ce0..c29032572a 100644
--- a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
+++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
@@ -17,9 +17,9 @@ image sdcard.img {
     offset = 1024
   }
 
-  partition u-boot-img {
+  partition u-boot {
     in-partition-table = "no"
-    image = "u-boot.img"
+    image = "%UBOOTBIN%"
     offset = 69K
   }
 
diff --git a/board/freescale/common/imx/genimage.cfg.template_spl b/board/freescale/common/imx/genimage.cfg.template_spl
index 0b6e22864b..d2d810777b 100644
--- a/board/freescale/common/imx/genimage.cfg.template_spl
+++ b/board/freescale/common/imx/genimage.cfg.template_spl
@@ -26,9 +26,9 @@ image sdcard.img {
     offset = 1024
   }
 
-  partition u-boot-img {
+  partition u-boot {
     in-partition-table = "no"
-    image = "u-boot.img"
+    image = "%UBOOTBIN%"
     offset = 69K
   }
 
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 12756c63d5..ab51dc2098 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -66,6 +66,10 @@ uboot_image()
 		echo "u-boot-dtb.imx"
 	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
 		echo "u-boot.imx"
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
+	    echo "u-boot-dtb.img"
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
+	    echo "u-boot.img"
 	fi
 }
 
-- 
2.17.1

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 9 Jul 2019 20:04:52 +0200
Subject: [Buildroot] [git commit] board/freescale: Introduce UBOOTBIN in spl
 genimage templates
Message-ID: <20190709180335.27F0881559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f9f3a0e9695e670c707d938096ec620c612b694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For boards like imx7d-pico, u-boot.img changes to u-boot-dtb.img in
U-Boot v2019.07. Therefore, we need to pick u-boot.img or u-boot-dtb.img
depending on the board configuration.

Just like was done in commit 52344e556fa03 for the generic genimage
template, replace the U-Boot file name with UBOOTBIN, which is set
according to the BR2_TARGET_UBOOT_FORMAT_* option. We also need to set
the correct value for this variable for the u-boot.img and
u-boot-dtb.img cases.

While we're at it, rename the partition from 'u-boot-img' to 'u-boot',
to stay consistent with the generic genimage template.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
[Arnout: correct u-boot.img condition, rework commit log]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl | 4 ++--
 board/freescale/common/imx/genimage.cfg.template_spl              | 4 ++--
 board/freescale/common/imx/post-image.sh                          | 4 ++++
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
 

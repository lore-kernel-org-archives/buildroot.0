From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:32:32 +0200
Subject: [Buildroot] [git commit] imx/post-image.sh: support
 BR2_LINUX_KERNEL_INSTALL_TARGET=y for non-SPL
Message-ID: <20210719205850.7D27188469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=63198aaa171a4da4587b3ea190809c0f509a1f56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, only SPL is supported when BR2_LINUX_KERNEL_INSTALL_TARGET=y
is selected.

Support non-SPL case too.

This is needed for booting imx7d-sabresd, for example.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../common/imx/genimage.cfg.template_no_boot_part         | 15 +++++++++++++++
 board/freescale/common/imx/post-image.sh                  |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
new file mode 100644
index 0000000000..edc34d0fcd
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
index 0c2ef53dc6..3bb482debd 100755
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

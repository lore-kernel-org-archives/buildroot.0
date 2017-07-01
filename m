From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Jul 2017 17:34:33 +0200
Subject: [Buildroot] [PATCH] olimex_imx233: refactor with genimage.sh
Message-ID: <20170701153433.11906-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

instead of use a freescale script

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/imx233_olinuxino/genimage.cfg | 37 ++++++++++++++++++++++++++++++
 configs/olimex_imx233_olinuxino_defconfig  |  3 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 board/olimex/imx233_olinuxino/genimage.cfg

diff --git a/board/olimex/imx233_olinuxino/genimage.cfg b/board/olimex/imx233_olinuxino/genimage.cfg
new file mode 100644
index 0000000000..3f4128960f
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/genimage.cfg
@@ -0,0 +1,37 @@
+# We mimic the .sdcard Freescale's MX23/MX28 image format:
+# * u-boot.sb is placed at offset 1M,
+# * a FAT partition at offset 16 MB is containing zImage/uImage and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+	vfat {
+		files = {
+			imx23-olinuxino.dtb, uImage
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
+		partition-type = 0x53
+		image = "u-boot.sd"
+		offset = 1M
+		size = 16M
+	}
+
+	partition kernel {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 1b35b7448c..e5ce15dea3 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -48,5 +48,6 @@ BR2_TARGET_UBOOT_FORMAT_SD=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/imx233_olinuxino/genimage.cfg"
 
-- 
2.11.0

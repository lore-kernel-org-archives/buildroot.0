From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:04:24 +0200
Subject: [Buildroot] [git commit] imx: Introduce an SPL genimage template
Message-ID: <20170924145821.B52F781039@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e2b8e1b42deac0261c96d8a867515d51ef33b5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce a genimage template for booting SPL + u-boot.img U-Boot
binaries.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../freescale/common/imx/genimage.cfg.template_spl | 46 ++++++++++++++++++++++
 board/freescale/common/imx/post-image.sh           | 11 +++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_spl b/board/freescale/common/imx/genimage.cfg.template_spl
new file mode 100644
index 0000000..0b6e228
--- /dev/null
+++ b/board/freescale/common/imx/genimage.cfg.template_spl
@@ -0,0 +1,46 @@
+# Minimal SD card image for the Freescale boards Template for SPL Boot
+#
+# We mimic the .sdcard Freescale's image format:
+# * the SD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8MB is containing zImage/uImage and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      %FILES%
+    }
+  }
+  size = 16M
+}
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
index 9e4da82..b239743 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -28,6 +28,15 @@ linux_image()
 	fi
 }
 
+genimage_type()
+{
+	if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_spl"
+	else
+		echo "genimage.cfg.template"
+	fi
+}
+
 main()
 {
 	local FILES="$(dtb_list) $(linux_image)"
@@ -35,7 +44,7 @@ main()
 	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 	sed -e "s/%FILES%/${FILES}/" \
-		board/freescale/common/imx/genimage.cfg.template > ${GENIMAGE_CFG}
+		board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}
 
 	rm -rf "${GENIMAGE_TMP}"
 

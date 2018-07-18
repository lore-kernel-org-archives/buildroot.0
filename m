From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 11:47:06 +0200
Subject: [Buildroot] [git commit] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
Message-ID: <20180718095331.CB024888A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52344e556fa03d632f2b32276c2701218010b12f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for flashing the u-boot-dtb.imx binary in the SD card
when a target selects BR2_TARGET_UBOOT_FORMAT_DTB_IMX.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/genimage.cfg.template |  2 +-
 board/freescale/common/imx/post-image.sh         | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template b/board/freescale/common/imx/genimage.cfg.template
index acce058b2a..2a7036a7df 100644
--- a/board/freescale/common/imx/genimage.cfg.template
+++ b/board/freescale/common/imx/genimage.cfg.template
@@ -22,7 +22,7 @@ image sdcard.img {
 
   partition u-boot {
     in-partition-table = "no"
-    image = "u-boot.imx"
+    image = "%UBOOTBIN%"
     offset = 1024
   }
 
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 264c8a4bcb..6590beda3e 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -41,13 +41,24 @@ genimage_type()
 	fi
 }
 
+uboot_image()
+{
+	if grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" ${BR2_CONFIG}; then
+		echo "u-boot-dtb.imx"
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
+		echo "u-boot.imx"
+	fi
+}
+
 main()
 {
 	local FILES="$(dtb_list) $(linux_image)"
+	local UBOOTBIN="$(uboot_image)"
 	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
 	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 	sed -e "s/%FILES%/${FILES}/" \
+		-e "s/%UBOOTBIN%/${UBOOTBIN}/" \
 		board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}
 
 	rm -rf "${GENIMAGE_TMP}"

From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  8 Jul 2018 18:16:18 -0300
Subject: [Buildroot] [PATCH v2 1/2] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
Message-ID: <1531084579-7949-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for flashing the u-boot-dtb.imx binary in the SD card
when a target selects BR2_TARGET_UBOOT_FORMAT_DTB_IMX.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use a UBOOTBIN variable to decide the U-Boot binary name instead
of creating a new genimage.cfg variant. (Thanks to Arnout!)

 board/freescale/common/imx/genimage.cfg.template |  2 +-
 board/freescale/common/imx/post-image.sh         | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template b/board/freescale/common/imx/genimage.cfg.template
index acce058..2a7036a 100644
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
index 264c8a4..6590bed 100755
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
-- 
2.7.4

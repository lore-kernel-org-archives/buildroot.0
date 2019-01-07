From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon,  7 Jan 2019 19:14:37 +0100
Subject: [Buildroot] [PATCH v2 5/6] board/freescale/common/imx: Add support
 for i.MX8X
In-Reply-To: <20190107181438.23857-1-nerv@dawncrow.de>
References: <20190107181438.23857-1-nerv@dawncrow.de>
Message-ID: <20190107181438.23857-6-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 .../common/imx/genimage.cfg.template_imx8     |  2 +-
 .../common/imx/imx8-bootloader-prepare.sh     | 20 ++++++++++++++-----
 board/freescale/common/imx/post-image.sh      | 13 ++++++++++++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
index 2f8842f8e0..bd5f6cdc73 100644
--- a/board/freescale/common/imx/genimage.cfg.template_imx8
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -23,7 +23,7 @@ image sdcard.img {
   partition imx-boot {
     in-partition-table = "no"
     image = "imx8-boot-sd.bin"
-    offset = 33K
+    offset = %IMXOFFSET%
   }
 
   partition boot {
diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index cc12666ae6..e98e93a857 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -7,12 +7,22 @@ main ()
 		echo "ERROR: couldn't find dtb: $UBOOT_DTB"
 		exit 1
 	fi
-	cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
-	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
-	${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
-	rm -f ${BINARIES_DIR}/u-boot.its
 
-	${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
+		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
+		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+		rm -f ${BINARIES_DIR}/u-boot.its
+
+		${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	else
+		${HOST_DIR}/bin/mkimage_imx8 -commit > ${BINARIES_DIR}/mkimg.commit
+		cat ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/mkimg.commit > ${BINARIES_DIR}/u-boot-hash.bin
+		cp ${BINARIES_DIR}/bl31.bin ${BINARIES_DIR}/u-boot-atf.bin
+		dd if=${BINARIES_DIR}/u-boot-hash.bin of=${BINARIES_DIR}/u-boot-atf.bin bs=1K seek=128
+
+		${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	fi
 
 	exit $?
 }
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 6590beda3e..12a5bea73b 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -34,6 +34,8 @@ genimage_type()
 {
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_spl"
 	else
@@ -41,6 +43,15 @@ genimage_type()
 	fi
 }
 
+imx_offset()
+{
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
+		echo "33K"
+	else
+		echo "32K"
+	fi
+}
+
 uboot_image()
 {
 	if grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" ${BR2_CONFIG}; then
@@ -53,11 +64,13 @@ uboot_image()
 main()
 {
 	local FILES="$(dtb_list) $(linux_image)"
+	local IMXOFFSET="$(imx_offset)"
 	local UBOOTBIN="$(uboot_image)"
 	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
 	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 	sed -e "s/%FILES%/${FILES}/" \
+		-e "s/%IMXOFFSET%/${IMXOFFSET}/" \
 		-e "s/%UBOOTBIN%/${UBOOTBIN}/" \
 		board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}
 
-- 
2.17.1

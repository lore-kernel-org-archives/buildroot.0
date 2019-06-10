From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 20:22:38 +0200
Subject: [Buildroot] [git commit] board/freescale/common/imx: add support
 for i.MX8MM
Message-ID: <20190610183348.E65198F690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92ac758c40f80487362b69db955564fdaaa05827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the boot image creation for the i.MX8MM, the main differences with
i.MX8M are that there is no HDMI firmware image passed, and the ATF
load address is different.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 7 +++++++
 board/freescale/common/imx/post-image.sh              | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 3b319693ea..df528b0df5 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -15,6 +15,13 @@ main ()
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
+		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ATF_LOAD_ADDR=0x00920000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
+		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+		rm -f ${BINARIES_DIR}/u-boot.its
+
+		${HOST_DIR}/bin/mkimage_imx8 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 	else
 		${HOST_DIR}/bin/mkimage_imx8 -commit > ${BINARIES_DIR}/mkimg.commit
 		cat ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/mkimg.commit > ${BINARIES_DIR}/u-boot-hash.bin
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 12a5bea73b..d07ad2ef5d 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -34,6 +34,8 @@ genimage_type()
 {
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
@@ -47,6 +49,8 @@ imx_offset()
 {
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
 		echo "33K"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
+		echo "33K"
 	else
 		echo "32K"
 	fi

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 15:41:24 +0200
Subject: [Buildroot] [git commit] board/freescale/common/imx: make
 imx8-bootloader-prepare more generic
Message-ID: <20180719133857.C178C88EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a534676dc334879f69a9834aaf47ed440e80a381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow user to override the hardcoded dtb name by using
BR2_ROOTFS_POST_SCRIPT_ARGS.

The only user of this script, configs/freescale_imx8mqevk, is updated
accordingly.

Cc: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 8 ++++++--
 configs/freescale_imx8mqevk_defconfig                 | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 2648147ab0..cc12666ae6 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -2,9 +2,13 @@
 
 main ()
 {
-	# Currently we support imx8mqevk.
+	UBOOT_DTB=$2
+	if [ ! -e "$UBOOT_DTB" ]; then
+		echo "ERROR: couldn't find dtb: $UBOOT_DTB"
+		exit 1
+	fi
 	cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
-	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${BINARIES_DIR}/fsl-imx8mq-evk.dtb > ${BINARIES_DIR}/u-boot.its
+	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 	${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 	rm -f ${BINARIES_DIR}/u-boot.its
 
diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index f48e4f78e4..a6e9b940b5 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -3,6 +3,7 @@ BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mq-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"

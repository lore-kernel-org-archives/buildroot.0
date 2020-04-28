From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Tue, 28 Apr 2020 09:33:51 +0200
Subject: [Buildroot] [PATCH 2/4] board/freescale/common/imx: use generic
 ddr_fw.bin name
In-Reply-To: <1588059233-11467-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1588059233-11467-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1588059233-11467-3-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some SoCs (i.e.: i.MX8M Nano for now), the DDR training firmware
in the boot image depends on the type of memory installed on a board
(LPDDR4, DDR4, etc...). The previous patch makes this firmware name
agnostic of the DDR type and uses ddr_fw.bin as a generic name. This
patch makes imx8-bootloader-prepare.sh use this generic name,
independently of the kind board DDR type.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index abf2e43..ad01cde 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -23,7 +23,7 @@ main ()
 
 		${HOST_DIR}/bin/mkimage_imx8 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$" ${BR2_CONFIG}; then
-		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
 		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00960000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 		rm -f ${BINARIES_DIR}/u-boot.its
-- 
2.7.4

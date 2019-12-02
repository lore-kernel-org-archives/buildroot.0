From: Julien Olivain <juju@cotds.org>
Date: Mon,  2 Dec 2019 21:03:33 +0100
Subject: [Buildroot] [PATCH 1/1] board/freescale/common/imx: use nodtb
 variant in uboot images for 8M
Message-ID: <20191202200333.418111-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using u-boot.bin, u-boot is using its builtin dtb which may not
be suitable for all cases. For TechNexion Pico Pi i.MX8M and
i.MX8MMini, this break the USB and UMS commands. Since those boards
does not have SD card slots, a recovery serial download is needed at
every update.

Using u-boot-nodtb.bin now fixes this issue.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index df528b0df5..cbf741af30 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -10,14 +10,14 @@ main ()
 
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
 		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
-		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ATF_LOAD_ADDR=0x00910000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
+		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00910000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
 		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
-		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ATF_LOAD_ADDR=0x00920000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
+		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00920000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 		rm -f ${BINARIES_DIR}/u-boot.its
 
-- 
2.23.0

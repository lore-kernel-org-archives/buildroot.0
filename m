From: Julien Olivain <juju@cotds.org>
Date: Wed,  6 Mar 2019 22:47:21 +0100
Subject: [Buildroot] [PATCH 1/1] board/freescale/common/imx: fix
 imx8-bootloader-prepare for i.MX8M
Message-ID: <20190306214721.8996-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The update of imx-mkimage in commit
c14d92d439062caa6c94c4a93b20ab18aa20554c

broke the imx8-bootloader-prepare.sh script for i.MX8M, used in
freescale_imx8mqevk_defconfig

The updated mkimage_fit_atf.sh script in imx-mkimage now needs
a ATF_LOAD_ADDR variable, which was set to 0x00910000 for i.MX8M.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index e98e93a857..3b319693ea 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -10,7 +10,7 @@ main ()
 
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
 		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
-		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
+		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ATF_LOAD_ADDR=0x00910000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 		rm -f ${BINARIES_DIR}/u-boot.its
 
-- 
2.20.1

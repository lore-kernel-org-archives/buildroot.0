From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 15:31:42 +0200
Subject: [Buildroot] [git commit] board/freescale/common/imx: add support
 for i.MX8M Nano
Message-ID: <20200418132828.DB4388F08B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb8b6ee4565174d6001157c74d62abdc72b73250
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Almost identical as i.MX8M Mini, here are the differences:
- different ATF load address [1]
- different entry point [2]
- different ROM version (v2) [3]

[1] https://gitlab.denx.de/u-boot/u-boot/-/blob/v2020.04/board/freescale/imx8mn_evk/README
[2] https://gitlab.denx.de/u-boot/u-boot/-/blob/v2020.04/configs/imx8mn_ddr4_evk_defconfig#L22
[3] https://gitlab.denx.de/u-boot/u-boot/-/commit/b8f16834

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 45c648e360..abf2e43de8 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -22,6 +22,13 @@ main ()
 		rm -f ${BINARIES_DIR}/u-boot.its
 
 		${HOST_DIR}/bin/mkimage_imx8 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$" ${BR2_CONFIG}; then
+		cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+		BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00960000 ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
+		${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+		rm -f ${BINARIES_DIR}/u-boot.its
+
+		${HOST_DIR}/bin/mkimage_imx8 -v v2 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x912000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 	else
 		${HOST_DIR}/bin/mkimage_imx8 -commit > ${BINARIES_DIR}/mkimg.commit
 		cat ${BINARIES_DIR}/u-boot.bin ${BINARIES_DIR}/mkimg.commit > ${BINARIES_DIR}/u-boot-hash.bin

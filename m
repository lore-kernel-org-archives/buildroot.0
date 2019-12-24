From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:24:43 +0100
Subject: [Buildroot] [git commit] board/freescale/common/imx: use nodtb
 variant in uboot images for 8M
Message-ID: <20191224131545.5CD498E1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d130f0a83700b52ba51ebde22885f0f9e577ee29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In board/freescale/common/imx/imx8-bootloader-prepare.sh, when
invoking mkimage_fit_atf.sh, the U-Boot DTB is passed as parameter, to
be included in the FIT image. This parameter usually comes from
BR2_ROOTFS_POST_SCRIPT_ARGS config option. The variable
BL33=u-boot.bin set in the invocation uses the u-boot image which is
including its embedded DTB. This means the U-Boot DTB is included
twice.

The upstream script mkimage_fit_atf.sh plus its Buildroot patch are
meant to use by default the nodtb variant and use the DTB in a
separate image. See [1] and [2].

The U-Boot default DTB which will be included in u-boot.bin image is
selected with U-Boot CONFIG_DEFAULT_DEVICE_TREE, or DEVICE_TREE
variable when invoking "make". If one of those option is not aligned
to the BR2_ROOTFS_POST_SCRIPT_ARGS config option, it's possible the
two included U-Boot DTBs are different. If such case happens, the
built-in DTB is always used, regardless of the other one, selected
with BR2_ROOTFS_POST_SCRIPT_ARGS.

For example, this case happens for TechNexion Pico Pi i.MX8M and
i.MX8MMini. Since the U-Boot defconfig assumes the nodtb version will
be used, it does not set the default DTB. The u-boot.bin will include
the fsl-imx8mm-evk instead. Including the wrong board DTB breaks the
USB and UMS commands (and possibly others). Since those boards does
not have SD card slots, a recovery serial download is needed at every
update.

This patch make sure that only the separate U-Boot DTB will be
included in the FIT image by using the nodtb variant.

[1] https://source.codeaurora.org/external/imx/imx-mkimage/tree/iMX8M/mkimage_fit_atf.sh?h=rel_imx_4.14.98_2.0.0_ga#n35
[2] https://git.busybox.net/buildroot/tree/package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch?h=2019.11#n42

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 

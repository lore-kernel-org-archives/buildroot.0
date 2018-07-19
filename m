From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 12:31:04 +0200
Subject: [Buildroot] [PATCH v2 2/7] board/freescale/common/imx: make
 imx8-bootloader-prepare more generic
In-Reply-To: <20180719103109.19887-1-gary.bisson@boundarydevices.com>
References: <20180719103109.19887-1-gary.bisson@boundarydevices.com>
Message-ID: <20180719103109.19887-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow user to override the hardcoded dtb name by using
BR2_ROOTFS_POST_SCRIPT_ARGS.

Cc: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Changes in v2:
- remove fallback to evk dtb
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

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
 
-- 
2.18.0

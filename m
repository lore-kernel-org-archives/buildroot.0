From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 09:32:49 +0200
Subject: [Buildroot] [PATCH 1/5] board/freescale/common/imx: make
 imx8-bootloader-prepare more generic
In-Reply-To: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
Message-ID: <20180719073253.22433-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow user to override the hardcoded dtb name by using
BR2_ROOTFS_POST_SCRIPT_ARGS.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 .../freescale/common/imx/imx8-bootloader-prepare.sh  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 2648147ab0..ce2c3405a0 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -2,9 +2,17 @@
 
 main ()
 {
-	# Currently we support imx8mqevk.
+	if [ $# -le 1 ]; then
+		UBOOT_DTB=${BINARIES_DIR}/fsl-imx8mq-evk.dtb
+	else
+		UBOOT_DTB=$2
+	fi
+	if [ ! -e $UBOOT_DTB ]; then
+		echo "ERROR: couldn't find $UBOOT_DTB"
+		exit 1
+	fi
 	cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
-	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${BINARIES_DIR}/fsl-imx8mq-evk.dtb > ${BINARIES_DIR}/u-boot.its
+	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} > ${BINARIES_DIR}/u-boot.its
 	${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
 	rm -f ${BINARIES_DIR}/u-boot.its
 
-- 
2.18.0

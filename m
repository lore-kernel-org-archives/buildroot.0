From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:38:50 +0200
Subject: [Buildroot] [git commit] board/freescale/common/imx: add
 imx8-bootloader-prepare script
Message-ID: <20180412204905.BF5388855D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a1ad1d135e38f01ba8dd13f713667a071ad3f2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds an imx8-bootloader-prepare.sh script that will be
used by i.MX8 platforms to prepare their bootloader image.

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/imx8-bootloader-prepare.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
new file mode 100755
index 0000000000..2648147ab0
--- /dev/null
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -0,0 +1,16 @@
+#!/usr/bin/env bash
+
+main ()
+{
+	# Currently we support imx8mqevk.
+	cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${BINARIES_DIR}/fsl-imx8mq-evk.dtb > ${BINARIES_DIR}/u-boot.its
+	${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+	rm -f ${BINARIES_DIR}/u-boot.its
+
+	${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+
+	exit $?
+}
+
+main $@

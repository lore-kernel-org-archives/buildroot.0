Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093BFC38147
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 09:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B40284211B;
	Sat, 16 Dec 2023 09:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B40284211B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4UgzNs2yCnk; Sat, 16 Dec 2023 09:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F043442148;
	Sat, 16 Dec 2023 09:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F043442148
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8FC1BF33B
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 771B742148
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771B742148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIrem-hpFIYq for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 09:51:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9063B41D6B
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 09:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9063B41D6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EC6087A95; Sat, 16 Dec 2023 09:51:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 10:48:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 564b00d581c9810f4171a434f02adb0cba0da8a3
X-Git-Newrev: 6f9431c3ad04e56b11bb72f3775cc804fc32918a
X-Patchwork-Hint: ignore
Message-Id: <20231216095110.6EC6087A95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_kria_kd240_defconfig: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6f9431c3ad04e56b11bb72f3775cc804fc32918a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for Xilinx Kria KD240 starter kit.

KD240 features can be found here:
https://www.xilinx.com/products/som/kria/kd240-drives-starter-kit.html

While the Kria SOM is based on a ZynqMP SoC, there are some key
boot config differences from the other ZynqMP evaluation boards.

1. There are no boot switches on Kria SOMs. The boot mode is thus
hard configured for QSPI flash. A pre-programmed boot.bin comes
with every Starter Kit. U-Boot can then find the Linux kernel and
file system on the SD card.

Optional instructions for updating the boot.bin in the QSPI flash
can be found in the readme.txt file and the link below.

https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM

2. Kria SOMs use UART1 for the console instead of UART0. For this
reason, Kria Starter Kits will use a separate extlinux.conf file
from other ZynqMP evaluation boards.

3. The KD240 has a USB to SD card bridge, so the Linux kernel
and file system are found on /dev/sda1 and /dev/sda2.

4. The following patches have been submitted upstream to u-boot.
Without these patches, the usb, sd card and ethernet peripherals
do not work correctly.

https://patchwork.ozlabs.org/project/uboot/patch/20231213134007.2818069-1-neal.frager@amd.com/
https://patchwork.ozlabs.org/project/uboot/patch/20231213134052.2818879-1-neal.frager@amd.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Peter: add upstream tag, drop patch numbering from patches]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |   1 +
 board/zynqmp/kria/kd240/kd240.sh                   |  16 +
 ...64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch | 401 +++++++++++++++++
 ...m64-zynqmp-Add-output-enable-pins-to-SOMs.patch |  79 ++++
 board/zynqmp/kria/kd240/pm_cfg_obj.c               | 494 +++++++++++++++++++++
 board/zynqmp/kria/readme.txt                       |  21 +-
 configs/zynqmp_kria_kd240_defconfig                |  42 ++
 7 files changed, 1046 insertions(+), 8 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ccc4d1bb32..96f3214f94 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2210,6 +2210,7 @@ F:	board/zynqmp/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
+F:	configs/zynqmp_kria_kd240_defconfig
 F:	configs/zynqmp_kria_kr260_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
diff --git a/board/zynqmp/kria/kd240/kd240.sh b/board/zynqmp/kria/kd240/kd240.sh
new file mode 100755
index 0000000000..2203536a52
--- /dev/null
+++ b/board/zynqmp/kria/kd240/kd240.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+# This is a temporary work around for generating kd240 u-boot.itb.
+# The problem is there is no way to currently configure u-boot to apply
+# the carrier board dtb overlay during build, so all kd240 carrier board
+# drivers are missing.
+# This will be removed when u-boot can build the kd240 u-boot.itb natively.
+
+UBOOT_DIR="$4"
+
+fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
+	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k24-revA.dtb" \
+	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kd-g-revA.dtbo"
+
+"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
+			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
new file mode 100644
index 0000000000..f088b90f52
--- /dev/null
+++ b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
@@ -0,0 +1,401 @@
+From f8cba630d3fccd901164dec7bd9b60442bab8995 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Wed, 13 Dec 2023 12:53:29 +0000
+Subject: [PATCH] arm64: zynqmp: Fix k24 psu_init_gpl.c clocking
+
+This patch corrects the k24 som clocking configuration such that the serdes
+clocks are correctly enabled and the usb0 is configured to use the psgtr
+refclk2 for usb3 mode.
+
+This patch also corrects the configuration of mio pins mio76 and mio77
+which should be configured as gpio pins.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231213134007.2818069-1-neal.frager@amd.com/
+---
+ .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 266 +++++++++++++-----
+ 1 file changed, 200 insertions(+), 66 deletions(-)
+
+diff --git a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
+index 45102302dc..4c904c6c81 100644
+--- a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
++++ b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
+@@ -72,6 +72,18 @@ static void dpll_prog(int div2, int ddr_pll_fbdiv, int d_lock_dly,
+ 	Xil_Out32(((0xFD1A0000U) + 0x0000002C), pll_ctrl_regval);
+ }
+ 
++static int serdes_illcalib(u32 lane3_protocol, u32 lane3_rate,
++			   u32 lane2_protocol, u32 lane2_rate,
++			   u32 lane1_protocol, u32 lane1_rate,
++			   u32 lane0_protocol, u32 lane0_rate)
++{
++	Xil_Out32(0xFD409914, 0xF3);
++	Xil_Out32(0xFD409940, 0xF3);
++	Xil_Out32(0xFD409990, 0x20);
++	Xil_Out32(0xFD409924, 0x37);
++	return 1;
++}
++
+ static unsigned long psu_pll_init_data(void)
+ {
+ 	psu_mask_write(0xFF5E0034, 0xFE7FEDEFU, 0x7E4B0C62U);
+@@ -490,20 +502,20 @@ static unsigned long psu_mio_init_data(void)
+ 	psu_mask_write(0xFF18008C, 0x000000FEU, 0x00000000U);
+ 	psu_mask_write(0xFF180090, 0x000000FEU, 0x000000C0U);
+ 	psu_mask_write(0xFF180094, 0x000000FEU, 0x000000C0U);
+-	psu_mask_write(0xFF180098, 0x000000FEU, 0x00000000U);
+-	psu_mask_write(0xFF18009C, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800A0, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800A4, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800A8, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800AC, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800B0, 0x000000FEU, 0x00000000U);
+-	psu_mask_write(0xFF1800B4, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800B8, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800BC, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800C0, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800C4, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800C8, 0x000000FEU, 0x00000010U);
+-	psu_mask_write(0xFF1800CC, 0x000000FEU, 0x00000010U);
++	psu_mask_write(0xFF180098, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF18009C, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800A0, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800A4, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800A8, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800AC, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800B0, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800B4, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800B8, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800BC, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800C0, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800C4, 0x000000FEU, 0x00000002U);
++	psu_mask_write(0xFF1800C8, 0x000000FEU, 0x00000080U);
++	psu_mask_write(0xFF1800CC, 0x000000FEU, 0x00000080U);
+ 	psu_mask_write(0xFF1800D0, 0x000000FEU, 0x00000004U);
+ 	psu_mask_write(0xFF1800D4, 0x000000FEU, 0x00000004U);
+ 	psu_mask_write(0xFF1800D8, 0x000000FEU, 0x00000004U);
+@@ -528,8 +540,8 @@ static unsigned long psu_mio_init_data(void)
+ 	psu_mask_write(0xFF180124, 0x000000FEU, 0x00000002U);
+ 	psu_mask_write(0xFF180128, 0x000000FEU, 0x00000002U);
+ 	psu_mask_write(0xFF18012C, 0x000000FEU, 0x00000002U);
+-	psu_mask_write(0xFF180130, 0x000000FEU, 0x000000C0U);
+-	psu_mask_write(0xFF180134, 0x000000FEU, 0x000000C0U);
++	psu_mask_write(0xFF180130, 0x000000FEU, 0x00000000U);
++	psu_mask_write(0xFF180134, 0x000000FEU, 0x00000000U);
+ 	psu_mask_write(0xFF180204, 0xFFFFFFFFU, 0x50000000U);
+ 	psu_mask_write(0xFF180208, 0xFFFFFFFFU, 0x00B02020U);
+ 	psu_mask_write(0xFF18020C, 0x00003FFFU, 0x00000FC0U);
+@@ -539,18 +551,18 @@ static unsigned long psu_mio_init_data(void)
+ 	psu_mask_write(0xFF180144, 0x03FFFFFFU, 0x03FFFFFFU);
+ 	psu_mask_write(0xFF180148, 0x03FFFFFFU, 0x03FFFFFFU);
+ 	psu_mask_write(0xFF18014C, 0x03FFFFFFU, 0x03FFFFFFU);
+-	psu_mask_write(0xFF180154, 0x03FFFFFFU, 0x00080814U);
++	psu_mask_write(0xFF180154, 0x03FFFFFFU, 0x00FC0814U);
+ 	psu_mask_write(0xFF180158, 0x03FFFFFFU, 0x03FFFFFFU);
+ 	psu_mask_write(0xFF18015C, 0x03FFFFFFU, 0x00000000U);
+-	psu_mask_write(0xFF180160, 0x03FFFFFFU, 0x03FFFFFFU);
+-	psu_mask_write(0xFF180164, 0x03FFFFFFU, 0x03FFFFFFU);
+-	psu_mask_write(0xFF180168, 0x03FFFFFFU, 0x03F7F7EBU);
+-	psu_mask_write(0xFF180170, 0x03FFFFFFU, 0x00FC000BU);
++	psu_mask_write(0xFF180160, 0x0387FFFFU, 0x0387FFFFU);
++	psu_mask_write(0xFF180164, 0x03FFFFFFU, 0x03FFF87FU);
++	psu_mask_write(0xFF180168, 0x03FFFFFFU, 0x0303F7EBU);
++	psu_mask_write(0xFF180170, 0x03FFFFFFU, 0x0004400BU);
+ 	psu_mask_write(0xFF180174, 0x03FFFFFFU, 0x03FFFFFFU);
+ 	psu_mask_write(0xFF180178, 0x03FFFFFFU, 0x00000000U);
+-	psu_mask_write(0xFF18017C, 0x0357FFFFU, 0x0357FFFFU);
+-	psu_mask_write(0xFF180180, 0x03FFFFFFU, 0x0357FFFFU);
+-	psu_mask_write(0xFF180184, 0x03FFFFFFU, 0x0303FFF4U);
++	psu_mask_write(0xFF18017C, 0x03FFFFFFU, 0x03FFFFFFU);
++	psu_mask_write(0xFF180180, 0x03FFFFFFU, 0x03FFFFFFU);
++	psu_mask_write(0xFF180184, 0x03FFFFFFU, 0x03FBBFF4U);
+ 	psu_mask_write(0xFF180200, 0x0000000FU, 0x00000000U);
+ 
+ 	return 1;
+@@ -569,21 +581,16 @@ static unsigned long psu_peripherals_init_data(void)
+ 	psu_mask_write(0xFD1A0100, 0x0001807CU, 0x00000000U);
+ 	psu_mask_write(0xFF5E0238, 0x001A0000U, 0x00000000U);
+ 	psu_mask_write(0xFF5E023C, 0x0093C018U, 0x00000000U);
+-	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
++	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0238, 0x00000001U, 0x00000000U);
+ 	psu_mask_write(0xFF180390, 0x00000004U, 0x00000004U);
+ 	psu_mask_write(0xFF5E023C, 0x00000400U, 0x00000000U);
+-	psu_mask_write(0xFF5E0238, 0x00000040U, 0x00000000U);
+-	psu_mask_write(0xFF180310, 0x00008000U, 0x00000000U);
+-	psu_mask_write(0xFF180320, 0x33840000U, 0x02840000U);
+-	psu_mask_write(0xFF18031C, 0x7FFE0000U, 0x64500000U);
+-	psu_mask_write(0xFF180358, 0x00000008U, 0x00000008U);
+-	psu_mask_write(0xFF180324, 0x03C00000U, 0x00000000U);
++	psu_mask_write(0xFF5E0238, 0x00000080U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0238, 0x00000400U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0238, 0x00008000U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0238, 0x00000010U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0238, 0x00007800U, 0x00000000U);
+-	psu_mask_write(0xFF5E0238, 0x00000004U, 0x00000000U);
++	psu_mask_write(0xFF5E0238, 0x00000006U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0238, 0x00040000U, 0x00000000U);
+ 	psu_mask_write(0xFF4B0024, 0x000000FFU, 0x000000FFU);
+ 	psu_mask_write(0xFFCA5000, 0x00001FFFU, 0x00000000U);
+@@ -591,40 +598,26 @@ static unsigned long psu_peripherals_init_data(void)
+ 	psu_mask_write(0xFFA60040, 0x80000000U, 0x80000000U);
+ 	psu_mask_write(0xFF260020, 0xFFFFFFFFU, 0x05F5DD18U);
+ 	psu_mask_write(0xFF260000, 0x00000001U, 0x00000001U);
+-	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
++	psu_mask_write(0xFF0A0284, 0x03FFFFFFU, 0x01000000U);
++	psu_mask_write(0xFF0A0288, 0x03FFFFFFU, 0x01000000U);
++	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
+ 
+ 	mask_delay(1);
+-	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000002U);
++	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0000U);
+ 
+ 	mask_delay(5);
+-	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
++	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
+ 
+ 	return 1;
+ }
+ 
+ static unsigned long psu_serdes_init_data(void)
+ {
+-	psu_mask_write(0xFD410000, 0x0000001FU, 0x00000009U);
+-	psu_mask_write(0xFD410004, 0x0000001FU, 0x00000009U);
+ 	psu_mask_write(0xFD410008, 0x0000001FU, 0x00000008U);
+-	psu_mask_write(0xFD402860, 0x00000080U, 0x00000080U);
+-	psu_mask_write(0xFD402864, 0x00000081U, 0x00000001U);
+-	psu_mask_write(0xFD402868, 0x00000082U, 0x00000002U);
++	psu_mask_write(0xFD402868, 0x00000080U, 0x00000080U);
+ 	psu_mask_write(0xFD40A094, 0x00000010U, 0x00000010U);
+ 	psu_mask_write(0xFD40A368, 0x000000FFU, 0x00000038U);
+ 	psu_mask_write(0xFD40A36C, 0x00000007U, 0x00000003U);
+-	psu_mask_write(0xFD402368, 0x000000FFU, 0x00000058U);
+-	psu_mask_write(0xFD40236C, 0x00000007U, 0x00000003U);
+-	psu_mask_write(0xFD406368, 0x000000FFU, 0x00000058U);
+-	psu_mask_write(0xFD40636C, 0x00000007U, 0x00000003U);
+-	psu_mask_write(0xFD402370, 0x000000FFU, 0x0000007CU);
+-	psu_mask_write(0xFD402374, 0x000000FFU, 0x00000033U);
+-	psu_mask_write(0xFD402378, 0x000000FFU, 0x00000002U);
+-	psu_mask_write(0xFD40237C, 0x00000033U, 0x00000030U);
+-	psu_mask_write(0xFD406370, 0x000000FFU, 0x0000007CU);
+-	psu_mask_write(0xFD406374, 0x000000FFU, 0x00000033U);
+-	psu_mask_write(0xFD406378, 0x000000FFU, 0x00000002U);
+-	psu_mask_write(0xFD40637C, 0x00000033U, 0x00000030U);
+ 	psu_mask_write(0xFD40A370, 0x000000FFU, 0x000000F4U);
+ 	psu_mask_write(0xFD40A374, 0x000000FFU, 0x00000031U);
+ 	psu_mask_write(0xFD40A378, 0x000000FFU, 0x00000002U);
+@@ -678,18 +671,8 @@ static unsigned long psu_serdes_init_data(void)
+ 	psu_mask_write(0xFD409978, 0x00000010U, 0x00000010U);
+ 	psu_mask_write(0xFD40D978, 0x00000010U, 0x00000010U);
+ 
+-	serdes_illcalib(0, 0, 3, 0, 4, 0, 4, 0);
+-	psu_mask_write(0xFD410010, 0x00000077U, 0x00000044U);
++	serdes_illcalib(0, 0, 3, 0, 0, 0, 0, 0);
+ 	psu_mask_write(0xFD410014, 0x00000007U, 0x00000003U);
+-	psu_mask_write(0xFD400CB4, 0x00000037U, 0x00000037U);
+-	psu_mask_write(0xFD404CB4, 0x00000037U, 0x00000037U);
+-	psu_mask_write(0xFD4001D8, 0x00000001U, 0x00000001U);
+-	psu_mask_write(0xFD4041D8, 0x00000001U, 0x00000001U);
+-	psu_mask_write(0xFD404CC0, 0x0000001FU, 0x00000000U);
+-	psu_mask_write(0xFD400CC0, 0x0000001FU, 0x00000000U);
+-	psu_mask_write(0xFD404048, 0x000000FFU, 0x00000000U);
+-	psu_mask_write(0xFD400048, 0x000000FFU, 0x00000000U);
+-
+ 	return 1;
+ }
+ 
+@@ -699,7 +682,7 @@ static unsigned long psu_resetout_init_data(void)
+ 	psu_mask_write(0xFF9D0080, 0x00000001U, 0x00000001U);
+ 	psu_mask_write(0xFF9D007C, 0x00000001U, 0x00000000U);
+ 	psu_mask_write(0xFF5E023C, 0x00000140U, 0x00000000U);
+-	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
++	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
+ 	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00000000U);
+ 	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000000U);
+ 	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x00000000U);
+@@ -708,7 +691,6 @@ static unsigned long psu_resetout_init_data(void)
+ 	psu_mask_write(0xFE20C11C, 0x00000600U, 0x00000600U);
+ 	psu_mask_write(0xFE20C12C, 0x00004000U, 0x00004000U);
+ 	psu_mask_write(0xFD480064, 0x00000200U, 0x00000200U);
+-	mask_poll(0xFD4063E4, 0x00000010U);
+ 	mask_poll(0xFD40A3E4, 0x00000010U);
+ 
+ 	return 1;
+@@ -717,7 +699,7 @@ static unsigned long psu_resetout_init_data(void)
+ static unsigned long psu_resetin_init_data(void)
+ {
+ 	psu_mask_write(0xFF5E023C, 0x00000540U, 0x00000540U);
+-	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000008U);
++	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000002U);
+ 	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x0000000AU);
+ 	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000002U);
+ 	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00010000U);
+@@ -1034,6 +1016,157 @@ static unsigned long psu_ddr_phybringup_data(void)
+ 	return 1;
+ }
+ 
++static int serdes_enb_coarse_saturation(void)
++{
++	Xil_Out32(0xFD402094, 0x00000010);
++	Xil_Out32(0xFD406094, 0x00000010);
++	Xil_Out32(0xFD40A094, 0x00000010);
++	Xil_Out32(0xFD40E094, 0x00000010);
++	return 1;
++}
++
++static int serdes_fixcal_code(void)
++{
++	int maskstatus = 1;
++	unsigned int rdata = 0;
++	unsigned int match_pmos_code[23];
++	unsigned int match_nmos_code[23];
++	unsigned int match_ical_code[7];
++	unsigned int match_rcal_code[7];
++	unsigned int p_code = 0;
++	unsigned int n_code = 0;
++	unsigned int i_code = 0;
++	unsigned int r_code = 0;
++	unsigned int repeat_count = 0;
++	unsigned int L3_TM_CALIB_DIG20 = 0;
++	unsigned int L3_TM_CALIB_DIG19 = 0;
++	unsigned int L3_TM_CALIB_DIG18 = 0;
++	unsigned int L3_TM_CALIB_DIG16 = 0;
++	unsigned int L3_TM_CALIB_DIG15 = 0;
++	unsigned int L3_TM_CALIB_DIG14 = 0;
++	int i = 0;
++
++	rdata = Xil_In32(0xFD40289C);
++	rdata = rdata & ~0x03;
++	rdata = rdata | 0x1;
++	Xil_Out32(0xFD40289C, rdata);
++	int count = 0;
++	do {
++		if (count == 1100000)
++			break;
++		rdata = Xil_In32(0xFD402B1C);
++		count++;
++	} while ((rdata & 0x0000000E) != 0x0000000E);
++
++	for (i = 0; i < 23; i++) {
++		match_pmos_code[i] = 0;
++		match_nmos_code[i] = 0;
++	}
++	for (i = 0; i < 7; i++) {
++		match_ical_code[i] = 0;
++		match_rcal_code[i] = 0;
++	}
++
++	do {
++		Xil_Out32(0xFD410010, 0x00000000);
++		Xil_Out32(0xFD410014, 0x00000000);
++
++		Xil_Out32(0xFD410010, 0x00000001);
++		Xil_Out32(0xFD410014, 0x00000000);
++
++		maskstatus = mask_poll(0xFD40EF14, 0x2);
++		if (maskstatus == 0) {
++			xil_printf("#SERDES initialization timed out\n\r");
++			return maskstatus;
++		}
++
++		p_code = mask_read(0xFD40EF18, 0xFFFFFFFF);
++		n_code = mask_read(0xFD40EF1C, 0xFFFFFFFF);
++		;
++		i_code = mask_read(0xFD40EF24, 0xFFFFFFFF);
++		r_code = mask_read(0xFD40EF28, 0xFFFFFFFF);
++		;
++
++		if (p_code >= 0x26 && p_code <= 0x3C)
++			match_pmos_code[p_code - 0x26] += 1;
++
++		if (n_code >= 0x26 && n_code <= 0x3C)
++			match_nmos_code[n_code - 0x26] += 1;
++
++		if (i_code >= 0xC && i_code <= 0x12)
++			match_ical_code[i_code - 0xC] += 1;
++
++		if (r_code >= 0x6 && r_code <= 0xC)
++			match_rcal_code[r_code - 0x6] += 1;
++
++	} while (repeat_count++ < 10);
++
++	for (i = 0; i < 23; i++) {
++		if (match_pmos_code[i] >= match_pmos_code[0]) {
++			match_pmos_code[0] = match_pmos_code[i];
++			p_code = 0x26 + i;
++		}
++		if (match_nmos_code[i] >= match_nmos_code[0]) {
++			match_nmos_code[0] = match_nmos_code[i];
++			n_code = 0x26 + i;
++		}
++	}
++
++	for (i = 0; i < 7; i++) {
++		if (match_ical_code[i] >= match_ical_code[0]) {
++			match_ical_code[0] = match_ical_code[i];
++			i_code = 0xC + i;
++		}
++		if (match_rcal_code[i] >= match_rcal_code[0]) {
++			match_rcal_code[0] = match_rcal_code[i];
++			r_code = 0x6 + i;
++		}
++	}
++
++	L3_TM_CALIB_DIG20 = mask_read(0xFD40EC50, 0xFFFFFFF0);
++	L3_TM_CALIB_DIG20 = L3_TM_CALIB_DIG20 | 0x8 | ((p_code >> 2) & 0x7);
++
++	L3_TM_CALIB_DIG19 = mask_read(0xFD40EC4C, 0xFFFFFF18);
++	L3_TM_CALIB_DIG19 = L3_TM_CALIB_DIG19 | ((p_code & 0x3) << 6)
++	    | 0x20 | 0x4 | ((n_code >> 3) & 0x3);
++
++	L3_TM_CALIB_DIG18 = mask_read(0xFD40EC48, 0xFFFFFF0F);
++	L3_TM_CALIB_DIG18 = L3_TM_CALIB_DIG18 | ((n_code & 0x7) << 5) | 0x10;
++
++	L3_TM_CALIB_DIG16 = mask_read(0xFD40EC40, 0xFFFFFFF8);
++	L3_TM_CALIB_DIG16 = L3_TM_CALIB_DIG16 | ((r_code >> 1) & 0x7);
++
++	L3_TM_CALIB_DIG15 = mask_read(0xFD40EC3C, 0xFFFFFF30);
++	L3_TM_CALIB_DIG15 = L3_TM_CALIB_DIG15 | ((r_code & 0x1) << 7)
++	    | 0x40 | 0x8 | ((i_code >> 1) & 0x7);
++
++	L3_TM_CALIB_DIG14 = mask_read(0xFD40EC38, 0xFFFFFF3F);
++	L3_TM_CALIB_DIG14 = L3_TM_CALIB_DIG14 | ((i_code & 0x1) << 7) | 0x40;
++
++	Xil_Out32(0xFD40EC50, L3_TM_CALIB_DIG20);
++	Xil_Out32(0xFD40EC4C, L3_TM_CALIB_DIG19);
++	Xil_Out32(0xFD40EC48, L3_TM_CALIB_DIG18);
++	Xil_Out32(0xFD40EC40, L3_TM_CALIB_DIG16);
++	Xil_Out32(0xFD40EC3C, L3_TM_CALIB_DIG15);
++	Xil_Out32(0xFD40EC38, L3_TM_CALIB_DIG14);
++	return maskstatus;
++}
++
++static int init_serdes(void)
++{
++	int status = 1;
++
++	status &= psu_resetin_init_data();
++
++	status &= serdes_fixcal_code();
++	status &= serdes_enb_coarse_saturation();
++
++	status &= psu_serdes_init_data();
++	status &= psu_resetout_init_data();
++
++	return status;
++}
++
+ static void init_peripheral(void)
+ {
+ 	psu_mask_write(0xFD5F0018, 0x8000001FU, 0x8000001FU);
+@@ -1050,6 +1183,7 @@ int psu_init(void)
+ 	status &= psu_ddr_init_data();
+ 	status &= psu_ddr_phybringup_data();
+ 	status &= psu_peripherals_init_data();
++	status &= init_serdes();
+ 	init_peripheral();
+ 
+ 	status &= psu_afi_config();
+-- 
+2.25.1
+
diff --git a/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch b/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
new file mode 100644
index 0000000000..5566dae891
--- /dev/null
+++ b/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
@@ -0,0 +1,79 @@
+From bf35bdac2adfa7c65c2992d8dedcc24585561732 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Wed, 13 Dec 2023 13:11:42 +0000
+Subject: [PATCH] arm64: zynqmp: Add output-enable pins to SOMs
+
+Now that the zynqmp pinctrl driver supports the tri-state registers, make
+sure that the pins requiring output-enable are configured appropriately for
+SOMs.
+
+Without it, all tristate setting for MIOs, which are not related to SOM
+itself, are using default configuration which is not correct setting.
+It means SDs, USBs, ethernet, etc. are not working properly.
+
+In past it was fixed through calling tristate configuration via bootcmd:
+usb_init=mw 0xFF180208 2020
+kv260_gem3=mw 0xFF18020C 0xFC0 && gpio toggle gpio@ff0a000038 && \
+  gpio toggle gpio@ff0a000038
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231213134052.2818879-1-neal.frager@amd.com/
+---
+ arch/arm/dts/zynqmp-sck-kd-g-revA.dts | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/arch/arm/dts/zynqmp-sck-kd-g-revA.dts b/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
+index 56f3128528..12865392a3 100644
+--- a/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
++++ b/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
+@@ -175,6 +175,7 @@
+ 		conf-tx {
+ 			pins = "MIO36";
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux {
+@@ -226,6 +227,7 @@
+ 		conf-bootstrap {
+ 			pins = "MIO44", "MIO49";
+ 			bias-disable;
++			output-enable;
+ 			low-power-disable;
+ 		};
+ 
+@@ -233,6 +235,7 @@
+ 			pins = "MIO38", "MIO39", "MIO40",
+ 				"MIO41", "MIO42", "MIO43";
+ 			bias-disable;
++			output-enable;
+ 			low-power-enable;
+ 		};
+ 
+@@ -241,6 +244,7 @@
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 			power-source = <IO_STANDARD_LVCMOS18>;
+ 			bias-disable;
++			output-enable;
+ 		};
+ 
+ 		mux-mdio {
+@@ -271,6 +275,7 @@
+ 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
+ 			"MIO60", "MIO61", "MIO62", "MIO63";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+@@ -298,6 +303,7 @@
+ 			pins = "MIO66", "MIO68", "MIO69", "MIO70", "MIO71",
+ 			"MIO72", "MIO73", "MIO74", "MIO75";
+ 			bias-disable;
++			output-enable;
+ 			drive-strength = <4>;
+ 			slew-rate = <SLEW_RATE_SLOW>;
+ 		};
+-- 
+2.25.1
+
diff --git a/board/zynqmp/kria/kd240/pm_cfg_obj.c b/board/zynqmp/kria/kd240/pm_cfg_obj.c
new file mode 100644
index 0000000000..13061ddcb3
--- /dev/null
+++ b/board/zynqmp/kria/kd240/pm_cfg_obj.c
@@ -0,0 +1,494 @@
+/******************************************************************************
+* Copyright (c) 2017 - 2021 Xilinx, Inc.  All rights reserved.
+* SPDX-License-Identifier: MIT
+******************************************************************************/
+
+#include "xil_types.h"
+#include "pm_defs.h"
+
+#define PM_CONFIG_MASTER_SECTION_ID	0x101U
+#define PM_CONFIG_SLAVE_SECTION_ID	0x102U
+#define PM_CONFIG_PREALLOC_SECTION_ID	0x103U
+#define PM_CONFIG_POWER_SECTION_ID	0x104U
+#define PM_CONFIG_RESET_SECTION_ID	0x105U
+#define PM_CONFIG_SHUTDOWN_SECTION_ID	0x106U
+#define PM_CONFIG_SET_CONFIG_SECTION_ID	0x107U
+#define PM_CONFIG_GPO_SECTION_ID	0x108U
+
+#define PM_SLAVE_FLAG_IS_SHAREABLE	0x1U
+#define PM_MASTER_USING_SLAVE_MASK	0x2U
+
+#define PM_CONFIG_GPO1_MIO_PIN_34_MAP	(1U << 10U)
+#define PM_CONFIG_GPO1_MIO_PIN_35_MAP	(1U << 11U)
+#define PM_CONFIG_GPO1_MIO_PIN_36_MAP	(1U << 12U)
+#define PM_CONFIG_GPO1_MIO_PIN_37_MAP	(1U << 13U)
+
+#define PM_CONFIG_GPO1_BIT_2_MASK	(1U << 2U)
+#define PM_CONFIG_GPO1_BIT_3_MASK	(1U << 3U)
+#define PM_CONFIG_GPO1_BIT_4_MASK	(1U << 4U)
+#define PM_CONFIG_GPO1_BIT_5_MASK	(1U << 5U)
+
+#define SUSPEND_TIMEOUT	0xFFFFFFFFU
+
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
+#define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
+#define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
+#define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
+
+
+
+#if defined (__ICCARM__)
+#pragma language=save
+#pragma language=extended
+#endif
+#if defined (__GNUC__)
+    const u32 XPm_ConfigObject[] __attribute__((used, section(".sys_cfg_data"))) =
+#elif defined (__ICCARM__)
+#pragma location = ".sys_cfg_data"
+__root const u32 XPm_ConfigObject[] =
+#endif
+{
+	/**********************************************************************/
+	/* HEADER */
+	2,	/* Number of remaining words in the header */
+	8,	/* Number of sections included in config object */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
+	/**********************************************************************/
+	/* MASTER SECTION */
+	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
+	3U, /* No. of Masters*/
+
+	NODE_APU, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
+
+	NODE_RPU_0, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Wake permissions */
+
+	NODE_RPU_1, /* Master Node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask of this master */
+	SUSPEND_TIMEOUT, /* Suspend timeout */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Suspend permissions */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* Wake permissions */
+
+
+	/**********************************************************************/
+	/* SLAVE SECTION */
+
+
+	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
+	35,				/* Number of slaves */
+
+	NODE_OCM_BANK_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_OCM_BANK_3,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TCM_0_A,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_TCM_0_B,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_TCM_1_A,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TCM_1_B,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_L2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU_PP_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU_PP_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_USB_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_2,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_TTC_3,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_ETH_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_UART_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_UART_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_SPI_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_I2C_1,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_DP,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GDMA,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_ADMA,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_QSPI,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPIO,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_CAN_0,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_EXTERN,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_DDR,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_IPI_APU,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK, /* IPI Mask */
+
+	NODE_IPI_RPU_0,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK, /* IPI Mask */
+
+	NODE_IPI_RPU_1,
+	0U,
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_GPU,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_RTC,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+	NODE_PL,
+	PM_SLAVE_FLAG_IS_SHAREABLE,
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
+
+
+	/**********************************************************************/
+	/* PREALLOC SECTION */
+
+	PM_CONFIG_PREALLOC_SECTION_ID, /* Preallaoc SectionID */
+	3U, /* No. of Masters*/
+
+	/* Prealloc for psu_cortexa53_0 */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK,
+	10,
+	NODE_DDR,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_L2,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_0,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_2,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_OCM_BANK_3,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_I2C_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_QSPI,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_PL,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_APU,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	/* Prealloc for psu_cortexr5_0 */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
+	3,
+	NODE_TCM_0_A,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_TCM_0_B,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_RPU_0,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	/* Prealloc for psu_cortexr5_1 */
+	PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	3,
+	NODE_TCM_1_A,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_TCM_1_B,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+	NODE_IPI_RPU_1,
+	PM_MASTER_USING_SLAVE_MASK, /* Master is using Slave */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Current Requirements */
+	PM_CAP_ACCESS | PM_CAP_CONTEXT, /* Default Requirements */
+
+
+	
+	/**********************************************************************/
+	/* POWER SECTION */
+
+	PM_CONFIG_POWER_SECTION_ID, /* Power Section ID */
+	4U, /* Number of power nodes */
+
+	NODE_APU, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_RPU, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_FPD, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+	NODE_PLD, /* Power node ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* Force power down permissions */
+
+
+	/**********************************************************************/
+	/* RESET SECTION */
+
+	PM_CONFIG_RESET_SECTION_ID, /* Reset Section ID */
+	120U, /* Number of resets */
+
+	XILPM_RESET_PCIE_CFG, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PCIE_BRIDGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PCIE_CTRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SWDT_CRF, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_AFI_FM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GDMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU_PP1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU_PP0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPU, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SATA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU3_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU2_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU1_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU0_PWRON, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APU_L2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ACPU0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DDR, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APM_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SOFT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GEM3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_QSPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_UART0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_UART1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SPI0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SPI1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SDIO0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SDIO1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_CAN0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_CAN1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_I2C0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_I2C1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TTC3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SWDT_CRL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_NAND, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_ADMA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IOU_CC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_TIMESTAMP, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_R50, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_R51, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_AMBA, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_OCM, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_PGE, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_CORERESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_HIBERRESET, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB0_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_USB1_APB, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IPI, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APM_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RTC, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_SYSMON, 0,
+	XILPM_RESET_AFI_FM6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_LPD_SWDT, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_FPD, PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK,
+	XILPM_RESET_RPU_DBG1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_DBG0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DBG_LPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DBG_FPD, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_APLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_DPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_VPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_IOPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPLL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_0, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_1, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_2, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_3, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_4, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_5, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_6, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_7, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_8, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_9, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_10, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_11, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_12, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_13, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_14, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_15, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_16, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_17, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_18, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_19, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_20, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_21, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_22, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_23, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_24, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_25, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_26, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_27, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_28, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_29, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_30, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPO3_PL_31, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_RPU_LS, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PS_ONLY, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_PL, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_92, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_93, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_94, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+	XILPM_RESET_GPIO5_EMIO_95, PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK,
+
+	/**********************************************************************/
+	/* SET CONFIG SECTION */
+	PM_CONFIG_SET_CONFIG_SECTION_ID,		/* Set Config Section ID */
+	0U, /* Permissions to load base config object */
+	0U, /* Permissions to load overlay config object */
+
+	/**********************************************************************/
+	/* SHUTDOWN SECTION */
+
+	PM_CONFIG_SHUTDOWN_SECTION_ID, /* Shutdown Section ID */
+	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* System Shutdown/Restart Permission */
+
+	/**********************************************************************/
+	/* GPO SECTION */
+	PM_CONFIG_GPO_SECTION_ID,		/* GPO Section ID */
+	0,					/* State of GPO pins */
+};
+#if defined (__ICCARM__)
+#pragma language=restore
+#endif
diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index dc6915f081..96009804b3 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -2,24 +2,29 @@
 Xilinx Kria SOM Starter Kits - ZynqMP SoC
 **************************************************
 
-This document describes the Buildroot support for the Kria 
-KV260 and KR260 starter kits by Xilinx, based on Kria SOM including the 
+This document describes the Buildroot support for the Kria KD240,
+KR260 and KV260 starter kits by Xilinx, based on Kria SOM including the
 Zynq UltraScale+ MPSoC (aka ZynqMP).  It has been tested with 
-the KV260 and KR260 production boards.
+the KD240, KR260 and KV260 production boards.
 
 Evaluation board features can be found here with the links below.
 
-KV260:
-https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html
+KD240:
+https://www.xilinx.com/products/som/kria/kd240-drives-starter-kit.html
 
 KR260:
 https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
 
+KV260:
+https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html
+
 How to build it
 ===============
 
-Configure Buildroot:
+Configure Buildroot: (use the command for the specific board)
 
+    $ make zynqmp_kria_kd240_defconfig
+    $ make zynqmp_kria_kr260_defconfig
     $ make zynqmp_kria_kv260_defconfig
 
 Compile everything and build the rootfs image:
@@ -68,7 +73,7 @@ in that the boot.bin and u-boot.itb files need to be flashed
 into the QSPI boot flash such that U-Boot can then load all
 of the remaining images from the SD card.
 
-In addition, the KV260 and KR260 Starter Kits QSPI comes pre-flashed with
+In addition, the Kria Starter Kits QSPI comes pre-flashed with
 a utility designed to make updating the QSPI flash memory
 easier.
 
@@ -94,7 +99,7 @@ Flashing boot.bin:
     $ sf erase 0x200000 +$filesize
     $ sf write 0x1000000 0x200000 $filesize
 
-KR260 Flashing Instructions:
+KD240 / KR260 Flashing Instructions:
 Flashing u-boot.itb:
     $ sf probe
     $ fatload usb 0 0x1000000 u-boot.itb
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
new file mode 100644
index 0000000000..78302a48c0
--- /dev/null
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -0,0 +1,42 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_TARGET_UBOOT_ZYNQMP=y
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kd240-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/kd240/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

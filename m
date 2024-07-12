Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51606C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42BD841103;
	Fri, 12 Jul 2024 15:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk3qB8N-HQpJ; Fri, 12 Jul 2024 15:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376B44110B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 376B44110B;
	Fri, 12 Jul 2024 15:00:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1B081BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF94D60E9F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wuooy0_AeGJS for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B72608C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B72608C1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:00:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00E1D86081; Fri, 12 Jul 2024 15:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:55:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57d7b12008a7f0998b8259a94621c35083531b84
X-Git-Newrev: d64958d92388dc5ecf29f3ddb36cb758d222bef9
X-Patchwork-Hint: ignore
Message-Id: <20240712150022.00E1D86081@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_kria_kd240_defconfig: bump
 to xilinx-v2024.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d64958d92388dc5ecf29f3ddb36cb758d222bef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PMUFW xilinx-v2024.1

Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
needed.

With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
the offset between the base address of the boot.bin and u-boot.itb instead of
a raw base address of u-boot.itb. This allows for A/B firmware updates since
the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.

Thus, Kria SOMs come with the following QSPI address table.

Partition A:
0x200000 - boot.bin
0x280000 - u-boot.itb

Partition B:
0xF80000 - boot.bin
0x1000000 - u-boot.itb

In addition, the kd240 still requires a board specific patch for the usb to sd
card bridge device.  Without the board specific patch in the
./board/zynqmp/kria/kd240/patches directory, the usb will not come up correctly
and u-boot will not be able to find the sd card containing the Linux kernel and
file system.

Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20240604083854.2033917-1-neal.frager@amd.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   1 -
 ...0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch |  81 +++++
 ...64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch | 401 ---------------------
 ...m64-zynqmp-Add-output-enable-pins-to-SOMs.patch |  79 ----
 configs/zynqmp_kria_kd240_defconfig                |  20 +-
 5 files changed, 93 insertions(+), 489 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 69414d2496..474508bf63 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -294,7 +294,6 @@ configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
-configs/zynqmp_kria_kd240_defconfig lib_defconfig.ForceCheckHash
 linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch lib_patch.Upstream
 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/4th/0001-avoid-regen-during-install.patch lib_patch.Upstream
diff --git a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
new file mode 100644
index 0000000000..0cc10d344e
--- /dev/null
+++ b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
@@ -0,0 +1,81 @@
+From 73c99c29508d7adfe11b6a81f13cf00efab5f9de Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Tue, 4 Jun 2024 09:15:23 +0100
+Subject: [PATCH] arm64: zynqmp: Enable usb3 for k24 som
+
+This patch corrects the mio and pll configuration registers for using usb3
+on the kd240 starter kit.  Without this patch, the usb3 to sd card bridge does
+not initialize correctly and u-boot is unable to find the OS located on the
+kd240 starter kit sd card.
+
+In addition, this patch correctly configures mio76 and mio77 as gpio pins
+which are used as reset gpio pins on the kd240 starter kit.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20240604083854.2033917-1-neal.frager@amd.com/
+---
+ .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 23 ++++++++-----------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
+index 166e61431b..274203ffaa 100644
+--- a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
++++ b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
+@@ -528,8 +528,8 @@ static unsigned long psu_mio_init_data(void)
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
+@@ -569,21 +569,16 @@ static unsigned long psu_peripherals_init_data(void)
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
+@@ -591,13 +586,15 @@ static unsigned long psu_peripherals_init_data(void)
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
+-- 
+2.25.1
+
diff --git a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
deleted file mode 100644
index f088b90f52..0000000000
--- a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
+++ /dev/null
@@ -1,401 +0,0 @@
-From f8cba630d3fccd901164dec7bd9b60442bab8995 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 13 Dec 2023 12:53:29 +0000
-Subject: [PATCH] arm64: zynqmp: Fix k24 psu_init_gpl.c clocking
-
-This patch corrects the k24 som clocking configuration such that the serdes
-clocks are correctly enabled and the usb0 is configured to use the psgtr
-refclk2 for usb3 mode.
-
-This patch also corrects the configuration of mio pins mio76 and mio77
-which should be configured as gpio pins.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231213134007.2818069-1-neal.frager@amd.com/
----
- .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 266 +++++++++++++-----
- 1 file changed, 200 insertions(+), 66 deletions(-)
-
-diff --git a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-index 45102302dc..4c904c6c81 100644
---- a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-+++ b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-@@ -72,6 +72,18 @@ static void dpll_prog(int div2, int ddr_pll_fbdiv, int d_lock_dly,
- 	Xil_Out32(((0xFD1A0000U) + 0x0000002C), pll_ctrl_regval);
- }
- 
-+static int serdes_illcalib(u32 lane3_protocol, u32 lane3_rate,
-+			   u32 lane2_protocol, u32 lane2_rate,
-+			   u32 lane1_protocol, u32 lane1_rate,
-+			   u32 lane0_protocol, u32 lane0_rate)
-+{
-+	Xil_Out32(0xFD409914, 0xF3);
-+	Xil_Out32(0xFD409940, 0xF3);
-+	Xil_Out32(0xFD409990, 0x20);
-+	Xil_Out32(0xFD409924, 0x37);
-+	return 1;
-+}
-+
- static unsigned long psu_pll_init_data(void)
- {
- 	psu_mask_write(0xFF5E0034, 0xFE7FEDEFU, 0x7E4B0C62U);
-@@ -490,20 +502,20 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF18008C, 0x000000FEU, 0x00000000U);
- 	psu_mask_write(0xFF180090, 0x000000FEU, 0x000000C0U);
- 	psu_mask_write(0xFF180094, 0x000000FEU, 0x000000C0U);
--	psu_mask_write(0xFF180098, 0x000000FEU, 0x00000000U);
--	psu_mask_write(0xFF18009C, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A0, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800AC, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800B0, 0x000000FEU, 0x00000000U);
--	psu_mask_write(0xFF1800B4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800B8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800BC, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C0, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800CC, 0x000000FEU, 0x00000010U);
-+	psu_mask_write(0xFF180098, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF18009C, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A8, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800AC, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B8, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800BC, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C8, 0x000000FEU, 0x00000080U);
-+	psu_mask_write(0xFF1800CC, 0x000000FEU, 0x00000080U);
- 	psu_mask_write(0xFF1800D0, 0x000000FEU, 0x00000004U);
- 	psu_mask_write(0xFF1800D4, 0x000000FEU, 0x00000004U);
- 	psu_mask_write(0xFF1800D8, 0x000000FEU, 0x00000004U);
-@@ -528,8 +540,8 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF180124, 0x000000FEU, 0x00000002U);
- 	psu_mask_write(0xFF180128, 0x000000FEU, 0x00000002U);
- 	psu_mask_write(0xFF18012C, 0x000000FEU, 0x00000002U);
--	psu_mask_write(0xFF180130, 0x000000FEU, 0x000000C0U);
--	psu_mask_write(0xFF180134, 0x000000FEU, 0x000000C0U);
-+	psu_mask_write(0xFF180130, 0x000000FEU, 0x00000000U);
-+	psu_mask_write(0xFF180134, 0x000000FEU, 0x00000000U);
- 	psu_mask_write(0xFF180204, 0xFFFFFFFFU, 0x50000000U);
- 	psu_mask_write(0xFF180208, 0xFFFFFFFFU, 0x00B02020U);
- 	psu_mask_write(0xFF18020C, 0x00003FFFU, 0x00000FC0U);
-@@ -539,18 +551,18 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF180144, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF180148, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF18014C, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180154, 0x03FFFFFFU, 0x00080814U);
-+	psu_mask_write(0xFF180154, 0x03FFFFFFU, 0x00FC0814U);
- 	psu_mask_write(0xFF180158, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF18015C, 0x03FFFFFFU, 0x00000000U);
--	psu_mask_write(0xFF180160, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180164, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180168, 0x03FFFFFFU, 0x03F7F7EBU);
--	psu_mask_write(0xFF180170, 0x03FFFFFFU, 0x00FC000BU);
-+	psu_mask_write(0xFF180160, 0x0387FFFFU, 0x0387FFFFU);
-+	psu_mask_write(0xFF180164, 0x03FFFFFFU, 0x03FFF87FU);
-+	psu_mask_write(0xFF180168, 0x03FFFFFFU, 0x0303F7EBU);
-+	psu_mask_write(0xFF180170, 0x03FFFFFFU, 0x0004400BU);
- 	psu_mask_write(0xFF180174, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF180178, 0x03FFFFFFU, 0x00000000U);
--	psu_mask_write(0xFF18017C, 0x0357FFFFU, 0x0357FFFFU);
--	psu_mask_write(0xFF180180, 0x03FFFFFFU, 0x0357FFFFU);
--	psu_mask_write(0xFF180184, 0x03FFFFFFU, 0x0303FFF4U);
-+	psu_mask_write(0xFF18017C, 0x03FFFFFFU, 0x03FFFFFFU);
-+	psu_mask_write(0xFF180180, 0x03FFFFFFU, 0x03FFFFFFU);
-+	psu_mask_write(0xFF180184, 0x03FFFFFFU, 0x03FBBFF4U);
- 	psu_mask_write(0xFF180200, 0x0000000FU, 0x00000000U);
- 
- 	return 1;
-@@ -569,21 +581,16 @@ static unsigned long psu_peripherals_init_data(void)
- 	psu_mask_write(0xFD1A0100, 0x0001807CU, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x001A0000U, 0x00000000U);
- 	psu_mask_write(0xFF5E023C, 0x0093C018U, 0x00000000U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
-+	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000001U, 0x00000000U);
- 	psu_mask_write(0xFF180390, 0x00000004U, 0x00000004U);
- 	psu_mask_write(0xFF5E023C, 0x00000400U, 0x00000000U);
--	psu_mask_write(0xFF5E0238, 0x00000040U, 0x00000000U);
--	psu_mask_write(0xFF180310, 0x00008000U, 0x00000000U);
--	psu_mask_write(0xFF180320, 0x33840000U, 0x02840000U);
--	psu_mask_write(0xFF18031C, 0x7FFE0000U, 0x64500000U);
--	psu_mask_write(0xFF180358, 0x00000008U, 0x00000008U);
--	psu_mask_write(0xFF180324, 0x03C00000U, 0x00000000U);
-+	psu_mask_write(0xFF5E0238, 0x00000080U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000400U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00008000U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00000010U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00007800U, 0x00000000U);
--	psu_mask_write(0xFF5E0238, 0x00000004U, 0x00000000U);
-+	psu_mask_write(0xFF5E0238, 0x00000006U, 0x00000000U);
- 	psu_mask_write(0xFF5E0238, 0x00040000U, 0x00000000U);
- 	psu_mask_write(0xFF4B0024, 0x000000FFU, 0x000000FFU);
- 	psu_mask_write(0xFFCA5000, 0x00001FFFU, 0x00000000U);
-@@ -591,40 +598,26 @@ static unsigned long psu_peripherals_init_data(void)
- 	psu_mask_write(0xFFA60040, 0x80000000U, 0x80000000U);
- 	psu_mask_write(0xFF260020, 0xFFFFFFFFU, 0x05F5DD18U);
- 	psu_mask_write(0xFF260000, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
-+	psu_mask_write(0xFF0A0284, 0x03FFFFFFU, 0x01000000U);
-+	psu_mask_write(0xFF0A0288, 0x03FFFFFFU, 0x01000000U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
- 
- 	mask_delay(1);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000002U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0000U);
- 
- 	mask_delay(5);
--	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
-+	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
- 
- 	return 1;
- }
- 
- static unsigned long psu_serdes_init_data(void)
- {
--	psu_mask_write(0xFD410000, 0x0000001FU, 0x00000009U);
--	psu_mask_write(0xFD410004, 0x0000001FU, 0x00000009U);
- 	psu_mask_write(0xFD410008, 0x0000001FU, 0x00000008U);
--	psu_mask_write(0xFD402860, 0x00000080U, 0x00000080U);
--	psu_mask_write(0xFD402864, 0x00000081U, 0x00000001U);
--	psu_mask_write(0xFD402868, 0x00000082U, 0x00000002U);
-+	psu_mask_write(0xFD402868, 0x00000080U, 0x00000080U);
- 	psu_mask_write(0xFD40A094, 0x00000010U, 0x00000010U);
- 	psu_mask_write(0xFD40A368, 0x000000FFU, 0x00000038U);
- 	psu_mask_write(0xFD40A36C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD402368, 0x000000FFU, 0x00000058U);
--	psu_mask_write(0xFD40236C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD406368, 0x000000FFU, 0x00000058U);
--	psu_mask_write(0xFD40636C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD402370, 0x000000FFU, 0x0000007CU);
--	psu_mask_write(0xFD402374, 0x000000FFU, 0x00000033U);
--	psu_mask_write(0xFD402378, 0x000000FFU, 0x00000002U);
--	psu_mask_write(0xFD40237C, 0x00000033U, 0x00000030U);
--	psu_mask_write(0xFD406370, 0x000000FFU, 0x0000007CU);
--	psu_mask_write(0xFD406374, 0x000000FFU, 0x00000033U);
--	psu_mask_write(0xFD406378, 0x000000FFU, 0x00000002U);
--	psu_mask_write(0xFD40637C, 0x00000033U, 0x00000030U);
- 	psu_mask_write(0xFD40A370, 0x000000FFU, 0x000000F4U);
- 	psu_mask_write(0xFD40A374, 0x000000FFU, 0x00000031U);
- 	psu_mask_write(0xFD40A378, 0x000000FFU, 0x00000002U);
-@@ -678,18 +671,8 @@ static unsigned long psu_serdes_init_data(void)
- 	psu_mask_write(0xFD409978, 0x00000010U, 0x00000010U);
- 	psu_mask_write(0xFD40D978, 0x00000010U, 0x00000010U);
- 
--	serdes_illcalib(0, 0, 3, 0, 4, 0, 4, 0);
--	psu_mask_write(0xFD410010, 0x00000077U, 0x00000044U);
-+	serdes_illcalib(0, 0, 3, 0, 0, 0, 0, 0);
- 	psu_mask_write(0xFD410014, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD400CB4, 0x00000037U, 0x00000037U);
--	psu_mask_write(0xFD404CB4, 0x00000037U, 0x00000037U);
--	psu_mask_write(0xFD4001D8, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFD4041D8, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFD404CC0, 0x0000001FU, 0x00000000U);
--	psu_mask_write(0xFD400CC0, 0x0000001FU, 0x00000000U);
--	psu_mask_write(0xFD404048, 0x000000FFU, 0x00000000U);
--	psu_mask_write(0xFD400048, 0x000000FFU, 0x00000000U);
--
- 	return 1;
- }
- 
-@@ -699,7 +682,7 @@ static unsigned long psu_resetout_init_data(void)
- 	psu_mask_write(0xFF9D0080, 0x00000001U, 0x00000001U);
- 	psu_mask_write(0xFF9D007C, 0x00000001U, 0x00000000U);
- 	psu_mask_write(0xFF5E023C, 0x00000140U, 0x00000000U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
-+	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00000000U);
- 	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x00000000U);
-@@ -708,7 +691,6 @@ static unsigned long psu_resetout_init_data(void)
- 	psu_mask_write(0xFE20C11C, 0x00000600U, 0x00000600U);
- 	psu_mask_write(0xFE20C12C, 0x00004000U, 0x00004000U);
- 	psu_mask_write(0xFD480064, 0x00000200U, 0x00000200U);
--	mask_poll(0xFD4063E4, 0x00000010U);
- 	mask_poll(0xFD40A3E4, 0x00000010U);
- 
- 	return 1;
-@@ -717,7 +699,7 @@ static unsigned long psu_resetout_init_data(void)
- static unsigned long psu_resetin_init_data(void)
- {
- 	psu_mask_write(0xFF5E023C, 0x00000540U, 0x00000540U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000008U);
-+	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000002U);
- 	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x0000000AU);
- 	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000002U);
- 	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00010000U);
-@@ -1034,6 +1016,157 @@ static unsigned long psu_ddr_phybringup_data(void)
- 	return 1;
- }
- 
-+static int serdes_enb_coarse_saturation(void)
-+{
-+	Xil_Out32(0xFD402094, 0x00000010);
-+	Xil_Out32(0xFD406094, 0x00000010);
-+	Xil_Out32(0xFD40A094, 0x00000010);
-+	Xil_Out32(0xFD40E094, 0x00000010);
-+	return 1;
-+}
-+
-+static int serdes_fixcal_code(void)
-+{
-+	int maskstatus = 1;
-+	unsigned int rdata = 0;
-+	unsigned int match_pmos_code[23];
-+	unsigned int match_nmos_code[23];
-+	unsigned int match_ical_code[7];
-+	unsigned int match_rcal_code[7];
-+	unsigned int p_code = 0;
-+	unsigned int n_code = 0;
-+	unsigned int i_code = 0;
-+	unsigned int r_code = 0;
-+	unsigned int repeat_count = 0;
-+	unsigned int L3_TM_CALIB_DIG20 = 0;
-+	unsigned int L3_TM_CALIB_DIG19 = 0;
-+	unsigned int L3_TM_CALIB_DIG18 = 0;
-+	unsigned int L3_TM_CALIB_DIG16 = 0;
-+	unsigned int L3_TM_CALIB_DIG15 = 0;
-+	unsigned int L3_TM_CALIB_DIG14 = 0;
-+	int i = 0;
-+
-+	rdata = Xil_In32(0xFD40289C);
-+	rdata = rdata & ~0x03;
-+	rdata = rdata | 0x1;
-+	Xil_Out32(0xFD40289C, rdata);
-+	int count = 0;
-+	do {
-+		if (count == 1100000)
-+			break;
-+		rdata = Xil_In32(0xFD402B1C);
-+		count++;
-+	} while ((rdata & 0x0000000E) != 0x0000000E);
-+
-+	for (i = 0; i < 23; i++) {
-+		match_pmos_code[i] = 0;
-+		match_nmos_code[i] = 0;
-+	}
-+	for (i = 0; i < 7; i++) {
-+		match_ical_code[i] = 0;
-+		match_rcal_code[i] = 0;
-+	}
-+
-+	do {
-+		Xil_Out32(0xFD410010, 0x00000000);
-+		Xil_Out32(0xFD410014, 0x00000000);
-+
-+		Xil_Out32(0xFD410010, 0x00000001);
-+		Xil_Out32(0xFD410014, 0x00000000);
-+
-+		maskstatus = mask_poll(0xFD40EF14, 0x2);
-+		if (maskstatus == 0) {
-+			xil_printf("#SERDES initialization timed out\n\r");
-+			return maskstatus;
-+		}
-+
-+		p_code = mask_read(0xFD40EF18, 0xFFFFFFFF);
-+		n_code = mask_read(0xFD40EF1C, 0xFFFFFFFF);
-+		;
-+		i_code = mask_read(0xFD40EF24, 0xFFFFFFFF);
-+		r_code = mask_read(0xFD40EF28, 0xFFFFFFFF);
-+		;
-+
-+		if (p_code >= 0x26 && p_code <= 0x3C)
-+			match_pmos_code[p_code - 0x26] += 1;
-+
-+		if (n_code >= 0x26 && n_code <= 0x3C)
-+			match_nmos_code[n_code - 0x26] += 1;
-+
-+		if (i_code >= 0xC && i_code <= 0x12)
-+			match_ical_code[i_code - 0xC] += 1;
-+
-+		if (r_code >= 0x6 && r_code <= 0xC)
-+			match_rcal_code[r_code - 0x6] += 1;
-+
-+	} while (repeat_count++ < 10);
-+
-+	for (i = 0; i < 23; i++) {
-+		if (match_pmos_code[i] >= match_pmos_code[0]) {
-+			match_pmos_code[0] = match_pmos_code[i];
-+			p_code = 0x26 + i;
-+		}
-+		if (match_nmos_code[i] >= match_nmos_code[0]) {
-+			match_nmos_code[0] = match_nmos_code[i];
-+			n_code = 0x26 + i;
-+		}
-+	}
-+
-+	for (i = 0; i < 7; i++) {
-+		if (match_ical_code[i] >= match_ical_code[0]) {
-+			match_ical_code[0] = match_ical_code[i];
-+			i_code = 0xC + i;
-+		}
-+		if (match_rcal_code[i] >= match_rcal_code[0]) {
-+			match_rcal_code[0] = match_rcal_code[i];
-+			r_code = 0x6 + i;
-+		}
-+	}
-+
-+	L3_TM_CALIB_DIG20 = mask_read(0xFD40EC50, 0xFFFFFFF0);
-+	L3_TM_CALIB_DIG20 = L3_TM_CALIB_DIG20 | 0x8 | ((p_code >> 2) & 0x7);
-+
-+	L3_TM_CALIB_DIG19 = mask_read(0xFD40EC4C, 0xFFFFFF18);
-+	L3_TM_CALIB_DIG19 = L3_TM_CALIB_DIG19 | ((p_code & 0x3) << 6)
-+	    | 0x20 | 0x4 | ((n_code >> 3) & 0x3);
-+
-+	L3_TM_CALIB_DIG18 = mask_read(0xFD40EC48, 0xFFFFFF0F);
-+	L3_TM_CALIB_DIG18 = L3_TM_CALIB_DIG18 | ((n_code & 0x7) << 5) | 0x10;
-+
-+	L3_TM_CALIB_DIG16 = mask_read(0xFD40EC40, 0xFFFFFFF8);
-+	L3_TM_CALIB_DIG16 = L3_TM_CALIB_DIG16 | ((r_code >> 1) & 0x7);
-+
-+	L3_TM_CALIB_DIG15 = mask_read(0xFD40EC3C, 0xFFFFFF30);
-+	L3_TM_CALIB_DIG15 = L3_TM_CALIB_DIG15 | ((r_code & 0x1) << 7)
-+	    | 0x40 | 0x8 | ((i_code >> 1) & 0x7);
-+
-+	L3_TM_CALIB_DIG14 = mask_read(0xFD40EC38, 0xFFFFFF3F);
-+	L3_TM_CALIB_DIG14 = L3_TM_CALIB_DIG14 | ((i_code & 0x1) << 7) | 0x40;
-+
-+	Xil_Out32(0xFD40EC50, L3_TM_CALIB_DIG20);
-+	Xil_Out32(0xFD40EC4C, L3_TM_CALIB_DIG19);
-+	Xil_Out32(0xFD40EC48, L3_TM_CALIB_DIG18);
-+	Xil_Out32(0xFD40EC40, L3_TM_CALIB_DIG16);
-+	Xil_Out32(0xFD40EC3C, L3_TM_CALIB_DIG15);
-+	Xil_Out32(0xFD40EC38, L3_TM_CALIB_DIG14);
-+	return maskstatus;
-+}
-+
-+static int init_serdes(void)
-+{
-+	int status = 1;
-+
-+	status &= psu_resetin_init_data();
-+
-+	status &= serdes_fixcal_code();
-+	status &= serdes_enb_coarse_saturation();
-+
-+	status &= psu_serdes_init_data();
-+	status &= psu_resetout_init_data();
-+
-+	return status;
-+}
-+
- static void init_peripheral(void)
- {
- 	psu_mask_write(0xFD5F0018, 0x8000001FU, 0x8000001FU);
-@@ -1050,6 +1183,7 @@ int psu_init(void)
- 	status &= psu_ddr_init_data();
- 	status &= psu_ddr_phybringup_data();
- 	status &= psu_peripherals_init_data();
-+	status &= init_serdes();
- 	init_peripheral();
- 
- 	status &= psu_afi_config();
--- 
-2.25.1
-
diff --git a/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch b/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
deleted file mode 100644
index 5566dae891..0000000000
--- a/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From bf35bdac2adfa7c65c2992d8dedcc24585561732 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 13 Dec 2023 13:11:42 +0000
-Subject: [PATCH] arm64: zynqmp: Add output-enable pins to SOMs
-
-Now that the zynqmp pinctrl driver supports the tri-state registers, make
-sure that the pins requiring output-enable are configured appropriately for
-SOMs.
-
-Without it, all tristate setting for MIOs, which are not related to SOM
-itself, are using default configuration which is not correct setting.
-It means SDs, USBs, ethernet, etc. are not working properly.
-
-In past it was fixed through calling tristate configuration via bootcmd:
-usb_init=mw 0xFF180208 2020
-kv260_gem3=mw 0xFF18020C 0xFC0 && gpio toggle gpio@ff0a000038 && \
-  gpio toggle gpio@ff0a000038
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231213134052.2818879-1-neal.frager@amd.com/
----
- arch/arm/dts/zynqmp-sck-kd-g-revA.dts | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/arch/arm/dts/zynqmp-sck-kd-g-revA.dts b/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-index 56f3128528..12865392a3 100644
---- a/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-+++ b/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-@@ -175,6 +175,7 @@
- 		conf-tx {
- 			pins = "MIO36";
- 			bias-disable;
-+			output-enable;
- 		};
- 
- 		mux {
-@@ -226,6 +227,7 @@
- 		conf-bootstrap {
- 			pins = "MIO44", "MIO49";
- 			bias-disable;
-+			output-enable;
- 			low-power-disable;
- 		};
- 
-@@ -233,6 +235,7 @@
- 			pins = "MIO38", "MIO39", "MIO40",
- 				"MIO41", "MIO42", "MIO43";
- 			bias-disable;
-+			output-enable;
- 			low-power-enable;
- 		};
- 
-@@ -241,6 +244,7 @@
- 			slew-rate = <SLEW_RATE_SLOW>;
- 			power-source = <IO_STANDARD_LVCMOS18>;
- 			bias-disable;
-+			output-enable;
- 		};
- 
- 		mux-mdio {
-@@ -271,6 +275,7 @@
- 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
- 			"MIO60", "MIO61", "MIO62", "MIO63";
- 			bias-disable;
-+			output-enable;
- 			drive-strength = <4>;
- 			slew-rate = <SLEW_RATE_SLOW>;
- 		};
-@@ -298,6 +303,7 @@
- 			pins = "MIO66", "MIO68", "MIO69", "MIO70", "MIO71",
- 			"MIO72", "MIO73", "MIO74", "MIO75";
- 			bias-disable;
-+			output-enable;
- 			drive-strength = <4>;
- 			slew-rate = <SLEW_RATE_SLOW>;
- 		};
--- 
-2.25.1
-
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 78302a48c0..dff49b9837 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
@@ -15,16 +15,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -32,11 +31,16 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kd240-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="kd240"
+BR2_TARGET_XILINX_PREBUILT_KRIA=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/kd240/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/kd240/patches board/xilinx/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

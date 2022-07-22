Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C317C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4DE540BB3;
	Fri, 22 Jul 2022 07:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4DE540BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNhDggr-S4TH; Fri, 22 Jul 2022 07:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8B314028D;
	Fri, 22 Jul 2022 07:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8B314028D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 157111BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDC3941882
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDC3941882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6mz5v3_Ux_0 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A6F64186D
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A6F64186D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 697218414D; Fri, 22 Jul 2022 07:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:36:55 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bdd6e41e38d71e38332f7b4abaaac1895e0dfb35
X-Git-Newrev: 89c216dd6eccd21c23b4066cc233d61033627edc
X-Patchwork-Hint: ignore
Message-Id: <20220722072724.697218414D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 configs/zynqmp_kria_xxx_defconfig: uboot dp pll patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=89c216dd6eccd21c23b4066cc233d61033627edc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
It needs to be applied for both the kv260 and kr260 starter kits.

The Linux DP driver expects the DP to be using the following PLL config:
  - DP video PLL should use the VPLL (0x0)
  - DP audio PLL should use the RPLL (0x3)
  - DP system time clock PLL should use RPLL (0x3)

Register 0xFD1A0070 configures the DP video PLL.
Register 0xFD1A0074 configures the DP audio PLL.
Register 0xFD1A007C configures the DP system time clock PLL.

This patch was build and run tested on a zynqmp-kria-kv260 target board.

Upstream-Status: submitted (https://lore.kernel.org/all/fa7e9abc419c9d7648405d1c62367dbe701d09b8.1652709736.git.michal.simek@amd.com/)
This patch will be removed from buildroot in a future release when no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit da7b674d91e541fdde64cff9181d328562720026)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...p-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch | 39 ++++++++++++++++++++++
 configs/zynqmp_kria_kv260_defconfig                |  1 +
 2 files changed, 40 insertions(+)

diff --git a/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch b/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
new file mode 100644
index 0000000000..99dc056115
--- /dev/null
+++ b/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
@@ -0,0 +1,39 @@
+From c6677ee92c05e3f0f22cc08e3b309a996292562f Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Fri, 13 May 2022 14:02:07 +0100
+Subject: [PATCH 1/1] arm64: zynqmp: zynqmp-sm-k26-revA: Fix DP PLL
+ configuration
+
+This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
+
+The Linux DP driver expects the DP to be using the following PLL config:
+  - DP video PLL should use the VPLL (0x0)
+  - DP audio PLL should use the RPLL (0x3)
+  - DP system time clock PLL should use RPLL (0x3)
+
+Register 0xFD1A0070 configures the DP video PLL.
+Register 0xFD1A0074 configures the DP audio PLL.
+Register 0xFD1A007C configures the DP system time clock PLL.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
+index ed025790bc..e5598807e8 100644
+--- a/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
++++ b/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
+@@ -74,6 +74,9 @@ static unsigned long psu_clock_init_data(void)
+ 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000A00U);
+ 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
+ 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
++	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
++	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
++	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01013803U);
+ 	psu_mask_write(0xFD1A0080, 0x00003F07U, 0x00000200U);
+ 	psu_mask_write(0xFD1A0084, 0x07003F07U, 0x07000100U);
+ 	psu_mask_write(0xFD1A00B8, 0x01003F07U, 0x01000203U);
+-- 
+2.17.1
+
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index cc01fb9155..42b8fdaf84 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -36,3 +36,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

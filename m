Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46852C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 08:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9C1840A6D;
	Sun, 24 Apr 2022 08:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkA6vGMyYd8a; Sun, 24 Apr 2022 08:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A020540AB6;
	Sun, 24 Apr 2022 08:52:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84C5E1BF963
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C06D4159A
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkotvT-o_lZJ for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 08:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C71CB41518
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 08:52:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CDE188414F; Sun, 24 Apr 2022 08:41:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 10:49:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42a3300ae5641bf45c4c8f6a1306f4e06dc93034
X-Git-Newrev: 8c925613dc1d3af6031c9a39bb51b418cfe2b9d8
X-Patchwork-Hint: ignore
Message-Id: <20220424084158.CDE188414F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.arm: re-organize MMU
 selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c925613dc1d3af6031c9a39bb51b418cfe2b9d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So far, all ARM cores were selecting BR2_ARCH_HAS_MMU_OPTIONAL, except
no-MMU cores which were selecting nothing.

In practice, MMU-capable ARM cores are always used with their MMU
enabled, so it doesn't make sense to support the use case of not using
the MMU on such cores.

Consequently, to simplify things, we group the MMU handling in the
BR2_ARM_CPU_ARM* options: BR2_ARM_CPU_ARMV4, BR2_ARM_CPU_ARMV5,
BR2_ARM_CPU_ARMV6, BR2_ARM_CPU_ARMV7A, BR2_ARM_CPU_ARMV8A all select
BR2_ARCH_HAS_MMU_MANDATORY, while BR2_ARM_CPU_ARMV7M continues to
select nothing, indicating that there is no MMU available at all.

Fixes:

 http://autobuild.buildroot.net/results/33277d4687ca9a04dbfb02c50e5755ff9e55b0b4/ (FLAT
 selected on AArch64)

 http://autobuild.buildroot.net/results/5e34d11393e14fc36fd6e72b69679bc4fd1e3798/ (FLAT
 selected on AArch64 big-endian)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 59 +++++-------------------------------------------------
 1 file changed, 5 insertions(+), 54 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 85040ac89f..fa2e882550 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -73,21 +73,26 @@ config BR2_ARM_CPU_HAS_THUMB2
 
 config BR2_ARM_CPU_ARMV4
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_ARM_CPU_ARMV5
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_ARM_CPU_ARMV6
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_ARM_CPU_ARMV7A
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_ARM_CPU_ARMV7M
 	bool
 
 config BR2_ARM_CPU_ARMV8A
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 choice
 	prompt "Target Architecture Variant"
@@ -103,23 +108,19 @@ config BR2_arm920t
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm922t
 	bool "arm922t"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 comment "armv5 cores"
 config BR2_arm926t
@@ -128,18 +129,15 @@ config BR2_arm926t
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_iwmmxt
 	bool "iwmmxt"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV5
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 comment "armv6 cores"
 config BR2_arm1136j_s
@@ -147,34 +145,29 @@ config BR2_arm1136j_s
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1136jf_s
 	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm11mpcore
 	bool "mpcore"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 comment "armv7a cores"
 config BR2_cortex_a5
@@ -184,7 +177,6 @@ config BR2_cortex_a5
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_ARM
@@ -192,7 +184,6 @@ config BR2_cortex_a7
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_ARM
@@ -200,7 +191,6 @@ config BR2_cortex_a8
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_HAS_ARM
@@ -208,7 +198,6 @@ config BR2_cortex_a9
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a12
 	bool "cortex-A12"
 	select BR2_ARM_CPU_HAS_ARM
@@ -216,7 +205,6 @@ config BR2_cortex_a12
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_ARM
@@ -224,7 +212,6 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a15_a7
 	bool "cortex-A15/A7 big.LITTLE"
 	select BR2_ARM_CPU_HAS_ARM
@@ -232,7 +219,6 @@ config BR2_cortex_a15_a7
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_cortex_a17
 	bool "cortex-A17"
@@ -241,7 +227,6 @@ config BR2_cortex_a17
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_cortex_a17_a7
 	bool "cortex-A17/A7 big.LITTLE"
@@ -250,14 +235,12 @@ config BR2_cortex_a17_a7
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_pj4
 	bool "pj4"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 comment "armv7m cores"
 config BR2_cortex_m3
@@ -286,7 +269,6 @@ config BR2_cortex_a32
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a35
 	bool "cortex-A35"
@@ -295,7 +277,6 @@ config BR2_cortex_a35
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a53
 	bool "cortex-A53"
@@ -304,7 +285,6 @@ config BR2_cortex_a53
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a57
 	bool "cortex-A57"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -312,7 +292,6 @@ config BR2_cortex_a57
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a57_a53
 	bool "cortex-A57/A53 big.LITTLE"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -320,7 +299,6 @@ config BR2_cortex_a57_a53
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a72
 	bool "cortex-A72"
@@ -329,7 +307,6 @@ config BR2_cortex_a72
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_cortex_a72_a53
 	bool "cortex-A72/A53 big.LITTLE"
@@ -338,7 +315,6 @@ config BR2_cortex_a72_a53
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a73
 	bool "cortex-A73"
@@ -347,7 +323,6 @@ config BR2_cortex_a73
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_cortex_a73_a35
 	bool "cortex-A73/A35 big.LITTLE"
@@ -356,7 +331,6 @@ config BR2_cortex_a73_a35
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_cortex_a73_a53
 	bool "cortex-A73/A53 big.LITTLE"
@@ -365,14 +339,12 @@ config BR2_cortex_a73_a53
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_emag
 	bool "emag"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_exynos_m1
 	bool "exynos-m1"
@@ -381,63 +353,54 @@ config BR2_exynos_m1
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_falkor
 	bool "falkor"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_phecda
 	bool "phecda"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_qdf24xx
 	bool "qdf24xx"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_thunderx
 	bool "thunderx (aka octeontx)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_thunderxt81
 	bool "thunderxt81 (aka octeontx81)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt83
 	bool "thunderxt83 (aka octeontx83)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt88
 	bool "thunderxt88"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt88p1
 	bool "thunderxt88p1"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_xgene1
 	bool "xgene1"
@@ -446,7 +409,6 @@ config BR2_xgene1
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 
 comment "armv8.1a cores"
@@ -455,21 +417,18 @@ config BR2_thunderx2t99
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderx2t99p1
 	bool "thunderx2t99p1"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_vulcan
 	bool "vulcan"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 
 comment "armv8.2a cores"
@@ -478,21 +437,18 @@ config BR2_cortex_a55
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_cortex_a75
 	bool "cortex-A75"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_cortex_a75_a55
 	bool "cortex-A75/A55 big.LITTLE"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_cortex_a76
 	bool "cortex-A76"
@@ -501,7 +457,6 @@ config BR2_cortex_a76
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_cortex_a76_a55
 	bool "cortex-A76/A55 big.LITTLE"
@@ -510,7 +465,6 @@ config BR2_cortex_a76_a55
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_neoverse_n1
 	bool "neoverse-N1 (aka ares)"
@@ -519,14 +473,12 @@ config BR2_neoverse_n1
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_tsv110
 	bool "tsv110"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 
 comment "armv8.4a cores"
@@ -535,7 +487,6 @@ config BR2_saphira
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

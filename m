Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62E0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4111040166;
	Mon, 24 Jan 2022 23:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSE84BNTQbuT; Mon, 24 Jan 2022 23:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B5A940141;
	Mon, 24 Jan 2022 23:02:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 752A91BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6492260B09
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbzZU0Krvbqq for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 482FE60B06
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D2AB7240008;
 Mon, 24 Jan 2022 23:01:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:01:03 +0100
Message-Id: <20220124230116.203218-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/16] arch/Config.in.x86: add "newer" names for
 several Intel x86 CPU variants
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In gcc commit d3c11974032e21121a051d423a1d71097edf752f ("Use proper
Intel processor names for -march=/-mtune="), which was merged in gcc
4.9, the following replacements were made:

 * corei7     -> nehalem
 * corei7-avx -> sandybridge
 * core-avx-i -> ivybridge
 * core-avx2  -> haswell
 * atom       -> bonnel
 * slm        -> silvermont

So this commit marks the Buildroot options BR2_x86_corei7,
BR2_x86_corei7_avx, BR2_x86_core_avx2 and BR2_x86_atom as deprecated,
and adds the four corresponding options with the newer names.

Note that the older options are still kept because the new option
names are only supported starting gcc 4.9, and we theoretically still
supports targets gcc as old as gcc 4.3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index a330d72f1d..4beb11662d 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -174,6 +174,19 @@ config BR2_x86_corei7
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	help
+	  This option is deprecated. Since gcc 4.9, the gcc option
+	  "nehalem" is preferred. Use BR2_x86_nehalem instead.
+config BR2_x86_nehalem
+	bool "nehalem"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_westmere
 	bool "westmere"
 	select BR2_X86_CPU_HAS_MMX
@@ -193,6 +206,20 @@ config BR2_x86_corei7_avx
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
+	help
+	  This option is deprecated. Since gcc 4.9, the gcc option
+	  "sandybridge" is preferred. Use BR2_x86_sandybridge instead.
+config BR2_x86_sandybridge
+	bool "sandybridge"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_core_avx2
 	bool "core-avx2"
 	select BR2_X86_CPU_HAS_MMX
@@ -204,6 +231,21 @@ config BR2_x86_core_avx2
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
+	help
+	  This option is deprecated. Since gcc 4.9, the gcc option
+	  "haswell" is preferred. Use BR2_x86_haswell instead.
+config BR2_x86_haswell
+	bool "haswell"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_atom
 	bool "atom"
 	select BR2_X86_CPU_HAS_MMX
@@ -211,6 +253,17 @@ config BR2_x86_atom
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+	help
+	  This option is deprecated. Since gcc 4.9, the gcc option
+	  "bonnel" is preferred. Use BR2_x86_bonnel instead.
+config BR2_x86_bonnel
+	bool "bonnel"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_silvermont
 	bool "silvermont"
 	select BR2_X86_CPU_HAS_MMX
@@ -341,9 +394,13 @@ config BR2_GCC_TARGET_ARCH
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
 	default "corei7"	if BR2_x86_corei7
+	default "nehalem"	if BR2_x86_nehalem
 	default "corei7-avx"	if BR2_x86_corei7_avx
+	default "sandybridge"	if BR2_x86_sandybridge
 	default "core-avx2"	if BR2_x86_core_avx2
+	default "haswell"	if BR2_x86_haswell
 	default "atom"		if BR2_x86_atom
+	default "bonnel"	if BR2_x86_bonnel
 	default "westmere"	if BR2_x86_westmere
 	default "silvermont"	if BR2_x86_silvermont
 	default "k8"		if BR2_x86_opteron
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

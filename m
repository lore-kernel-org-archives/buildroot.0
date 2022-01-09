Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FBAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 08:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B73401D4;
	Sun,  9 Jan 2022 08:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSUz1jjuVSRj; Sun,  9 Jan 2022 08:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65275403C7;
	Sun,  9 Jan 2022 08:01:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6F871BF473
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6054403A8
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FzPw0uenS2a for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 08:01:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60F1B40360
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 08:01:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5D0E6240002;
 Sun,  9 Jan 2022 08:01:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 09:01:23 +0100
Message-Id: <20220109080124.2271241-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109080124.2271241-1-thomas.petazzoni@bootlin.com>
References: <20220109080124.2271241-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] arch/Config.in.x86: add support for
 x86-64-v2, x86-64-v3, x86-64-v4
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the face of the vast amount of x86-64 CPU architecture variants,
Linux distributions have worked together to define "micro-architecture
levels" in the x86-64 psABI, called x86-64-v2, x86-64-v3 and
x86-64-v4. They standardize a set of CPU features, and GCC since its
version 11.x has support for these micro-architecture levels as
-march= options.

It makes sense to support them in Buildroot, especially for those who
want to build toolchains that aim at targeting a reasonably broad
family of x86-64 processors.

More details:

 https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex
 https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
 https://www.phoronix.com/scan.php?page=news_item&px=GCC-11-x86-64-Feature-Levels

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 794d808d96..153c8bad38 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -91,6 +91,63 @@ config BR2_x86_x86_64
 	  "Generic CPU with 64-bit extensions" by the GCC
 	  documentation. It is a 64-bit CPU with MMX, SSE and SSE2
 	  support.
+config BR2_x86_x86_64_v2
+	bool "x86-64-v2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  This option corresponds to the x86-64-v2 micro-architecture
+	  level, as defined by the x86-64 psABI document, see
+	  https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex.
+
+	  It is close to the Nehalem CPU architecture, and is
+	  applicable for CPUs that support CMPXCHG16B, LAHF-SAHF,
+	  POPCNT, SSE3, SSE4.1, SSE4.2, SSSE3.
+config BR2_x86_x86_64_v3
+	bool "x86-64-v3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  This option corresponds to the x86-64-v3 micro-architecture
+	  level, as defined by the x86-64 psABI document, see
+	  https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex.
+
+	  It is close to the Haswell CPU architecture, and is
+	  applicable for CPUs that support all of x86-64-v2 plus AVX,
+	  AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE.
+config BR2_x86_x86_64_v4
+	bool "x86-64-v4"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  This option corresponds to the x86-64-v4 micro-architecture
+	  level, as defined by the x86-64 psABI document, see
+	  https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex.
+
+	  It is applicable for CPUs that support all of x86-64-v3 plus
+	  AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL.
 config BR2_x86_nocona
 	bool "nocona"
 	select BR2_X86_CPU_HAS_MMX
@@ -292,6 +349,9 @@ config BR2_GCC_TARGET_ARCH
 	default "pentium4"	if BR2_x86_pentium4
 	default "prescott"	if BR2_x86_prescott
 	default "x86-64"	if BR2_x86_x86_64
+	default "x86-64-v2"	if BR2_x86_x86_64_v2
+	default "x86-64-v3"	if BR2_x86_x86_64_v3
+	default "x86-64-v4"	if BR2_x86_x86_64_v4
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
 	default "corei7"	if BR2_x86_corei7
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

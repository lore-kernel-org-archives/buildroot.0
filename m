Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED39C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA1E404F1;
	Sun,  9 Jan 2022 10:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSYa8PnUOlCm; Sun,  9 Jan 2022 10:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29AC2404EF;
	Sun,  9 Jan 2022 10:31:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96DE91BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90DD281424
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPQbPTxSejMQ for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:31:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B83AC81415
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:31:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6DBBB82B6F; Sun,  9 Jan 2022 10:25:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 11:30:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6ce2a16814fd96a45888a774da6a4db74cd540a
X-Git-Newrev: eeace1cc13ce09a0c88ce177465b836d6eb58298
X-Patchwork-Hint: ignore
Message-Id: <20220109102523.6DBBB82B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: add support for
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eeace1cc13ce09a0c88ce177465b836d6eb58298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the face of the vast amount of x86-64 CPU architecture variants,
Linux distributions have worked together to define "micro-architecture
levels" in the x86-64 psABI, called x86-64-v2, x86-64-v3 and
x86-64-v4. They standardize a set of CPU features, and GCC since its
version 11.x has support for these micro-architecture levels as
-march= options.

It makes sense to support them in Buildroot, especially for those who
want to build toolchains that aim at targeting a reasonably broad
family of x86-64 processors.

It only really makes sense to use as 64-bit CPUs, and not as 32-bit
ones, so we guard them behind BR2_x86_64.

More details:

 https://gitlab.com/x86-psABIs/x86-64-ABI/-/blob/master/x86-64-ABI/low-level-sys-info.tex
 https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
 https://www.phoronix.com/scan.php?page=news_item&px=GCC-11-x86-64-Feature-Levels
 https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=59482fa1e7243bd905c7e27c92ae2b89c79fff87

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - they are x86-64-only CPUs
  - add gcc commit URL
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 34564c1ed1..0ba9ecbcea 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -92,6 +92,66 @@ config BR2_x86_x86_64
 	  "Generic CPU with 64-bit extensions" by the GCC
 	  documentation. It is a 64-bit CPU with MMX, SSE and SSE2
 	  support.
+config BR2_x86_x86_64_v2
+	bool "x86-64-v2"
+	depends on BR2_x86_64
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
+	depends on BR2_x86_64
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
+	depends on BR2_x86_64
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
@@ -293,6 +353,9 @@ config BR2_GCC_TARGET_ARCH
 	default "pentium4"	if BR2_x86_pentium4
 	default "prescott"	if BR2_x86_prescott
 	default "x86-64"	if BR2_x86_x86_64
+	default "x86-64-v2"	if BR2_x86_x86_64_v2
+	default "x86-64-v3"	if BR2_x86_x86_64_v3
+	default "x86-64-v4"	if BR2_x86_x86_64_v4
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
 	default "corei7"	if BR2_x86_corei7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

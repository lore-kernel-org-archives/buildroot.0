Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB9EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E281441558;
	Tue, 25 Jan 2022 07:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Fc2oEJ_e8Op; Tue, 25 Jan 2022 07:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7E141786;
	Tue, 25 Jan 2022 07:57:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23F811BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0271060B2F
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NctNycwmfGx for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F1B560F20
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6C1C082774; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:41:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3702977799b6a9a6f7e0f9bfaf83fccd95e9dc41
X-Git-Newrev: 4c0088718ebca4166f87606d5fd811a4190750e6
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.6C1C082774@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: add skylake CPU
 variants
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c0088718ebca4166f87606d5fd811a4190750e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both skylake and skylake-avx512 were added in gcc 6.x. According to
https://en.wikipedia.org/wiki/Skylake_(microarchitecture) the early
Skylake processors indeed did not have AVX512 support, while the later
ones did, hence the separate gcc options.

Due to this being the first CPU we support with AVX512, this commit
adds BR2_X86_CPU_HAS_AVX512.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index d5d84715b8..6b18580ae4 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -19,6 +19,8 @@ config BR2_X86_CPU_HAS_AVX
 	bool
 config BR2_X86_CPU_HAS_AVX2
 	bool
+config BR2_X86_CPU_HAS_AVX512
+	bool
 
 choice
 	prompt "Target Architecture Variant"
@@ -259,6 +261,18 @@ config BR2_x86_broadwell
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+config BR2_x86_skylake
+	bool "skylake"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_x86_atom
 	bool "atom"
 	select BR2_X86_CPU_HAS_MMX
@@ -287,6 +301,19 @@ config BR2_x86_silvermont
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+config BR2_x86_skylake_avx512
+	bool "skylake-avx512"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_AVX512
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_x86_k6
 	bool "k6"
 	depends on !BR2_x86_64
@@ -414,10 +441,12 @@ config BR2_GCC_TARGET_ARCH
 	default "core-avx2"	if BR2_x86_core_avx2
 	default "haswell"	if BR2_x86_haswell
 	default "broadwell"	if BR2_x86_broadwell
+	default "skylake"	if BR2_x86_skylake
 	default "atom"		if BR2_x86_atom
 	default "bonnel"	if BR2_x86_bonnel
 	default "westmere"	if BR2_x86_westmere
 	default "silvermont"	if BR2_x86_silvermont
+	default "skylake-avx512" if BR2_x86_skylake_avx512
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F1CC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D4B280D58;
	Tue, 30 Jul 2024 07:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VFZxDnijDNm; Tue, 30 Jul 2024 07:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8954F80E0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8954F80E0D;
	Tue, 30 Jul 2024 07:35:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB2211BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E450080E47
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kI1oq19XWjO for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22DAF80E0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22DAF80E0D
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:35:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F7FF836B7; Tue, 30 Jul 2024 07:35:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 09:29:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fab00ff153155fab626e718fb43d425e88d3066
X-Git-Newrev: 01becc082dd7b394b1591508e58f298b262e26af
X-Patchwork-Hint: ignore
Message-Id: <20240730073536.0F7FF836B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: drop knightslanding
 and knightsmill archs
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

commit: https://git.buildroot.net/buildroot/commit/?id=01becc082dd7b394b1591508e58f298b262e26af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the GCC 14.x release notes at
https://gcc.gnu.org/gcc-14/changes.html:

  Xeon Phi CPUs support (a.k.a. Knight Landing and Knight Mill) are
  marked as deprecated. GCC will emit a warning when using the
  -mavx5124fmaps, -mavx5124vnniw, -mavx512er, -mavx512pf,
  -mprefetchwt1, -march=knl, -march=knm, -mtune=knl or -mtune=knm
  compiler switches. Support will be removed in GCC 15.

Using those architectures already emits warnings, which when treated
as errors cause build failures, such as:

  cc1: error: '-march=knm' support will be removed in GCC 15 [-Werror=deprecated]
  cc1: all warnings being treated as errors

Therefore, let's drop support for those two architectures, which are
anyway not common at all, especially in the embedded space.

Fixes:

  http://autobuild.buildroot.net/results/ce98c41b22212f52bf7b53d84871b8e03409dbca/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy   | 14 ++++++++++++++
 arch/Config.in.x86 | 26 --------------------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index da6f24366c..a746f682cc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_x86_knightslanding
+	bool "knightslanding x86 architecture support dropped"
+	select BR2_LEGACY
+	help
+	  GCC 14.x has marked this architecture as obsolete, and emits
+	  a warning causing build failures.
+
+config BR2_x86_knightsmill
+	bool "knightsmill x86 architecture support dropped"
+	select BR2_LEGACY
+	help
+	  GCC 14.x has marked this architecture as obsolete, and emits
+	  a warning causing build failures.
+
 config BR2_PACKAGE_DVB_APPS
 	bool "dvb-apps package removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 93a223b7ae..f9b32130b2 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -379,30 +379,6 @@ config BR2_x86_grandridge
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-config BR2_x86_knightslanding
-	bool "knightslanding"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-	select BR2_X86_CPU_HAS_SSSE3
-	select BR2_X86_CPU_HAS_SSE4
-	select BR2_X86_CPU_HAS_SSE42
-	select BR2_X86_CPU_HAS_AVX
-	select BR2_X86_CPU_HAS_AVX2
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
-config BR2_x86_knightsmill
-	bool "knightsmill"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-	select BR2_X86_CPU_HAS_SSSE3
-	select BR2_X86_CPU_HAS_SSE4
-	select BR2_X86_CPU_HAS_SSE42
-	select BR2_X86_CPU_HAS_AVX
-	select BR2_X86_CPU_HAS_AVX2
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_x86_skylake_avx512
 	bool "skylake-avx512"
 	select BR2_X86_CPU_HAS_MMX
@@ -791,8 +767,6 @@ config BR2_GCC_TARGET_ARCH
 	default "tremont"	if BR2_x86_tremont
 	default "sierraforest"	if BR2_x86_sierraforest
 	default "grandridge"	if BR2_x86_grandridge
-	default "knl"		if BR2_x86_knightslanding
-	default "knm"		if BR2_x86_knightsmill
 	default "skylake-avx512" if BR2_x86_skylake_avx512
 	default "cannonlake"	if BR2_x86_cannonlake
 	default "icelake-client" if BR2_x86_icelake_client
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

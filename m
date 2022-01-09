Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4133FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE37C60B35;
	Sun,  9 Jan 2022 10:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eorFf9Qpz67z; Sun,  9 Jan 2022 10:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4720360B2F;
	Sun,  9 Jan 2022 10:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A629B1BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 947D960B2F
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tM5fB7isuvJB for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:31:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B322D60B28
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:31:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 65CEC812B6; Sun,  9 Jan 2022 10:25:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 11:30:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf01e51f3c626c2235f587b561af4bfac192c05e
X-Git-Newrev: d6ce2a16814fd96a45888a774da6a4db74cd540a
X-Patchwork-Hint: ignore
Message-Id: <20220109102523.65CEC812B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: add option for
 -march=x86-64
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6ce2a16814fd96a45888a774da6a4db74cd540a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already have support for a wide range of x86-64 CPUs, but we don't
have any option to build for the most generic possible x86-64 CPU, as
made available by the -march=x86-64 GCC option.

This commit makes this option available in Buildroot.

It only really makes sense to use as a 64-bit CPU, and not as a 32-bit
one, so we guard it behind BR2_x86_64.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: it's an x86-64-only CPU]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 7aae3cafb7..34564c1ed1 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -81,6 +81,17 @@ config BR2_x86_prescott
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+config BR2_x86_x86_64
+	bool "x86-64"
+	depends on BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	help
+	  This option corresponds to -march=x86-64, documented as a
+	  "Generic CPU with 64-bit extensions" by the GCC
+	  documentation. It is a 64-bit CPU with MMX, SSE and SSE2
+	  support.
 config BR2_x86_nocona
 	bool "nocona"
 	select BR2_X86_CPU_HAS_MMX
@@ -281,6 +292,7 @@ config BR2_GCC_TARGET_ARCH
 	default "pentium3"	if BR2_x86_pentium3
 	default "pentium4"	if BR2_x86_pentium4
 	default "prescott"	if BR2_x86_prescott
+	default "x86-64"	if BR2_x86_x86_64
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
 	default "corei7"	if BR2_x86_corei7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

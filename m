Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C24C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 08:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0505F8126D;
	Sun,  9 Jan 2022 08:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfGztd9zUpEb; Sun,  9 Jan 2022 08:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4722380EE8;
	Sun,  9 Jan 2022 08:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46A9A1BF473
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30B30402DC
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44kSDfAi21Fw for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 08:01:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8D58400F5
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 08:01:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E029060003;
 Sun,  9 Jan 2022 08:01:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 09:01:22 +0100
Message-Id: <20220109080124.2271241-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] arch/Config.in.x86: add option for
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We already have support for a wide range of x86-64 CPUs, but we don't
have any option to build for the most generic possible x86-64 CPU, as
made available by the -march=x86-64 GCC option.

This commit makes this option available in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 7aae3cafb7..794d808d96 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -81,6 +81,16 @@ config BR2_x86_prescott
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+config BR2_x86_x86_64
+	bool "x86-64"
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
@@ -281,6 +291,7 @@ config BR2_GCC_TARGET_ARCH
 	default "pentium3"	if BR2_x86_pentium3
 	default "pentium4"	if BR2_x86_pentium4
 	default "prescott"	if BR2_x86_prescott
+	default "x86-64"	if BR2_x86_x86_64
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
 	default "corei7"	if BR2_x86_corei7
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

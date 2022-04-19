Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671CDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 21:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D1B83DFA;
	Tue, 19 Apr 2022 21:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzYmHZnE9ENt; Tue, 19 Apr 2022 21:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0F8083EA8;
	Tue, 19 Apr 2022 21:35:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A774D1BF3F0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95C68607F1
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2ji2_QHAROG for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 21:34:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 967B8605A1
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 21:34:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7F4B1FF806;
 Tue, 19 Apr 2022 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650404094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zcKr+dG3qfDZNyCUlrIGhVzuu1RwUt33pfCECpTpIjE=;
 b=Lj2dJnin4j2fIQ/Tl/f2ZaaCBiWen/V5Jm+x0VN6UsGuBPRluXWOymfC8Wdpuxj958UNuH
 CeuT1LHqfYg4nOjplnDWj2ffa9XvEEGTERT4XnQy9lE/KCusNDyYj+jlB3hyRfSBb+T+ny
 6QcJh+yhFn6N2d3E/I2b5hY17uGJSF5rLPJW10vPAxrwpPM9p2XGOzJkzXwvRyR7LxaYS0
 EKcp8kQZSh6o9zQ0cACFURryUwygMU8RO3w+K6XYKCEaQMDB9uIQEs47i8UJHz9hRBzYVD
 MA6m+Rr061hLCZ1mKCQHhajaZGHq4tniSNG+JmkxMbxUwQAtkcR/qK7as9PfvQ==
To: Buildroot List <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 Apr 2022 23:34:45 +0200
Message-Id: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] arch/Config.in.sh: fixup MMU selection
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_sh selects BR2_ARCH_HAS_MMU_OPTIONAL, which means that it's up to
the user to decide whether he wants to use MMU or not on SuperH
platforms.

However:

 - On SH2A, there is no MMU at all, so being to select "Use MMU"
   doesn't make any sense.

 - On SH4, there is no support for *not* using the MMU, so disabling
   "Use MMU" will cause the build to fail.

In order to fix this, we move the MMU selection to arch/Config.in.sh:

 - BR2_sh2a selects nothing, so that it's always noMMU

 - BR2_sh4* select BR2_ARCH_HAS_MMU_MANDATORY so that the MMU is
   always used.

Fixes:

 http://autobuild.buildroot.net/results/f4d52cabee61ee0f234b03c1ec1bd02e85e7bb20/ (FLAT
 selected with sh4aeb)

 http://autobuild.buildroot.net/results/d1b1dfe449f82944bd48215da3cdffd05797e2e9/ (FLAT
 selected with sh4a)

 http://autobuild.buildroot.net/results/45bc90fd2dde7bb201d7f999db1a8024cf889a06/ (FLAT
 selected with sh4)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in    | 1 -
 arch/Config.in.sh | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 98b0e40d51..e51ef60f40 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -228,7 +228,6 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
 	  (RISC) instruction set architecture (ISA) developed by
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index c1ba449dd5..a012cbf491 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -9,12 +9,16 @@ config BR2_sh2a
 	bool "sh2a (SH2A big endian)"
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4eb
 	bool "sh4eb (SH4 big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4a
 	bool "sh4a (SH4A little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4aeb
 	bool "sh4aeb (SH4A big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 endchoice
 
 config BR2_ARCH
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

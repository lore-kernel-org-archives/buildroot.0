Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F68C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 14:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80794195F;
	Mon, 27 Jun 2022 14:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E80794195F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5zatndsXVDM; Mon, 27 Jun 2022 14:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C4C4195B;
	Mon, 27 Jun 2022 14:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C4C4195B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 192CC1BF9B2
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 14:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BDF84195B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 14:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BDF84195B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlFAo1JSD84g for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 14:02:44 +0000 (UTC)
X-Greylist: delayed 00:08:13 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB49D41959
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB49D41959
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 14:02:43 +0000 (UTC)
Date: Mon, 27 Jun 2022 13:54:21 +0000
To: buildroot@buildroot.org
Message-ID: <20220627135359.2232222-1-fhunleth@troodon-software.com>
Feedback-ID: 38965776:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software.com; s=protonmail2; t=1656338067; x=1656597267;
 bh=D1IVPQ3iuY1OeUrhJFT/y7CEh0V0CwdxMqqjqA1WXrs=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=HVI9aNbs3FLldWsr1ZNibC/82k5qOF6YVSDJ36wbeKEpB7vjTV7legrcRcPxFbKbT
 lnxFsBqMJ3qPU1euMxmyH/x7DfgZePKE5CnI+PUw9Rv7yX6e8128qIHEZ2h/xaH9dR
 O6BT2min54m9m/XAZ8j8rYO5krcUzHHjIq5bI4XvBFhmD9kn6GDRueD2srqKPkZppx
 j57GlRmDXl+35igFM6GcO+vpEVZeKh2lRRC81wHqnM9lCYkOsu1WgMB3GNZV8M/5Pe
 luGszTgRvB8fH3IeYtJzZTXdISXYRLhLRZazviTqlFExngGt8S8lUlbWxAV5+3p1vS
 Ht80Egrc9RCbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=troodon-software.com header.i=@troodon-software.com
 header.a=rsa-sha256 header.s=protonmail2 header.b=HVI9aNbs
X-Mailman-Original-Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=troodon-software.com
 header.i=@troodon-software.com header.b="HVI9aNbs"
Subject: [Buildroot] [PATCH 1/1] arch/riscv: support the vector operations
 extension
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
From: Frank Hunleth via buildroot <buildroot@buildroot.org>
Reply-To: Frank Hunleth <fhunleth@troodon-software.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 arch/Config.in.riscv | 7 +++++++
 arch/arch.mk.riscv   | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 288ed833eb..e4dc936cf8 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD
 config BR2_RISCV_ISA_RVC
 	bool

+config BR2_RISCV_ISA_RVV
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_riscv_g
@@ -63,6 +66,10 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 config BR2_RISCV_ISA_CUSTOM_RVC
 	bool "Compressed Instructions (C)"
 	select BR2_RISCV_ISA_RVC
+
+config BR2_RISCV_ISA_CUSTOM_RVV
+	bool "Vector Instructions (V)"
+	select BR2_RISCV_ISA_RVV
 endif

 choice
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..cea5b0f263 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -26,5 +26,8 @@ endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)v
+endif

 endif
--
2.25.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

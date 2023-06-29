Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B300EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 29 Jun 2023 05:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C45CF60EC4;
	Thu, 29 Jun 2023 05:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C45CF60EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qz2LUeb4r6wS; Thu, 29 Jun 2023 05:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9FE760E92;
	Thu, 29 Jun 2023 05:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9FE760E92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AFA01BF97D
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 05:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D898B8143E
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 05:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D898B8143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yed78r6-MZRv for <buildroot@lists.busybox.net>;
 Thu, 29 Jun 2023 05:31:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4732C81DE2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4732C81DE2
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 05:31:38 +0000 (UTC)
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6AD91C0007;
 Thu, 29 Jun 2023 05:31:33 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Thu, 29 Jun 2023 07:31:28 +0200
Message-Id: <20230629053130.3976-2-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
References: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1688016694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMplKyVm+IHk1472WFu+YKhGUJRJS4QIu1p8mI7LYcY=;
 b=lvqLIiqfBcIjIAtiQfGFlUozRKE2OmTWTcC9kNAZdFLBhbA/DdeOC7guATfWDTVDXZKrn+
 +JfESZCd7Gjn/bbPeiwF4udgyptFZsqGiQDvxIJpRkyE1rs5LMuWR5+uCCLLct8i02xM9Q
 iOezM7ZxTuFL0tbgkbQdlsy09zXnCV71BBgCw8Ir8/IErdtGT/EpuzhDO4R2HgP0tSwjBD
 2a6jLN1mDG3vwAQKxH6zLj5LBbqtx5+Q867hXaRUOgYk9wBelukC2XlQuQnuvt52GO8YMf
 zi9eVK/hXvYP2btfVxC76h2di+gOqz1tbNjmY/5Ly34W6N4fLPp15L1lFBwkSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=lvqLIiqf
Subject: [Buildroot] [PATCH 1/3] arch: add support for mcf54418 Colfdire
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The m68k family ony has one Coldfire variant, namely the 5208. Add the
support for the MCF54418 CPU in the configuration file.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/Config.in.m68k | 9 +++++++++
 toolchain/Config.in | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 9fd22aaf1e..6aa409b272 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -33,11 +33,20 @@ config BR2_m68k_cf5208
 	select BR2_m68k_cf
 	select BR2_SOFT_FLOAT
 
+config BR2_m68k_cf54418
+	bool "54418"
+	select BR2_m68k_cf
+	select BR2_USE_MMU
+	select BR2_SOFT_FLOAT
 endchoice
 
 config BR2_GCC_TARGET_CPU
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
+	default "54455"		if BR2_m68k_cf54418
+
+config BR2_GCC_TARGET_ARCH
+	default "cf"            if BR2_m68k_cf54418
 
 config BR2_READELF_ARCH_NAME
 	default "MC68000"
diff --git a/toolchain/Config.in b/toolchain/Config.in
index ff0eb93017..ec2185cb39 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -95,6 +95,7 @@ config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_ARM_CPU_ARMV5
 	depends on !BR2_sparc_v8
 	depends on !BR2_m68k_cf5208
+	depends on !BR2_m68k_cf54418
 
 # GCC uses thunk functions to adjust the 'this' pointer when calling
 # C++ member functions in classes derived with multiple inheritance.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

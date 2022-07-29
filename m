Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA9C00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B10A400DB;
	Fri, 29 Jul 2022 00:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B10A400DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3FIMklRgtgO; Fri, 29 Jul 2022 00:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D47E40925;
	Fri, 29 Jul 2022 00:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D47E40925
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD1341BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C529382456
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C529382456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jP2XTR3GpS_x for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A8B683366
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A8B683366
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:28 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id ha11so3412495pjb.2
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vX/E3+6i6/5UbZg5vEqkR7lgmeb7gXKixS4VZXiwdr0=;
 b=bWfr5nKf2oC/hTWp6D3up55UJWbVbBhJhrFVCCPucEkGc7Yu0zA4430s8R2nLxi8v8
 STXehdnMZ/Uiaq8ZgDCHmDjNe0kIF/cDKRyvBi+/7iFh23y9EmjdCFDnhPDdVKBngM/c
 qRpq/gO9udqTLotsRuKQ7Mzt5mT3saMqwTHQIFrZWOkMZ/mYAn4XK0YAXYmNM4IaXtc4
 BqzcUWh4Zc2jahcEQ7qUATBPN2GlJiDDXupy/NWWGAOeHcPtvxEWBCtApXzMZBz7feHw
 7enAHKy1gC8YeDjgWwOik528HZWRrYY/+mKz/QXQA1lC+HBrooWi/BtGH0z5gtfO7yVG
 TfAw==
X-Gm-Message-State: ACgBeo23Q4s0M/pk6Q0VSkCgml3K5AcHAEGhoCBEeNwJXgMGCXOD52Iq
 FdHXoWS+srKfN4gkYeL+BtHalKszJks=
X-Google-Smtp-Source: AA6agR7EBi7Qs2gwEpP2uncL/8jzP5Ohlb4UDk9mG90EYG1G8R3v9lkhE+pnsSrRIHeOWenQlhnCtA==
X-Received: by 2002:a17:90b:164e:b0:1f2:cdd8:328a with SMTP id
 il14-20020a17090b164e00b001f2cdd8328amr1180768pjb.176.1659053366907; 
 Thu, 28 Jul 2022 17:09:26 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:26 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:38:57 +0930
Message-Id: <20220729000904.1295295-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vX/E3+6i6/5UbZg5vEqkR7lgmeb7gXKixS4VZXiwdr0=;
 b=Z4cjX2GpuKKyiXuQXr/t6HJIB+WqHTPWTgCV8JoKS6XsebVCnsjUUO6Ptg7cCtm6KN
 4W8/S2jF1zrcrDQK3N1TqdSLkLmK489vrHJ3A/c+gnKdn/dDYfkX85bo355oLr0K54tp
 tEu5YMl/pAyVGatxmNdEcr4f2rQU6hLaRo1Jm+HphFQwz+cNPOVrv0nXBC0leyv4niR8
 qhhaR0g+BaSLLmTb26LFUA2aBqiG+scdFMxW9llIlBfxbfPpMBlQhE8cMSEYAvPc/vek
 J7Vc/otLtJWhd7LiOEaRceWXbi5I4SgITbA6eJkO/l6VEX+4UvEyFTgk2tbhtqreWG+m
 tQ2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z4cjX2Gp
Subject: [Buildroot] [PATCH 2/9] arch/powerpc: Clarify generic CPUs
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the case where a specific CPU is not selected, set an appropriate
gcc target for the architecture.

For clarity this introduces a BR2_generic_powerpc64 as a generic 64 bit
CPU as this makes the it clearer when browsing menuconfig.

We can't have a generic ppc64le GCC, as attempting to configure glibc
for powerpc64le fails:

 configure: error: ***  POWER8 or newer is required on powerpc64le.
 __builtin_signbit is broken.  GCC 7.4 or newer is required to resolve
 (PR83862). The compiler must support -mabi=ieeelongdouble and
 -mlong-double-128 simultaneously.

Hence set Power8 as the default CPU for powerpc64le.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/Config.in.powerpc | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index ef0e85fec680..8d392bfde814 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -9,12 +9,17 @@ config BR2_POWERPC_CPU_HAS_SPE
 
 choice
 	prompt "Target Architecture Variant"
-	default BR2_generic_powerpc
+	default BR2_generic_powerpc if !BR2_ARCH_IS_64
+	default BR2_generic_powerpc64 if BR2_ARCH_IS_64
+	default BR2_powerpc_power8 if BR2_powerpc64le
 	help
 	  Specific CPU variant to use
 config BR2_generic_powerpc
-	bool "generic"
-	# No C library supports this variant on ppc64le
+	bool "generic (32 bit)"
+	depends on !BR2_ARCH_IS_64
+config BR2_generic_powerpc64
+	bool "generic (64 bit)"
+	depends on BR2_ARCH_IS_64
 	depends on !BR2_powerpc64le
 config BR2_powerpc_401
 	bool "401"
@@ -220,6 +225,8 @@ config BR2_GCC_TARGET_CPU
 	default "power6"	if BR2_powerpc_power6
 	default "power7"	if BR2_powerpc_power7
 	default "power8"	if BR2_powerpc_power8
+	default "powerpc64"	if BR2_generic_powerpc64
+	default "powerpc"	if BR2_generic_powerpc
 
 config BR2_READELF_ARCH_NAME
 	default "PowerPC"	if BR2_powerpc
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

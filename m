Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F304C00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EADC9833CB;
	Fri, 29 Jul 2022 00:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EADC9833CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_Tt9Va54S_I; Fri, 29 Jul 2022 00:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD31382456;
	Fri, 29 Jul 2022 00:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD31382456
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 754D11BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5026740117
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5026740117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0sTOyjrmXKJz for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4E9400DB
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C4E9400DB
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:31 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y9so3236819pff.12
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H6wdEt1TdiYwAEcovgTE9RyRAyQlF7wha4ThcsxQz0k=;
 b=Q9aPN4hzCliEVYOUHt+05VAmqYIwH/P0VHmy0bADCSFAY5rnm9YhEuuwP1wwgD86cQ
 V+/XF52AtRAQl2LrTaoDiyvb0JB3nDWnS4EdNbSEMiCeWPQS5GdGFrAXirvq8jyMuGsp
 ZyxHDK/ArMZpXXhydMmTYRFXKXDFR7ghUu92pyBpEKrXgGZvI0xZIqAa1BPcsKSslUZF
 puIHBF8rbcLzgi9D+02V8YsktDB8nKw9+ydIWEdp9pxDJVCSiMLBtLJSa+xrys5quRr9
 JSP7oBpiL8MxVRPFkIuYeLZ8UeQiVxIVeVHgWEcO2EZQzK3OhV1thbJq7PiXv8+PdR0R
 PrzQ==
X-Gm-Message-State: AJIora/Hio45j4Z8btOFatM/8OEzoQXAYkwJ518/QR9WFiz8MasFhmOT
 bInHBGqD9i/p2IuRwOEyBGi15LyIl4A=
X-Google-Smtp-Source: AGRyM1u/Cvh9vqB9xO6c8Ac2RvEJ8hSDzOXP9CaBmf94czZIPJBno5TXkQ4Cbiw0zvOapLZwKkmsVg==
X-Received: by 2002:a63:1f4b:0:b0:41a:daa:3068 with SMTP id
 q11-20020a631f4b000000b0041a0daa3068mr907592pgm.330.1659053370417; 
 Thu, 28 Jul 2022 17:09:30 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:29 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:38:58 +0930
Message-Id: <20220729000904.1295295-4-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6wdEt1TdiYwAEcovgTE9RyRAyQlF7wha4ThcsxQz0k=;
 b=OLYYfNNZkngbGVtPuFcELchUIdHx6GjxR/HdRxDQicL3m6Wm05iw4oR57HH6ReLKpV
 t+L5lF8fcxaauyV1UnK4OgEDNJRx0RKRWqC1aib+xLCbABNLmP+cr5Dr920JEwR/Zw+D
 cldV2CN1MWKSMrkBxG8WuM4PJbPoSHUWJQ5FUj1LoN2yEayEo3O167NMRBG5V6iIa5d+
 SjOqmLmIP7VgbQXEgmwEgiNmBrZjvFw5zjxIqPZJaIExmDd6Moq9y1i77Eo9vU96quA9
 ZoAhoMshrknnX2NVnnqIIr1hX281YTIZ/GDnxtZYQqLt6CtESIHKwtNo5s70qKnKeGKp
 ymEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OLYYfNNZ
Subject: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only on
 CPUs that support it
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

Invalid configurations lead to build failures, such as trying to enable
ppc64le for the ppc970:

  http://autobuild.buildroot.net/results/fda886768fce25ccd9b52b635ff5b13da7ba2d0c/

In order to run a ppc64le userspace a kernel that runs in this mode is
required. The only CPU supported in buildroot that can boot a ppc64le
kernel is Power8, so mark all of the other 64-bit capable CPUs as not
supporting ppc64le.

This drops the comment about libc, which is true but doesn't tell the
whole story.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/Config.in.powerpc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 8d392bfde814..7c6ae84348e9 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -71,11 +71,9 @@ config BR2_powerpc_604e
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_620
 	bool "620"
-	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_630
 	bool "630"
-	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_740
 	bool "740"
@@ -102,6 +100,7 @@ config BR2_powerpc_860
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_970
 	bool "970"
+	depends on !BR2_powerpc64le
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
@@ -129,21 +128,25 @@ config BR2_powerpc_e6500
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
-	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_power5
 	bool "power5"
-	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
+	depends on BR2_ARCH_IS_64
 config BR2_powerpc_power6
 	bool "power6"
+	depends on !BR2_powerpc64le
+	depends on BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power7
 	bool "power7"
+	depends on !BR2_powerpc64le
+	depends on BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 config BR2_powerpc_power8
 	bool "power8"
+	depends on BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 endchoice
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

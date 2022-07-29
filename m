Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E297C00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11E078343E;
	Fri, 29 Jul 2022 00:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11E078343E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88ue1D8DNFLg; Fri, 29 Jul 2022 00:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E1A833CB;
	Fri, 29 Jul 2022 00:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E1A833CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 026B21BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D13A64019F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D13A64019F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rD53UM3viXzY for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EE8240117
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EE8240117
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:43 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 w63-20020a17090a6bc500b001f3160a6011so4927732pjj.5
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pax9oaTpjpNJsN/PMRdnWnD3PnW5FYCnJreVmhgb3hk=;
 b=0U0f5U7CI2x+MiPR0raJVPfHBSuavLF+d83mveXFRd0Nxn/DnLY7LGx/6uIlioqf3W
 Sheg4mxgl8h/x9NyMcmk4Sfh5fe0U0HTwRPOGxzp4b50DqVhASAM6q59GkEB3HNUJDAf
 7GHFk90TTCMiRBQwNaSsF0PS3XowTIQvGxdQx63YCPA+CyINO8m5Ydzc1VY6UullbvBd
 A50+xrKxpwoiwaQrcpZw0d2cyEv8J3rNfcBYSoXLVwSMH2RUV1l4yvos2760XoDazuoV
 0hi028LnFbrYN2eGOt6rFacmxIYfOG4L0UvBhM19+lApGnX3N5HXQXuLOIcxWAJ8mtSM
 oRmw==
X-Gm-Message-State: ACgBeo3PhOTg66+KcsZIcsCItfrOcR2kBoldxqbLc77fM14bQ8Pq4RdQ
 B1X7pzqE6kmRdDfqI0LtrpgM5SC0Fj0=
X-Google-Smtp-Source: AA6agR6njzP0gZNMNc26zp6ruSpsBpLO7i2jxLjJN35xGKBMP8pzY+kzbtfz4IKz4paQUa2lbeb/nA==
X-Received: by 2002:a17:90b:4c0b:b0:1f2:c8b0:a28c with SMTP id
 na11-20020a17090b4c0b00b001f2c8b0a28cmr1804364pjb.227.1659053381884; 
 Thu, 28 Jul 2022 17:09:41 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:41 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:39:01 +0930
Message-Id: <20220729000904.1295295-7-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pax9oaTpjpNJsN/PMRdnWnD3PnW5FYCnJreVmhgb3hk=;
 b=BjJ2qYc5AZL8K2DqqROn85Cn+RbGraEDk0NM6eOITMjcpUOPryFJc7IrmPTOnqGxDy
 DA+tT6VMobodIHy1HGzlHqZ4OSpPkYIBwDoT78AiIoq2J3OaziuKJsXnCfwm70z+ArcB
 Bc3+WbcQi5OgG5FIb1CJ7GTl+QuqHMd17PsB4GRzfKNwSylbpXLOAKJVdYXxl4Op0qpw
 yZZ6yS61nDVW0jl7/dFZky13tEbqpdJ8PPsHjBceYUgsN2/0/J7HO/AMkxdGybQjlqEK
 NrEDdIYdHrVVGFd71WYJgrlfMbo8k1ybCkGJDnQlhIKsFBUykdVPCB/IPAY2qpwWU+VI
 oWzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BjJ2qYc5
Subject: [Buildroot] [PATCH 6/9] arch/powerpc: Add Power10 CPU type
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

The Power10 CPU was released by IBM in 2021. It is a 64-bit CPU
implementing ISA v3.1. It runs in big and little endian modes, and
supports VSX and AltiVec.

It introduces prefix (8 byte) instructions along side the existing 4
byte instructions, and new SIMD MMA instructions.

Power10 is supported as of GCC 10 and Binutils 2.35.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/Config.in.powerpc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 4c633c338d86..002998d079ee 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -155,6 +155,12 @@ config BR2_powerpc_power9
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+config BR2_powerpc_power10
+	bool "power10"
+	depends on BR2_ARCH_IS_64
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 endchoice
 
 if BR2_POWERPC_CPU_HAS_SPE
@@ -235,6 +241,7 @@ config BR2_GCC_TARGET_CPU
 	default "power7"	if BR2_powerpc_power7
 	default "power8"	if BR2_powerpc_power8
 	default "power9"	if BR2_powerpc_power9
+	default "power10"	if BR2_powerpc_power10
 	default "powerpc64"	if BR2_generic_powerpc64
 	default "powerpc"	if BR2_generic_powerpc
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

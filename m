Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D604C19F2A
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A512360D65;
	Fri, 29 Jul 2022 00:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A512360D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kl0JZ4SPWeR3; Fri, 29 Jul 2022 00:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFCD860D54;
	Fri, 29 Jul 2022 00:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFCD860D54
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67DF01BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DE1F4179F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DE1F4179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ri1HdcIjGMU0 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DF64179E
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91DF64179E
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:39 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id y141so3255340pfb.7
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aMgvyQXNUk2WLMyjmZJYo0WWYU+MaKTtvugGu/pMFqw=;
 b=NEWOAKE9LPa9Q0/2Nk1fFMOFsLLvcyxR5DNeAWvRveXfFIr/EcIPNvdsykKz9MqMdb
 ONSXr8I9LSxj/hW2fbO+ToJtDwdEQUJh6gFcKkMDz9yyvtukVLbZAfhDk6hH+Pciu3g0
 MdcdMfJRF9wlZ84eyhr+Hu+/cEii/9uyT7cEaz6AHNWiLXTdOsZ5jgM6bSjy+Z8jGGrN
 0QlTILwzWTW2xTZs3go4AvpQbtSgUva+YSBK79GKxSmTaMDM4xIj7CDI+sCMWLmDQ3MI
 oBwHFHAdLcWan6dZGqTbOXBDa3Wlhwri5XGsrDzQRRuPiPPziHsO8K0dkiW210KY1qLl
 muaA==
X-Gm-Message-State: AJIora/Ev2RaraY7IaBbIfBp9MKAYHZ6PRnGkdzeWc6GXUdgpIUVc9sj
 00HSxZzRNcqZYRvgdK5yU9mmcbiFAow=
X-Google-Smtp-Source: AGRyM1vjoadUTU6l4UCixG2eW43H9g5vfk08Tjf2fDOoM6AjWVPyGtL46/AafWf/licZao2P7zz8DQ==
X-Received: by 2002:a63:5c5e:0:b0:412:a2f1:d0dd with SMTP id
 n30-20020a635c5e000000b00412a2f1d0ddmr905928pgm.251.1659053378223; 
 Thu, 28 Jul 2022 17:09:38 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:37 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:39:00 +0930
Message-Id: <20220729000904.1295295-6-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aMgvyQXNUk2WLMyjmZJYo0WWYU+MaKTtvugGu/pMFqw=;
 b=dKdwW5l9SmD/yXMavek6qez0B3Gp+5Xnph2/12gINZqdUfvBoJDWFgpPue0mfHVfoP
 0vD/4fTsTHdy2m9CYSbLfwTImSwc83PocohijunSWmSjrZx/r+X5OWm6Mw/sZREbPpd2
 njE1i4kEllUvdfoVAx9tQRJpzeZhf0CsrTBgg9a9YwdBcthqOJuVf7wTHUdFyTSUyiq6
 I3GW+oTaB2xZDitxgybrAaspAzh1i0YnXle1LoLgk9ghVpPXdyxwzaYW7e2yYKVKu8m4
 zTAWPZCW6zUKlwda8QZBtgFRdR8Bcql2aH/2/h5WuMHkYYDofHEebJxguuSmXr3IUlWV
 ZY2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dKdwW5l9
Subject: [Buildroot] [PATCH 5/9] arch/powerpc: Add Power9 CPU type
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

The Power9 CPU was released by IBM in 2016. It is a 64-bit CPU
implementing ISA v3.0. It runs in big and little endian modes, and
supports VSX and AltiVec.

Power9 is supported as of GCC 6.1 and Binutils 2.26.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/Config.in.powerpc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 7c6ae84348e9..4c633c338d86 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -149,6 +149,12 @@ config BR2_powerpc_power8
 	depends on BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
+config BR2_powerpc_power9
+	bool "power9"
+	depends on BR2_ARCH_IS_64
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 endchoice
 
 if BR2_POWERPC_CPU_HAS_SPE
@@ -228,6 +234,7 @@ config BR2_GCC_TARGET_CPU
 	default "power6"	if BR2_powerpc_power6
 	default "power7"	if BR2_powerpc_power7
 	default "power8"	if BR2_powerpc_power8
+	default "power9"	if BR2_powerpc_power9
 	default "powerpc64"	if BR2_generic_powerpc64
 	default "powerpc"	if BR2_generic_powerpc
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

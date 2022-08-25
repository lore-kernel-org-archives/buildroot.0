Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70384C32774
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 07:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBBC781C67;
	Thu, 25 Aug 2022 07:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBBC781C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J77KPaDardw7; Thu, 25 Aug 2022 07:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFE981397;
	Thu, 25 Aug 2022 07:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFE981397
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8171BF83B
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 07:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CD7B812F3
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 07:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD7B812F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lGsmSZyLTRCE for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 07:53:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB826812F1
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB826812F1
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 07:53:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r4so25003249edi.8
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 00:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=903Vc4yFYTb9AybPEO1uAJOzcs2JD2r8mwR1T3J4pxY=;
 b=2fEjV2iirk+KbetvPOpoPSR+cTkevymba82ySMf3iMQ4ybQT3h5cZlOXWSLiJ5tLel
 1dF77xziTNQ3L4IKKle2Z/rO5hqQB5YJsMog4yL//TB7aggqGQHuopT+7kKxSjPLIBwy
 TPz41GPQ6RC2jVVeg1HW1t3xY2EN1gUqM4cqmiAewpWlVEdsQLYGK82aoP1I0RUdAHpg
 hupNvP3xehfJeYCNIqUMLciDtEc9S8bbsRyerFrDC5irbGYdpoT/1Y//K3n4HRmlRc/c
 yOFhxWBPQqya8P0pDqZ+fdU7ja6f3eytrYaF91z07UOfoiAcaa1+lZe70sk2EuGuIUPH
 VJsg==
X-Gm-Message-State: ACgBeo24gxuw7hWMgLKpXYBZJ/plRUGmPfCzNaXwEOdkP9Qdu1MFm8u/
 k0aTifrRCAfECNWmpG+W2+tSu8cRqjVqZw==
X-Google-Smtp-Source: AA6agR7fVJn6BPuAM1Cf0vZieDr0aly2aOPWUVnDDGQPiCha4VBceY0LHb96erNg4BNfWkYyJ8VVbw==
X-Received: by 2002:a05:6402:530c:b0:43b:c6bf:a496 with SMTP id
 eo12-20020a056402530c00b0043bc6bfa496mr2124053edb.282.1661414017507; 
 Thu, 25 Aug 2022 00:53:37 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 u16-20020aa7d0d0000000b004477c582ffdsm2385130edo.80.2022.08.25.00.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 00:53:36 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Aug 2022 09:53:34 +0200
Message-Id: <20220825075334.3921399-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=903Vc4yFYTb9AybPEO1uAJOzcs2JD2r8mwR1T3J4pxY=;
 b=T/e8LPyi/CCqVnTwkvr1SaN+d3hRamNOkAUTELwCw3KOhAm8haIB6BKkP0qFFFFBU4
 styCVp+jxqUax1XbOe2PC1nYYJZS3OTyFFsg+E0M7jF8Eve8NDcGlbpjMZpbeaemPfIj
 E71oT2p/IUYg60D8HeGqiMxwfdhwLCD2I8AOUjN7IOvHb0GLuzyJ9LhCThXfodXr9/m9
 3Gdky/kDZ9yEWF4M5klhH+GqMnLKcT0Ya8n00NIKfAF/cSE6ff01e0bxbj1pS+uiHtrb
 nfV+ElXRALWx9ri42BmQUW8dd9SdXYQY9T/m+xNPAFXFJ8wRc7tgNSXU5EFLWhCbqiDs
 RnSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T/e8LPyi
Subject: [Buildroot] [PATCH 2/2] package/qt6: add QT6_GL_AVAILABLE variable
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

My apologies, I forgot to add this variable in the previous patch, it
is part of the qt6 extending as needed for GUI/OpenGL functionality

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4b2b9a1174..32f32eb162 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -12,6 +12,11 @@ config BR2_PACKAGE_QT6_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	depends on BR2_USE_MMU
 
+config BR2_PACKAGE_QT6_GL_AVAILABLE
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
 comment "qt6 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, host gcc >= 8"
 	depends on !BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_QT6_ARCH_SUPPORTS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

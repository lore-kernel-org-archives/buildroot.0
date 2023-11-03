Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E39AC4167D
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 21:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF6E82347;
	Fri,  3 Nov 2023 21:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF6E82347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Q-3miSqauFu; Fri,  3 Nov 2023 21:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B2482344;
	Fri,  3 Nov 2023 21:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58B2482344
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73D1E1BF616
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 21:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B6F940182
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 21:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B6F940182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzdTitWmtNUV for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 21:53:54 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19ADD40015
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 21:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19ADD40015
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso18702165e9.2
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 14:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699048432; x=1699653232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e/ruYAt46JPiXug9rxx+aVyPMeu2ecJc8pAWrDfQdOU=;
 b=OtCxLc2HUYuj4HrG1v8Sf9tBKTlhf4S6oUNHvpS0aAJeEwr2FWfibIAgDtDOc6drBS
 2Df2EOdlXNa4dZqvRJJ4TapVcmontozPgtGF/dOPPzaMVv1TRZiBxoC3p13gjdmSfT0y
 eLSDcW0L+lBN/Ag8O7nmMZ8TarhwBeiXQL7/ExJOutDFPsk0kDrrEpeit38SzyWy1Ypd
 43F/FSok6dwfea/BiB63SPl90PWxTW02J5+alwA+OhdSBCZhNsilufJ/z3VfBjDF0KiQ
 PAPtPMjFunc7PKcK6utrz9kwG/S2xwGdlxFHpTvNw/4pfVMwy1hobH/b5Qk4hWaUDjmN
 RK4g==
X-Gm-Message-State: AOJu0Yyj82cE7XKmnLRXpE96nYvRHWqtydEoi1VXPobx4mIL7IIBYBTp
 Hh6LF4hfk5n73qpKaOmcQaghqpSSfLA=
X-Google-Smtp-Source: AGHT+IH/6qSw8ssaZFz645XhXVczD4SbcCFO0GjuieoIS1QRhxxfwDH7RIKrgBO82sbNEoqRl5RU4Q==
X-Received: by 2002:a05:600c:470d:b0:404:f9c1:d5d7 with SMTP id
 v13-20020a05600c470d00b00404f9c1d5d7mr19324289wmo.25.1699048431482; 
 Fri, 03 Nov 2023 14:53:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bg19-20020a05600c3c9300b0040531f5c51asm3881350wmb.5.2023.11.03.14.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 14:53:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 22:53:45 +0100
Message-ID: <20231103215345.25210-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699048432; x=1699653232; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e/ruYAt46JPiXug9rxx+aVyPMeu2ecJc8pAWrDfQdOU=;
 b=mhmuXUuj+s9H4bDipCZ0ZNUdDFKaySyTV+LuOsdVygY5Gs8MmLryO18J9XH9mjodsT
 hr3n5vYgsTYtdYzCyhMNEqfmGZSs0bM21JBMiLOQGtKg6F3RqYVlvcnsj2X6qWvpdEss
 a2z4t6LExai6htPeeWU4TzdvV9CaHlOfFhncdKAQ2zHSOOaV4UEAr7CpF8SAYXiOWoeL
 abCpazqryN9xJll3Sm94LbqgsKqKIm6XWLRGcu6HFsrboWeRTxNlQUuglZJgWjjVpAuv
 +zDasxHFbiOe2GSS2TJkpdaK9hPB3FvV59yA3bDJb3R7TOeYcLu0jE1DsesOYXFPHJuh
 3d9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mhmuXUuj
Subject: [Buildroot] [PATCH 1/1] package/mender: add MENDER_CPE_ID_VENDOR
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:northern.tech:mender is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/F90CE0C3-FCE6-40AA-8C0D-EDE2C81BD67B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mender/mender.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 724295f784..ee1398244b 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -7,6 +7,7 @@
 MENDER_VERSION = 3.4.0
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
+MENDER_CPE_ID_VENDOR = northern.tech
 
 # Vendor license paths generated with:
 #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

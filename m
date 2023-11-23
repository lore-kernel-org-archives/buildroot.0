Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD75C27C40
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3414F81F6E;
	Thu, 23 Nov 2023 00:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3414F81F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmcWU5XsJ-dB; Thu, 23 Nov 2023 00:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6912981F4E;
	Thu, 23 Nov 2023 00:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6912981F4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C51FB1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B9C4015A
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B9C4015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtgI1Wgu1sS0 for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:37 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC0F2400D8
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC0F2400D8
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6c431b91b2aso328877b3a.1
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698116; x=1701302916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tg3vpmPyb+HmiylY+Wo1sHa/Mu5TdgKmORoZSGOkWB0=;
 b=YJoILQXIVRQ4lLbV0dIhqr2vpVBzQnoCvOoHsy1Fgn87vR/kDNXyXEqThjzW0Bl5rO
 qhnKH00xsLTEZPTKrlfuBLuY87EgASE+l/KMRzqnTP0dtOBH8iT3h2L/KMU6/7cDg0wG
 XiadW1PPoT4Dnd7MqnpF6Xc9L+MfF899y4z9M/zmdpszmjE/ql+hfaQ6dD4FuFT4tsSS
 HfWlPYS+9009JrVTq38/Dc3EvsGJRjbnUKHau1INBplsLY2af8XL+mxBlt2cDTAY3Iwy
 DO+fkBvSlbp+CyiraJVddWA9b7qysYR+owVTRTTyW/L0P9mSX31TNjvCovNOjaiUaxAu
 rK2g==
X-Gm-Message-State: AOJu0YwtwAZJAdSogzyxHRTSTX9sLGxhxpXFMGwedGxNoNLb0tmE9NJG
 DvvyfkETD06wXVd2YZSqlMjSjsQUZEwxyvKZpUY=
X-Google-Smtp-Source: AGHT+IFCXQJ64KohxHkO1+ElWsFzioD2kJH1ZOAJeBFgqq3RDkFAZ0VX5FUfKafarOr8IbT/8An1VQ==
X-Received: by 2002:a05:6a21:a59d:b0:187:9521:92bc with SMTP id
 gd29-20020a056a21a59d00b00187952192bcmr4764986pzc.58.1700698116706; 
 Wed, 22 Nov 2023 16:08:36 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:36 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:14 -0700
Message-ID: <20231123000819.488595-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698116; x=1701302916;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tg3vpmPyb+HmiylY+Wo1sHa/Mu5TdgKmORoZSGOkWB0=;
 b=MykqPoLxVz2cnn02mivgBLVNMIbDBD0TdEKntACubUSqvPP8wdCRRZFCimKh7BRawP
 Lnl7mWwnDq7Fkv4TADmOYQHaZp1cPfmqGawo4G1z34vdw9z/s7zXrk3X72bQvWnRP5DW
 CxyHjQyfyw0XCI01pRnRsrEra0RiyWZ8huuo8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MykqPoLx
Subject: [Buildroot] [PATCH/next 08/13] package/sway: enable bash-completion
 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/sway.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 19f90b8b00..677b101f1d 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Ddefault-wallpaper=false \
 	-Dzsh-completions=false \
-	-Dbash-completions=false \
 	-Dfish-completions=false \
 	-Dswaybar=false \
 	-Dswaynag=false \
@@ -34,4 +33,10 @@ else
 SWAY_CONF_OPTS += -Dgdk-pixbuf=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+SWAY_CONF_OPTS += -Dbash-completions=true
+else
+SWAY_CONF_OPTS += -Dbash-completions=false
+endif
+
 $(eval $(meson-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

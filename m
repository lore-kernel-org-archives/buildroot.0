Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B269C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0834883CDF;
	Fri,  5 Jan 2024 13:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0834883CDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j8fdmdeiqkW0; Fri,  5 Jan 2024 13:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59ACB83C5E;
	Fri,  5 Jan 2024 13:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59ACB83C5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4B281BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B769436BD
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B769436BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rR5rR_0FO0Jc for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:11:22 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F4A6435DF
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F4A6435DF
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso16227355e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 05:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704460279; x=1705065079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=729NeWuNqzOEozKS7tBqW+lycBiWDr0hO87Jl+7RFRk=;
 b=GeyQlfHaPYjMcVeyMYEt9HRExx+B7IK7O9O8mWCmSwJTelOr8LhCyqi3qDizhZ9PWp
 rky5Gb0YK/V/MSGsaweIelf8ynvhQ5RG+utaQBUGQAS5zZeOiVrYwkMhnFvMDuyudc4G
 mwiEDBCJq/elR1Z+X4YOoOg8g5g42DzRqZMX3EmxWMkOtJUXYMkzc+KKFzLEvCDC0j5V
 UH5BAEoEG1hqKrhWN61YbQtJXC5lmwRsMIdVFyn/WjE5oINcWPp86P5NjVhURx6z42f3
 AIYvos+zppaZbUljf9KzcxaWQQ0EyhmzoSQ0g53qOQP7yKt4A6r4VT4xh3NK2XnjZtTW
 kWxA==
X-Gm-Message-State: AOJu0YwNHJkYVBUlggy+/AU5IAfAtRF5KtlParlBzEKs0NI1djprCqoX
 9PWbLmaPDlceNza8cdoHvzRaL3RxWTw=
X-Google-Smtp-Source: AGHT+IEbPJZmabhMFEg6QKpu1p5TifW6wUjxyJQkUpGwuvwNadidcTiyxOGQL9v2lw6bHU6qdErXrQ==
X-Received: by 2002:a05:600c:5389:b0:40c:2c42:ea56 with SMTP id
 hg9-20020a05600c538900b0040c2c42ea56mr786517wmb.273.1704460279189; 
 Fri, 05 Jan 2024 05:11:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b0040d839e7bb3sm1546524wmq.19.2024.01.05.05.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:11:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 14:11:16 +0100
Message-ID: <20240105131116.390644-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704460279; x=1705065079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=729NeWuNqzOEozKS7tBqW+lycBiWDr0hO87Jl+7RFRk=;
 b=ay849WncsA3JomNhxO7+Am1I+PYwXUb2gqGDQcZC38zqztm3lHOsu8lNfQiuBMkbKP
 2ik61dGUznz0AdXtTPiSQM+Dc+nvU92knBRDIesUut/RxagDsCcfCjKyzgMShX13xsIc
 Ru8DhtFioB47CxB50kMP1b5FqLeFgI8D5KqxoUyZ9Wd8X/ksCpdBAyHdN7kjvbcxPHNC
 J28XF51To7PzpPkxe+4SqAADh8uxHojSfLuIS5RL5RfsVczlYErnm+b5jSIArvzbaAZ3
 7gFt0xzK3wyzjTkvbnazQBY6MEZhx+hqTmbBQBG4wtrTqxBFlWY3HEl3QxLdzcm4kXbj
 v1xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ay849Wnc
Subject: [Buildroot] [PATCH 1/1] package/cups: add openssl optional
 dependency
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
 Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openssl is an optional dependency since bump to version 2.4.2 in commit
433fd541eaa37db3241eed16df6ae1f51d81335b and
https://github.com/OpenPrinting/cups/commit/3e9f2c04d620cccf2a09c43791ed9d8bb717c9da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups/cups.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 8db0281dc8..a5098b50e9 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -49,8 +49,11 @@ CUPS_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-CUPS_CONF_OPTS += --with-tls=yes
+CUPS_CONF_OPTS += --with-tls=gnutls
 CUPS_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CUPS_CONF_OPTS += --with-tls=openssl
+CUPS_DEPENDENCIES += openssl
 else
 CUPS_CONF_OPTS += --with-tls=no
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

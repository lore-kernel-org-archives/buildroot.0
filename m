Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D397C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E6618176A;
	Sun, 14 Aug 2022 23:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6618176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7WsOdVjy3Pt; Sun, 14 Aug 2022 23:44:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45BD481490;
	Sun, 14 Aug 2022 23:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45BD481490
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9B2E1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A53B860E35
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A53B860E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNAKjZP59x_0 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F239E60DC6
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F239E60DC6
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:21 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id b81so3013321vkf.1
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mvjeB1O4QcAVV2UsEiQ03GMgMZjhb+beJakX6lRJHPU=;
 b=Y+US12RqXN6tmAJlsDowRT/emgvnk9oBFhMNLqNb737c1kfoosSeE6vJWSD5lqcq26
 mAfikPVeL8jRURoREP4+faUwiZgaXNJVF2xjDrGBTpjW4F+W4PWtADziQAkKe1jgJ9iJ
 Dwd2NVi/IW145Ww2xjHlW7bp/4EX1lbfhF2RVdGkNukprbrlbCKkiYUCh9+MLAOd6pOp
 Uj9+RaPE/Ljil530bjQ918nbdIeoJi9ky1RHASjfnTccMIm5mYCcDQDQNuxWm0IbDcrl
 ql0/4e/NMqsMkxFdtNTS89+8ByMf9TaJOCXGEt8XcIU01/CgJ9W6zNQCDvh2t9ZvSU7c
 HOKQ==
X-Gm-Message-State: ACgBeo0sch12xRyu+g9rUbd+PKjxQ3UpnsapTr9OeUZA4kqjXe14zpEx
 XMVTLxI85JatLEzIe55zEgcmy2D9c38=
X-Google-Smtp-Source: AA6agR5kCFhxPxbM1R/rTA3A3MnT04iFQV4X5BkS/9YC6UvrMqy5URTRIUIOAOg5oY/hNUMSZoujDA==
X-Received: by 2002:a05:6122:214f:b0:377:dd43:ba43 with SMTP id
 m15-20020a056122214f00b00377dd43ba43mr5513544vkd.39.1660520420849; 
 Sun, 14 Aug 2022 16:40:20 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:19 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:37 -0300
Message-Id: <20220814233845.2247022-26-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mvjeB1O4QcAVV2UsEiQ03GMgMZjhb+beJakX6lRJHPU=;
 b=S0MLrQbodse2CX7PFCCLE5vKzyQsNkYJcZInQ6fdiNaS790ljUqpHhblw3HCriQbWa
 m9S5HZwOFtQyfJWtHshtTvjj03pDu32rLfBwwOG0w/pCYAFs8K5Ay3Qa6bGO/PUKQgRm
 l/vQnUoSMf8lJd6HsVTNAOA9pUd8/752c2jL/vBgSvoYEs0NBFbulrDdexkvN0Og59k+
 8mgOHciojR9zmvHKTYxjz4XCNlhGPs9CaueNta7SC0lIL8VUeZJJQNFhZlyp1+wMmtfX
 8IIi6BC40LwCTfy/68th5+NhoHgTB1eH44unSu3JQebwWkFPU06Fj8zkzZtZgzlqu7RN
 i9RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S0MLrQbo
Subject: [Buildroot] [PATCH 25/33] package/cups: drop bogus libpaper
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
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The inexistent package libpaper is referenced since 2016, from commit:
'd37ce8e1a4 package/cups: Un-deprecate, and update CUPS to 2.1.2'

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/cups/cups.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 2bd5f3bbb6..fed2aa809f 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -27,6 +27,7 @@ CUPS_CONF_OPTS = \
 	--with-cups-user=lp \
 	--with-cups-group=lp \
 	--with-system-groups="lpadmin sys root" \
+	--disable-libpaper \
 	--without-rcdir
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
@@ -63,13 +64,6 @@ else
 CUPS_CONF_OPTS += --disable-libusb
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPAPER),y)
-CUPS_CONF_OPTS += --enable-libpaper
-CUPS_DEPENDENCIES += libpaper
-else
-CUPS_CONF_OPTS += --disable-libpaper
-endif
-
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 CUPS_DEPENDENCIES += avahi
 CUPS_CONF_OPTS += --enable-avahi
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1E2C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 14:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE5140765;
	Wed, 27 Mar 2024 14:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRH0pMZuFptJ; Wed, 27 Mar 2024 14:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4439406A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4439406A1;
	Wed, 27 Mar 2024 14:08:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB3931BF279
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 14:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E544381FD0
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 14:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB40XYkzr3oJ for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 14:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5245F81E6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5245F81E6D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5245F81E6D
 for <buildroot@busybox.net>; Wed, 27 Mar 2024 14:07:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33e285a33bdso4198704f8f.2
 for <buildroot@busybox.net>; Wed, 27 Mar 2024 07:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711548476; x=1712153276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GIlafYDrKp7KUGSVT9dFF2CojRxmyE5fu2UggmQJQMk=;
 b=v46vyRbFPk7oZmFOYr9pN9ocSI5eFJD0CNwdrSqZSHMkC14SzWbZcQZbYqc8wx0WPF
 EcrLxLI65OlgH5IbPpr2/delkNRYJPH7jhRKQ3g9prOO6O0THOdTN9vTgwvOjMumec0Y
 v1nWzZnF2a/Y7IJRZwioRPx8FK5JeOgf1gpmhXGc200SdNrWg/3VP3X0PwkjbuB0J3S+
 tHwD7EGiv9REty4T22CnXiebCm2jYHLn8JKa+//FSgFCK4a27cl968oMcv7+m9vmi99M
 AygehA56hzSFJ11mHCzQv4fv0rF4Ja32V7cEynyLv6GZ2V4aKh5xslPR8FvZIZbVQYdn
 cryQ==
X-Gm-Message-State: AOJu0YzeAzV3IFLrUdwVh0K3Tmp+ywmmQHuAKiGKocjx+8+A8V5BKmko
 jidesfXpZXbCXmJEUmiQteHwcCgT8aZyxNOsIcxDUUoo0d9iWzsj6AZTZjTx
X-Google-Smtp-Source: AGHT+IEYrogmdnF1415ZwNvIWKjWa37/abCNBwUQ/g7N/KsznXua6B2soCXVls3GzsFfcVs7TFWHiQ==
X-Received: by 2002:a5d:5007:0:b0:33e:d865:41f with SMTP id
 e7-20020a5d5007000000b0033ed865041fmr37285wrt.35.1711548475864; 
 Wed, 27 Mar 2024 07:07:55 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5947000000b0033f20497d4asm15005602wri.5.2024.03.27.07.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 07:07:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 27 Mar 2024 15:07:52 +0100
Message-Id: <20240327140752.5286-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711548476; x=1712153276; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GIlafYDrKp7KUGSVT9dFF2CojRxmyE5fu2UggmQJQMk=;
 b=IR+XpdO7ciepsiyLdT/trayR/kKp9nNLLux2qa1R7cytPQCjD4yQvirDn8ogr/YcwN
 foSl15TFA8Ht3ksGP2OoFQUsxlztZcFxtoCD84olCzMxzsc2OXgzBQFeU+C798xaZYVC
 bnT+kB6Df19yNN3R8JMQdg5R6SuWTbCMjHqYF9cguj6cnN6JhgkE0hlyMb72OEELCWuv
 S+9XxdfyiW+jMMrPbFUvR2LUSQ3gp+5pSHVha7WwtcepYWTXjIQIJS7OL9df/E4n5Ktd
 8OVaFoLIlpcuOoWEn7Ogi4lX29FacCP4JAeawxrXUAOloJa9EiVZxPeJYiblJrv2Q5hK
 Evhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IR+XpdO7
Subject: [Buildroot] [PATCH] package/libtommath: bump to version 1.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libtommath/Config.in       | 2 +-
 package/libtommath/libtommath.hash | 2 +-
 package/libtommath/libtommath.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtommath/Config.in b/package/libtommath/Config.in
index b2ffc722a..7447fb9eb 100644
--- a/package/libtommath/Config.in
+++ b/package/libtommath/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBTOMMATH
 	  LibTomMath is a free open source portable number theoretic
 	  multiple-precision integer library written entirely in C.
 
-	  http://www.libtom.net
+	  https://www.libtom.net
diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
index 4f5dd4023..4ce6057e0 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  986025d7b374276fee2e30e99f3649e4ac0db8a02257a37ee10eae72abed0d1f  ltm-1.2.1.tar.xz
+sha256  296272d93435991308eb73607600c034b558807a07e829e751142e65ccfa9d08  ltm-1.3.0.tar.xz
 
 # Hashes for license files:
 sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 7b5305faf..66b258641 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMMATH_VERSION = 1.2.1
+LIBTOMMATH_VERSION = 1.3.0
 LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = Unlicense
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

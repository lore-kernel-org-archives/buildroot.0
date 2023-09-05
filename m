Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B573BCA0FFA
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB5C040876;
	Tue,  5 Sep 2023 18:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB5C040876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9gZXmGV2NBos; Tue,  5 Sep 2023 18:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 918E54189A;
	Tue,  5 Sep 2023 18:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 918E54189A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EDF91BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 182878136D
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182878136D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPbvf5hI_lAE for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:20 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D07698135D
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07698135D
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bf078d5f33so21992955ad.3
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937180; x=1694541980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SfoEi7F/bm65MnarYtXP1CbKzCdy+FiacGX2H46MvrE=;
 b=GqyKjr0VxFs2MFS5r+5x2wAys1IiYex+494wbM1NHZ5CbGdOflnvkJnZbJdb1B+Aer
 eMOWlZAulzictL+4/yKRbYboTyLzxo4FNdYgjkO9izqRhHl0VXz5J24YA8igKxr5pSLK
 YI/R2ap/5XldmzYxhdFRPfDiV6CB6WRFKqBCpJi77KY75FXMY2rWZqloEtfBBIHM17J3
 kQ5J2ZPXURSh97OxuTwP7T+j/sNLyEALjhEaYmvaG4Flqf/N5VDhVJJf2uCHoQc/Y+FP
 5cO6HekztyAem9R2rAUA0UKpRV/iEfSuG9ErzmZHWCbpKKxgpWwioPOH6JD+7TXm0E1f
 v1mw==
X-Gm-Message-State: AOJu0YzCMD+peEOa31GCC7gdwfeklRCIIg8fh20AbCQ/c6zap8S1OjSa
 1fZoJPtvQOi1RMIAA8AZ/I7YGqogIUE=
X-Google-Smtp-Source: AGHT+IExzhDVY1PpgYiE55gbmvli2noiTL7Gbo0Z9a+4QbD43j2nZ/6n1qPQzJB51T3T2H7cHTHp6Q==
X-Received: by 2002:a17:902:82c8:b0:1c0:e630:5031 with SMTP id
 u8-20020a17090282c800b001c0e6305031mr12902007plz.28.1693937179790; 
 Tue, 05 Sep 2023 11:06:19 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:19 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:03 -0600
Message-Id: <20230905180610.1610778-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937180; x=1694541980; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SfoEi7F/bm65MnarYtXP1CbKzCdy+FiacGX2H46MvrE=;
 b=aLJj+Abk4QcH5/K51gAytmyvA4wuZcIlTbG/r5pgDYfhcH8c0ZLZeqzXViYsSg0krs
 sfk817IBL9ra9ckws/B0kXqAfahxMph7R9fPqUCEexLlXdISI8RYQJTjHosh9vzkXZeO
 1RBkExHNZF6t62qb6AcyBhy2I7BrTLw+tRB4Hplcyx2r14Gn5IZuxc6EPTSEVpSgTLNx
 GZOuLLEK10HD74rQbBOXZ7GdMcBPg576y491hTFT5jIxqRLMgjkSic0V5OOXrJiJfULB
 bKAu2cVJbCF/P1o0p8jLc3ge9TUo1AYzyOXEPOzw8n4Y2jyKuDhEkatsFzFcZ1QqNlMQ
 jJjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aLJj+Abk
Subject: [Buildroot] [PATCH 03/10] package/php-apcu: bump version to 5.1.22
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Adam Duskett <aduskett@gmail.comm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.comm>

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
---
 package/php-apcu/php-apcu.hash | 2 +-
 package/php-apcu/php-apcu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-apcu/php-apcu.hash b/package/php-apcu/php-apcu.hash
index 3aae4120d2..4a5eadf803 100644
--- a/package/php-apcu/php-apcu.hash
+++ b/package/php-apcu/php-apcu.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390  apcu-5.1.20.tgz
+sha256  010a0d8fd112e1ed7a52a356191da3696a6b76319423f7b0dfdeaeeafcb41a1e  apcu-5.1.22.tgz
 sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
index d381c9054f..b8eeb9de7c 100644
--- a/package/php-apcu/php-apcu.mk
+++ b/package/php-apcu/php-apcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_APCU_VERSION = 5.1.20
+PHP_APCU_VERSION = 5.1.22
 PHP_APCU_SITE = http://pecl.php.net/get
 PHP_APCU_SOURCE = apcu-$(PHP_APCU_VERSION).tgz
 PHP_APCU_LICENSE = PHP-3.01
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

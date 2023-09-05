Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B767C83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E1B4189F;
	Tue,  5 Sep 2023 18:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E1B4189F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3K6GjS8oeb38; Tue,  5 Sep 2023 18:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8EC6418D6;
	Tue,  5 Sep 2023 18:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8EC6418D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12FF81BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF1C340876
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1C340876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0JxRdd-QzLM for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:24 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E21254189E
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E21254189E
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c0bae4da38so910945ad.0
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937183; x=1694541983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=07OfMbKtIQurcyeTiQ2/pAU/YphmtVCT3HvRLhE+nik=;
 b=jiOJYDJ65/Z9SvB8sSOl4148LerqcVub2YGaGuvGAD6XXhpngNRKQpI46NIIaF5D1e
 2XLdtCPJ+z2xssRVSO0x9XRK2ZjvOqZnV9GHbdmqyt6ebJXoOO0uW7NdcuDkAdo66yd8
 VenFiy1VdpoZAniMN6JVBB3Pbaf1ep01UE9D6ccHTJQjABrh1Ef5Ds1aQmt4GPsXDpNd
 UnzkulFw7Pd4Cu1NHGn8NOAlEqeGsXNgIHAZGP2vkavrc1yG+2XcjeSaM3pFaKGjAV9B
 ZqEWZAlsz7YXaRWf0F8tS1j5Jh2r9c9wAeDT1Ikm9xNRi7RrDOm5zIWQOVtSG4nPBXdk
 UGuw==
X-Gm-Message-State: AOJu0Yy4b4pjOkoRb7UkEWr8xusZLYZombQkO3MzrM4H7hWWQKTVun53
 TPxZ8Wvbxpp7nGbdgduJORFipifuftE=
X-Google-Smtp-Source: AGHT+IEpfTFgdUcfKBHkEeQn5uesfK6gwOzB+iCOld2PuzPzQ/9eqCqGkAPnS1ysfEgtc2WcHlumow==
X-Received: by 2002:a17:902:ecc8:b0:1c0:cbaf:6954 with SMTP id
 a8-20020a170902ecc800b001c0cbaf6954mr18486758plh.25.1693937182804; 
 Tue, 05 Sep 2023 11:06:22 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:22 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:05 -0600
Message-Id: <20230905180610.1610778-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937183; x=1694541983; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07OfMbKtIQurcyeTiQ2/pAU/YphmtVCT3HvRLhE+nik=;
 b=kEwM38Ajst/1vorTHKYeOcp6gw5H9ABTnK7vyEJLgR5+rKuFlij+yuVOXR33wri7rs
 7//jW6fOYWLtQEtslUon1GHfJmzRbZ9JR/2GUYhSgFJRDZHts19Kt7ZxoGAtP270iXSO
 IouiuZ9plDgAgTv6QYC08TndyUn8sRXwrHrYdd9ROAqVtQ7YuFmBsD4CzsEcAbKyorl8
 zLgRBi9KFVunjyrsAFDg5W1gSI2h9cO3f/9otpLJoEwlG7NPP56PxOnqHGdzyhqIudPL
 iRUWROLRAqBvBlWa2LIpWFLnV3wD7xhtMKvrn80AnqlsxLLM4XQcL6oFxDwkEaGER6ge
 FuVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kEwM38Aj
Subject: [Buildroot] [PATCH 05/10] package/php-memcached: bump version to
 3.2.0
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
 package/php-memcached/php-memcached.hash | 2 +-
 package/php-memcached/php-memcached.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
index 7e918c17f6..162d25f795 100644
--- a/package/php-memcached/php-memcached.hash
+++ b/package/php-memcached/php-memcached.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b288e45f839593e16c4d8508b241de51a86df4f7322153e6becb9e1c819021fd  memcached-3.1.5.tgz
+sha256  2a41143a7b29f4a962a3805b77aa207a99e4566e2d314ce98a051cd24d6e9636  memcached-3.2.0.tgz
 sha256  24e8e3a9529204ead9422fa17cf3ddd75d292a8763b87fdb20591964f2e6ebe0  LICENSE
 sha256  a453a7a272fbd24105b39959f76996d50dad80b22d1c310f6c67f74f62ae4054  fastlz/LICENSE
 sha256  bba8cb50c660842c5ca459c5004395bdef8f01c1b64f97a9978f1053f173cb82  g_fmt.h
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 068fbb786b..f92a8ddf4c 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_MEMCACHED_VERSION = 3.1.5
+PHP_MEMCACHED_VERSION = 3.2.0
 PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
 PHP_MEMCACHED_SITE = https://pecl.php.net/get
 PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

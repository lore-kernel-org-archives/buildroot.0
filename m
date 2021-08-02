Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0551C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 21:04:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F4360F4B
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 21:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4F4360F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B0D882882;
	Mon,  2 Aug 2021 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BB51-A8vup5l; Mon,  2 Aug 2021 21:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B620A8257D;
	Mon,  2 Aug 2021 21:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1EB81BF303
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1F748254A
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 21:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qt8hbXgHzpcU for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 21:04:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF305824EF
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 21:04:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c16so22944249wrp.13
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+cZqQrZANC96VGNROIKNS9A/mqhJJq+TR6mPt9qPiU=;
 b=R6h5GVb3BZh632FbRVFXwDQG3Ow+a2SVI1nUQpkdohwDVPBoBZCQDCPo8ySCbOSoaj
 nZwJUDgSz1Nqgq4Isc+Yf5LQ8E3j3pSvhEiLLaeOj6hOOaNEUmjyCLbDPWk7eQCj05Qg
 USHB4BMk2RgooP/BgGyd11R8fQXqSIH6iRwf5Do2vRgKzZMaI2ZxlwFqYnsCCli11sfq
 nNrmRXhaZOhzM2aaSfkxI8TyCp2RFifbNvgQXFpjVqD5/wqp5yxviTRoxPHAFbpnPncb
 K2a60jZUcnRgI9GEF9MqU551WRTl2jeAEGaFKXYTB/hHinqlAB9DDLhF24JR+3MWH+0n
 fBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+cZqQrZANC96VGNROIKNS9A/mqhJJq+TR6mPt9qPiU=;
 b=WUYsdrvFHSvv1qvDhpAh8P0xBtkyj4KhuBZZUHkvQgVE5siDrmAlgdk8i0+2c0DTOB
 NRQFuzi+zvOoq9xecAuXxElpUWPxoy8N0s/2m/b6XJ2TuLhS6bBFgJUGQu1OrH5RkGfL
 ac/Rr2a56rJ5ssqcoDDjihfSZJ5KodaaA679yW/8cX1NzB42t2+aPde64ZhC8i3FUns0
 RUst7fFvp9z92VbrF5U3hY/0afAjDKpCLN/lqNHI5Qodc60fLiTtY10kTZ6+uD9W2JWZ
 SM+49qR9FbPcsQdgpUwY+7xbArIqYpsEKwb4xlyXhLTornVEqF0LEr8JIbn7pSWEw7HL
 8HQw==
X-Gm-Message-State: AOAM533Wk+SREllRvAW6lIbGabGv+AA5iBabKbdJ+CPUWeCEywRAspjy
 xJXA9viqLKU0xWFC0AM+F3/vo/sAWbTEVQ==
X-Google-Smtp-Source: ABdhPJx1deBri2kAO7MmXhdZUKnhqAHTujnOAySRMnM0vEDqiFuubxWib6z1U+kS3GeiFptDywJODA==
X-Received: by 2002:adf:e587:: with SMTP id l7mr19217385wrm.411.1627938253627; 
 Mon, 02 Aug 2021 14:04:13 -0700 (PDT)
Received: from kali.home (pop.92-184-116-137.mobile.abo.orange.fr.
 [92.184.116.137])
 by smtp.gmail.com with ESMTPSA id h4sm12537529wru.2.2021.08.02.14.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 14:04:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 23:04:02 +0200
Message-Id: <20210802210402.1730871-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php: drop mcrypt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

mcrypt has been dropped from php since version 7.2.0 and
https://github.com/php/php-src/commit/5a17f632d4c7d936385485a0cb187172f33eb97a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy       | 6 ++++++
 package/php/Config.ext | 6 ------
 package/php/php.mk     | 5 -----
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4e4a464709..54476acf9a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_PACKAGE_PHP_EXT_MCRYPT
+	bool "PHP mcrypt extension removed"
+	select BR2_LEGACY
+	help
+	  mcrypt has been removed from php since version 7.2.0.
+
 config BR2_BINUTILS_VERSION_2_34_X
 	bool "binutils 2.34 has been removed"
 	select BR2_LEGACY
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 83bb3c481f..7c97316048 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -83,12 +83,6 @@ config BR2_PACKAGE_PHP_EXT_LIBSODIUM
 	help
 	  libsodium support
 
-config BR2_PACKAGE_PHP_EXT_MCRYPT
-	bool "mcrypt"
-	select BR2_PACKAGE_LIBMCRYPT
-	help
-	  mcrypt support
-
 config BR2_PACKAGE_PHP_EXT_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/php/php.mk b/package/php/php.mk
index 6780b6a962..a1ad6e3296 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -136,11 +136,6 @@ PHP_CONF_OPTS += --enable-mbstring
 PHP_DEPENDENCIES += oniguruma
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
-PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += libmcrypt
-endif
-
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += openssl
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E906ECD128E
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 16:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 499D4812E0;
	Sun, 31 Mar 2024 16:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSLc8NHqN8Er; Sun, 31 Mar 2024 16:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FC9C812E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC9C812E5;
	Sun, 31 Mar 2024 16:44:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CEB21BF267
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 16:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 489E140384
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 16:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXLRyxIszTD4 for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 16:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE22040372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE22040372
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE22040372
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 16:44:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41561610ef4so2914265e9.0
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 09:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711903440; x=1712508240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S65f+AuuXqf0Jcwy9laGaBnP0OUMykiG05nP9XY+mSU=;
 b=sQ2rPxrWEfxM4lrcoJRZ7bBWexg6aPrPjRaMwLwrUA7YbIOesbNx3ONGfAnRYs1Nv1
 PgJ8wCSe9wfY/PS+Pv9ub75/mtSXIjvb/AmIbDtqWycnRYltPRLDE0x9yBt/QpgIomdi
 4bBVP8cAz9gbYR+Gr9MeOjrOW/9OHevQM4j11Lrlat62iR5Ayme1oUgNWzOPeDruI5Q/
 jnrA0RLTc77A1aclR2vI8HVTcGQzqSUN2lH9SIB4Fzg6ubuV3+fHQCUAZzl7bW9PH8QJ
 7E9C6sbSjY1LfFBh/3J/zazbZZ99JEosU4UfFZ4zUM/lkMJdWZIP8hh0b7rPqPIdj2/1
 vnJw==
X-Gm-Message-State: AOJu0YwY50DwEisFTQ9NXqZLLeiyCW9/SzwBzjwoGXPrwrgheq6fn6V+
 r0ZUhfSnSCCuUrU7W+RHvWzJX9DWEHqKf9m150MLATjq2pMY8IXnUPAv7EJQ
X-Google-Smtp-Source: AGHT+IFLCqSRudE7QH7OS5rQMMW+Uc9D2HyP4j+qxn4C9x/JLKarLxqd8WJmkSazgQkFz9Dkdl/Xcg==
X-Received: by 2002:a05:600c:1504:b0:415:55d5:2faa with SMTP id
 b4-20020a05600c150400b0041555d52faamr3400081wmg.23.1711903440262; 
 Sun, 31 Mar 2024 09:44:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 di6-20020a0560000ac600b00341c9956dc9sm9345596wrb.68.2024.03.31.09.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 09:43:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 18:43:54 +0200
Message-ID: <20240331164354.94483-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711903440; x=1712508240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S65f+AuuXqf0Jcwy9laGaBnP0OUMykiG05nP9XY+mSU=;
 b=gTQ4mvTN6SMejBuDRRofRIYh0IWpVBZiPnhG9wWcruLepSEuLvfWEt9YAUgeUCiUjo
 MEx8+I5uPjbGcspcV8rDmypLjParTqALNR/naqpQ+3jiHHptZn8maqiuXz5aTCZv5ulf
 pt53YvvoWUCPYv8D2iZTNESAGHwL5OiR5vLe2xN6knEc9bGFQQ7sGCZu8o0lVLj5vPmE
 E7jkcmlykpm1gOuymb+NNOatin64AYqbEQHnflxZB6OFFJHfmk1KVGtJRthmv2opfZfq
 N5sWx60fDdAzS+b0OPEZUK4cdSwPCM1wi1j1Vzew/EfHB0mV222zVqIIl299EHtvr3A+
 TZ1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gTQ4mvTN
Subject: [Buildroot] [PATCH 1/1] package/giflib: fix host build without
 convert
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not build docs for host-giflib to avoid the following build failure
without convert on host raised since bump to version 5.2.2 in commit
f98239dada59270efe19de9d9fae50ec9ab9d28c and
https://sourceforge.net/p/giflib/code/ci/d565f6fa04be8973425bd7cd3f169908ac9e95c2:

convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
make[2]: convert: No such file or directory

Fixes: f98239dada59270efe19de9d9fae50ec9ab9d28c
 - http://autobuild.buildroot.org/results/04dd54f5060881cb8aa030de34edb4ceea863fa6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/giflib/giflib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 770338507b..f37ec8af21 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -27,7 +27,7 @@ define GIFLIB_BUILD_CMDS
 endef
 
 define HOST_GIFLIB_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) shared-lib
 endef
 
 define GIFLIB_INSTALL_STAGING_CMDS
@@ -42,7 +42,7 @@ endef
 
 define HOST_GIFLIB_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
-		PREFIX=/usr install
+		PREFIX=/usr install-include install-shared-lib
 endef
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

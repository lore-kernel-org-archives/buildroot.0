Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556B1C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21C1D81F94;
	Sat, 13 Jul 2024 21:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xz87JNxqKY8x; Sat, 13 Jul 2024 21:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32B0281EE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B0281EE1;
	Sat, 13 Jul 2024 21:53:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 210FE1BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF7E81EE1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiSVEVQNlNB6 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:53:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0430B81120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0430B81120
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0430B81120
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:53:17 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eebc76119aso35356691fa.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720907595; x=1721512395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K2v/P0cEOYNeSt2uvZ8lyEd1LIfPH+jWG1t3Ojm01hg=;
 b=wG3LHhGif4EYvmFjtIEkj+Y3NJF8vHnmX4WLM941+NBHsPqvvtvCvWAQMyX6MeyiZc
 8gBRr2VPcqiqUY9+akC0F9O87LIDM0ATj0w4+uMhkXDHbHTGHdUcqpr1AjDvrQ4NTReP
 eIOazoRSQs1ohNN/2dx1Iry6Wv6aWYzOf0MXoC0ow0het4WVN5BuNRxf4MR9ebGCmCnM
 /7TOuA0w+oESvK8MshiPHPxs3M3ZcwfKhtG4Rhgu8QMcN/rwo1ezOTqzRXSw4K64nnA8
 3ssiSmqk3euYHtYMLhMk2h/6bnBQqAMxLW1upzbtSkuI+hhYFocCKW9IahQBL5VKKZCJ
 SfDg==
X-Gm-Message-State: AOJu0YzI8CIy5gIYjNTxvleuU6YxNvsrVqWWpdyRiEGS9vpUb//viMV3
 UA2G0fg1Nu+uJ1jBu99naEbzLevHtYKqlzaCAn07JDVcngBMhQnCT8Brjg==
X-Google-Smtp-Source: AGHT+IH/a9lfTnv3L1bGtg3k4Dkub+Wa1GhDnPO56E9wZJIaPkTtoVeDMHF7p3IefHKw0qfm9mYGHA==
X-Received: by 2002:a05:651c:198b:b0:2ec:40cf:fa9 with SMTP id
 38308e7fff4ca-2eeb3103c4dmr136147891fa.29.1720907594381; 
 Sat, 13 Jul 2024 14:53:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e9a814sm33365475e9.27.2024.07.13.14.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 14:53:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 23:52:52 +0200
Message-ID: <20240713215252.671703-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720907595; x=1721512395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K2v/P0cEOYNeSt2uvZ8lyEd1LIfPH+jWG1t3Ojm01hg=;
 b=nd2jYCr+GcpEeLlI+8DTWV71Ddaln8qSHhZ+JAA10eQRaXDa/y4JS+o67vTAR9R6wc
 vuXS2LuuQUSqdvrjDRQ+mPv80dwM6yACcwVHpkX1spcU6vOu9IbK0kSNeBy6jhqPLjAS
 EnCadiufT+h9J/tPJeV/VYjG7IEshjWjQnjNyyraTMgrK2jblKlj2LMd/0aITtKoA1bn
 iEJe72XfRgiUEy+9go5v+OjuE90/qqpvMJtVKqbKmM0vk3AgE4MjxP9kKLajDNSG/91D
 c4aMNwECitb4TBtYXmIkGXoeTf/096SfjDj7Ok3S0sDEV43j1TE8JM0FD2SNkRF/Dgkk
 ctmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nd2jYCr+
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.7.2
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2024-1544, CVE-2024-5288, CVE-2024-5991 and CVE-2024-5814
- Disable option checking which is enabled by default since
  https://github.com/wolfSSL/wolfssl/commit/412447ac416ce76ba2a9bebbea8917258ed4c81e

https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.2-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index e705bba9fd..9a1e8bfd4a 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2de93e8af588ee856fe67a6d7fce23fc1b226b74d710b0e3946bc8061f6aa18f  wolfssl-5.7.0.tar.gz
+sha256  0f2ed82e345b833242705bbc4b08a2a2037a33f7bf9c610efae6464f6b10e305  wolfssl-5.7.2.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 893408eca4..91ab7ca08a 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.7.0
+WOLFSSL_VERSION = 5.7.2
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
@@ -16,7 +16,10 @@ WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
 WOLFSSL_AUTORECONF = YES
 WOLFSSL_DEPENDENCIES = host-pkgconf
 
-WOLFSSL_CONF_OPTS = --disable-examples --disable-crypttests
+WOLFSSL_CONF_OPTS = \
+	--disable-examples \
+	--disable-crypttests \
+	--disable-option-checking
 
 ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 WOLFSSL_CONF_OPTS += --enable-all
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

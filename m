Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217E4C3600E
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 08:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A89C1606A8;
	Wed, 26 Mar 2025 08:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xulB5JTwEkyn; Wed, 26 Mar 2025 08:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFBFD60A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBFD60A70;
	Wed, 26 Mar 2025 08:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93CE01B8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85715840C8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkA7EMBlA7kX for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 08:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4365284113
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4365284113
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4365284113
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:18:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so162910866b.3
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 01:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742977099; x=1743581899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3qTDGpwCeJV3s7hda7A2oHP6x6NvKyf/1DZ0tgNRNY=;
 b=ICGoO+iVKAX8y0rBPTZwyOl2bMwXUE3MjdtAxz2RQe4AJ/e0ZpCt+4GngRjG0CC4YM
 XM5isMU6CeQO/EBkF7peqBsWhIqz7XgcTH7goGq96b4iLKnBtH3b8xM6VpJ91rOgsV5Y
 07UCdv5Mun0CxdlSyKHUgklORqjTgQQyljQrfiGhmX9p9BX3q422jnNCuJUaIf1KDi1u
 d8hHor8iqHMf4TBiAX3sdaBrG3Z7/RbwbkEzNx0NA/Mppuz5GozSyrCxci7+616h8648
 5tWLQ2ZkexBtvu1hq2v0xM0CV4tq6EIJk5bNJUbp2PeE9lz57O2urNIhQlFlt6hphLBv
 eMkQ==
X-Gm-Message-State: AOJu0YyeG7bzRD8Y7d1WyM5+Q/IUCa3C8ldZxqFiBxtCLXz7LisuE6Xs
 eSr2XxH+Afos7qv3mFny6od7VULOsLSbULhfZTwX+lQdHwy2++uwASzu+A==
X-Gm-Gg: ASbGnctsq1vkSduEtL7CXBKMlrhKZvtPTrNeLbNHfSD1/GbBupqZKNGztUu2VywZLU7
 Lidhs4RcPDLKBVwa158hN9dkpDVD3O0zLMUWck9ufCH3CM7bGG60f9maWOcCXXZzWgUSFRcKGt3
 P0oTT4G5p3TktWjM6IdN2UxmVjdLRcI/X98YVX+yQKtI+/COotO8j61vVcTBpkFzUAyxI+XgKMg
 rRcypcGKTAPDJojOsnSuL+DgvpNGL82QJUx9oOz4qfbxADE5qIQgT3ft0/z9LxfqFlxa1k+nd2E
 dgSmqokt3LeOxcekHigDTDvdkipsBkUw2lLSgFEoe21bfTjKTOCFRcVWq0GmLHRYVlknVPXiRiC
 Gp0txOiiMfH0UiidvF7kgYVOMYQ==
X-Google-Smtp-Source: AGHT+IH7I9prS6NBOaPuMJrEqYdSkEM/O76mEaCHMsov3g0uUpaM5GQvWhZj5ZSaoJ2FeVzQ8tuHCw==
X-Received: by 2002:a17:907:3e8b:b0:abf:fb7b:8d09 with SMTP id
 a640c23a62f3a-ac3f2539839mr1957657166b.51.1742977099219; 
 Wed, 26 Mar 2025 01:18:19 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef86e46bsm996098066b.13.2025.03.26.01.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 01:18:18 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Wed, 26 Mar 2025 09:18:14 +0100
Message-Id: <20250326081814.3477045-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1742977099; x=1743581899; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x3qTDGpwCeJV3s7hda7A2oHP6x6NvKyf/1DZ0tgNRNY=;
 b=Q8fOgQpM6sRFLTG974ibGeOXJ0aXSNsQvD0ee9BHe2z7rHLXhujmRLR7emlVAZ//rp
 P9qd5snOi0S0GPlRBNxPrQh6geYOKeVlUAXDFt58dT3aSBWt+0lG6/C5YJ84FXpKX7YW
 7Ubk5MNWhf8m8T2R7d4O5ZpvTrcyA75EcgFtPEI2nFHvvgM+cJ9PNG6+GtglRan+Kptd
 C3jd5MTDdsNoUf3lIfvOxHA5+wuT2QLp/mqGaYscoBo7ovCsNs1iAEAnelexPURc0VdP
 C4sQ6GNRoRj4wCFPnLseMQkpA+tZ3IPeV6OoFyo+uQZc/JcdnuElM08a4fy/USBIH9Kd
 7Rwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q8fOgQpM
Subject: [Buildroot] [PATCH] package/httping: bump to version
 a1c5fdcf289cf7d1d8245579150bcf670f90d248
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Enable gettext support.

Make all options configurable.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/httping/httping.hash |  2 +-
 package/httping/httping.mk   | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/httping/httping.hash b/package/httping/httping.hash
index a55febb15f..cfdd7670b3 100644
--- a/package/httping/httping.hash
+++ b/package/httping/httping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  22c794df06a1c680e923891a445a3745fc88e01b24854af1be8457a37be19fe6  httping-ffb9201042813c58d020df41697f6445df96f438-git4.tar.gz
+sha256  07b6b36e88506810ef19eb987a7ca477a88fb15fa6beccc509ed8f4a06bd64c1  httping-a1c5fdcf289cf7d1d8245579150bcf670f90d248-git4.tar.gz
 sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 3759f9fb76..8ba124f673 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,19 +4,31 @@
 #
 ################################################################################
 
-HTTPING_VERSION = ffb9201042813c58d020df41697f6445df96f438
+HTTPING_VERSION = a1c5fdcf289cf7d1d8245579150bcf670f90d248
 HTTPING_SITE = https://github.com/folkertvanheusden/HTTPing
 HTTPING_SITE_METHOD = git
 HTTPING_LICENSE = AGPL-3.0
 HTTPING_LICENSE_FILES = LICENSE
+HTTPING_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_HTTPING_TUI),y)
 HTTPING_DEPENDENCIES += ncurses fftw-double
-HTTPING_CONF_OPTS += -DUSE_TUI=1
+HTTPING_CONF_OPTS += -DUSE_TUI=ON -DUSE_FFTW3=ON
+else
+HTTPING_CONF_OPTS += -DUSE_TUI=OFF -DUSE_FFTW3=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_HTTPING_SSL),y)
 HTTPING_DEPENDENCIES += openssl
+HTTPING_CONF_OPTS += -DUSE_SSL=ON
+else
+HTTPING_CONF_OPTS += -DUSE_SSL=OFF
+endif
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+HTTPING_CONF_OPTS += -DUSE_GETTEXT=ON
+else
+HTTPING_CONF_OPTS += -DUSE_GETTEXT=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

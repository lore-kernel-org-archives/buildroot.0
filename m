Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DB1C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38FE418CA;
	Wed,  3 Jul 2024 14:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZGdILe5rjp3; Wed,  3 Jul 2024 14:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1703341881
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1703341881;
	Wed,  3 Jul 2024 14:01:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42ACE1BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FEEE60BF0
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFDx26hZiFbh for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 14:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10B516077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B516077D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10B516077D
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 14:01:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7245453319so115749266b.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 07:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015273; x=1720620073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VNo6v3l3IVh5tbrG1GhFcJBxBpIkDdwzrK+PbI0Oew=;
 b=fYO8ol3NAchboefraJDeIJww8ZVAb/rwkfzQqxR47qJz2RSHZ+zRcF7itklQU5s+sW
 66vjaE4jgIDuBju8wzQN6X/POx6njhwUsjjK/y84GctsOShOmXSKrhWOqUMkDmd6pP7n
 lh1ekGxTQFRTdBqKjEB477QrOnnOUBrwzRGQCesEuNAWFHjUroxsYuC5smQ/Q5nALDes
 uZN/cYwtXzSdJCq21vOgZsPTDTVFlRg69geMf1IsdiSfwejfDPXhSf2NqN9h5aWdHItJ
 cnaWWZ308Q9CQjs4UKtR95pVk1gNeK9v4EMoX1lmMWA06lXtORTk78fiNBHjJoKw2bWX
 u9Uw==
X-Gm-Message-State: AOJu0YxMo0DRWeBwxPc9lfCSNdN4Bvg4toiRTvjWLkHSFso3bdcokB4m
 sR8fPvCGu/MP+GI4Z95tJQt5MkOueyaByqGJcO6d3d5JocYeoka7vXfvYQ==
X-Google-Smtp-Source: AGHT+IH4JfiZyp9ohrkXKcix8BtDqxwAqNgGG5U3ueY8JnMbUN40GvZmCTI5kTk+sfdPC56DY7JpeA==
X-Received: by 2002:a17:906:230f:b0:a6f:6df5:a264 with SMTP id
 a640c23a62f3a-a77a2411d9dmr141085066b.1.1720015272777; 
 Wed, 03 Jul 2024 07:01:12 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a752008272esm314671766b.175.2024.07.03.07.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:01:11 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Wed,  3 Jul 2024 16:00:55 +0200
Message-Id: <20240703140054.3224869-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703140054.3224869-1-heiko.thiery@gmail.com>
References: <20240703140054.3224869-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720015273; x=1720620073; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2VNo6v3l3IVh5tbrG1GhFcJBxBpIkDdwzrK+PbI0Oew=;
 b=Qa8DoWph53AjlIBj1CmYU692rMUPDYiCdAmkwX7mpiXg0TIp/61XHjWT94uEfSwVZL
 vyFDTnI+78H+UmXwTSY7J53uYwdthevBUu0XEmr/7TNtgJqia+paGc6bRcRyqjn70UB+
 ZyVkOnkI0ZLQD/RgglT/T72z219ctRnF+sJCrJ23fZ80EaulzNb1cEN6wXPSTO821lQy
 o+w3alSed+dohvMbQ5Rbz4Nbe4cVpNwGbnUErRSuLj1qURkDlD8eGuUVJ7yFzEYUT1Pj
 2yVV5+WDfn6u5noIocdXUKkYZWfzXxkT9GaYSexMeeJlVTrGm61D3vgh+QIDmXIO1Ueq
 KJow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qa8DoWph
Subject: [Buildroot] [PATCH 3/3] package/ccache: bump version to 4.10.1
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version requires additional dependencies to host-blake3 and host-xxhash.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/ccache/ccache.hash |  2 +-
 package/ccache/ccache.mk   | 16 ++++++++--------
 package/pkg-generic.mk     |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index a2537077b6..ec43a47d1b 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  4c03bc840699127d16c3f0e6112e3f40ce6a230d5873daa78c60a59c7ef59d25  ccache-4.9.1.tar.xz
+sha256  3a43442ce3916ea48bb6ccf6f850891cbff01d1feddff7cd4bbd49c5cf1188f6  ccache-4.10.1.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 0b2c02e8a7..e3e9110348 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.9.1
+CCACHE_VERSION = 4.10.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
-HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd
+HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd host-xxhash host-blake3
 
 # We are ccache, so we can't use ccache
 HOST_CCACHE_CONF_OPTS += \
@@ -32,12 +32,12 @@ HOST_CCACHE_CONF_OPTS += \
 HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
 
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/Config.cpp
-	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
-	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
-	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
-	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/Config.cpp
-	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/Config.cpp
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/Config.cpp
+	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
+	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
+	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
+	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
+	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a2749320c3..7249a9a233 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -793,7 +793,7 @@ $(2)_EXTRACT_DEPENDENCIES += \
 endif
 
 ifeq ($$(BR2_CCACHE),y)
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd,$(1)),)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd host-xxhash host-blake3,$(1)),)
 $(2)_DEPENDENCIES += host-ccache
 endif
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

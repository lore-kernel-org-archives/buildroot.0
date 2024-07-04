Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B77C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 06:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02697405DD;
	Thu,  4 Jul 2024 06:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgCrhtX3uQYR; Thu,  4 Jul 2024 06:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6E441BE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF6E441BE4;
	Thu,  4 Jul 2024 06:43:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5901BF391
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 175894065C
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEwSnwrKlEF2 for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 06:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97A1E40654
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A1E40654
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97A1E40654
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 06:43:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab63so375021a12.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 23:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720075424; x=1720680224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lnCJZqvKUjO586BF6qChYdUjIf9ac5SVMjImgXi5ghs=;
 b=KW2FKLyDyJFDkmY9tMVMq44Hb1sXJ5oO/XYgEkQhk9H944xQngBzV2G8rxp3wu57yY
 POWBYdubdZftrHqbZmE8S5WrdOqen0G1sGUgBY2CfVppoBNcWoYgy/Zv/t8z/Oug/vIb
 YRvNlKEWoOPOuiQc1uRHRg22CBJQJGx+GK6DO7JZXzQi9bNIq4Yywn/bLvqD07cUCkdG
 nQrFzMZiKiZksYEQYvXxGWRDAfq12bU/Faee+UpmRoTfcdSJlHZ4pc/SfkUQRLs4749G
 NV2V/6xk3/DUXIJQwlA53d3/0aH2FBgBuFrGS+bBCebmCBrgpEv1UqIRK/UVPX7WdOcv
 5HNg==
X-Gm-Message-State: AOJu0Yw+XrhkTxFZNP9y4FNo1CC5wwb/LabXIiR5ME6RnutCyyp1fxZz
 sAc9MR+X0AnReSi+6jXn0Mo8cXWZqSm1cHlrYqfyFsQf4GsE0myPxUzGjQ==
X-Google-Smtp-Source: AGHT+IG5DzSwbYLqtoKcD3KEccfQu0wYA1r35Vmrcl0LnSJdW7EWiGW+32XvxnmKqbqttIH9vMVbVA==
X-Received: by 2002:a05:6402:5255:b0:58c:7c2f:5c0b with SMTP id
 4fb4d7f45d1cf-58e5b4ae20dmr418713a12.25.1720075423654; 
 Wed, 03 Jul 2024 23:43:43 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324dfaasm8252620a12.32.2024.07.03.23.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 23:43:42 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Thu,  4 Jul 2024 08:43:24 +0200
Message-Id: <20240704064322.3242095-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704064322.3242095-1-heiko.thiery@gmail.com>
References: <20240704064322.3242095-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720075424; x=1720680224; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnCJZqvKUjO586BF6qChYdUjIf9ac5SVMjImgXi5ghs=;
 b=CPDPzQvH12dGv2aH45TwE/QIYIol/iJy6UhuKfrY4ttXzEslK708k3QJD4Nbi1j+1c
 xxtlNI35NqhVcvKTkPd0ok/AQJfiTbRIyeep5yOmWk6FjAcQzXmUbDoxo8CciaPmezXs
 Yfxh++HTjPP35BMT8Mdz1ugbfX22XC/anMTmqJwH/uC1lemNAA76SWm7H31brklqMfbE
 uhJMlJziSVcwdFUv8UfXQcNFKgPF8rZwPGCca10Ctp58IwETdVwPcXJO9EOtdNR5RE1a
 aP1UKbU1kTZiHElrMKNqxxLyyBZ5bJn0ZqsoZlXLruyR4n20clP1lD9DBDJUDwx7VbxP
 bOgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CPDPzQvH
Subject: [Buildroot] [PATCH v2 3/3] package/ccache: bump version to 4.10.1
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

https://ccache.dev/releasenotes.html#_ccache_4_10_1

This version requires use the system dependencies of host-blake3 and
host-xxhash. The bundled version is not able to build/download.

The ZSTD_FROM_INTERNET and HIREDIS_FROM_INTERNET variables are replaced
in the ccache build system with DEP_ZSTD and DEP_HIREDIS in version 4.10.
For the sake of completeness, all DEP_<xxx> variables were set for external
dependencies.

The generation of documentation has also been switched off.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2:
    - replaced ZSTD_FROM_INTERNET and HIREDIS_FROM_INTERNET config
      options with DEP_ZSTD and DEP_HIREDIS
    - added and set all DEP_ config variables
    - disabled documentation build


 package/ccache/ccache.hash |  2 +-
 package/ccache/ccache.mk   | 27 +++++++++++++++++----------
 package/pkg-generic.mk     |  2 +-
 3 files changed, 19 insertions(+), 12 deletions(-)

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
index 0b2c02e8a7..d92608512c 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,20 +4,27 @@
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
 	-UCMAKE_C_COMPILER_LAUNCHER \
 	-UCMAKE_CXX_COMPILER_LAUNCHER \
 	-DCCACHE_DEV_MODE=OFF \
-	-DZSTD_FROM_INTERNET=OFF \
-	-DHIREDIS_FROM_INTERNET=OFF \
+	-DDEP_BLAKE3=SYSTEM \
+	-DDEP_FMT=BUNDLED \
+	-DDEP_CPPHTTPLIB=BUNDLED \
+	-DDEP_HIREDIS=SYSTEM \
+	-DDEP_NONSTDSPAN=BUNDLED \
+	-DDEP_TLEXPECTED=BUNDLED \
+	-DDEP_XXHASH=SYSTEM \
+	-DDEP_ZSTD=SYSTEM \
+	-DENABLE_DOCUMENTATION=OFF \
 	-DENABLE_TESTING=OFF
 
 # Patch host-ccache as follows:
@@ -32,12 +39,12 @@ HOST_CCACHE_CONF_OPTS += \
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

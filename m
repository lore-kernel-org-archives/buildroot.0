Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262FDC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6CE281098;
	Sat, 13 Jul 2024 12:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bwlc5aQwxEJY; Sat, 13 Jul 2024 12:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA2981FBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA2981FBE;
	Sat, 13 Jul 2024 12:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C33CD1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD2B44093B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0boxxRNytRC for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C8DB40939
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C8DB40939
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C8DB40939
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:24:17 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-59a47d5c22aso1813763a12.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720873454; x=1721478254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNL4rM2Wv6Qt7/Js/SLDAQk+bNv5mrGhfSkP17HOWDM=;
 b=D3vJcO6rLxdVsv6SUpoyPEIC/kpK8kQBC68IWod9Dy09x9H8Sh19Vy+CY5MzKAalQw
 ES/Ow5igXuYLKOgc/susBBXeZSdKf5k37MAT1crK+yovJ/a5/RBMrFvbk0tv8FqSCpFJ
 p+CJx1GuZA3LJHD8dCiADXE6cmYqO7LcfBje2HoTt1eJIV8fNKgUq6lY3VzZhsajU7IN
 HeC/jF+BHTEr0lkBgx455y+vKGNvLXQlr1h5WO58D9Wyq+j4MBHrZl0AsAIlvMgdsQN0
 ut0EG6pf6GZIdL4PJLNLdsdvPsn3buiplQLh2GdXqL3L3To8Uzlgtd4BZa+dC71pQH8o
 KntQ==
X-Gm-Message-State: AOJu0Yyc3KXGE1PoReYVJtD7Q9q40W7eHXaLF0nFEOKC2TrkL7thnwni
 xWFG+UyYrY949kuwwwLs3OjTVosK4k/CmxNLb5jdVQ7eiZZWCz74f3lYhg==
X-Google-Smtp-Source: AGHT+IHQLRjmSNEHWWl1XgxwBve23YXX0e0CqjmsueQj1kAC5gYtbhMgHU65uc06xID5uowxv6insw==
X-Received: by 2002:a05:6402:520d:b0:58e:e2a:1b4b with SMTP id
 4fb4d7f45d1cf-594ba98f273mr9690878a12.7.1720873454421; 
 Sat, 13 Jul 2024 05:24:14 -0700 (PDT)
Received: from hthiery.fritz.box (ip5f5ba0e6.dynamic.kabel-deutschland.de.
 [95.91.160.230]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26f621b8sm700586a12.85.2024.07.13.05.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 05:24:13 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org,
	Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2024 14:23:34 +0200
Message-Id: <20240713122331.298786-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240713122331.298786-1-heiko.thiery@gmail.com>
References: <20240713122331.298786-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720873454; x=1721478254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNL4rM2Wv6Qt7/Js/SLDAQk+bNv5mrGhfSkP17HOWDM=;
 b=abum194WC0oehhkSTypyLUbc5gieaFKMD9+hHdclVbnAz2+pCu1F60y8ZUfyQ1O92f
 VRQVf5QMby04Y00KxTOFFHWVDfJ/XaCfbM0K50qKUp4YzGlQvU4rzzza1Lv7aQNZ0z+/
 XW6N21PBD4stdVKPiZgnzRYDGzWRB54AbrJw4xcoR7gadby19SZKcIyIgq7lRXFMB4LX
 AUSRjyRFcelJv5kQ/+05WpB/dkc64q2yb+xi/25wiaWYupfHYsNQz00M7DzdoT62DblK
 r+efXRQ2T4tBMIP9ZydWYwUGO9W/WyPgH+oc2fSrazgtiXQasEVxUJJmmDGc36hZ4QDu
 9QMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=abum194W
Subject: [Buildroot] [PATCH v4 3/4] package/ccache: bump version to 4.10.1
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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

The LICENSE.adoc was updated regarding the bundled libraries version used
like cpp-httplib, BLAKE3, fmt, nonstd-span, cxxurl.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v4:
    - add note for change reason in LICENCE.adoc

 package/ccache/ccache.hash |  4 ++--
 package/ccache/ccache.mk   | 27 +++++++++++++++++----------
 package/pkg-generic.mk     |  2 +-
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index a2537077b6..744e167489 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  4c03bc840699127d16c3f0e6112e3f40ce6a230d5873daa78c60a59c7ef59d25  ccache-4.9.1.tar.xz
+sha256  3a43442ce3916ea48bb6ccf6f850891cbff01d1feddff7cd4bbd49c5cf1188f6  ccache-4.10.1.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE.adoc
+sha256  de4684f5251a0a2c58f3a7ab94d6a8d3443822cbd01abcdadd9250d3d1e0bfe1  LICENSE.adoc
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
index e1c16b7343..eeb7531dbb 100644
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

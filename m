Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A0EC5479D
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 01:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8D860E6D;
	Sat,  7 Jan 2023 01:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F8D860E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxWZ53mtb2bs; Sat,  7 Jan 2023 01:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC7C60E0D;
	Sat,  7 Jan 2023 01:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC7C60E0D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C95E31BF59B
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 01:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B246D4026A
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 01:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B246D4026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3Z-oWxH2uZQ for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 01:04:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E8240022
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0E8240022
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 01:04:47 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id bp26so1917839ilb.3
 for <buildroot@buildroot.org>; Fri, 06 Jan 2023 17:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q2uADHsFDTrL406LBFtHkBuioJY01BgegkKl7x0thgw=;
 b=Ptsefw64GEalpt2NZyapbCxW8gNj3AuDg9TgWp4AIJuMgvtGqvDJZ0JMyzgWfFFjWs
 8tos2mmwTJVIWguAIOHRMgZnvzm2Dxx93RXwi2gjOXNZ5b23upcEDpcK8K7b6k2nsp7g
 SUJrP5KQqyXXPJKl621IwO69BKOoNfahdBCc10zSRRRCc90g6pvj5PR5lgQPbvnOk0y2
 UgWrYhK30b4eyLpQDC79mDNo3hSYltVDrgHGkZKJS6hSr2yEZ0nGyYzlzeJZ1lyfl5Vz
 AL1QpJ24HdBBQ9yr5s7SWWIRWD3GZARDyq3V4jO5Dx9wx5s9n1z8crqRWABqUJxaL5aG
 8dWQ==
X-Gm-Message-State: AFqh2kpeB04XiYiuFNzu9PlhsX6dFpbpNZ7wo6kacl6Qana6BpOZAE4P
 W+d708NBXp7XrhNKvZW+yKnqM6mDwap2wA==
X-Google-Smtp-Source: AMrXdXtCWF6wSFD+Ic3/uphiRpzKSjGhTKXPwxmb38sAos+sGyKN5RUixt9sgIGhXfolQhX8NPBNVw==
X-Received: by 2002:a92:1e04:0:b0:30d:1415:aee8 with SMTP id
 e4-20020a921e04000000b0030d1415aee8mr9593154ile.6.1673053486572; 
 Fri, 06 Jan 2023 17:04:46 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e26-20020a0566380cda00b00363c4307bb2sm725938jak.79.2023.01.06.17.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 17:04:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 18:04:37 -0700
Message-Id: <20230107010437.2471513-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107010437.2471513-1-james.hilliard1@gmail.com>
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q2uADHsFDTrL406LBFtHkBuioJY01BgegkKl7x0thgw=;
 b=Pqz5gHcmNWdNutFVfXk1XRALJoObnHyA4VgHjnPF1XddnQQj7s3752ISzaBYmE1/ba
 ZXoZY9DJZzanb3/QqCt5gyxty+JuFlJp1Fgqj9AIDwGnbx/RS3kmbSVkqmDMlKvP/l/v
 GSJFphUmksuTaql1Ho1JEJ7htAIAyxch+7BeD9c/xUVgeQzw6if9qBinX3GCq6wtQ0hi
 JhahVx5dPCTneY7675RH7aQdA70gV5iotqbJ1etuEC1XT/2zKpsT6NtIyQlmh6PwQ9f4
 /5YwVoXsFqVKsdgJtfPznEhGXxDJLbgRNCD5HTT1hzHUogqyB+uYaUbxZOXZwfh6WDZ6
 Xc/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Pqz5gHcm
Subject: [Buildroot] [PATCH 4/4] package/ccache: bump to version 4.7.4
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to cmake package infrastructure.

Add new host-hiredis host-zstd dependencies.

Add new ccache dependency exclusions to pkg-generic.

Migrate HOST_CCACHE_PATCH_CONFIGURATION to handle updated
source files/format.

License hashes changed due to migrating urls to https:
https://github.com/ccache/ccache/commit/a0f32f161f1b8b9c5d287ca8abe88e3fd1e940a2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ccache/ccache.hash |  6 +++---
 package/ccache/ccache.mk   | 30 +++++++++++-------------------
 package/pkg-generic.mk     |  2 +-
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 16cfad602c..9b11f026ec 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  a02f4e8360dc6618bc494ca35b0ae21cea080f804a4898eab1ad3fcd108eb400  ccache-3.7.12.tar.xz
-sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
-sha256  4f63223bcdee822d55a6768cc8399ffe06401d7a03cfe79e1dc305f50dc22c59  LICENSE.adoc
+sha256  df0c64d15d3efaf0b4f6837dd6b1467e40eeaaa807db25ce79c3a08a46a84e36  ccache-4.7.4.tar.xz
+sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
+sha256  56cf64f68b7b8150300acd79899941615523ea5c56c120e92f5b175b7cc78e3c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 97aa8b1c75..0c208cb9e6 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,27 +4,19 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.7.12
+CCACHE_VERSION = 4.7.4
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
-
-# Force ccache to use its internal zlib. The problem is that without
-# this, ccache would link against the zlib of the build system, but we
-# might build and install a different version of zlib in $(O)/host
-# afterwards, which ccache will pick up. This might break if there is
-# a version mismatch. A solution would be to add host-zlib has a
-# dependency of ccache, but it would require tuning the zlib .mk file
-# to use HOSTCC_NOCCACHE as the compiler. Instead, we take the easy
-# path: tell ccache to use its internal copy of zlib, so that ccache
-# has zero dependency besides the C library.
-HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
+HOST_CCACHE_DEPENDENCIES = host-hiredis host-zstd
 
 # We are ccache, so we can't use ccache
-HOST_CCACHE_CONF_ENV = \
-	CC="$(HOSTCC_NOCCACHE)" \
-	CXX="$(HOSTCXX_NOCCACHE)"
+HOST_CCACHE_CONF_OPTS += \
+	-DCMAKE_C_COMPILER_LAUNCHER="" \
+	-DCMAKE_CXX_COMPILER_LAUNCHER="" \
+	-DZSTD_FROM_INTERNET=OFF \
+	-DHIREDIS_FROM_INTERNET=OFF
 
 # Patch host-ccache as follows:
 #  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
@@ -35,11 +27,11 @@ HOST_CCACHE_CONF_ENV = \
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
 #    CCache replaces "%s" with the home directory of the current user,
 #    So rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
-HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))
+HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
 
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache.c
-	sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/conf.c
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/Config.cpp
+	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
@@ -62,7 +54,7 @@ endef
 HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAL_SETUP
 endif
 
-$(eval $(host-autotools-package))
+$(eval $(host-cmake-package))
 
 ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f24e03a325..0863444221 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -792,7 +792,7 @@ $(2)_EXTRACT_DEPENDENCIES += \
 endif
 
 ifeq ($$(BR2_CCACHE),y)
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd,$(1)),)
 $(2)_DEPENDENCIES += host-ccache
 endif
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

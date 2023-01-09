Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A723C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 00:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876E7817A5;
	Mon,  9 Jan 2023 00:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876E7817A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sd3tThwyEfF; Mon,  9 Jan 2023 00:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF921817C0;
	Mon,  9 Jan 2023 00:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF921817C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E46561BF424
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C034040167
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C034040167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YcbiBykWuQf for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 00:06:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94DFC400BF
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94DFC400BF
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 00:06:11 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id q190so3804586iod.10
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 16:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=681YllWGlrI1mywUthBkbEd4p2gdb9QioALdp+mlYJ8=;
 b=U0JkV728m5DMv84xFCrpmMLaEQG2w88WNb7x6zpv6MrdAasijutycTc5Au/gLvS6BL
 Ay0Oba/VL0AYb66All1YcbeUqYYn1u2OYwjkmFKq8iuMBiyElF5UzNsFY9yRBQwYPhEK
 h9dZzBukmex2WGsyu6TpN4agREAEUsq0UqG5Bzr/sSpwpSxQS8iMeizdFK2eF9V2OuOq
 2C7oWzoatTMRPWPyyRgiUw/rv27pmgdDE2dJkDmzwcqQmQVULtBZJZzuWUxIplRaZ+C3
 jCHJfTqiaRZ/eoaaBDHZKw9Ca7KvoSBuEZhqYBLEntjWsWUd4r/P5I/qf2L9beNTygbz
 /ydg==
X-Gm-Message-State: AFqh2krxR4lcxAeUl2e1WtbD/epR+eGzgZ+QObYhdiPrOrgNuLDj+3Yg
 g/BD0OHBXh/EJkVnyz4e+jDB2eVzW+cCiA==
X-Google-Smtp-Source: AMrXdXvEaCDuaVeG3AZ3/eSdLbs4gcRV+EL81lgPhAjdVzSEY4AAQN5oKMxWWOv2BfYDRwZJJraNQA==
X-Received: by 2002:a6b:e812:0:b0:6e3:a39:a0c2 with SMTP id
 f18-20020a6be812000000b006e30a39a0c2mr52587149ioh.20.1673222770390; 
 Sun, 08 Jan 2023 16:06:10 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e10-20020a026d4a000000b0038ac4923addsm2321108jaf.53.2023.01.08.16.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:06:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 17:06:06 -0700
Message-Id: <20230109000606.624986-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109000606.624986-1-james.hilliard1@gmail.com>
References: <20230109000606.624986-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=681YllWGlrI1mywUthBkbEd4p2gdb9QioALdp+mlYJ8=;
 b=IIt26sD/ei/z0DjNT1mlMs3yIxCDBXWMdobJRxdQvHcfO6R5UB4dXwhHxE6xmi7Br5
 7s2mC0g4/tS2psrybt+GrhYm4k66ihmTaF31MJcwtUgR5ZpOD/u7U1YV9HowdzXphR5k
 QWNGOhOnN5waFSErKfLv/LXr48n9+F/7jUS5LvQhBvicqsz8JPrmxktg+ewAomVGPg6C
 aL5TmA6VfW/1ElGpWlPWEcrNr7Yma4iKUFHREWE/M77uBqXR5sNRWKUQrLx9jWjAwwdP
 V/Lsv/4ob0KnmQnChVX/70LlqOuIEviUVy3wsB5w7o5bxtz4V/tfieo+eTTFV1GlP6LN
 WTvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IIt26sD/
Subject: [Buildroot] [PATCH v2 2/2] package/ccache: bump to version 4.7.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
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
Changes v1 -> v2:
  - add some additional ccache path overrides
---
 package/ccache/ccache.hash |  6 +++---
 package/ccache/ccache.mk   | 38 +++++++++++++++++---------------------
 package/pkg-generic.mk     |  2 +-
 3 files changed, 21 insertions(+), 25 deletions(-)

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
index 97aa8b1c75..d897d44803 100644
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
@@ -33,13 +25,17 @@ HOST_CCACHE_CONF_ENV = \
 #    BR2_CCACHE_DIR.
 #  - Change hard-coded last-ditch default to match path in .config, to avoid
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
-#    CCache replaces "%s" with the home directory of the current user,
-#    So rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
-HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))
+#    CCache replaces "home_dir" with the home directory of the current user,
+#    so rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
+HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
 
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache.c
-	sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/conf.c
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/Config.cpp
+	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
+	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
+	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/Config.cpp
+	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/Config.cpp
+	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/Config.cpp
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
@@ -62,7 +58,7 @@ endef
 HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAL_SETUP
 endif
 
-$(eval $(host-autotools-package))
+$(eval $(host-cmake-package))
 
 ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f2bea01d7d..0863444221 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -792,7 +792,7 @@ $(2)_EXTRACT_DEPENDENCIES += \
 endif
 
 ifeq ($$(BR2_CCACHE),y)
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-hiredis host-pkgconf host-zstd,$(1)),)
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

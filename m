Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA20C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 00:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E85548183D;
	Mon,  9 Jan 2023 00:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E85548183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EL4OWahD_jXP; Mon,  9 Jan 2023 00:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205FD8184F;
	Mon,  9 Jan 2023 00:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 205FD8184F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B01191BF865
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BA3A60A66
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BA3A60A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0E_Jq5KWHQr for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 00:10:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6322B606DC
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6322B606DC
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 00:10:41 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id p66so3869920iof.1
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 16:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4l0djRiuus6qpVjgcUUTchGZjaVVoOETGbLQUOJc3M=;
 b=SJ5nsrzkdwLR9s1nvfin713DSFYy+Z8taLXkXy01XgJ5iVfIMZBq6gfHVi4X+EgDRw
 x4hNgy12NnDdFre58Q0gIP2EON7IJflL88U+1UNuEak5gx5/zJkcAAZjY6CF+su8Z8Sz
 Cdp9A/UJvO+bIUzrxEE/pFZRKq+tSF85wmYyxqOShtcw9xH80yvfmqx/Xfd0KUAnw1Pu
 kjWrPLb2NJIfDf6acnxlFLvGgFi22kNvxZW0szT7StrmAIF7+B67fwhGoebN64uTK4bG
 g59rR2kN3JWyr363JfjkqkYTk6YnZyQnR/8CLvG0IxIA76/u6ozg2INJT1Q84SX4Gh1l
 l63A==
X-Gm-Message-State: AFqh2kr7OOLz5oD8j+TV2xi3c0dVnOQbEPbU2MTkt9PcQF7h7cAzIpN0
 59RtFPi5+kRpYCHff/yWj3Mj244QauTkFA==
X-Google-Smtp-Source: AMrXdXuuYWZJennuX/OFcN2mILqmf3koTFCnSxRDBkaOxab2fTrgrVUEGoB8+HIgCbv5LPpzSevIKw==
X-Received: by 2002:a6b:5a15:0:b0:6df:7841:4cf with SMTP id
 o21-20020a6b5a15000000b006df784104cfmr52971164iob.6.1673223040217; 
 Sun, 08 Jan 2023 16:10:40 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 d2-20020a0566022be200b006e00ddb4517sm2727579ioy.48.2023.01.08.16.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:10:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 17:10:37 -0700
Message-Id: <20230109001037.641422-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109001037.641422-1-james.hilliard1@gmail.com>
References: <20230109001037.641422-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4l0djRiuus6qpVjgcUUTchGZjaVVoOETGbLQUOJc3M=;
 b=YwscGt3j4LNLPS6hfQLulyIH/Gk/XCopQGuRpuZ6SKLQ81sdT9e4D9DXLoqBrmMZIC
 2F3V7ztsi7OpsE0oZQVMkz+IBzt/JgnOX2F+dkUT+blmLQLJM+L9pOPbr/yMcUk0WUQn
 MhFToceyVxJG/NI9jSMxZ/joA06CiyHYKT3tnYj8FPAhC51mCOmyAJPBSNQITARpnQzf
 GKCPw+/MjIb40iEyLWYYuRTPDyVxPwBk+h6yWBrySrHH1EhFkKDCW4eIWBgGJlC6Pi2D
 nEGnWxwm/jRbxWib8UrfcTU06dJ/UfBjKeMl8aqs0v7wh2J0479Y4OSFz+J1B2sVSNvg
 pUPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YwscGt3j
Subject: [Buildroot] [PATCH v3 2/2] package/ccache: bump to version 4.7.4
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
Changes v2 -> v3:
  - use UCMAKE_C_COMPILER_LAUNCHER/UCMAKE_CXX_COMPILER_LAUNCHER to disable ccache
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
index 97aa8b1c75..6b7d57b40c 100644
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
+	-UCMAKE_C_COMPILER_LAUNCHER \
+	-UCMAKE_CXX_COMPILER_LAUNCHER \
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

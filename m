Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDA3F513F1
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 15:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D90E608C7;
	Sat,  7 Mar 2026 15:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uld-zv8qNa51; Sat,  7 Mar 2026 15:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E9B4608DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772897993;
	bh=zXAYRKXnfQQ3rq9rh2LuTD0CGT75Kmx6BYCB8IcNtDs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=DTnf4oiiSAFxR+GedAFFyXtwDM1iW/xvv2Jk0Du2yigZfmzDnDfW9UruFUjECmRAw
	 lnfmabwtGStGwzSavEgXVP/h2FGjbK6cSPhVNRGopm+VFWEuC6nf/em41CVDyQkbsl
	 rIYlJLX5d98HUve4j6gy9mVi0uEB4+aPeM6gtMqXIdH5tflEvLwso5E1e+/gI+Kw85
	 T2BKOPomqnhkyjhyjNDiZX4gqiahKvHSmgo7kOMVEjWm0nV444Mf+vTMc9RBMZg9Nn
	 LU7jlvtiy6bzfAtcf+8d3U4ISWhfnjNl81bXWC33sxauFkkHb83CwgrQAn08LBqHQn
	 R6oitCLX2JPww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E9B4608DA;
	Sat,  7 Mar 2026 15:39:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 111CD169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02B4784179
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 421JM1spr4wd for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 15:39:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B67378417B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B67378417B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B67378417B
 for <buildroot@busybox.net>; Sat,  7 Mar 2026 15:39:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso6297566f8f.1
 for <buildroot@busybox.net>; Sat, 07 Mar 2026 07:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772897988; x=1773502788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5uIbhYPrY/8KtoVIQuaAkcWKBKWXjf1yHTLGIAtj3GU=;
 b=u/nl2z+/llaXfxBC2GSj1fqkd0XVMMDK9+Nk2X7yV7OOYfXqeiSpZ4lqMkkeGYy5w4
 8YaBRF+KBbAOKlYnti00cnwyIOpNWAuTSnV1h0ZankGJqcKzXlAVlgjNT/PxVf8jQr9b
 +L1JgeiMaejXjUyUtUS6b6QS+0cjWYX0f89EtAmPARjB2PxBBtAoggJMSWymHJsINGcI
 +Z/OudAplWGQY5uUGUb+5tyZtBpKf1V1umjh7g3Rc5tBFzlxEy15pZgDYjHRP+zaxUyr
 LMPcyuDxooqIJbd6EgY9V8p3BZmCTF/fjxoK9Kk7GROKGoEc7NVeUVYwEJdkAA9TvpiE
 qdng==
X-Gm-Message-State: AOJu0YwJsbehkg3LFjwJ64ej/4xY9wb1Lqr+03RB+AVCQZNbf+9hKAYi
 S0g0kMI7dq6cU6wy9i/RPbHzeuJ42DPwsm5hVLhidvTs7RCWZD7O8NnNcpZmg/m26qsjF7jkcfn
 33AdrYg==
X-Gm-Gg: ATEYQzwX8jp6xevN54IamZ0Kie4YYY/NjWDdCrPKsmXfaqwlF2ViNwTX/v9yKgdOXK3
 tT7UXFvl6yqCPWDjTi3NoMM6PHs/tinof7TS7Sr7eiZv+MpwJZw2UDaW/FJT0DD1nFtLL4g1ROz
 vdQon+vE8u4cZ1E3S/juuipIpFtOu8lFQBq2uthTi1BrguMeY0ajrxQo7bh9Gfi0aLSkzisbEj8
 G6FQtRDAH75UfrtSSnMXAfuqRWwv6LbTuSvDebtS6SzB5Ql2XcLLErknw5mCOk7stKKOQodjN5C
 6GtEaw244FpOz9epPPFwuTiR2+X5Jf+rlN/03qSbe36ogOmFf/tVj7b4KfL2bZsbEkbmQOCfroO
 usgNkWBwJVF9Tm7SCUDn4ga3WEn0VXJSjP4sd4vvtOHoUAuB/k2bLKSkZK7/yvzF2UDwZis08mj
 hlp6Yj+9lb1hTgW98eMjDbMeX0uPrPCZqT7vUWsrGliKYhK5zkOA==
X-Received: by 2002:a05:6000:1acf:b0:435:add0:3d68 with SMTP id
 ffacd0b85a97d-439da8a7f38mr10167396f8f.58.1772897986423; 
 Sat, 07 Mar 2026 07:39:46 -0800 (PST)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8ec97sm13052912f8f.5.2026.03.07.07.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 07:39:46 -0800 (PST)
To: buildroot@busybox.net
Date: Sat,  7 Mar 2026 16:39:29 +0100
Message-ID: <20260307153929.384884-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260307153929.384884-1-francois.perrad@gadz.org>
References: <20260307153929.384884-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1772897988; x=1773502788; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5uIbhYPrY/8KtoVIQuaAkcWKBKWXjf1yHTLGIAtj3GU=;
 b=chsZA7A664LY0aExunqAWjZX9i0ktd5xkf5mufnPZGY/Q30DqX2oOif4pEyBHjxjqo
 f2F0jGyRc1Mt4qZbGpk+sDjBDU7REZOrbGne8tAswRZWsFm1qmL+SOMWnJZjZJExZhmt
 lkRgqAWAxE2RUtV5AKrBzI27diwbIdxvqkdnQfLrijafUlw8P4p+elQsgNvK2lsevuvd
 6n6tBT1/vJK0lwxVJ6uOJkkct6rqaHIwJC2fiPzWtZ3t5PdfecOr9sgG93BiCSyT9sgD
 AlV+hjYp3RODW4jBYy/2SAC86SkVQWNU0i3W3KhiVooadjG0/nMtLd5QrkcB2HaP+aXU
 twXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=chsZA7A6
Subject: [Buildroot] [PATCH 2/2] package/ficl: bump to version 3.05
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- sources are now hosted on Github
- ficl have its own LICENSE file
- remove one upstreamed patch
- support only static lib

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...=> 0001-makefile.linux-pass-LDFLAGS.patch} | 30 ++++++------
 package/ficl/0001-missing-include.patch       | 26 -----------
 package/ficl/Config.in                        |  2 +-
 package/ficl/ficl.hash                        |  4 +-
 package/ficl/ficl.mk                          | 46 ++++---------------
 5 files changed, 28 insertions(+), 80 deletions(-)
 rename package/ficl/{0002-Makefile.linux-pass-LDFLAGS.patch => 0001-makefile.linux-pass-LDFLAGS.patch} (79%)
 delete mode 100644 package/ficl/0001-missing-include.patch

diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
similarity index 79%
rename from package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
rename to package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
index aa5c00edb..d0ab468a3 100644
--- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
+++ b/package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
@@ -17,23 +17,25 @@ Upstream: upstream is dead
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 [francois: downgrade to 3.03]
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+[francois: upgrade to 3.05]
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
- Makefile.linux | 2 +-
+ makefile.linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.linux b/Makefile.linux
-index 5f1a41f..df887e6 100644
---- a/Makefile.linux
-+++ b/Makefile.linux
-@@ -13,7 +13,7 @@ MAJOR = 3
- MINOR = 0.1
- 
- ficl: testmain.o ficl.h sysdep.h libficl.a
--	$(CC) testmain.o -o ficl -L. -lficl -lm
-+	$(CC) $(LDFLAGS) testmain.o -o ficl -L. -lficl -lm
- 
- lib: libficl.so.$(MAJOR).$(MINOR)
- 
+diff --git a/makefile.linux b/makefile.linux
+index 1e467ea..fad7059 100755
+--- a/makefile.linux
++++ b/makefile.linux
+@@ -25,7 +25,7 @@ libficl.a: $(OBJECTS)
+ 
+ # === Console Test executable ===
+ ficl: testmain.o ficl.h sysdep.h libficl.a
+-	$(CC) testmain.o -o ficl -L. -lficl -lm
++	$(CC) $(LDFLAGS) testmain.o -o ficl -L. -lficl -lm
+ 
+ # === Compile rules ===
+ .SUFFIXES: .cxx .cc .c .o
 -- 
 2.35.1
 
diff --git a/package/ficl/0001-missing-include.patch b/package/ficl/0001-missing-include.patch
deleted file mode 100644
index a52089623..000000000
--- a/package/ficl/0001-missing-include.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 87c78eea2c4ac69c09947c8e49f8e8668640071c Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sun, 7 Dec 2025 10:15:27 +0100
-Subject: [PATCH] missing include
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-Upstream: upstream is dead
----
- fileaccess.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/fileaccess.c b/fileaccess.c
-index 738889d..c03d5d6 100644
---- a/fileaccess.c
-+++ b/fileaccess.c
-@@ -4,6 +4,7 @@
- #include <string.h>
- #include <ctype.h>
- #include <sys/stat.h>
-+#include <unistd.h>
- #include "ficl.h"
- 
- #if FICL_WANT_FILE
--- 
-2.43.0
-
diff --git a/package/ficl/Config.in b/package/ficl/Config.in
index 4d9ab4a5b..550eaf42f 100644
--- a/package/ficl/Config.in
+++ b/package/ficl/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_FICL
 	  development prototyping language.
 	  Ficl is an acronym for "Forth Inspired Command Language".
 
-	  http://ficl.sourceforge.net
+	  https://ficl.sourceforge.net/
diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
index 1a4a54e70..8bb5dbb45 100644
--- a/package/ficl/ficl.hash
+++ b/package/ficl/ficl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  064abbea44b2cbbeb53b8df8e5588ed41c4d32dd19bdb897e5d21507691407b2  ficl303.tar.gz
-sha256  18527f5cdc213d29fb65791e153690974e5426b7e989f3b8eee61c2e5f9e5fcd  ReadMe.txt
+sha256  c8b481d76f1a676f761bb410074ec8f3b425feb74f3775149fa48a69a4faa57e  ficl305.tar.gz
+sha256  b7a894f23d7d7302852405b3d1b6fd88e76b4c116a68f046d4547c073c75d3ea  LICENSE
diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index da9a9a33f..6ef94f11e 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -4,55 +4,27 @@
 #
 ################################################################################
 
-FICL_VERSION = 303
-FICL_VERSION_SO = 3.0.1
+FICL_VERSION = 305
 FICL_SOURCE = ficl$(FICL_VERSION).tar.gz
-FICL_SITE = https://sourceforge.net/projects/ficl/files/ficl-all/ficl$(FICL_VERSION)
-FICL_LICENSE = BSD-2-Clause
-FICL_LICENSE_FILES = ReadMe.txt
+FICL_SITE = $(call github,jwsadler58,ficl,ficl$(FICL_VERSION))
+FICL_LICENSE = BSD-3-Clause
+FICL_LICENSE_FILES = LICENSE
 FICL_INSTALL_STAGING = YES
 
-ifeq ($(BR2_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += ficl
-define FICL_INSTALL_STATIC_BIN
-	$(INSTALL) -D -m 0755 $(@D)/ficl $(TARGET_DIR)/usr/bin/ficl
-endef
-endif
-
-ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += libficl.a
-define FICL_INSTALL_STATIC_LIB
-	$(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
-endef
-endif
-
-ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += testmain libficl.so.$(FICL_VERSION_SO)
-define FICL_INSTALL_SHARED_BIN
-	$(INSTALL) -D -m 0755 $(@D)/testmain $(TARGET_DIR)/usr/bin/ficl
-endef
-define FICL_INSTALL_SHARED_LIB
-	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.$(FICL_VERSION_SO)
-	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.3
-	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so
-endef
-endif
+FICL_DEPENDENCIES = host-python3
 
 define FICL_BUILD_CMDS
-	$(MAKE) -C $(@D) -f Makefile.linux $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline -fPIC -I. -Dlinux" CPPFLAGS="" $(FICL_BUILD_TARGETS)
+	$(MAKE) -C $(@D) -f makefile.linux $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c11 -Dlinux -DFICL_UNIT_TEST=0 -D_POSIX_C_SOURCE=200809L -I. " CPPFLAGS="" ficl
 endef
 
 define FICL_INSTALL_STAGING_CMDS
-	$(FICL_INSTALL_STATIC_LIB)
-	$(call FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
+	$(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
 	$(INSTALL) -D -m 0644 $(@D)/ficl.h $(STAGING_DIR)/usr/include/ficl.h
 endef
 
 define FICL_INSTALL_TARGET_CMDS
-	$(FICL_INSTALL_STATIC_BIN)
-	$(FICL_INSTALL_SHARED_BIN)
-	$(call FICL_INSTALL_SHARED_LIB,$(TARGET_DIR))
+	$(INSTALL) -D -m 0755 $(@D)/ficl $(TARGET_DIR)/usr/bin/ficl
 endef
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

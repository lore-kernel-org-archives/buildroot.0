Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC2AFA1FD7
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 16:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0738861BA2;
	Wed, 22 Apr 2026 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBwh2L6vcLsW; Wed, 22 Apr 2026 16:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0457B61B98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776875500;
	bh=OUxw0XmrwnHLPjwTZ00nU224iIfR7ICzmJGSfvJ9N3o=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=iFzHK50ENUiz+urAEmexpk5+eUcVMbKrtHEZ9KtJED5Kr/DlreSt2EPOMIUPUHMiH
	 QPr8Ow97wmb/dBvQ612WOyDL5mT2n5EclZpLpO6HJib4q5yEiPZNVCDgJyrHfjsYUN
	 5cmfyOsk6RQID5ZcDZAhgh903/TTbeAKLesToZpQ0Lf9xPTNWXez4DYoVv1pw16eHL
	 QFvo5eAPG0Ac5nZTRDsTN4UdMf41d901Ys/4NED/Q+9VBbOEzIA1B4HCcC17n/W2ja
	 WVHfbwiHTqQszX30l8crH8l9RnHIc2WtuRC6D4eAgJ1qrSTPWd5lgZ8D6g+FHy2k3n
	 b9/ea6XvJomew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0457B61B98;
	Wed, 22 Apr 2026 16:31:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A30D257
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C5D684666
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yis1HfSQz3if for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 16:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4213784691
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4213784691
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4213784691
 for <buildroot@busybox.net>; Wed, 22 Apr 2026 16:31:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so24807705e9.0
 for <buildroot@busybox.net>; Wed, 22 Apr 2026 09:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776875494; x=1777480294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VhlhRx+Vow6WJh/DYhZZpZ65Z0R9xn0YY/O+5U3SWWw=;
 b=Fz516I/vTLKTMfBhhDN71pp7/S3tP/74RCoxy9KYuDLuLmby8+srLfec2AdjrBzCBM
 TQqppYl9ipglhwMAPcpNMb7JTxXHdH13qEq5k6XOBdZngfSKXjj0EyG839GyYthmrBg1
 OxkUq1uzmo9BjbOcdKqzLnCha2YJ+FwYM73b/mtHjvzuSy+LKZToWeMMBMHYFtdS31Rn
 HXIdglXEsIrqVV7Nli3I0uHbN+B2Z61DvhaFW2V4sKYhDMhs00mRWEsiBp5JCXK580ad
 UJg+mfxIAG0SeEOtfDtN5c+vfGwws6CxoDRd+b6pPw+BPgH3yQjDAb4eiTB1K1PVFwap
 H5AA==
X-Gm-Message-State: AOJu0Yx1VGvsvLQy+A16pL1VHDEjSn/I/U2h0XKiBMi1QRjseR/3M7dY
 WtBPHoqIX1ijgUvKCj7HrhQBVvCqFKqXT2jOVOG6CBvIktCb/caRIcjSjaNc/KbDvQlk1T6oBcU
 Bk3TNZha3
X-Gm-Gg: AeBDiet7HLXXdplUctO46o/f/+KsqpxLUQp7LY+E83T6Ur/XI4LVgCp3GrgIo6JN7H0
 yOvd8MSrfnRc55S9wh6aMqw8C+tx6nWSZQS5qMpTKwAR5g9e8tSCltZx3iHMx+DANew+P8slY3e
 tuTlX6VE/h87mzLpbB7LsuPjUkK/4Nirg9iWOrpByDb1HiVCKQtcgJwzQOreo+NT9xSOtagCl1D
 kmlb5ioAJAFYOKbA74Ex+lcdwewb7P1Zb+bRetcYa3D1Wz1p9BrkVN0l0cwgM8BSp9SgriAYJPL
 0J+5yCLIi2kpipV7Fy/cQdwWMmX7sQV/CWY2QxKv8Oj2DPqkey2pTIIzMinjRMISp3FwmAWllbS
 3K4Qr/ndUjvvq6W28Y+7ZoaOSJXj01Ta3bmC0br/oz+JS0+WnNF4ii6JpQ6hBpxWbo2N+sbmbSL
 +T+o5Q9ylVl3UrGauqTovlAqlfSJVLAt+ujgu7UJkRfSAI/7aljQK3tE3Jfc40
X-Received: by 2002:a05:600c:b96:b0:48a:5339:a46 with SMTP id
 5b1f17b1804b1-48a53390f6cmr136211975e9.9.1776875492890; 
 Wed, 22 Apr 2026 09:31:32 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c318636sm256548075e9.7.2026.04.22.09.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 09:31:32 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 22 Apr 2026 18:31:25 +0200
Message-ID: <20260422163125.5757-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422163125.5757-1-francois.perrad@gadz.org>
References: <20260422163125.5757-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1776875494; x=1777480294; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VhlhRx+Vow6WJh/DYhZZpZ65Z0R9xn0YY/O+5U3SWWw=;
 b=ceQO0qVF0BiKkrGq9l3HukIbxqi+ykXasRe7D/sQS5yoXvATxWCHPuzjPHa8AkcLuw
 MQ3itycVSFlpG8S9xSQLh4HGLJgGGK26lhmF3UUlF0xYaXCpw2/hQg18XO+8soPYk7ah
 j1L+BDbOn0F9vuvcYiB99Fhaa6dCiHMhgKmXFame7Gl/yxUYSzGCLfUo2eRSdkd8u/Zc
 u1mThMdEoeXf5v1TEZxtSIXiBzfrL8wfTWZy0UCslHoA4IDfJye7TNRo/JRUf2BsdSD7
 SdjjZSww/6iAxpC2gH8zpVD/hLj26QuLu5rXYa/HCqUE90b5JPesUp5YQfLkpZ7Jq5aq
 Lb3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=ceQO0qVF
Subject: [Buildroot] [PATCH v3 2/2] package/ficl: bump to version 3.065
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
- requires C11

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...=> 0001-makefile.linux-pass-LDFLAGS.patch} | 30 ++++++------
 package/ficl/0001-missing-include.patch       | 26 ----------
 package/ficl/Config.in                        |  6 ++-
 package/ficl/ficl.hash                        |  4 +-
 package/ficl/ficl.mk                          | 47 ++++---------------
 5 files changed, 33 insertions(+), 80 deletions(-)
 rename package/ficl/{0002-Makefile.linux-pass-LDFLAGS.patch => 0001-makefile.linux-pass-LDFLAGS.patch} (70%)
 delete mode 100644 package/ficl/0001-missing-include.patch

diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
similarity index 70%
rename from package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
rename to package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
index aa5c00edb..1ac86466d 100644
--- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
+++ b/package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
@@ -17,23 +17,25 @@ Upstream: upstream is dead
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 [francois: downgrade to 3.03]
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+[francois: upgrade to 3.065]
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
+@@ -26,7 +26,7 @@ libficl.a: $(OBJECTS)
+ 
+ # === Console Test executable ===
+ ficl: $(FICL_TEST_OBJ) ficl.h sysdep.h libficl.a
+-	$(CC) $(FICL_TEST_OBJ) -o ficl -L. -lficl -lm
++	$(CC) $(LDFLAGS) $(FICL_TEST_OBJ) -o ficl -L. -lficl -lm
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
index 4d9ab4a5b..21861652e 100644
--- a/package/ficl/Config.in
+++ b/package/ficl/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_FICL
 	bool "ficl"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6 # C11/static_assert
 	help
 	  Ficl is a programming language interpreter designed to be
 	  embedded into other systems as a command, macro, and
 	  development prototyping language.
 	  Ficl is an acronym for "Forth Inspired Command Language".
 
-	  http://ficl.sourceforge.net
+	  https://ficl.sourceforge.net/
+
+comment "ficl needs a gcc >= 4.6"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
index 1a4a54e70..6023708ff 100644
--- a/package/ficl/ficl.hash
+++ b/package/ficl/ficl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  064abbea44b2cbbeb53b8df8e5588ed41c4d32dd19bdb897e5d21507691407b2  ficl303.tar.gz
-sha256  18527f5cdc213d29fb65791e153690974e5426b7e989f3b8eee61c2e5f9e5fcd  ReadMe.txt
+sha256  09a4649a68a075999c2bc26129cf233c4d672335a9c68b98ffcbf1bc8962e5e1  ficl3065.tar.gz
+sha256  b7a894f23d7d7302852405b3d1b6fd88e76b4c116a68f046d4547c073c75d3ea  LICENSE
diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index ef2e1408c..1ab1bb6a3 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -4,56 +4,29 @@
 #
 ################################################################################
 
-FICL_VERSION = 3.03
+FICL_VERSION = 3.065
 FICL_TAG = ficl$(subst .,,$(FICL_VERSION))
-FICL_VERSION_SO = 3.0.1
 FICL_SOURCE = $(FICL_TAG).tar.gz
-FICL_SITE = https://sourceforge.net/projects/ficl/files/ficl-all/$(FICL_TAG)
-FICL_LICENSE = BSD-2-Clause
-FICL_LICENSE_FILES = ReadMe.txt
+FICL_SITE = $(call github,jwsadler58,ficl,$(FICL_TAG))
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
+	# workaround for static_assert on uclibc-ng < 1.0.42
+	$(MAKE) -C $(@D) -f makefile.linux $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c11 -Dlinux -D_POSIX_C_SOURCE=200809L -Dstatic_assert=_Static_assert -I. " CPPFLAGS="" ficl
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

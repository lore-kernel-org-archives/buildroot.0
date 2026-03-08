Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A1AEA8524
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 15:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C9018211B;
	Sun,  8 Mar 2026 15:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9I1OQB83tHD; Sun,  8 Mar 2026 15:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D15821D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772982423;
	bh=AOK5EW2FKx7bPdg2nYc5GVEeZR+c3HPMdRVxyGNgsCo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=gpHyhGWdRLzbIOMfdxeyto4YqiX3FLvaDRz1ffT5mhDiVYT1Mqr6OTOQDV69X0HkH
	 djY/GZwTHd9LghR70LwdAEesAcjXduT2LUH2yJ0PtH24oeEm0Ws7SQTcHXORm4wgdl
	 rKXt4tG21sHLwtbGlOJgYzCJQOGUlAmSKTL9B8lIi4/rM7wYtDtsUguCluiB79jtPK
	 HC++iyfuVlDcUqCYV28e4qIRcz/lunmAzTGb9vapjdy3VRDwyapOuP3gCOjE+cEe5Z
	 lPNfu2Ice3NhskOkfLaH2uLU7AHqAUAiIZxwg6c79rL58ZQj/NhqCs03NYWZg+OcJy
	 Eu0Kq7ZP2ZL3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D15821D1;
	Sun,  8 Mar 2026 15:07:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D65A158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21ED381341
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Pz8qRP1Rpqg for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 15:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D01A081350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01A081350
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D01A081350
 for <buildroot@busybox.net>; Sun,  8 Mar 2026 15:06:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso7396882f8f.0
 for <buildroot@busybox.net>; Sun, 08 Mar 2026 08:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772982418; x=1773587218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6F+cwBUzugrIoUnS8W618N9j2ZDrcWaO9mq/g6lZ0IU=;
 b=pq7t6rj1EZNKkja19GrY2gXS4aUF8MIW8QT0wCLm+JNcPn23ibLC/2sGWNht0eyvlj
 xIdZpaw+XnrC+I1404PNcJ9Gtzbvj/F5+zGJ73E+seBRcdBqPYGM5AVV4OrBUQgp1zM4
 qROInRmVyCUiHQszHzzdwTC7d0qn2FoFrq1ckz/B2Z5y/IuAjpLzUazP0A06L0l6ye84
 oE7pYteWQpIM6I36h8nb6JD0Qgt4AWCoTPzaJQ7my4xpNHUILyz5j1rC8YuOAPs8oIHt
 9HYtNXajEyD3X/IXQJHZYYUf7xVvlcuv7Xelt93GyivbSRNHasaEqmY/VitAMfKfibvD
 X5kA==
X-Gm-Message-State: AOJu0YyEkUk8UVZwYwQ3WPVjZhSlbq0dOEbls5/e1tV9MOS3HHIVpxBt
 D+qhBdb03A88co9wkkfaN8l4bNwuTpIyGknuLqKk42f+Oz92+Xb0K/gf+om2eyiYOmya9k0H6Um
 NLhK4uA==
X-Gm-Gg: ATEYQzxVaWsfvOxeqlfZNy0jElhCPOj0m/r3VXaiXZI+BuE04Lux4UX55E8Awj67y1g
 NHa+Nk5gLD9MJDO8phSChR8gWSvmeCSIGZ+gwl6LoXzO3qRhtMYFvThmSbsZqUjQCsfDXlR5PFg
 UrvgbMivu9p4KIhzZZUomp3DYb2bvxL2Ph+zsttUZCRrb5k7O3MmDSFH06jYhPDhxhJlK/wZIGF
 4fZAr2RyD+L0aSUrVDQIhTRf5du6nVcKs8BMa9pIGdnVLjcNQrXiO4Kq3RmIt1GR2yWASEzUd5n
 ajsjN+8ceGmY56FN5wHFu1ff3J3DigSfZY5EvV87ZrtjRf3vfPbUjvLyjHprz5oout6NFf7u7Z5
 n2G1knbdqcIR+2voQpuCDQGSsk3HnoFp0HkwVeTWYTYg8JNYJ30inW3KvlwI8vLqe1siMOxWpIv
 f2Do0XFKFgvodxqml9l3boStjJscT/00c3kxXF9jh5QDSZwm6Fow==
X-Received: by 2002:a05:600c:8b5b:b0:480:4ae2:def1 with SMTP id
 5b1f17b1804b1-485269305e5mr130330015e9.13.1772982416607; 
 Sun, 08 Mar 2026 08:06:56 -0700 (PDT)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853a59fc36sm52380345e9.9.2026.03.08.08.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 08:06:56 -0700 (PDT)
To: buildroot@busybox.net
Date: Sun,  8 Mar 2026 16:06:49 +0100
Message-ID: <20260308150650.48948-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308150650.48948-1-francois.perrad@gadz.org>
References: <20260308150650.48948-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1772982418; x=1773587218; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6F+cwBUzugrIoUnS8W618N9j2ZDrcWaO9mq/g6lZ0IU=;
 b=cd7/lUDDwQCGTVEsYYRkK5RcYzbnBhILduwUBMJynXoktUfZSntmONo0hI26O4McKk
 RLL3B3zvm8CExFHx7sfgi31il0X+Nx7tXD6J8y5GIc2Ze5Zg16iRiqB195oY7v4O+06x
 YyFpOuJ7/Z6oj2fxgffOzGOknci2S0MGPXSvABLu2mJIqt6ah+qagC/J/0fYgpIwg8+p
 /TlOSayZHYnml/kdeJ5BPc+APvifyPKFER1mhhFAfMrNycQQj72HSa5WTSizXdcO8Z7m
 vnZhovPCtX9tm85Qm+cPEnBRqYRiJ0rgAlknzxzUuCXiQPZrHGVof61dfSZa+m4dVj/8
 8KJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=cd7/lUDD
Subject: [Buildroot] [PATCH v2 2/2] package/ficl: bump to version 3.05
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
---
 ...=> 0001-makefile.linux-pass-LDFLAGS.patch} | 30 ++++++------
 package/ficl/0001-missing-include.patch       | 26 -----------
 package/ficl/Config.in                        |  6 ++-
 package/ficl/ficl.hash                        |  4 +-
 package/ficl/ficl.mk                          | 46 ++++---------------
 5 files changed, 32 insertions(+), 80 deletions(-)
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

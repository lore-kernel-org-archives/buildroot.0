Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9B2D44149
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 08:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2197460A48;
	Fri, 12 Dec 2025 08:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUYb3-hta6EM; Fri, 12 Dec 2025 08:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1681260A63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765529401;
	bh=ONc+6gJmCa4jIPUPGEbF3JBAYyY9kDbjf/XwPkkJxB4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HVee8BeWMLmsEjmhB0PoEB1N3LiHNIDwDxj/KvT8Uvcdwgyo7yWrnANeQ82/yEiyX
	 Ddk0h8k0fhyNr9fVMBMGH/2uXAmbEcPQTXwOS2SGLxAidwVUo2CKaA7+bhStwRAgS3
	 TuVPXNNUtFFVrep74Bf7/8+6IJEveyDBYlQ3P4h68ZV/4A93CF6vOIZgikllrulZnB
	 1YeA3ox2rzxiWdLOlIjidgS+PgRbPtcGMqiMRrzjKwWdk8qN5NM0yTPTRkg94aX89i
	 7eqlSZOtrwrdKb/ra44gBZE07n0weJV0rxKeMWKd2DY8uu9XQVKHEIgwHreByzd7I7
	 5AafP+Hqd0zIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1681260A63;
	Fri, 12 Dec 2025 08:50:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B2CB2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D0B0810C4
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMhdvWDwC9qY for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 08:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF7CF80F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7CF80F3B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF7CF80F3B
 for <buildroot@busybox.net>; Fri, 12 Dec 2025 08:49:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso4030625e9.0
 for <buildroot@busybox.net>; Fri, 12 Dec 2025 00:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765529397; x=1766134197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+MznOoSbG+LUje3+t/GjaBKJ1fgwwqyn6bI64Zp/4w=;
 b=EanYKoygNOApYe1+zUgBwyYH6FcYrX9rwqCwjLU+57lhKf/MaSs1olAXJkQaEt/m5h
 WnLI631sK2lT744hpHYN95lvWNbF/WP6HQVJedjcw6WJbXFdEz24yjVKX5+QKwU+PRj0
 8ex3OYAz0GtsH4mqf3TBN2vOTP6eTH137JAGbwph565VH9XjTbe2nvgb9jJ9hC1XW68F
 ZxpSFZkW7zAgfI3AV0Ls+7LpCXO8bDukdTnuVinMraLKVsfEwLGpq8Lb73w2YUJFAruE
 yWpp2ZolKRpFR6PiAs32ruk3OX6UdT7u/2p1YZBnAzoANtPcx0iAnQoEq+Yh5zi+UMts
 Ng5A==
X-Gm-Message-State: AOJu0YzlYCUI8Mjfx5nocUgoIWLXaQMmDJ+glUDZBc/+LPiIMjIr031k
 79OpBCk822/ph5zP/ltUm8p4+IWFN17/dZrKkAPYNjl8GSTgiPr0kiGaXn1NKFhONqq3xbD13fW
 KZi/kMQ==
X-Gm-Gg: AY/fxX62TWWGPzqKBmP30j369Z8apjervARBEwguwAXC4DlfxT7+qcnxXp69hbw/ghT
 w47Jbcxenr92NO6jwkj5tlMTc2MnHxyY+EMuLLmemrok2dYeRWvrxrJqUjn2swwOSvfsU+ydgi/
 vDvUwNUUOxHQ/v0XgzXqEykkQ2Lo1OmIssyJ+qQFu0ueq1jY6yqf91g0bYm+iLVdjcB5AXxNQXb
 T4huJhDz2rEY+EfJTSC1CVjnA1koVAcvxTq4WU8enjykQPxZKM4rIQ2g9v1TwX6z2W+icFmcoVX
 q+Qr7ateQRrgo/7FyUihMtxtjRBMMYpzEOzF0ZBY7IP831IZPW/aY6cC6br3+eToyvxZuas8OuN
 7EMa1emPllpxim276IX67yzA9pBsA2GjLObKD6KOv7SzoKcIvoZqLJkG0fNA85lLlEErvfBwohX
 3F9YLOcUsu29q74+wpDbi9XJ76NgGFKuxb4fQ=
X-Google-Smtp-Source: AGHT+IFinW4XUXRrskjnD2/RfqygYTdb1p52Bl4rtPqW2KQsCYiffI8QJjWORoXGi2cw6/7Ud6N02g==
X-Received: by 2002:a05:600c:444a:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-47a8f1c20e1mr14168585e9.11.1765529396512; 
 Fri, 12 Dec 2025 00:49:56 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f776898sm20381985e9.8.2025.12.12.00.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 00:49:56 -0800 (PST)
To: buildroot@busybox.net
Date: Fri, 12 Dec 2025 09:49:53 +0100
Message-ID: <20251212084954.76257-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1765529397; x=1766134197; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w+MznOoSbG+LUje3+t/GjaBKJ1fgwwqyn6bI64Zp/4w=;
 b=Z4wcW9qtuPo4Bnh+iUL7VgBvLQ+6H1/61qGdzN21hF5UD3m0Jv57bJuOVzLPPc8AaP
 ACJeplRJjHimapsOIGhVHNYv7he1J1bfWe0idsOzLUTaBcAT4xcxgAwj9GSSkoSeEzDT
 OwE7PH+uxcjYioy+F4C6Dnvz3kw3arhHRdLdCH9CkR13nsZDggmnDqrT+UupQkbsGAVg
 t1YLe158gGhyYTmUcPhWIEVslDs7uy23e88ZNKzxYUHRpKM2zbk7Sh/KTc4oMDvMKEqV
 sekxflCXT+lJd/vPxJ0qrWMSeKXXkzFv8/OozBlOtn65IMPHQifcBzMIP5FgyQpAsArb
 5zCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Z4wcW9qt
Subject: [Buildroot] [PATCH] package/ficl: downgrade to version 3.03
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

see https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ficl/0001-fix-Makefile.patch          | 47 -------------------
 package/ficl/0001-missing-include.patch       | 26 ++++++++++
 .../0002-Makefile.linux-pass-LDFLAGS.patch    | 19 ++++----
 package/ficl/ficl.hash                        |  4 +-
 package/ficl/ficl.mk                          | 19 ++++----
 5 files changed, 48 insertions(+), 67 deletions(-)
 delete mode 100644 package/ficl/0001-fix-Makefile.patch
 create mode 100644 package/ficl/0001-missing-include.patch

diff --git a/package/ficl/0001-fix-Makefile.patch b/package/ficl/0001-fix-Makefile.patch
deleted file mode 100644
index d5a25c43f..000000000
--- a/package/ficl/0001-fix-Makefile.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-fix dependency in Makefiles
-
-there is no longer a sysdep.h file.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-diff --git a/Makefile b/Makefile
-index 976d00a..7f73c44 100644
---- a/Makefile
-+++ b/Makefile
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) $(CFLAGS) $(LDFLAGS) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
-diff --git a/Makefile.ansi b/Makefile.ansi
-index e510fcd..170e6eb 100644
---- a/Makefile.ansi
-+++ b/Makefile.ansi
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
-diff --git a/Makefile.linux b/Makefile.linux
-index d447e7e..7f2cdfe 100644
---- a/Makefile.linux
-+++ b/Makefile.linux
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
--- 
-
diff --git a/package/ficl/0001-missing-include.patch b/package/ficl/0001-missing-include.patch
new file mode 100644
index 000000000..a52089623
--- /dev/null
+++ b/package/ficl/0001-missing-include.patch
@@ -0,0 +1,26 @@
+From 87c78eea2c4ac69c09947c8e49f8e8668640071c Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 7 Dec 2025 10:15:27 +0100
+Subject: [PATCH] missing include
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Upstream: upstream is dead
+---
+ fileaccess.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fileaccess.c b/fileaccess.c
+index 738889d..c03d5d6 100644
+--- a/fileaccess.c
++++ b/fileaccess.c
+@@ -4,6 +4,7 @@
+ #include <string.h>
+ #include <ctype.h>
+ #include <sys/stat.h>
++#include <unistd.h>
+ #include "ficl.h"
+ 
+ #if FICL_WANT_FILE
+-- 
+2.43.0
+
diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
index dd9e16412..aa5c00edb 100644
--- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
+++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
@@ -15,6 +15,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: upstream is dead
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[francois: downgrade to 3.03]
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
  Makefile.linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -23,14 +25,15 @@ diff --git a/Makefile.linux b/Makefile.linux
 index 5f1a41f..df887e6 100644
 --- a/Makefile.linux
 +++ b/Makefile.linux
-@@ -14,6 +14,6 @@ MINOR = 1.0
- 
- ficl: main.o $(HEADERS) libficl.a
--	$(CC) main.o -o ficl -L. -lficl -lm
-+	$(CC) $(LDFLAGS) main.o -o ficl -L. -lficl -lm
- 
- lib: libficl.so.$(MAJOR).$(MINOR)
- 
+@@ -13,7 +13,7 @@ MAJOR = 3
+ MINOR = 0.1
+ 
+ ficl: testmain.o ficl.h sysdep.h libficl.a
+-	$(CC) testmain.o -o ficl -L. -lficl -lm
++	$(CC) $(LDFLAGS) testmain.o -o ficl -L. -lficl -lm
+ 
+ lib: libficl.so.$(MAJOR).$(MINOR)
+ 
 -- 
 2.35.1
 
diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
index df53c843c..1a4a54e70 100644
--- a/package/ficl/ficl.hash
+++ b/package/ficl/ficl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4daf74f3d3d6f8b86ea7cb47bc24931d50b4809b50ba34ca32e0ca1e972bd3a3  ficl-4.1.0.tar.gz
-sha256  1d1dd1f1cde52e8b607c5ccb6a2e5de878fd1719b8c5a4d31b9cdb343c203d0d  ReadMe.txt
+sha256  064abbea44b2cbbeb53b8df8e5588ed41c4d32dd19bdb897e5d21507691407b2  ficl303.tar.gz
+sha256  18527f5cdc213d29fb65791e153690974e5426b7e989f3b8eee61c2e5f9e5fcd  ReadMe.txt
diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index c0698a343..da9a9a33f 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-FICL_VERSION_MAJOR = 4.1
-FICL_VERSION = $(FICL_VERSION_MAJOR).0
-FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
+FICL_VERSION = 303
+FICL_VERSION_SO = 3.0.1
+FICL_SOURCE = ficl$(FICL_VERSION).tar.gz
+FICL_SITE = https://sourceforge.net/projects/ficl/files/ficl-all/ficl$(FICL_VERSION)
 FICL_LICENSE = BSD-2-Clause
 FICL_LICENSE_FILES = ReadMe.txt
 FICL_INSTALL_STAGING = YES
@@ -26,14 +27,14 @@ endef
 endif
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += main libficl.so.$(FICL_VERSION)
+FICL_BUILD_TARGETS += testmain libficl.so.$(FICL_VERSION_SO)
 define FICL_INSTALL_SHARED_BIN
-	$(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/ficl
+	$(INSTALL) -D -m 0755 $(@D)/testmain $(TARGET_DIR)/usr/bin/ficl
 endef
 define FICL_INSTALL_SHARED_LIB
-	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.$(FICL_VERSION)
-	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.4
-	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so
+	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.$(FICL_VERSION_SO)
+	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.3
+	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so
 endef
 endif
 
@@ -46,8 +47,6 @@ define FICL_INSTALL_STAGING_CMDS
 	$(FICL_INSTALL_STATIC_LIB)
 	$(call FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
 	$(INSTALL) -D -m 0644 $(@D)/ficl.h $(STAGING_DIR)/usr/include/ficl.h
-	$(INSTALL) -D -m 0644 $(@D)/ficllocal.h $(STAGING_DIR)/usr/include/ficllocal.h
-	$(INSTALL) -D -m 0644 $(@D)/ficlplatform/unix.h $(STAGING_DIR)/usr/include/ficlplatform/unix.h
 endef
 
 define FICL_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4827BF5141C
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 15:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED4484179;
	Sat,  7 Mar 2026 15:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFctZoi8dn1U; Sat,  7 Mar 2026 15:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C90C8417B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772897991;
	bh=ONc+6gJmCa4jIPUPGEbF3JBAYyY9kDbjf/XwPkkJxB4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=exBqGoVw9ol9EEr6vodS9GclhQX0X92A/wtL8oyOwFmGHUETRqsLrAHjvzWWAzf8u
	 FX1bNswIab9cgK45jtbyVe0QC+B7kwsl4QRjH6OrQaFPXcchNSFd3cu7pohcNj1Go4
	 kGAVEJQ3v6nijnBsRADBYOhVqNXfzhut32ukdxN1MnYreq8UkWBpcAad7te4tasovU
	 k4aXxTVqO5lwT5bmnyTADbQ5TARmn2ryH1mnBe3YDtqRvsStHr5Nrtv2y7sGKN17We
	 yZ/9HXz75+26vfTUR8Y5Y0ZYhu3EPPPwdNlkbZPAW0aB7J49d3Yn32jJcxlFRXB1oe
	 zafEj5BBuqKlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C90C8417B;
	Sat,  7 Mar 2026 15:39:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F7CB25B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 455288417D
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STgM8ZoxkkNs for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 15:39:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9F8E84179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9F8E84179
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9F8E84179
 for <buildroot@busybox.net>; Sat,  7 Mar 2026 15:39:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439baf33150so5049915f8f.0
 for <buildroot@busybox.net>; Sat, 07 Mar 2026 07:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772897986; x=1773502786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+MznOoSbG+LUje3+t/GjaBKJ1fgwwqyn6bI64Zp/4w=;
 b=dY2G78NtcNItrGvACxXN6HPfV0/viMMNtjagq5/iaT8cz7q7QgHcBgApOsON5OUWWy
 0ENr5aK3mjNmLtPGqxN64mKD3sTDTYHGm3txCPFbDpsXX8gpbfs/UmJ07L/XnjWpAgbW
 FM4doNPc7utJCBOJkZXc3B4EBpUkBgMIvpJGE6d0ir00LC+olZ+txR7hb5sXw19DVFec
 E99NDVjKngPB3bQBtpMnXXmYgmUoRM5Iai/TIhdsbW3TbO8REZX/Zo25pDXunm5C9Ljg
 QsV8dyWEVD1+B5fumGB34ZeMv7mdNNBOtYOTY4Lfuy48BTpyjPq7WIj360U++dKZ93h0
 R3ZA==
X-Gm-Message-State: AOJu0YyT+xpSPlqckGLB+KAMNkVPa3iNrNfkzI+1AtmozcoQCvjiIPfD
 VZv7CQx06tQKBF8ULjmmQac4tPTmSUy9Myvez4D6dE43TZFwPoxLUAR3jUwlHtQ4xmbZKlvKYkR
 5e1PcXg==
X-Gm-Gg: ATEYQzzQeFASD8T8NC0f3NkgAOpg85+/xpu/6kMddjR52+vEkC4aFl1hDK9FVIcVWCF
 cwYhYRHu6m92CNB/+ENZCPP2axCsDDU1WY3j6zZKS6khQ9/pIz1fZfCi3uGQPlThAFMn1oTggXJ
 aYlVguZX97HazcpjEtI3fnDt283wBXFvywZZzFJiZ9H1ZZsH+xVD6YmsT2BviwhnLzPt6bDjtXE
 UvUxvcAK/SY3dbIrhuSd1UmIyHn2pV0B8eSg0WYJ2scCIZDJTsd7mf3pdD7YqKUUV+BMZoRJMnw
 nzJrAvGBMskJtfNyEJwnHjbmHFM1TbiVU0vej0J1WMrfDMc21zbz/sj7KSuhoyfNFaTkkgNksVH
 eTtIV8XQ8n/uMPxW2JqAviNE81D6x+cPLdSLoxQix5RkLhd639/cGAu8tAPaIRT3ZrAifqtGXR8
 0W3O6a8FgYQ6SKqiPe2O+W7dIHdXHi5Amh+9TR8pwxnPSDn8MI+A==
X-Received: by 2002:a5d:5848:0:b0:439:936b:c006 with SMTP id
 ffacd0b85a97d-439cfd76e29mr17517838f8f.20.1772897985207; 
 Sat, 07 Mar 2026 07:39:45 -0800 (PST)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8ec97sm13052912f8f.5.2026.03.07.07.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 07:39:44 -0800 (PST)
To: buildroot@busybox.net
Date: Sat,  7 Mar 2026 16:39:28 +0100
Message-ID: <20260307153929.384884-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1772897986; x=1773502786; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w+MznOoSbG+LUje3+t/GjaBKJ1fgwwqyn6bI64Zp/4w=;
 b=aNeMImR+xd0H71+f8aSDlPE1uTz9Ao/EkgjIX0nC6dKeaxmmFQv2T7lOmuled4oL5i
 BDv8jJ7bg3cKGGnrkyV5WnDDwWc1mhyyAju7//SMt2ZAGkwm/r8wI7ifRdAj3iLND/PA
 R4chJR7GmvIBhKne+2krDyZE5ey9E+/eOXtfxgcSPf9t02JqXT2DEnil8oX5kmbqGyii
 /7FFY13u7u3LBe6lTDqBoPr2aWplyOv7AjzChsIghGfJ77/+YH57T5oq37taJByuyrlN
 K9j+xubO7ZzpXNOPR9d6DJJ9kkNL2WHEU9ILfIa7WU5/p25fi+MdQOTQ+yCVakCAstSz
 HYew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=aNeMImR+
Subject: [Buildroot] [PATCH 1/2] package/ficl: downgrade to version 3.03
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

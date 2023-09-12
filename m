Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64EDEE3F0C
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 305FC8200D;
	Tue, 12 Sep 2023 18:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 305FC8200D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZynY0eQpiQC8; Tue, 12 Sep 2023 18:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77CA181FE4;
	Tue, 12 Sep 2023 18:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77CA181FE4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1029F1BF2A5
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDDFB81FE4
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDDFB81FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYVvqNDtv2eb for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:57:17 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DDAA81FDC
 for <buildroot@busybox.net>; Tue, 12 Sep 2023 18:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DDAA81FDC
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3ff7d73a6feso63455615e9.1
 for <buildroot@busybox.net>; Tue, 12 Sep 2023 11:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694545035; x=1695149835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZRgzRElU4Sq8eNhabr9eBK3wKJ84jwiMdGCNyY0Dq+0=;
 b=X2r4XrgBMdNt3972rmXPE3HWhDbMEhf885uirRmyFHAfUDByewgoLZqazEchKzHhyg
 7yu4gqMfUG7ZJOeJQ6gp+HKAFnDdFt4h7AyMb+P8kdugLG8G7qsbaiVSA8jNfanqz+Nk
 fCvaxxVzt34ZVvuKVilSCRcswFMbVlWlLlwnn0EdI5L4mGxmjTuOjN+Z22rDlcvWMR4E
 HpQUwwa/hnR21q7yIzDYcGN5UBM8b9GZoayAAmbky75cQVpStMfMLu4eUNjARt9D4W7m
 /1Cl4iS2R4QkrnMHWZsP2yu/SlC1L0vSEb8sPiD98ew3h+sBocek9WOszmvee6Y8toew
 PKsw==
X-Gm-Message-State: AOJu0YxRy/Mr3Sy4w/mMiMffYgrddu7LtM052E7oqVeMcgYoXcatj6F8
 NbLkNYbYCr83xprFacre8+9et8xULhs=
X-Google-Smtp-Source: AGHT+IGFOarOujEV9Gc68eEhIWn6R+HbRXfQIMZy7huCHuaOd2goXDR58FEixPNJUheOEd/31B6awQ==
X-Received: by 2002:a05:600c:d7:b0:402:f55e:ac11 with SMTP id
 u23-20020a05600c00d700b00402f55eac11mr247463wmm.20.1694545035162; 
 Tue, 12 Sep 2023 11:57:15 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 z20-20020a1c4c14000000b00402e942561fsm16805967wmf.38.2023.09.12.11.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 11:57:14 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Sep 2023 20:57:06 +0200
Message-Id: <20230912185706.2605439-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694545035; x=1695149835; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRgzRElU4Sq8eNhabr9eBK3wKJ84jwiMdGCNyY0Dq+0=;
 b=slPRybnm6APX3zdjyqlx5SVY7qsnY77lZSUOWevRz/isIusvlnmotWyrIFapKkVNI5
 HL0G9P4mi/QY2G3NqOfOOOajg4ZBTegPYIP3cLAdCu3YOJQEXs0qr+zne4vFX/2m1VmF
 RZFOsb2uct4FwDTQUY+ZTZ4W7fqJgAn+qEf3vuqGYDi8D8id0uLh8RGn/i/SPGfKs1ba
 c1y79Y2b7UG/nfFK5N/wFCkXyGnbWYviXDj7jCgkVQOgZ4h5rz0BO3i8VTgJ4JKFxqb5
 Va0yAGJ3e/Nglda36p99HSAnNhHmtyrRqCR5NGzaET67zDDei5oH/EHh7Q5w1uJNRAGx
 2ETg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=slPRybnm
Subject: [Buildroot] [PATCH v2] package/luajit: bump to version
 41fb94defa8f830ce69a8122b03f6ac3216d392a
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The LuaJIT project switches to a rolling release scheme.
Now, the version contains the timestamp of its latest commit.

The timestamp can be seen in build log:
==== Successfully installed LuaJIT 2.1.1693350652 to /usr ====

diff COPYRIGHT:
    -Copyright (C) 2005-2022 Mike Pall. All rights reserved.
    +Copyright (C) 2005-2023 Mike Pall. All rights reserved.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/0001-no-bin-symlink.patch |  4 ++--
 package/luajit/0002-install-inc.patch    |  6 +++---
 package/luajit/luajit.hash               |  4 ++--
 package/luajit/luajit.mk                 | 12 +++++++++++-
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index dc36fa58d..ea0e5bf8d 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -45,8 +45,7 @@
+@@ -50,8 +50,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SOSHORT1= libluajit-$(ABIVER).so
  INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
-@@ -61,7 +60,6 @@
+@@ -66,7 +65,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 8de777dce..163a5d36f 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -6,12 +6,12 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -33,7 +33,7 @@
+@@ -38,7 +38,7 @@
  INSTALL_BIN=   $(DPREFIX)/bin
  INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
  INSTALL_SHARE= $(DPREFIX)/share
--INSTALL_DEFINC= $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
+-INSTALL_DEFINC= $(DPREFIX)/include/luajit-$(MMVERSION)
 +INSTALL_DEFINC= $(DPREFIX)/include
  INSTALL_INC=   $(INSTALL_DEFINC)
  
- INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(VERSION)
+ INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(MMVERSION)
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 049f8c2fc..578bb7a3e 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  835035b244c3dc3d3d19bdd5ac623af90b84207e6330fb78f9fa51d6e200d760  luajit-8635cbabf3094c4d8bd00578c7d812bea87bb2d3.tar.gz
+sha256  b518721280390e4cec1af30f6819d86756ce4234d82410a55a4e121855f64e08  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a.tar.gz
 
 # Locally calculated
-sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
+sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 2a27aa505..07cb6e015 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
+LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
@@ -33,6 +33,16 @@ LUAJIT_HOST_CC = $(HOSTCC) -m32
 LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
+# emulation of git archive with .gitattributes & export-subst
+# Timestamp of the $(LUAJIT_VERSION) commit, obtained in the LuaJit
+# repo, with:   git show -s --format=%ct $(LUAJIT_VERSION)
+define LUAJIT_ROLLING_VERSION
+	echo 1693350652 >$(@D)/.relver
+endef
+
+LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_ROLLING_VERSION
+HOST_LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_ROLLING_VERSION
+
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
 # build system uses non conventional variable names.
 define LUAJIT_BUILD_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

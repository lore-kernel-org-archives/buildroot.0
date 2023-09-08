Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A9AEE57D5
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 06:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25AE982015;
	Fri,  8 Sep 2023 06:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AE982015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vp7REfQUevVk; Fri,  8 Sep 2023 06:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AC6581FB8;
	Fri,  8 Sep 2023 06:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC6581FB8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 975DC1BF397
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 06:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E4EE818D7
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 06:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E4EE818D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6yzyV-jncxL for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 06:49:55 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE19D81871
 for <buildroot@busybox.net>; Fri,  8 Sep 2023 06:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE19D81871
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401bbfc05fcso19267615e9.3
 for <buildroot@busybox.net>; Thu, 07 Sep 2023 23:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694155793; x=1694760593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZa3lY6U11RxixUprpjtf5VP9EZo829zrltE7er3cus=;
 b=ln6jDPZBnqrmd7guTMx3GroqYB9R8t6IT9mgB3Ps5kAzh/kmHldtwwNamgViYREV5+
 OceUCjQ9fMXLBoEDjKkzKLsTOP2KCdN0ixc+vvSoOcpKDw9uM3vwk8ybEJFPFVR9203K
 gfZ6uYsOndzECAJb9GwCaI4741ckeqRiDQInebhAvhtsoTDY5GlImPO0pEt344YtWKTs
 tpvetpN//zhrOAilOqj/mpwcc1Qbb1RmTGZf/Eqlm0nijWKywT8qT5teqjfgZUXPrfoU
 q9JSAvDYh5ePJVm32WVTkE3te9dyN9v9BIhYwNssk6jPWdfF24GvCLLa/t0j+4fXMYgt
 rQUA==
X-Gm-Message-State: AOJu0YyLB6wKAm/HuPaW7060BuKB1n+nIStVIapd6LcI/dCWQbnzHi0f
 jSgQryzeFmBO0YGPswWhqdOWcXuldH0=
X-Google-Smtp-Source: AGHT+IEBQsL/JMoAnvKgNX3e/RL9PSP/j8VFR5g/y+iHK2Lz6Dl4GpP7kKFhKlqJ9lpihkNTV4vDIQ==
X-Received: by 2002:a1c:7912:0:b0:401:bf56:8baf with SMTP id
 l18-20020a1c7912000000b00401bf568bafmr1322100wme.8.1694155792625; 
 Thu, 07 Sep 2023 23:49:52 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 g10-20020a5d540a000000b003176c6e87b1sm1221874wrv.81.2023.09.07.23.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 23:49:52 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  8 Sep 2023 08:49:44 +0200
Message-Id: <20230908064944.2558686-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694155793; x=1694760593; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GZa3lY6U11RxixUprpjtf5VP9EZo829zrltE7er3cus=;
 b=k0jXfpIhfujylfLUGl+ckRyTEBGRoxi5p1T7TtIu84YFexd2jbB1kUfz8HU7WOPqyC
 K3YlC0lHNvpyPh5VY5L2KCpncXAGT6f98WiA5m0Jg5ttGSWi7LYrVxOJK7b2U3oODluN
 CPFnsM/Ud0OnxylD96LNx9vGn2s5BoV7lsrx+aUrY9iEYHE/xwU3oDS2x9xvz4y33SXY
 /v9R0yERoffQ+U9MAbxK7RcKs857aDzWpVZPWm0o3Knh1l5JJxpJ7ux04G8boHtUvxJD
 P2IDNFNcqLS4eBQcwBywvt/0OUDv9CS0T+2mwzhk9aYIlxHqEIe0EBazQ8jWgijC+pkF
 j9sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k0jXfpIh
Subject: [Buildroot] [PATCH] package/luajit: bump to version
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
Now, the version contains the timestamp of the latest commit.
So, we need to switch to the SITE_METHOD to git.

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
 package/luajit/luajit.mk                 | 13 +++++++++++--
 4 files changed, 18 insertions(+), 9 deletions(-)

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
index 049f8c2fc..9e5060ea8 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  835035b244c3dc3d3d19bdd5ac623af90b84207e6330fb78f9fa51d6e200d760  luajit-8635cbabf3094c4d8bd00578c7d812bea87bb2d3.tar.gz
+sha256  1f43430957ea2889ea736d610cf449e9ac6d7140252a697803fccc1aeff241b5  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a-br1.tar.gz
 
 # Locally calculated
-sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
+sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 2a27aa505..db3bdc913 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
-LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
+LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
+LUAJIT_SITE_METHOD = git
+LUAJIT_SITE = https://github.com/LuaJIT/LuaJIT.git
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 LUAJIT_CPE_ID_VENDOR = luajit
@@ -33,6 +34,14 @@ LUAJIT_HOST_CC = $(HOSTCC) -m32
 LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
+# emulation of git archive with .gitattributes & export-subst
+define LUAJIT_ROLLING_VERSION
+	cd $(LUAJIT_DL_DIR)/git && $(GIT) show -s --format=%ct $(LUAJIT_VERSION) > $(@D)/.relver
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

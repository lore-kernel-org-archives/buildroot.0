Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B947BC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 17:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6700D415BD;
	Fri, 17 Jan 2025 17:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEfQrEBpCy7u; Fri, 17 Jan 2025 17:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E9041812
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E9041812;
	Fri, 17 Jan 2025 17:46:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27ABCB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 17:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0819883AB9
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 17:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwyaFlcETwUu for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 17:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC17783976
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC17783976
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC17783976
 for <buildroot@busybox.net>; Fri, 17 Jan 2025 17:46:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso22958385e9.1
 for <buildroot@busybox.net>; Fri, 17 Jan 2025 09:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737135980; x=1737740780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZF3UCeZhM538j9DJVsjs8DmF5VICZSHNkDS5jC+hFg=;
 b=jBVH7a+ftoj3os8+lu2u/cLxuxlwctBu2Wq5lXsf3Von8DCQkE87ITGnz7N+f2Sx4A
 0q5+mTLuQCT1dobQeu83e12ZkNRLmUHyAm9Xem04g0WQNMnX1MEhsEQD2nWRSAAFglVN
 52GxpyNLtrZFWeT0A5fuF4aiF8SvcXblgpPS1odcKXG99r48guJm41mKEiBJIjxCiquU
 IAYV/YMq/9dnyqxXwkI8l3HiUrYZfIlRHR5YSQc2GGG3EnEVmOePXhy4TNelqs5aTpqg
 VHLaRFXPYdhCwFpvxaPIq5mFRkTCRh3UvUTlqusNvfWfytANrvg0eP0eVLEfhUoVsF4x
 7dPg==
X-Gm-Message-State: AOJu0Ywka571bK9Hl44bTvSsQoqHJrJJmkjgbCLCqHSqaBtLy2KxmZwh
 UPtScYDUp6WXyin6WMWCqz3eTw6jB9rHVXtTXHHxuEtVdOzkZaHfgWXV25TIasOhy7lbiTbZrpu
 G1g==
X-Gm-Gg: ASbGncsOeE3TxnM9eriH7uM5MsqLliJi2E0JaRQlJ3dMxoR3udV39xtOFVqmRcuu5XB
 f1wBHLE5xdr0T+o8x7e5RmFJZeXMLfXTb0HlxBmmmsRpgG+rwyGiBqr5fD52iEaw2uEXFcvRohS
 tGUfEttqEFD0fmWYbxsTh7lDIkmks9b0WaMXXtpMHs4oLjFNtsAAxECneoOIi4VscbL14TjMTbR
 j3I8NZGZTsv7NqB4Jkiz9cXsDhhmJ25VkowR5qzHvmvEMtMUn71VkYOBr1HMkzu/8fUdDRc/1p5
 oha0Uk3mQ77k2rA=
X-Google-Smtp-Source: AGHT+IEqK90YAFufvUeW+fA6ShHgzkcnRKemJ2DwWa+Shp80AfGiJxC9i9SfrUcbGX6rFIE8zCNHLA==
X-Received: by 2002:a5d:438c:0:b0:38a:2b39:679d with SMTP id
 ffacd0b85a97d-38bf57a9d66mr2935375f8f.32.1737135979866; 
 Fri, 17 Jan 2025 09:46:19 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32151e6sm3014604f8f.20.2025.01.17.09.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 09:46:19 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 17 Jan 2025 18:46:11 +0100
Message-ID: <20250117174611.2612416-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1737135980; x=1737740780; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rZF3UCeZhM538j9DJVsjs8DmF5VICZSHNkDS5jC+hFg=;
 b=mDQpr/4///buErJZwtNfAUwpiYHIW0xffIy0XgizTWIjvi5cTfEgfYi7rTdFxvw9zv
 RmiwTNIpbDVNm70anX7jy+xszN262QaAMKYVwR//ydvqmldWEciC1rJNxhwH36fOnJHd
 NbvHno040fknqlLArgwqpckW4frMU1kaYT05e2IQskUYK2unU1D3Y+X7b2BB0b4XOhmA
 eGUa8E8qjghZhzDgGKoOuZZQDNeGWdQnpxwPsKR6p7Y+2GKGzLwyhhAZ2U4dy7RyQ+bi
 orlutZpY0a7g+cpzIqLW/g7L3SAfOof6MjCA5FK6n+WMFEVOO/yI3HcQip1RDwVX76vo
 IEog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=mDQpr/4/
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 a4f56a459a588ae768801074b46ba0adcfb49eb1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
    -Copyright (C) 2005-2023 Mike Pall. All rights reserved.
    +Copyright (C) 2005-2025 Mike Pall. All rights reserved.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/0001-no-bin-symlink.patch | 4 ++--
 package/luajit/0002-install-inc.patch    | 8 ++++----
 package/luajit/luajit.hash               | 4 ++--
 package/luajit/luajit.mk                 | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index ea0e5bf8d..3141d2adb 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -50,8 +50,7 @@
+@@ -51,8 +51,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SOSHORT1= libluajit-$(ABIVER).so
  INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
-@@ -66,7 +65,6 @@
+@@ -67,7 +66,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index eec77a5f8..ff4d169af 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -6,12 +6,12 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -38,7 +38,7 @@
- INSTALL_BIN=   $(DPREFIX)/bin
+@@ -39,7 +39,7 @@
  INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
- INSTALL_SHARE= $(DPREFIX)/share
+ INSTALL_SHARE_= $(PREFIX)/share
+ INSTALL_SHARE= $(DESTDIR)$(INSTALL_SHARE_)
 -INSTALL_DEFINC= $(DPREFIX)/include/luajit-$(MMVERSION)
 +INSTALL_DEFINC= $(DPREFIX)/include
  INSTALL_INC=   $(INSTALL_DEFINC)
  
- export INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(MMVERSION)
+ export INSTALL_LJLIBD= $(INSTALL_SHARE_)/luajit-$(MMVERSION)
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index eddd2a241..e14bcc906 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cbf1647acbd340c62b9c342dae43290762efa1b26d8bf8457f143fabf8ed86c7  luajit-97813fb924edf822455f91a5fbbdfdb349e5984f.tar.gz
+sha256  b4120332a4191db9c9da2d81f9f11f0d4504fc4cff2dea0f642d3d8f1fcebd0e  luajit-a4f56a459a588ae768801074b46ba0adcfb49eb1.tar.gz
 
 # Locally calculated
-sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
+sha256  5b79fb4754728487cf43d55b213bb68369912484f2dd7ab68380435e994bce39  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 301973db7..b030a16cf 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 97813fb924edf822455f91a5fbbdfdb349e5984f
+LUAJIT_VERSION = a4f56a459a588ae768801074b46ba0adcfb49eb1
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

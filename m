Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2C0C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF5C415BD;
	Thu, 15 May 2025 12:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXnWFzPo4vbk; Thu, 15 May 2025 12:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CCC141516
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CCC141516;
	Thu, 15 May 2025 12:10:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B363213D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A065A6114A
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiTTqFlSP_4t for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 999E261128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 999E261128
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 999E261128
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f6f86580ecso179399a12.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311033; x=1747915833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eaiaCXD9U48HeZ6c9aI0ka9W+fwYgvbCfKvpu55jI6U=;
 b=DaFhNzCuyY0aNEkocAtg3wMLaMtsxkGffVU1t5E8zvJZ4v+ZMlU8bIdqy14hXtPiYU
 bEpkkcFVwVidDA7BtR8a9s/N64OTEXgQg6OznvhC8CmykihptgYQ2smaPQU0LgjtjnzR
 0xk2fTQNwqmwIVDKJahUS6qWkrvbJI+oy92Gu/v3uOBb6a9osW1V9bjyxUyuZslWpyS4
 r0AVlUyw6i1JgLWgFNJk+yUmdX2sqzwRo5H7RLtCrhsTExs8OJMOdVOPaiatVwffoi0t
 5SZIp5f1F6WiSDLM6W3vk26rT8O0qS6bFoxM6ebECvcxb8Kz4JW/d0XxOqf2ev1yJY0j
 stJw==
X-Gm-Message-State: AOJu0YxpV+bMtPJGNGYcixeyu1MZEnEaPUuMuU/p4TUe3q9o/pScthJG
 UI3/POSNSA8TDtqiJqys5CLPtcPL1l3WLd3JXWLLzG20oMfnNp8UO7gPZ10/N7uV3AIioeTfgJF
 l
X-Gm-Gg: ASbGncuphvHD+uw3IP9n3zHvhES8gp10vAzdC+CE+GrNttNQaNlyEQFQlOYUUAmKkok
 DB3a5GMxUHXGaVbK+GOKxCG+Rbbn6mHWz4PPFdw1OgHXt9gHJ2qesfqUrM49leLzpXnmZo2QqiH
 SQGLjlph07vd5nJz+uHF3T5rgaE/tkRfUkNsZxR0coarlB6AzOzY9pvnI6M7jPZ1/Q9s2W1JHDm
 h0St2dImmUVEHOrtTed677iMGvMH5YeT/TbObNzmsdDNdRSrZKgxXy243bHTDiOv+necckHb4cT
 7W9VNkRa3n2az3KohT6BXEstMfXQLj3jSpSlA78fOV0BTjpJV1F13ZwAAbgkZdFRPA6qmX+VLF0
 BujcMWyIqT0uUg7YEwieXxXlpiKtOW9EQIlB56KbPzdSye3XxYUHkzKRZAehu/kWB9+VPkh6bQV
 7S3klQBEjnUShLiYP8qzWz
X-Google-Smtp-Source: AGHT+IH+1WTIN8yLgx5M+JY3lXvDRMNYZfgF6Ir96QbdiNpU299+OSgBXdjMOkvfc/AV8HvCtlcCSg==
X-Received: by 2002:a05:6402:2743:b0:5fa:a224:f3f1 with SMTP id
 4fb4d7f45d1cf-5ff98898a3dmr2320848a12.2.1747311033292; 
 Thu, 15 May 2025 05:10:33 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:32 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:19 +0200
Message-ID: <20250515121027.561571-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311033; x=1747915833;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eaiaCXD9U48HeZ6c9aI0ka9W+fwYgvbCfKvpu55jI6U=;
 b=rXIH75TcBUNNPaU4KTlenLq8wxPBaXShMacJpOyuLG8LC0ilolxv2nabbm6ViobAAg
 s39nRyfOftzwRKNLphD7in+TFNqZg9IEegg1/aAduWcGnJCOrQAwH/PMF0SME+lnftxE
 0YUh8TYrdOQAr+NsdYIHypFyYv3C63MgNGKWY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rXIH75Tc
Subject: [Buildroot] [PATCH 02/10] package/libsepol: bump to version 3.8.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
    - SELinux policy version 34 is available starting with kernel 6.14.
    - Updated 0001-support-static-only.patch to apply cleanly and changed
      the email address from aduskett@gmail.com to
      adam.duskett@amarulasolutions.com
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../libsepol/0001-support-static-only.patch   | 39 +++++++++++--------
 package/libsepol/Config.in                    |  2 +
 package/libsepol/libsepol.hash                |  2 +-
 package/libsepol/libsepol.mk                  |  2 +-
 4 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
index b3eb608f7b..7a614d7d0d 100644
--- a/package/libsepol/0001-support-static-only.patch
+++ b/package/libsepol/0001-support-static-only.patch
@@ -1,6 +1,6 @@
 From 2140db697c7f1da2a0a3f7bbcb14c1a0dade84e5 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 9 Oct 2017 16:28:12 -0400
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Wed, 14 May 2025 16:32:53 +0200
 Subject: [PATCH] Add support for static-only build
 
 Instead of unconditionally building shared libraries, this patch
@@ -10,17 +10,19 @@ libraries. It allows to support cases where the target architecture
 does not have support for shared libraries.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Updated for 3.8.1]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Update for 2.8]
 ---
- src/Makefile | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
+ src/Makefile | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
 
-diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
---- libsepol-2.7.orig/src/Makefile	2018-01-15 21:07:51.285183415 +0100
-+++ libsepol-2.7/src/Makefile	2018-01-15 21:08:56.515182717 +0100
-@@ -39,7 +39,12 @@
+diff --git a/src/Makefile b/src/Makefile
+index 71fa3ed..efb81bc 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -45,7 +45,12 @@ LDFLAGS += -undefined dynamic_lookup
  LN=gln
  endif
  
@@ -34,14 +36,17 @@ diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
  
  
  $(LIBA):  $(OBJS)
-@@ -81,8 +86,10 @@
+@@ -87,8 +92,10 @@ endif
  install: all
-	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
-	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
+ 	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
+ 	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
 +ifeq ($(STATIC),)
-	test -d $(DESTDIR)$(SHLIBDIR) || install -m 755 -d $(DESTDIR)$(SHLIBDIR)
-	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
+ 	test -d $(DESTDIR)$(SHLIBDIR) || install -m 755 -d $(DESTDIR)$(SHLIBDIR)
+ 	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
 +endif
-	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
-	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
-	$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
+ 	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
+ 	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
+ 	$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
+-- 
+2.49.0
+
diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 5dfd1a41d3..5b0832009c 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_LIBSEPOL
 
 config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	int "Policy version"
+	default 34 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	default 33 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
 	default 32 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
@@ -32,6 +33,7 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	  >= 4.13 < 5.5    31
 	  >= 5.5 < 5.8     32
 	  >= 5.8           33
+	  >= 6.14          34
 
 endif
 
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index dcc67ac638..adf7cb86bb 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  cd741e25244e7ef6cd934d633614131a266c3eaeab33d8bfa45e8a93b45cc901  libsepol-3.7.tar.gz
+sha256  0e78705305f955abd4c0654d37a5477ee26349ab74db9e2b03a7868897ae1ddf  libsepol-3.8.1.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index af14778ead..2376ab852d 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.7
+LIBSEPOL_VERSION = 3.8.1
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

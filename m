Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1CFC433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 20:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE6D606E6;
	Sun, 23 Oct 2022 20:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE6D606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_fMnEZ2Wq72; Sun, 23 Oct 2022 20:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53AE6068B;
	Sun, 23 Oct 2022 20:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53AE6068B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2D061BF38D
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4D14027C
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC4D14027C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jdVRWEiMZ_nL for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 20:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E824027A
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56E824027A
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 20:40:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bp11so12534552wrb.9
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 13:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4DQucoT4KAXzuv66QtOxO2AnZsr7K/BQQtX8cxQj/cg=;
 b=DtVv62VkR247pD/88EwiOYTYg223lJVahCoVm0IUELXKfmWRetMpcCXa8U25CqaK0j
 CfRJ1Xc29yH2D2dUUIcqMi2F7CWjt4gUnJIBwJXWpP9Se8VsuYCdo+mklJvOTrts9Y2i
 JBV7TcWJLHRV3NFRnjd/8lYn1adD/GmoEjbBE6bvRTd4dTOy12uJq0RQBTqTMqHU2ATS
 8fbxyOCtAAfjIdr2do9DA4QtETcyTcVAIpeHG+D6XDxKulKTKkSYxzp9l5vrIaXJUZYj
 CeSKBbI7Aa+wSn1c3wLBCHoAqfW3UOlDnlFOZujeWHglv6XaNZs4px9vEffEHFdfowET
 KkUg==
X-Gm-Message-State: ACrzQf2zVtSsSYCj7O9UGdlhO1+gyGkArGZE6PiI45t99nTnzupDCIIM
 n+6ca69cIQZ1T16BTcKIXZpjJATrAKE=
X-Google-Smtp-Source: AMsMyM7nAxwDZ6u0sk17Pui9KT68fy0d1UK9j74IRzPJDSke4wF1h7K3fbzbTjnoVIkH2CyAMtngFA==
X-Received: by 2002:a5d:4008:0:b0:235:a4c4:97c2 with SMTP id
 n8-20020a5d4008000000b00235a4c497c2mr13360769wrp.295.1666557649019; 
 Sun, 23 Oct 2022 13:40:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d4e8e000000b0023655e51c14sm6739069wru.32.2022.10.23.13.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 13:40:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 22:40:44 +0200
Message-Id: <20221023204044.23467-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4DQucoT4KAXzuv66QtOxO2AnZsr7K/BQQtX8cxQj/cg=;
 b=hKCT2jD5Q8ikZGxO9fvDHC3MMQj800GZokxhkzq17eb6xwHyvUeNG/WaZQmIpdmuw2
 YL5T900EmGVypJK74x2jeZTORXrOLJaCW/JlmcW4K1Dx6VxOBd8sru2ePm5nfbUytqtT
 LKgWAYU8I3r03j7yfPb1saEqx0DSyWWASZS8n2IcjAFdJZxUvoCrDQpdjssuNObYDTMD
 07kwLSoJh6EdjSNYzXwmqBuxy1MRPsUX1HqD3ZN48Gp4IOZEANglSQC5jdAfZgsblScv
 NZ5QkBwpeU/57ZK3nciXJ37fGhMtgT7ftLLUqKgaAexFsE4dxeZiQYpBrZJEO1cwVwGl
 kE5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hKCT2jD5
Subject: [Buildroot] [PATCH 1/1] package/libshout: bump to version 2.4.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version) and so autoreconf
- libvorbis is optional since
  https://gitlab.xiph.org/xiph/icecast-libshout/-/commit/181ac9f3f51825077194599f5c4621fa323b1b7f

https://gitlab.xiph.org/xiph/icecast-libshout/-/blob/v2.4.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re.ac-add-an-option-to-disable-tools.patch | 51 -------------------
 package/libshout/Config.in                    |  1 -
 package/libshout/libshout.hash                |  4 +-
 package/libshout/libshout.mk                  | 13 +++--
 4 files changed, 11 insertions(+), 58 deletions(-)
 delete mode 100644 package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch

diff --git a/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch b/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch
deleted file mode 100644
index 5c20db72e9..0000000000
--- a/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 148b56bf894192cef6dd133715e295260b934a71 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 5 Mar 2021 15:50:32 +0100
-Subject: [PATCH] configure.ac: add an option to disable tools
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.xiph.org/xiph/icecast-libshout/-/issues/2331]
----
- Makefile.am  | 5 ++++-
- configure.ac | 5 +++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ea855cf..79241f1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,10 +3,13 @@
- AUTOMAKE_OPTIONS = 1.6 foreign
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = include src doc win32 tools
-+SUBDIRS = include src doc win32
- if HAVE_EXAMPLES
- SUBDIRS += examples
- endif
-+if HAVE_TOOLS
-+SUBDIRS += tools
-+endif
- 
- EXTRA_DIST = INSTALL m4/shout.m4 m4/acx_pthread.m4 \
- 	m4/ogg.m4 m4/vorbis.m4 m4/xiph_compiler.m4 m4/xiph_net.m4 \
-diff --git a/configure.ac b/configure.ac
-index 264b9b0..34f971c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -100,6 +100,11 @@ AC_ARG_ENABLE([examples],
-   AS_HELP_STRING([--disable-examples],[Do not build example code]))
- AM_CONDITIONAL([HAVE_EXAMPLES],[test "${enable_examples}" != "no"])
- 
-+dnl Allow tools not to be build
-+AC_ARG_ENABLE([tools],
-+  AS_HELP_STRING([--disable-tools],[Do not build tools]))
-+AM_CONDITIONAL([HAVE_TOOLS],[test "${enable_tools}" != "no"])
-+
- dnl Module checks
- XIPH_NET
- 
--- 
-2.30.0
-
diff --git a/package/libshout/Config.in b/package/libshout/Config.in
index f8749b9183..6a7560b349 100644
--- a/package/libshout/Config.in
+++ b/package/libshout/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBSHOUT
 	bool "libshout"
 	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_LIBVORBIS
 	help
 	  Libshout is a library for communicating with and sending data
 	  to an icecast server. It handles the socket connection, the
diff --git a/package/libshout/libshout.hash b/package/libshout/libshout.hash
index ae43e0a9c8..d562b5231b 100644
--- a/package/libshout/libshout.hash
+++ b/package/libshout/libshout.hash
@@ -1,8 +1,8 @@
 # From https://ftp.osuosl.org/pub/xiph/releases/libshout/SHA512SUMS
-sha512  290844185da16961f03434d3e341573dd6cb0139e5fa81902903021b641382d2629302d7c356bc591b35656754e07f4e44a8d9e782e092b17a051b9ae8f54341  libshout-2.4.5.tar.gz
+sha512  e8478cdbf9a27674c16a7b620d1576f2e31a47262b8e29b314d0f46d4e5be24b9a29790b7b226f48939bc34cacf5734fae0aa5686c7ed5879cdbd827ff8e0339  libshout-2.4.6.tar.gz
 
 # From https://ftp.osuosl.org/pub/xiph/releases/libshout/SHA256SUMS
-sha256  d9e568668a673994ebe3f1eb5f2bee06e3236a5db92b8d0c487e1c0f886a6890  libshout-2.4.5.tar.gz
+sha256  39cbd4f0efdfddc9755d88217e47f8f2d7108fa767f9d58a2ba26a16d8f7c910  libshout-2.4.6.tar.gz
 
 # Hash for license file
 sha256  7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852  COPYING
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 4afb762de6..be63786795 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBSHOUT_VERSION = 2.4.5
+LIBSHOUT_VERSION = 2.4.6
 LIBSHOUT_SITE = https://downloads.xiph.org/releases/libshout
 LIBSHOUT_LICENSE = LGPL-2.0+
 LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
-LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
-# We're patching configure.ac
-LIBSHOUT_AUTORECONF = YES
+LIBSHOUT_DEPENDENCIES = host-pkgconf libogg
 LIBSHOUT_CONF_OPTS = \
 	--disable-examples \
 	--disable-tools
@@ -23,6 +21,13 @@ else
 LIBSHOUT_CONF_OPTS += --disable-theora
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+LIBSHOUT_CONF_OPTS += --enable-vorbis
+LIBSHOUT_DEPENDENCIES += libvorbis
+else
+LIBSHOUT_CONF_OPTS += --disable-vorbis
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 LIBSHOUT_CONF_OPTS += --enable-speex
 LIBSHOUT_DEPENDENCIES += speex
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

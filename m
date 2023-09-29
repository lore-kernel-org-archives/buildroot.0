Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14FAE728C4
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 16:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79BEF4061C;
	Fri, 29 Sep 2023 16:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79BEF4061C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xxEunRxTMfY; Fri, 29 Sep 2023 16:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B69141C81;
	Fri, 29 Sep 2023 16:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B69141C81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 723371BF27E
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C22D60BD0
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C22D60BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWgKDEn7V9QC for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 16:12:19 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F11DF60ADD
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11DF60ADD
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40651a72807so20583925e9.1
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 09:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696003936; x=1696608736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4uTcT2yjolUvPqMX1/6iQH5DiUTE0aauVCpbBgfd4P4=;
 b=MHBkwWP8QNJzB7UL+54xGWxj/mXwgxZtfanRLS7PLRdcJgCmSLBDjloXp/CqJEOv1h
 a6sTZ1CpCncHF70C/afrxGbbF3CbqbHMLEp/W9YMvejbekseCam7rrk0ATnGW1kLXU95
 xyxk3aj8mvNnfgUlj9Th3J8ERaHZKR6FqdBqUdXRWo/8WZOF/DOK6LqSZyjYJ9vHllBv
 3jpdp5dWOKfYVov1UhAQuYbGYZz1VM8q2C8UyphdRgH0QJGTonCtpcvn7eJrmdOJkmtM
 y+pSBG6ZoB/2bEeT0xmYbz3fnoAaBTlVrGyDU8qX0mOqKjK1Mon37GYPaRVhFSIiz+4D
 LqiQ==
X-Gm-Message-State: AOJu0Yyt4dobMIxfw9Xesd0qL+Y/lJDAxqro+uuJKCY0L3WxhUfeIrcq
 hTx3MnBvZxJlLj5Hwgg7bcE5XYYSQIs=
X-Google-Smtp-Source: AGHT+IGfuj0MDRmKgB58T7VoWn2eST/o70tAtMu0B4ssnYAvv28yGRQK/IgdTI8VdnR1m+7LsTYA5w==
X-Received: by 2002:a7b:c398:0:b0:3f9:b430:199b with SMTP id
 s24-20020a7bc398000000b003f9b430199bmr4172729wmj.15.1696003936325; 
 Fri, 29 Sep 2023 09:12:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g8-20020a7bc4c8000000b003fc02e8ea68sm1711391wmk.13.2023.09.29.09.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 09:12:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 18:12:08 +0200
Message-Id: <20230929161208.1106775-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929161208.1106775-1-fontaine.fabrice@gmail.com>
References: <20230929161208.1106775-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696003936; x=1696608736; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4uTcT2yjolUvPqMX1/6iQH5DiUTE0aauVCpbBgfd4P4=;
 b=fRBhooEjtnLPctOT4Ky4fW8QjkfoTwh/wOcLsYwmDD/5u8gn/54YDpdmMCrz1vxNaY
 Dq5mji2flJeL+6I/6yy0nDO0J9b6voMD54hBfl1DoBdeMY07hbREX1Ynxm9BbdKfWhUI
 ETmvW9otR7mvRAnKFcMq20m3r4D6G4jQO81YZRxO5037Jw8G1f4QuoNOrJtmbd0oXJ6W
 B7PP/jSTTB7+DpPqakKTK3zNmcwSDkT6rxcebxZtNze1aqQOVymOIN4w1w2/AKO0sFrm
 dY/TZ/7CGWItQqksLuf2Qc63y1p4+vXVR/DrE2jw6tInwja8HLUytm0OSKchWgs17vAs
 W1WA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fRBhooEj
Subject: [Buildroot] [PATCH 2/2] package/powertop: bump to version 2.15
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
Cc: Steven Noonan <steven@uplinklabs.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site to get latest version
- Replace patch by an upstreamable one

https://github.com/fenrus75/powertop/compare/v2.13...v2.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...1-add-disable-stack-protector-option.patch | 55 +++++++++++++++++++
 ...dont-force-stack-smashing-protection.patch | 18 ------
 package/powertop/Config.in                    |  2 +-
 package/powertop/powertop.hash                |  6 +-
 package/powertop/powertop.mk                  | 16 ++++--
 6 files changed, 70 insertions(+), 28 deletions(-)
 create mode 100644 package/powertop/0001-add-disable-stack-protector-option.patch
 delete mode 100644 package/powertop/0001-dont-force-stack-smashing-protection.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0c7fae9409..d6873fb5a3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1110,7 +1110,6 @@ package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch Upstream
 package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch Upstream
 package/postgresql/S50postgresql Variables
-package/powertop/0001-dont-force-stack-smashing-protection.patch Upstream
 package/pppd/0001-pppd-Fix-compilation-with-older-glibc-or-kernel-headers.patch Upstream
 package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch Upstream
 package/pptp-linux/0001-susv3-legacy.patch Upstream
diff --git a/package/powertop/0001-add-disable-stack-protector-option.patch b/package/powertop/0001-add-disable-stack-protector-option.patch
new file mode 100644
index 0000000000..01a030522d
--- /dev/null
+++ b/package/powertop/0001-add-disable-stack-protector-option.patch
@@ -0,0 +1,55 @@
+From 95382246ddd889839633aa0da800a03936b93986 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 31 Oct 2021 18:26:01 +0100
+Subject: [PATCH] add --disable-stack-protector option
+
+Allow the user to disable stack-protector as not all toolchains support
+this feature
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/fenrus75/powertop/pull/138
+---
+ configure.ac    | 4 ++++
+ src/Makefile.am | 5 ++++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 37c1304..69160d5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,6 +43,10 @@ AX_ADD_FORTIFY_SOURCE
+ AX_CXX_COMPILE_STDCXX([11], [noext], [mandatory])
+ PKG_PROG_PKG_CONFIG
+ 
++AC_ARG_ENABLE([stack-protector],
++	AS_HELP_STRING([--disable-stack-protector], [Disable stack-protector]))
++AM_CONDITIONAL([ENABLE_STACK_PROTECTOR], [test x$enable_stack_protector != xno])
++
+ # Checks for libraries.
+ AX_PTHREAD([
+     LIBS="$PTHREAD_LIBS $LIBS"
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 6b523f6..ca30d20 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -138,13 +138,16 @@ powertop_CXXFLAGS = \
+ 	-Wformat \
+ 	-Wshadow \
+ 	-fno-omit-frame-pointer \
+-	-fstack-protector \
+ 	$(GLIB2_CFLAGS) \
+ 	$(LIBNL_CFLAGS) \
+ 	$(NCURSES_CFLAGS) \
+ 	$(PCIUTILS_CFLAGS) \
+ 	$(PTHREAD_CFLAGS)
+ 
++if ENABLE_STACK_PROTECTOR
++powertop_CXXFLAGS += \
++	-fstack-protector
++endif
+ 
+ powertop_CPPFLAGS = \
+ 	-DLOCALEDIR=\"$(localedir)\" \
+-- 
+2.33.0
+
diff --git a/package/powertop/0001-dont-force-stack-smashing-protection.patch b/package/powertop/0001-dont-force-stack-smashing-protection.patch
deleted file mode 100644
index 75ed2d1c24..0000000000
--- a/package/powertop/0001-dont-force-stack-smashing-protection.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Do not pass -fstack-protector unconditionally
-
-Using -fstack-protector only works when the toolchain has SSP support.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/Makefile.am
-===================================================================
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -127,7 +127,6 @@
- 	-Wformat \
- 	-Wshadow \
- 	-fno-omit-frame-pointer \
--	-fstack-protector \
- 	$(GLIB2_CFLAGS) \
- 	$(LIBNL_CFLAGS) \
- 	$(NCURSES_CFLAGS) \
diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index fd88a3d0eb..2f7ba2bb9d 100644
--- a/package/powertop/Config.in
+++ b/package/powertop/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_POWERTOP
 	  A tool to diagnose issues with power consumption and power
 	  management
 
-	  https://01.org/powertop/
+	  https://github.com/fenrus75/powertop/
 
 comment "powertop needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/powertop/powertop.hash b/package/powertop/powertop.hash
index fc8f3cc52f..810b80a514 100644
--- a/package/powertop/powertop.hash
+++ b/package/powertop/powertop.hash
@@ -1,5 +1,3 @@
-# Locally calculated after checking pgp signature
-# https://01.org/sites/default/files/downloads/powertop-2.13.tar.gz.asc.txt
-# using key 22E8F306C8FA4BAA2A5F36F3A0303B060918941C
-sha256  a65f992ca4a419bc73b623651060eb9fc00c5a86fa03556358cd9db011ef3178  powertop-2.13.tar.gz
+# Locally calculated
+sha256  e58ab3fd7b8ff5f4dd0d17f11848817e7d83c0a6918145ac81de03b5dccf8f49  powertop-2.15.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 681f5fda46..41403b0918 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -4,16 +4,24 @@
 #
 ################################################################################
 
-POWERTOP_VERSION = 2.13
-POWERTOP_SITE = https://01.org/sites/default/files/downloads
-POWERTOP_DEPENDENCIES = ncurses libnl host-pkgconf \
+POWERTOP_VERSION = 2.15
+POWERTOP_SITE = $(call github,fenrus75,powertop,v$(POWERTOP_VERSION))
+POWERTOP_DEPENDENCIES = host-autoconf-archive ncurses libnl host-pkgconf \
 	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
 	$(TARGET_NLS_DEPENDENCIES)
 POWERTOP_LICENSE = GPL-2.0
 POWERTOP_LICENSE_FILES = COPYING
 POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-# 0001-dont-force-stack-smashing-protection.patch
+POWERTOP_CONF_OPTS = --disable-stack-protector
+# 0001-add-disable-stack-protector-option.patch
 POWERTOP_AUTORECONF = YES
+POWERTOP_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+
+# fix missing config.rpath (needed for autoreconf) in the codebase
+define POWERTOP_TOUCH_CONFIG_RPATH
+	touch $(@D)/config.rpath
+endef
+POWERTOP_PRE_CONFIGURE_HOOKS += POWERTOP_TOUCH_CONFIG_RPATH
 
 # Help powertop at finding the right ncurses library depending on
 # which one is available.
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

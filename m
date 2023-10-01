Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982FBE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 15:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F9F881F16;
	Sun,  1 Oct 2023 15:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F9F881F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kd_6RUUft-qb; Sun,  1 Oct 2023 15:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4252181F4A;
	Sun,  1 Oct 2023 15:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4252181F4A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE0141BF42E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94C3B41B4A
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C3B41B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0zGR2qlf2RB for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 15:38:12 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F205141B39
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 15:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F205141B39
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4065dea9a33so21618155e9.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 08:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696174689; x=1696779489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sPyeKhCL3dpe8Lmg+rBaopHmpa229pg87g55d+WQ7IU=;
 b=o5tF7GJWczdiuJvdPaPq1/b/HSVEBdDScdZH7xmqmnlWNVi3YEzyuAc6PM4PmaZwav
 ilFksH5glXF149fc3iGcLafqCUw8tdOCCENWZjc+DPrQ9mLMgTDjVU/AktO2QZt7jojX
 Hvun9vvCNg3jF0QCMTnjPfY+UfJEMbLyQTqqkFFu24c70/t47Zv2P2hguXh8e++1x9J5
 rkrc4poJyKHCj6UvdrLO8sJcEsCttU7yCA6Mt4FqDVXOOKwUecz/gHFi4n/SGsPAl3p/
 HIUh9PJAjMuIspVAal7kU0Ues2NzYs2aCTH6OC2XfPzCLzru4JrGCliSep7NrLYJLNRg
 qQ7A==
X-Gm-Message-State: AOJu0YwDn4OVrXua86R2rVYwngOS91mulDTw+y4SNLG+miNZDP41rL2f
 axSW6dezkwgx0jbR/PNub6hnX6HKRgA=
X-Google-Smtp-Source: AGHT+IFYHiwQQNUEtDDIHU98wChwi3Sr3tUPBHJENBpc5vgPVN74oui01uSJTqXRwE4KwPBewCDRmg==
X-Received: by 2002:a05:600c:378c:b0:3fe:2a98:a24c with SMTP id
 o12-20020a05600c378c00b003fe2a98a24cmr7805654wmr.26.1696174689436; 
 Sun, 01 Oct 2023 08:38:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n20-20020a1c7214000000b003fee567235bsm5482542wmc.1.2023.10.01.08.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 08:38:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 17:38:01 +0200
Message-Id: <20231001153801.1123445-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696174689; x=1696779489; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sPyeKhCL3dpe8Lmg+rBaopHmpa229pg87g55d+WQ7IU=;
 b=g/jwJMZY64cAvLjb1zOqmABY7fJ4GQJJHObkajmjVhepQAmJKM5vb1oIliphkQsG7Y
 Pjky5lPTcnc2Dc6hHPso8XSEQbOaRmjfPC1dx/UGk2k9DrdMvh/i2VDTSQ5VJhmqbG9e
 h748KcG5airLjf+zLLo9Cwat4ENfGXpkeySUMmCfHEBiCFfzZ8p6e5ycvPzmiFcsnGi7
 NQVOzWwQbDhIZ4T8Mp/I6sjykSx/q+yUV6/WcVR8PwerLukntZKbx5uZ+Q9GWxAFL4nz
 86kh/SlrNJp4bwH00AilOm0ukJyzcwE0F9n8kq/m174oZrMwHXIWa5w7NC27/8z5WtMF
 KX2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g/jwJMZY
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: bump to version
 1.7.0
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

- Use official tarball
- Drop patch (already in version)
- Add patch to fix build failure

https://github.com/kravietz/pam_tacplus/blob/v1.7.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...0001-Add-an-option-to-disable-Werror.patch | 55 -------------------
 .../0001-Remove-conflicting-man-flag.patch    | 23 ++++++++
 package/libpam-tacplus/libpam-tacplus.hash    |  2 +-
 package/libpam-tacplus/libpam-tacplus.mk      |  8 +--
 5 files changed, 28 insertions(+), 61 deletions(-)
 delete mode 100644 package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch
 create mode 100644 package/libpam-tacplus/0001-Remove-conflicting-man-flag.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 445bd63827..a9cf6e475f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -731,7 +731,6 @@ package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf
 package/liboping/0004-Fix-compile-error-on-GCC-7.patch Upstream
 package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch Upstream
 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch Upstream
-package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch Upstream
 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch Upstream
 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
diff --git a/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch b/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch
deleted file mode 100644
index 80da2f35b4..0000000000
--- a/package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 88c78901503d50d0a62d85c96994ca4d67ab61e0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 13 Nov 2020 20:50:27 +0100
-Subject: [PATCH] Add an option to disable -Werror
-
-Allow the user to disable -Werror to avoid the following build failure
-with gcc 4.8:
-
-libtac/lib/magic.c:138:13: error: ignoring return value of 'read', declared with attribute warn_unused_result [-Werror=unused-result]
-             (void) read(rfd, &seed, sizeof(seed));
-             ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/5c17226f12eba104d907693ec37fc101cc6d447f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.am  | 6 +++++-
- configure.ac | 3 +++
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0be3cdb..4a137e9 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -8,7 +8,11 @@
- 
- ACLOCAL_AMFLAGS = -I config
- AUTOMAKE_OPTIONS = subdir-objects
--AM_CFLAGS = -Wall -Wextra -Werror
-+AM_CFLAGS = -Wall -Wextra
-+
-+if ENABLE_WERROR
-+AM_CFLAGS += -Werror
-+endif
- 
- if TACC
- bin_PROGRAMS = tacc
-diff --git a/configure.ac b/configure.ac
-index d0c5eba..dd8a966 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -100,6 +100,9 @@ AC_SUBST(pamdir)
- AC_ARG_ENABLE(doc, AS_HELP_STRING([--disable-doc], [do not build docs]))
- AM_CONDITIONAL(DOC, test "x$enable_doc" != "xno")
- 
-+AC_ARG_ENABLE(werror, AS_HELP_STRING([--disable-werror], [do not build with -Werror]))
-+AM_CONDITIONAL(ENABLE_WERROR, test "x$enable_werror" != "xno")
-+
- dnl --------------------------------------------------------------------
- dnl Switch for run-time debugging
- AC_ARG_ENABLE(runtime-debugging, [AS_HELP_STRING([--enable-runtime-debugging],
--- 
-2.28.0
-
diff --git a/package/libpam-tacplus/0001-Remove-conflicting-man-flag.patch b/package/libpam-tacplus/0001-Remove-conflicting-man-flag.patch
new file mode 100644
index 0000000000..a832366cb1
--- /dev/null
+++ b/package/libpam-tacplus/0001-Remove-conflicting-man-flag.patch
@@ -0,0 +1,23 @@
+From 104044848ffb0a283e1f1bf3466693fa4af450e9 Mon Sep 17 00:00:00 2001
+From: Pawel Krawczyk <p+github@krvtz.net>
+Date: Mon, 7 Nov 2022 22:10:52 +0000
+Subject: [PATCH] Remove conflicting man flag
+
+Upstream: https://github.com/kravietz/pam_tacplus/commit/104044848ffb0a283e1f1bf3466693fa4af450e9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a481d7a..ef2b92b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -15,7 +15,6 @@ bin_PROGRAMS = tacc
+ tacc_SOURCES = tacc.c
+ tacc_LDADD = libtac.la $(LTLIBINTL) $(LIB_CRYPTO)  $(LIB_GETRANDOM)
+ tacc_CFLAGS = $(AM_CFLAGS) -I $(top_srcdir)/libtac/include @rt_debug_defines@ -I $(top_srcdir)/lib
+-dist_man_MANS = tacc.1
+ man1_MANS = tacc.1
+ 
+ lib_LTLIBRARIES = libtac.la
diff --git a/package/libpam-tacplus/libpam-tacplus.hash b/package/libpam-tacplus/libpam-tacplus.hash
index 084a3e54a4..fc1db9fef7 100644
--- a/package/libpam-tacplus/libpam-tacplus.hash
+++ b/package/libpam-tacplus/libpam-tacplus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73961800dc0d5e422751ad4c9f09b1863ab33e381e0bdb2a1d0343dcfc30e44e  libpam-tacplus-1.6.1.tar.gz
+sha256  cf00e27b687c1fafe4b2cf35e648116e99e9c9832718a0d3b479bcf43370adf4  pam_tacplus-1.7.0.tar.gz
 sha256  b2b961f07e97c4fb78074276da304ea36b85dc299aae5efb79080cedaea3d5ac  COPYING
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index ff0dce9c0b..044b7207f9 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBPAM_TACPLUS_VERSION = 1.6.1
-LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,v$(LIBPAM_TACPLUS_VERSION))
+LIBPAM_TACPLUS_VERSION = 1.7.0
+LIBPAM_TACPLUS_SOURCE = pam_tacplus-$(LIBPAM_TACPLUS_VERSION).tar.gz
+LIBPAM_TACPLUS_SITE = https://github.com/kravietz/pam_tacplus/releases/download/v$(LIBPAM_TACPLUS_VERSION)
 LIBPAM_TACPLUS_LICENSE = GPL-2.0+
 LIBPAM_TACPLUS_LICENSE_FILES = COPYING
 LIBPAM_TACPLUS_CPE_ID_VENDOR = pam_tacplus_project
@@ -13,8 +14,7 @@ LIBPAM_TACPLUS_CPE_ID_PRODUCT = pam_tacplus
 LIBPAM_TACPLUS_DEPENDENCIES = \
 	linux-pam \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
-# Fetching from github, we need to generate the configure script
-# 0001-Add-an-option-to-disable-Werror.patch
+# We're patching Makefile.am
 LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
 LIBPAM_TACPLUS_CONF_ENV = \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

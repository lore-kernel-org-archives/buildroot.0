Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEDDEEAA7B
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 22:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC12E405D1;
	Thu, 14 Sep 2023 22:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC12E405D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzOnLwP8Jxl9; Thu, 14 Sep 2023 22:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA46240A8B;
	Thu, 14 Sep 2023 22:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA46240A8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7230F1BF5A4
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BB6B405CB
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 22:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB6B405CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_blw1UE_R5q for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 22:06:57 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2AB84029B
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 22:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2AB84029B
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso1348573f8f.0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 15:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694729214; x=1695334014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mPi8qk8i4M97U4LXPynjKpQhzUbPdPK1Ds0YQ/T9qqc=;
 b=r8p2lZPpQUo0YFe7lMdDxz8Qa50vML8rWM6KxD5QnMyERRG0SWOg9otR9tfIRDMy4o
 rKpj0ILugHwo9dHhypRkCJhBM/tAnM4agz+Kaydzs2bHAldO7+xiUA7Ix4mR+xczqaT1
 C2ANnfP/ajL/gmAytAXizKs6WzQBOprF9Kc5gFh1wuezB8CFYCbeCiQFQObpGHAWyw3b
 P4LKrdq//CEv9vFBf2kDCFIAw0BSvYZYkfidTO/hYQ37JahENcjPj+2gSazttSREINz7
 7JSADw6WgT1CV+NMXqrFMdK1rnUKx6YIxZaDuVfeMH/nGWRTUqsfTXxuk/hENYcqNd1P
 wcwg==
X-Gm-Message-State: AOJu0YxRulFuxwoPeyztmHGbEa/BJ8EDds+Ly8tJ/TbCK8fSHMPSfoHt
 jfTxaPpmtEiGE6MwSHJb/iKKrY09GoA=
X-Google-Smtp-Source: AGHT+IGrQdpN73s4pGd2OvotmvA32yy9RgikK5TJqLdYcLzEJV9uXO7CkqXCoaJGzKRCdgHL9pe+zg==
X-Received: by 2002:a5d:61c4:0:b0:313:e971:53af with SMTP id
 q4-20020a5d61c4000000b00313e97153afmr5966574wrv.32.1694729214301; 
 Thu, 14 Sep 2023 15:06:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e11-20020a056000120b00b003196b1bb528sm2806281wrx.64.2023.09.14.15.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 15:06:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 00:06:48 +0200
Message-Id: <20230914220648.357408-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694729214; x=1695334014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mPi8qk8i4M97U4LXPynjKpQhzUbPdPK1Ds0YQ/T9qqc=;
 b=h/xuPgXOg9gDsAWSWNNMAgcaIo9wGJx/bN6pJEfqoytrcIobLYW++VtY73wdNeaIth
 qBWKP2OU7t77boHQyPyjVhSaVyk23S1le9aQlw6y/TuGD+HMjkQj2ZLGwdGy3B4aWxgK
 23JEhrZJWaV+87nGwzDPKAYzCwNe8ETuGIlfJLCUjvdpv81WpNVruvctDGMUdb6FtpKS
 IsCKs+ohvIuxiUswN+wvgdvoCza8QyHFtJVGRuuvMTy03I7xK0pqynyUlIKkS77UWkCZ
 fFYaSotON6rlcHBlsSBE4lSt1mjxMdKR6sQGyYqYOv4lOYiw5Zn04GCYaE02urKi+yzU
 IBfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=h/xuPgXO
Subject: [Buildroot] [PATCH 1/1] package/libqb: security bump to version
 2.0.8
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2023-39976: log_blackbox.c in libqb before 2.0.8 allows a
  buffer overflow via long log messages because the header size is not
  considered.
- Drop patch (already in version) and so autoreconf

https://github.com/ClusterLabs/libqb/compare/v2.0.6...v2.0.8
https://github.com/ClusterLabs/libqb/releases/tag/v2.0.7
https://github.com/ClusterLabs/libqb/releases/tag/v2.0.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 .../libqb/0001-Add-disable-tests-option.patch | 62 -------------------
 package/libqb/libqb.hash                      |  4 +-
 package/libqb/libqb.mk                        |  4 +-
 4 files changed, 3 insertions(+), 68 deletions(-)
 delete mode 100644 package/libqb/0001-Add-disable-tests-option.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index fde8eceed2..929b972a43 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -746,7 +746,6 @@ package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch Upstream
 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch Upstream
 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
-package/libqb/0001-Add-disable-tests-option.patch Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch Upstream
 package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch Upstream
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch Upstream
diff --git a/package/libqb/0001-Add-disable-tests-option.patch b/package/libqb/0001-Add-disable-tests-option.patch
deleted file mode 100644
index 1afb05520d..0000000000
--- a/package/libqb/0001-Add-disable-tests-option.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 051d9cfe8f365e30affc6476ed79b9e04a6b15ad Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 4 Nov 2022 00:27:50 +0100
-Subject: [PATCH] Add --disable-tests option
-
-Add --disable-tests to allow the user to disable tests. As a
-side-effect, this will avoid the following build failure when check is
-found:
-
-libstat_wrapper.c:11:10: fatal error: gnu/lib-names.h: No such file or directory
-   11 | #include <gnu/lib-names.h>
-      |          ^~~~~~~~~~~~~~~~~
-
-This build failure is raised since version 2.0.5 and
-https://github.com/ClusterLabs/libqb/commit/78df90b180740712d0c90b6d982b78241cc99d72
-
-Fixes:
- - http://autobuild.buildroot.org/results/450cfc36d4fd6dc71c138bec45f05b5a2d92a08d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ClusterLabs/libqb/pull/475]
----
- Makefile.am  | 6 +++++-
- configure.ac | 5 +++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index a08b1d2..6a710a0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -39,7 +39,11 @@ ACLOCAL_AMFLAGS		= -I m4
- 
- dist_doc_DATA		= COPYING INSTALL README.markdown
- 
--SUBDIRS			= include lib doxygen2man docs tools tests examples
-+SUBDIRS			= include lib doxygen2man docs tools examples
-+
-+if ENABLE_TESTS
-+SUBDIRS			+= tests
-+endif
- 
- dist-clean-local:
- 	rm -f .snapshot-version autoconf automake autoheader
-diff --git a/configure.ac b/configure.ac
-index ac44b7e..4946008 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -562,6 +562,11 @@ AC_ARG_WITH([force-sockets-config-file],
- 	[ FORCESOCKETSFILE="$withval" ],
- 	[ FORCESOCKETSFILE="$sysconfdir/libqb/force-filesystem-sockets" ])
- 
-+AC_ARG_ENABLE([tests],
-+  [AS_HELP_STRING([--disable-tests],[disable tests])],,
-+  [ enable_tests="yes" ])
-+AM_CONDITIONAL([ENABLE_TESTS], [test x$enable_tests = xyes])
-+
- AC_ARG_ENABLE([install-tests],
-   [AS_HELP_STRING([--enable-install-tests],[install tests])],,
-   [ enable_install_tests="no" ])
--- 
-2.35.1
-
diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
index de247c2660..f7006ff10e 100644
--- a/package/libqb/libqb.hash
+++ b/package/libqb/libqb.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.6/libqb-2.0.6.sha256
-sha256  f1e744208e8f69934804c14e05d9707668f99d4867de9cccf2f7a6bf4d48331c  libqb-2.0.6.tar.xz
+# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.8/libqb-2.0.8.sha256
+sha256  b42531fc20b8ac02f4c6d0a4dc49f7c4a1eef09bdb13af5f6927b7fc49522ee6  libqb-2.0.8.tar.xz
 
 # Locally calculated
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index 65d68181ee..11b5788b45 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQB_VERSION = 2.0.6
+LIBQB_VERSION = 2.0.8
 LIBQB_SOURCE = libqb-$(LIBQB_VERSION).tar.xz
 LIBQB_SITE = \
 	https://github.com/ClusterLabs/libqb/releases/download/v$(LIBQB_VERSION)
@@ -12,8 +12,6 @@ LIBQB_LICENSE = LGPL-2.1+
 LIBQB_LICENSE_FILES = COPYING
 LIBQB_CPE_ID_VENDOR = clusterlabs
 LIBQB_INSTALL_STAGING = YES
-# We're patching configure.ac
-LIBQB_AUTORECONF = YES
 LIBQB_CONF_OPTS = --disable-tests
 LIBQB_DEPENDENCIES = libxml2
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9F3C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA6040491;
	Tue, 23 Jul 2024 10:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fP2lEYvdmAmm; Tue, 23 Jul 2024 10:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05DE24043D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05DE24043D;
	Tue, 23 Jul 2024 10:48:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A82131BF20D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93E1780E8C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCEQSvkrfOOg for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFEFD80DE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEFD80DE1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFEFD80DE1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:48:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso40142775e9.2
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 03:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721731725; x=1722336525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wGCP6KsLUqoa8erFSw14bbxcB2XWwcDesAwBslt/cYU=;
 b=oXsfJSl6zqdNWoluBLyALht/DbIo4yiztDFn22A3TvJ1zvfKnGt23yl3gr1gV63KBr
 aRWeJ81VK4v1GH8QJsAPS4aZv4brUFNfXYktiK6oAYB71r936IOE9WifKprifKhGcntX
 lfAo5oWsB0xI1oo8/f600H2hlE1zy0QhzjHCEL1HZmZIo/nK3btXMzwohba3sevj99RA
 9KkBEBv8DVK4NmfR4pVUF3003ve5hrgkfte2YfbP2fxwsMQxXadBSVT8kLrWNea1p20/
 RqwpMi0ZMZJYlkHsadsLSAyqsCuBdxUxpFxho0ZRbVe5mtbqRa92o6fBeQInF9ESyyHa
 Cb6w==
X-Gm-Message-State: AOJu0YygCoyYdtg1CRBTJ1BP6EEDPjChnv327O9Tbgo3FlH5huQF/QUb
 8cW3/jst6hd6WEIUME9IL7AMUIRiHeeSQ0Xeao4CLwD1THA41TInGsLrgA==
X-Google-Smtp-Source: AGHT+IGNEUWZHUra/1UhMTkmNLwddCQDWjHKnZsaV8aJUUzT3zcynkQeekHGogHPRnOEqR4sHaJSgA==
X-Received: by 2002:a5d:52d0:0:b0:367:89d3:5d4f with SMTP id
 ffacd0b85a97d-369dec04763mr1398689f8f.12.1721731725314; 
 Tue, 23 Jul 2024 03:48:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f69bc9d7sm455555e9.4.2024.07.23.03.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 03:48:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:48:41 +0200
Message-ID: <20240723104841.9239-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721731725; x=1722336525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wGCP6KsLUqoa8erFSw14bbxcB2XWwcDesAwBslt/cYU=;
 b=SLNeXFKtR3UIcbL+sUHmUP3+Tc6PbOEsX/f173SS6qF4A0fH2TucI71hHpulAyHsLr
 ajc/VtpuOAM/oahXiabkHaJD1yPzmIduy30iCOxRI7UNWE24t1QA8IV2yvWtv4mh7/8p
 L/9RYXT6D7S75qHY2BPtl1XMieiGditRoGGNNQbQ4bXm5WYpruwVz6nmEPQQeh6B+bbG
 0UL5O6zLSlTxCUBurZHpbgN2nk8plwMPWnJDPfpkh0W9ytnYR+DU0cIasTdK9jqWnZ7N
 HV+w9qg675PXgnoE87Y8YOlaqUf446G/rHh0ePV49wMKd+AYY2KTxISqnURGDwn/pZJR
 Gsdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SLNeXFKt
Subject: [Buildroot] [PATCH 1/1] package/gamin: drop package
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As advocated by Thomas Petazzoni [1], drop gamin as package is not
maintained anymore.

This will also avoid the following build failure with gcc 14:

gam_api.c: In function 'gamin_get_user_name':
gam_api.c:123:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
  123 |         strncpy(user_name, pw->pw_name, 99);
      |         ^~~~~~~

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240723085645.732060-1-fontaine.fabrice@gmail.com/

Fixes:
 - http://autobuild.buildroot.org/results/b267f53ba6035d256c013dbbbbd1bcdfe0ef111f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  3 -
 Config.in.legacy                              |  7 +++
 package/gamin/0001-no-abstract-sockets.patch  | 61 -------------------
 package/gamin/0002-no-const-return.patch      | 57 -----------------
 ...x-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch | 39 ------------
 package/gamin/Config.in                       | 14 -----
 package/gamin/gamin.hash                      |  3 -
 package/gamin/gamin.mk                        | 21 -------
 package/samba4/samba4.mk                      |  8 +--
 9 files changed, 8 insertions(+), 205 deletions(-)
 delete mode 100644 package/gamin/0001-no-abstract-sockets.patch
 delete mode 100644 package/gamin/0002-no-const-return.patch
 delete mode 100644 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
 delete mode 100644 package/gamin/Config.in
 delete mode 100644 package/gamin/gamin.hash
 delete mode 100644 package/gamin/gamin.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index b042873aa3..a4492ae09b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -562,9 +562,6 @@ package/ftop/0001-overflow.patch lib_patch.Upstream
 package/fwts/0001-build-do-not-use-Werror.patch lib_patch.Upstream
 package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch lib_patch.Upstream
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
-package/gamin/0001-no-abstract-sockets.patch lib_patch.Upstream
-package/gamin/0002-no-const-return.patch lib_patch.Sob lib_patch.Upstream
-package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch lib_patch.Upstream
 package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 414a14944e..94ac60b668 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_GAMIN
+	bool "gamin package removed"
+	select BR2_LEGACY
+	help
+	  The gamin package was removed as it is not maintained
+	  anymore (no commit since 2016).
+
 config BR2_PACKAGE_CAIRO_SVG
 	bool "cairo svg support"
 	select BR2_LEGACY
diff --git a/package/gamin/0001-no-abstract-sockets.patch b/package/gamin/0001-no-abstract-sockets.patch
deleted file mode 100644
index 3d659015ec..0000000000
--- a/package/gamin/0001-no-abstract-sockets.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-[PATCH]: Remove abstract socket namespace check breaking cross compilation
-
-Taken from openembedded:
-
-http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/gamin/files/no-abstract-sockets.patch
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---- /tmp/configure.in	2007-04-30 13:08:49.000000000 +0200
-+++ gamin-0.1.8/configure.in	2007-04-30 13:10:53.285251000 +0200
-@@ -354,51 +354,6 @@
-     AC_DEFINE(HAVE_CMSGCRED,1,[Have cmsgcred structure])
- fi
- 
--#### Abstract sockets
--
--AC_MSG_CHECKING(abstract socket namespace)
--AC_LANG_PUSH(C)
--AC_RUN_IFELSE([AC_LANG_PROGRAM(
--[[
--#include <sys/types.h>
--#include <stdlib.h>
--#include <string.h>
--#include <stdio.h>
--#include <sys/socket.h>
--#include <sys/un.h>
--#include <errno.h>
--]],
--[[
--  int listen_fd;
--  struct sockaddr_un addr;
--  
--  listen_fd = socket (PF_UNIX, SOCK_STREAM, 0);
--  
--  if (listen_fd < 0)
--    {
--      fprintf (stderr, "socket() failed: %s\n", strerror (errno));
--      exit (1);
--    }
--
--  memset (&addr, '\0', sizeof (addr));
--  addr.sun_family = AF_UNIX;
--  strcpy (addr.sun_path, "X/tmp/dbus-fake-socket-path-used-in-configure-test");
--  addr.sun_path[0] = '\0'; /* this is what makes it abstract */
--  
--  if (bind (listen_fd, (struct sockaddr*) &addr, SUN_LEN (&addr)) < 0)
--    {
--       fprintf (stderr, "Abstract socket namespace bind() failed: %s\n", 
--                strerror (errno));
--       exit (1);
--    }
--  else 
--    exit (0);
--]])],
--              [have_abstract_sockets=yes],
--              [have_abstract_sockets=no])
--AC_LANG_POP(C)
--AC_MSG_RESULT($have_abstract_sockets)
--
- if test x$enable_abstract_sockets = xyes; then
-     if test x$have_abstract_sockets = xno; then
- 	AC_MSG_ERROR([Abstract sockets explicitly required, and support not detected.])
diff --git a/package/gamin/0002-no-const-return.patch b/package/gamin/0002-no-const-return.patch
deleted file mode 100644
index 3e6e905214..0000000000
--- a/package/gamin/0002-no-const-return.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
-build failures.
-
-Upstream-Status: Pending
-
-Index: gamin-0.1.10/server/gam_node.c
-===================================================================
---- gamin-0.1.10.orig/server/gam_node.c	2011-10-12 15:25:45.217178314 +0100
-+++ gamin-0.1.10/server/gam_node.c	2011-10-12 15:26:17.807178293 +0100
-@@ -122,7 +122,7 @@
-  * it has finished with the string.  If it must keep it longer, it
-  * should makes its own copy.  The returned string must not be freed.
-  */
--G_CONST_RETURN char *
-+const char *
- gam_node_get_path(GamNode * node)
- {
-     g_assert(node);
-Index: gamin-0.1.10/server/gam_node.h
-===================================================================
---- gamin-0.1.10.orig/server/gam_node.h	2011-10-12 15:25:46.857178269 +0100
-+++ gamin-0.1.10/server/gam_node.h	2011-10-12 15:26:28.637178297 +0100
-@@ -58,7 +58,7 @@
- void                  gam_node_set_is_dir          (GamNode         *node,
- 						   gboolean        is_dir);
- 	
--G_CONST_RETURN char  *gam_node_get_path            (GamNode         *node);
-+const char  *gam_node_get_path            (GamNode         *node);
- 
- GList                *gam_node_get_subscriptions   (GamNode         *node);
- 
-Index: gamin-0.1.10/server/gam_subscription.c
-===================================================================
---- gamin-0.1.10.orig/server/gam_subscription.c	2011-10-12 15:25:40.497177525 +0100
-+++ gamin-0.1.10/server/gam_subscription.c	2011-10-12 15:26:39.867178304 +0100
-@@ -141,7 +141,7 @@
-  * @param sub the GamSubscription
-  * @returns The path being monitored.  It should not be freed.
-  */
--G_CONST_RETURN char *
-+const char *
- gam_subscription_get_path(GamSubscription * sub)
- {
-     if (sub == NULL)
-Index: gamin-0.1.10/server/gam_subscription.h
-===================================================================
---- gamin-0.1.10.orig/server/gam_subscription.h	2011-10-12 15:25:28.507178266 +0100
-+++ gamin-0.1.10/server/gam_subscription.h	2011-10-12 15:25:58.817178285 +0100
-@@ -21,7 +21,7 @@
- 
- int                  gam_subscription_get_reqno    (GamSubscription *sub);
- 
--G_CONST_RETURN char *gam_subscription_get_path     (GamSubscription *sub);
-+const char *gam_subscription_get_path     (GamSubscription *sub);
- 
- GamListener         *gam_subscription_get_listener (GamSubscription *sub);
- 
diff --git a/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch b/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
deleted file mode 100644
index b5f2e6c521..0000000000
--- a/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Fix missing PTHREAD_MUTEX_RECURSIVE_NP
-
-The musl C library does not provide the non portable
-PTHREAD_MUTEX_RECURSIVE_NP. In addition, uClibc does not define it as
-a #define, but as an enum value, so doing a #if defined() check
-doesn't work properly. Instead, add a AC_CHECK_DECL() autoconf check.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Thomas: switch to an autoconf check.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -294,6 +294,10 @@
- 	   AC_DEFINE([HAVE_LIBPTHREAD], [], [Define if pthread library is there (-lpthread)])
- 	   AC_DEFINE([HAVE_PTHREAD_H], [], [Define if <pthread.h> is there])
- 	   WITH_THREADS="1"]))
-+
-+    AC_CHECK_DECL([PTHREAD_MUTEX_RECURSIVE_NP],
-+		[AC_DEFINE([HAVE_PTHREAD_MUTEX_RECURSIVE_NP], [], [whether HAVE_PTHREAD_MUTEX_RECURSIVE_NP is defined])],
-+		[], [#include <pthread.h>])
- fi
- 
- dnl Use weak symbols on linux/gcc to avoid imposing libpthreads to apps
-Index: b/libgamin/gam_data.c
-===================================================================
---- a/libgamin/gam_data.c
-+++ b/libgamin/gam_data.c
-@@ -470,7 +470,7 @@
-     }
-     if (is_threaded > 0) {
- 	pthread_mutexattr_init(&attr);
--#if defined(linux) || defined(PTHREAD_MUTEX_RECURSIVE_NP)
-+#if defined(HAVE_PTHREAD_MUTEX_RECURSIVE_NP)
- 	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
- #else
- 	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
deleted file mode 100644
index 55e037a4a4..0000000000
--- a/package/gamin/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_GAMIN
-	bool "gamin"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  the File Alteration Monitor
-
-	  http://www.gnome.org/~veillard/gamin/sources
-
-comment "gamin needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gamin/gamin.hash b/package/gamin/gamin.hash
deleted file mode 100644
index e28660dded..0000000000
--- a/package/gamin/gamin.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1  gamin-0.1.10.tar.gz
-sha256  7f9ffc38883325f011f331a9d6074ffd0175fbcecd57f69c577fb3845f333876  COPYING
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
deleted file mode 100644
index 4621b1646f..0000000000
--- a/package/gamin/gamin.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# gamin
-#
-################################################################################
-
-GAMIN_VERSION = 0.1.10
-GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
-GAMIN_AUTORECONF = YES
-GAMIN_INSTALL_STAGING = YES
-GAMIN_LICENSE = LGPL-2.0+
-GAMIN_LICENSE_FILES = COPYING
-
-# python support broken
-GAMIN_CONF_OPTS += --without-python
-
-GAMIN_CONF_ENV = have_abstract_sockets=no
-
-GAMIN_DEPENDENCIES = libglib2
-
-$(eval $(autotools-package))
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 126a572c91..c9f025134a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -79,13 +79,6 @@ else
 SAMBA4_CONF_OPTS += --disable-avahi
 endif
 
-ifeq ($(BR2_PACKAGE_GAMIN),y)
-SAMBA4_CONF_OPTS += --with-fam
-SAMBA4_DEPENDENCIES += gamin
-else
-SAMBA4_CONF_OPTS += --without-fam
-endif
-
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
 SAMBA4_CONF_OPTS += --with-libarchive
 SAMBA4_DEPENDENCIES += libarchive
@@ -143,6 +136,7 @@ define SAMBA4_CONFIGURE_CMDS
 			--disable-rpath \
 			--disable-rpath-install \
 			--disable-iprint \
+			--without-fam \
 			--without-pam \
 			--without-dmapi \
 			--without-gpgme \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD79C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:06:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD13560C40
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD13560C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EA8E6065C;
	Sat, 28 Aug 2021 15:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9xipSJ0Z2gC; Sat, 28 Aug 2021 15:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 700C76066D;
	Sat, 28 Aug 2021 15:06:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 337181BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 303B260689
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7m4Y7k9GYo1R for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:06:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D26A16065C
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:06:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q14so15208609wrp.3
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENQzUUtdJ/yUJ/xBBHk04vYnO9yrBQmgp3dhmkgEcro=;
 b=D8BG0GOOLqHCaRmz8d59d8M4OnMfo9uCGdduZyRCQ4vD+zeZGEW/gTCgTlMFQ30LjH
 ZpmHtXRTyop3KYNtyxU58rTEZtQeQPI2Cz5eNzHnue2xzjjjwgCReGGzS1tUhR89uXFA
 AFf7GbbZ0nwxaWYg3+NTUQhbYPS79/c/mCVYg9VjQda8rgKbC8p7dWHce6xqMDlulUkt
 Y0mLeeHmj/iqvAk/VzBKh2vKUpYSysLk4fx4lyGNjF45r+ugbemavcQX8YBnr+1tzCWB
 IkVpl18uB+hzuWTBmyWcbiCIPPrUQOW1bA+vgrqRlO27Je0JOQt4+QvRgvZLeqt/e7Sa
 oAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ENQzUUtdJ/yUJ/xBBHk04vYnO9yrBQmgp3dhmkgEcro=;
 b=qyvnQzmT9UuQMwo4XTxy9NU+3Z8Vs6fRLOzV/5SoeLIjKftkWhwqea1G7/P196axXS
 QsSVjecCo+6I+pFbw0e+7lQmwVHaoBmlZNDlXwnp6QETfq8+ypzeWVTEyqLPADfGGUAj
 aL9nOHE1DmgeaLbhykuyhspuOaUtQzorqXV121d5LC5I7Xt9AaTpRaXc5qF/MQq4+wq/
 cmkGjZ//sz90tqhsAku7GWQdQMxG+gi2Mj8lGJQRhOcjIsU56SE37dCfMrYl54GcVz0d
 Oigv+CcyFDOVdJdiGz5EPkXsX/05RXu2hUUCVDMeh2Wo17N4OlJ5SRJcAxYInSCdQqYA
 KcbA==
X-Gm-Message-State: AOAM530PIwCfB7e97GcbmMIXJLR8v/e7LzTlxPh6qVprDg3xlkp5EIEk
 mDwaeDFPXQ8kAwAxsqLnGo+hR3Q3SWAN5A==
X-Google-Smtp-Source: ABdhPJxIiqiQu3IniuUW7wK8sC8VlugnjPUUDzS2XG4GxVsralOBgXsFlNpSuU9NsjdzeMKRaHatlg==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr15659023wra.245.1630163178834; 
 Sat, 28 Aug 2021 08:06:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id o26sm4089504wmc.17.2021.08.28.08.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 08:06:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:06:03 +0200
Message-Id: <20210828150604.946236-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
References: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/c-ares: fix build with latest nodejs
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with nodejs raised since bump to version
12.22.5 in commit 7038b029d8c8774eca6d7888d6642d7e84ff5165:

../src/cares_wrap.cc:42:11: fatal error: ares_nameser.h: No such file or directory
   42 | # include <ares_nameser.h>
      |           ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a0f867d5e765fc1aa052de5e53ed350b3b20743f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ares_nameser-h-as-a-public-interface.patch | 170 ++++++++++++++++++
 package/c-ares/c-ares.mk                      |   2 +
 2 files changed, 172 insertions(+)
 create mode 100644 package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch

diff --git a/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch b/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
new file mode 100644
index 0000000000..c3ae3daa8d
--- /dev/null
+++ b/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
@@ -0,0 +1,170 @@
+From 7712fcd17847998cf1ee3071284ec50c5b3c1978 Mon Sep 17 00:00:00 2001
+From: Felix Yan <felixonmars@archlinux.org>
+Date: Wed, 18 Aug 2021 01:32:44 +0800
+Subject: [PATCH] Provide ares_nameser.h as a public interface (#417)
+
+NodeJS needs ares_nameser.h as a pubic header.
+
+Fixes: #415
+Fix By: Felix Yan (@felixonmars)
+
+[Retrieved from:
+https://github.com/c-ares/c-ares/commit/7712fcd17847998cf1ee3071284ec50c5b3c1978]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt                      |  6 ++++++
+ configure.ac                        | 14 ++++++++++++++
+ include/CMakeLists.txt              |  2 +-
+ include/Makefile.am                 |  2 +-
+ include/ares_build.h.cmake          |  2 ++
+ include/ares_build.h.in             |  3 +++
+ {src/lib => include}/ares_nameser.h | 10 ++++++----
+ src/lib/Makefile.inc                |  1 -
+ 8 files changed, 33 insertions(+), 7 deletions(-)
+ rename {src/lib => include}/ares_nameser.h (98%)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3f42d145..28f8e01a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -557,6 +557,12 @@ ENDIF()
+ IF (HAVE_WINDOWS_H)
+ 	SET (CARES_HAVE_WINDOWS_H 1)
+ ENDIF()
++IF (HAVE_ARPA_NAMESER_H)
++	SET (CARES_HAVE_ARPA_NAMESER_H 1)
++ENDIF()
++IF (HAVE_ARPA_NAMESER_COMPAT_H)
++	SET (CARES_HAVE_ARPA_NAMESER_COMPAT_H 1)
++ENDIF()
+ 
+ # Record toplevel CMakeLists.txt path
+ set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
+diff --git a/configure.ac b/configure.ac
+index c21b8ff3..1ba8a8ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -547,6 +547,20 @@ dnl *Sigh* these are needed in order for net/if.h to get properly detected.
+ ]
+ )
+ 
++dnl Test and set CARES_HAVE_ARPA_NAMESER_H / CARES_HAVE_ARPA_NAMESER_COMPAT_H
++AC_CHECK_DECL([HAVE_ARPA_NAMESER_H],
++[
++CARES_DEFINE_UNQUOTED([CARES_HAVE_ARPA_NAMESER_H])
++],
++[]
++)
++AC_CHECK_DECL([HAVE_ARPA_NAMESER_COMPAT_H],
++[
++CARES_DEFINE_UNQUOTED([CARES_HAVE_ARPA_NAMESER_COMPAT_H])
++],
++[]
++)
++
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+ AC_TYPE_SIZE_T
+diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
+index 439e7bb2..3321956d 100644
+--- a/include/CMakeLists.txt
++++ b/include/CMakeLists.txt
+@@ -3,6 +3,6 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
+ 
+ # Headers installation target
+ IF (CARES_INSTALL)
+-	SET (CARES_HEADERS ares.h ares_version.h "${PROJECT_BINARY_DIR}/ares_build.h" ares_rules.h ares_dns.h)
++	SET (CARES_HEADERS ares.h ares_version.h "${PROJECT_BINARY_DIR}/ares_build.h" ares_rules.h ares_dns.h ares_nameser.h)
+ 	INSTALL (FILES ${CARES_HEADERS} COMPONENT Devel DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+ ENDIF ()
+diff --git a/include/Makefile.am b/include/Makefile.am
+index 125a686a..d208bece 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -2,6 +2,6 @@ AUTOMAKE_OPTIONS = foreign nostdinc 1.9.6
+ ACLOCAL_AMFLAGS = -I m4 --install
+ 
+ # what headers to install on 'make install':
+-include_HEADERS = ares.h ares_version.h ares_build.h ares_rules.h ares_dns.h
++include_HEADERS = ares.h ares_version.h ares_build.h ares_rules.h ares_dns.h ares_nameser.h
+ 
+ EXTRA_DIST = ares_build.h.cmake ares_build.h.in ares_build.h.dist CMakeLists.txt
+diff --git a/include/ares_build.h.cmake b/include/ares_build.h.cmake
+index ac32d47f..e847f17e 100644
+--- a/include/ares_build.h.cmake
++++ b/include/ares_build.h.cmake
+@@ -13,6 +13,8 @@
+ #cmakedefine CARES_HAVE_WS2TCPIP_H
+ #cmakedefine CARES_HAVE_WINSOCK2_H
+ #cmakedefine CARES_HAVE_WINDOWS_H
++#cmakedefine CARES_HAVE_ARPA_NAMESER_H
++#cmakedefine CARES_HAVE_ARPA_NAMESER_COMPAT_H
+ 
+ #ifdef CARES_HAVE_SYS_TYPES_H
+ #  include <sys/types.h>
+diff --git a/include/ares_build.h.in b/include/ares_build.h.in
+index 24e3a989..20fd28a0 100644
+--- a/include/ares_build.h.in
++++ b/include/ares_build.h.in
+@@ -55,6 +55,9 @@
+    Error Compilation_aborted_CARES_TYPEOF_ARES_SOCKLEN_T_already_defined
+ #endif
+ 
++#undef CARES_HAVE_ARPA_NAMESER_H
++#undef CARES_HAVE_ARPA_NAMESER_COMPAT_H
++
+ /* ================================================================ */
+ /*  EXTERNAL INTERFACE SETTINGS FOR CONFIGURE CAPABLE SYSTEMS ONLY  */
+ /* ================================================================ */
+diff --git a/src/lib/ares_nameser.h b/include/ares_nameser.h
+similarity index 98%
+rename from src/lib/ares_nameser.h
+rename to include/ares_nameser.h
+index 65aebcc1..18a9e5ac 100644
+--- a/src/lib/ares_nameser.h
++++ b/include/ares_nameser.h
+@@ -2,10 +2,12 @@
+ #ifndef ARES_NAMESER_H
+ #define ARES_NAMESER_H
+ 
+-#ifdef HAVE_ARPA_NAMESER_H
++#include "ares_build.h"
++
++#ifdef CARES_HAVE_ARPA_NAMESER_H
+ #  include <arpa/nameser.h>
+ #endif
+-#ifdef HAVE_ARPA_NAMESER_COMPAT_H
++#ifdef CARES_HAVE_ARPA_NAMESER_COMPAT_H
+ #  include <arpa/nameser_compat.h>
+ #endif
+ 
+@@ -68,7 +70,7 @@
+  * provide them
+  * ============================================================================
+  */
+-#ifndef HAVE_ARPA_NAMESER_H
++#ifndef CARES_HAVE_ARPA_NAMESER_H
+ 
+ typedef enum __ns_class {
+     ns_c_invalid = 0,       /* Cookie. */
+@@ -173,7 +175,7 @@ typedef enum __ns_rcode {
+     ns_r_badtime = 18
+ } ns_rcode;
+ 
+-#endif /* HAVE_ARPA_NAMESER_H */
++#endif /* CARES_HAVE_ARPA_NAMESER_H */
+ 
+ 
+ /* ============================================================================
+diff --git a/src/lib/Makefile.inc b/src/lib/Makefile.inc
+index 7426c3de..47bc8cdd 100644
+--- a/src/lib/Makefile.inc
++++ b/src/lib/Makefile.inc
+@@ -73,7 +73,6 @@ HHEADERS = ares_android.h                        \
+   ares_strsplit.h			\
+   ares_writev.h				\
+   bitncmp.h				\
+-  ares_nameser.h			\
+   ares_setup.h				\
+   setup_once.h
+ 
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 3a7c6e0298..761aa73280 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -10,6 +10,8 @@ C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
+# We're patching configure.ac
+C_ARES_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

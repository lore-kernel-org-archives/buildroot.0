Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D31C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:11:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F5360296
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0F5360296
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4404C40554;
	Wed, 27 Oct 2021 19:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Glf4AiDvYbZY; Wed, 27 Oct 2021 19:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691BF40558;
	Wed, 27 Oct 2021 19:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCE41BF333
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BD0181CE9
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8sW4bhthZvbH for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:11:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C229181B72
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:11:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s14so2970758wrb.3
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 12:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQjA2Rk6l84mfwm9xtKyE/pWp80g0ZLg+MtQCFkGewQ=;
 b=PYjcSdvxYFa21ID51yGs1BZCaVInzuSZdascQzbH/8fql27zQ4IXuUgY2+4LO8yLFU
 PVnRmIzx/Xic4FP3MPBFftAJ44Y+QmBXQxZzOLEuTQKb7Iav7+3+02B4JIFmzIGBdzR5
 N/lOfnMdFLKXZaNuJ1MGw8DJVMrqvmkvkAV4b72znXeJIAGBx1N1+w2VLzo0qNJb2yzv
 dlijODRrSeUOevxM9ZbpQcAw4qccxi7qs33k0N9TAXVRPgdxyvQDkfvmE9CQkqGjaViV
 aNPI2wOnfW9ffW586irZk3715AP20AtpwmQGQkDzB3+8tArhSBLsUK7ui8+zMoqmyzJ1
 UraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQjA2Rk6l84mfwm9xtKyE/pWp80g0ZLg+MtQCFkGewQ=;
 b=Rl+GvZApb0PI68E9Yca7iMZ8Dh2M3qUmTqx4YKnzYlvTCYJwlafoSGLamMpaDE/9En
 FrUzQWjKp1BLXbUh97sELHFuLk4moWPRXLekxTg9fxYlpXjYjdsvKiw9N52W1rft45aI
 VHFYLzh5iqX2h/Jt4SHSURZE9otcdXruMThlYKyJtOXGolQt/LcHC5TTKov7gwFkvDYs
 h8k/nodmU4bKXDjRm+4jid2lmqL7Is2zy5vt2sQJHixejS6uiw83p7jsknCgYrioef+j
 /DPIWC2zsuwP8IA7nlCA1NCNkYvQCiSB9XATlmTGZJdg0QVO6mjyYfQzyzaASnscD4CE
 xBMA==
X-Gm-Message-State: AOAM531fH8o+vDlb8hDbCe1ixaaGakklXVBNRjB8NpBploqNPfDLoWbr
 Bi5pQDH+NXWNcw1+KVQtEQ8RTxW72cQ=
X-Google-Smtp-Source: ABdhPJyJKXqZW286Yyfey7Za7R/Y94HvFxILP54nRCcmxrByy+KIBZGYeyxrdVVDRVCCi5QjfOBAgg==
X-Received: by 2002:adf:f252:: with SMTP id b18mr43132870wrp.292.1635361875403; 
 Wed, 27 Oct 2021 12:11:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id 10sm4982700wme.27.2021.10.27.12.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 12:11:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 21:09:34 +0200
Message-Id: <20211027190934.414201-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/c-ares: bump to version 1.18.1
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

Drop patch (already in version) and so autoreconf

https://c-ares.org/changelog.html#1_18_1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Bump to version 1.18.1

 ...ares_nameser-h-as-a-public-interface.patch | 170 ------------------
 package/c-ares/c-ares.hash                    |   2 +-
 package/c-ares/c-ares.mk                      |   4 +-
 3 files changed, 2 insertions(+), 174 deletions(-)
 delete mode 100644 package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch

diff --git a/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch b/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
deleted file mode 100644
index c3ae3daa8d..0000000000
--- a/package/c-ares/0001-Provide-ares_nameser-h-as-a-public-interface.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From 7712fcd17847998cf1ee3071284ec50c5b3c1978 Mon Sep 17 00:00:00 2001
-From: Felix Yan <felixonmars@archlinux.org>
-Date: Wed, 18 Aug 2021 01:32:44 +0800
-Subject: [PATCH] Provide ares_nameser.h as a public interface (#417)
-
-NodeJS needs ares_nameser.h as a pubic header.
-
-Fixes: #415
-Fix By: Felix Yan (@felixonmars)
-
-[Retrieved from:
-https://github.com/c-ares/c-ares/commit/7712fcd17847998cf1ee3071284ec50c5b3c1978]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt                      |  6 ++++++
- configure.ac                        | 14 ++++++++++++++
- include/CMakeLists.txt              |  2 +-
- include/Makefile.am                 |  2 +-
- include/ares_build.h.cmake          |  2 ++
- include/ares_build.h.in             |  3 +++
- {src/lib => include}/ares_nameser.h | 10 ++++++----
- src/lib/Makefile.inc                |  1 -
- 8 files changed, 33 insertions(+), 7 deletions(-)
- rename {src/lib => include}/ares_nameser.h (98%)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3f42d145..28f8e01a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -557,6 +557,12 @@ ENDIF()
- IF (HAVE_WINDOWS_H)
- 	SET (CARES_HAVE_WINDOWS_H 1)
- ENDIF()
-+IF (HAVE_ARPA_NAMESER_H)
-+	SET (CARES_HAVE_ARPA_NAMESER_H 1)
-+ENDIF()
-+IF (HAVE_ARPA_NAMESER_COMPAT_H)
-+	SET (CARES_HAVE_ARPA_NAMESER_COMPAT_H 1)
-+ENDIF()
- 
- # Record toplevel CMakeLists.txt path
- set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
-diff --git a/configure.ac b/configure.ac
-index c21b8ff3..1ba8a8ec 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -547,6 +547,20 @@ dnl *Sigh* these are needed in order for net/if.h to get properly detected.
- ]
- )
- 
-+dnl Test and set CARES_HAVE_ARPA_NAMESER_H / CARES_HAVE_ARPA_NAMESER_COMPAT_H
-+AC_CHECK_DECL([HAVE_ARPA_NAMESER_H],
-+[
-+CARES_DEFINE_UNQUOTED([CARES_HAVE_ARPA_NAMESER_H])
-+],
-+[]
-+)
-+AC_CHECK_DECL([HAVE_ARPA_NAMESER_COMPAT_H],
-+[
-+CARES_DEFINE_UNQUOTED([CARES_HAVE_ARPA_NAMESER_COMPAT_H])
-+],
-+[]
-+)
-+
- dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
- AC_TYPE_SIZE_T
-diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
-index 439e7bb2..3321956d 100644
---- a/include/CMakeLists.txt
-+++ b/include/CMakeLists.txt
-@@ -3,6 +3,6 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
- 
- # Headers installation target
- IF (CARES_INSTALL)
--	SET (CARES_HEADERS ares.h ares_version.h "${PROJECT_BINARY_DIR}/ares_build.h" ares_rules.h ares_dns.h)
-+	SET (CARES_HEADERS ares.h ares_version.h "${PROJECT_BINARY_DIR}/ares_build.h" ares_rules.h ares_dns.h ares_nameser.h)
- 	INSTALL (FILES ${CARES_HEADERS} COMPONENT Devel DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
- ENDIF ()
-diff --git a/include/Makefile.am b/include/Makefile.am
-index 125a686a..d208bece 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -2,6 +2,6 @@ AUTOMAKE_OPTIONS = foreign nostdinc 1.9.6
- ACLOCAL_AMFLAGS = -I m4 --install
- 
- # what headers to install on 'make install':
--include_HEADERS = ares.h ares_version.h ares_build.h ares_rules.h ares_dns.h
-+include_HEADERS = ares.h ares_version.h ares_build.h ares_rules.h ares_dns.h ares_nameser.h
- 
- EXTRA_DIST = ares_build.h.cmake ares_build.h.in ares_build.h.dist CMakeLists.txt
-diff --git a/include/ares_build.h.cmake b/include/ares_build.h.cmake
-index ac32d47f..e847f17e 100644
---- a/include/ares_build.h.cmake
-+++ b/include/ares_build.h.cmake
-@@ -13,6 +13,8 @@
- #cmakedefine CARES_HAVE_WS2TCPIP_H
- #cmakedefine CARES_HAVE_WINSOCK2_H
- #cmakedefine CARES_HAVE_WINDOWS_H
-+#cmakedefine CARES_HAVE_ARPA_NAMESER_H
-+#cmakedefine CARES_HAVE_ARPA_NAMESER_COMPAT_H
- 
- #ifdef CARES_HAVE_SYS_TYPES_H
- #  include <sys/types.h>
-diff --git a/include/ares_build.h.in b/include/ares_build.h.in
-index 24e3a989..20fd28a0 100644
---- a/include/ares_build.h.in
-+++ b/include/ares_build.h.in
-@@ -55,6 +55,9 @@
-    Error Compilation_aborted_CARES_TYPEOF_ARES_SOCKLEN_T_already_defined
- #endif
- 
-+#undef CARES_HAVE_ARPA_NAMESER_H
-+#undef CARES_HAVE_ARPA_NAMESER_COMPAT_H
-+
- /* ================================================================ */
- /*  EXTERNAL INTERFACE SETTINGS FOR CONFIGURE CAPABLE SYSTEMS ONLY  */
- /* ================================================================ */
-diff --git a/src/lib/ares_nameser.h b/include/ares_nameser.h
-similarity index 98%
-rename from src/lib/ares_nameser.h
-rename to include/ares_nameser.h
-index 65aebcc1..18a9e5ac 100644
---- a/src/lib/ares_nameser.h
-+++ b/include/ares_nameser.h
-@@ -2,10 +2,12 @@
- #ifndef ARES_NAMESER_H
- #define ARES_NAMESER_H
- 
--#ifdef HAVE_ARPA_NAMESER_H
-+#include "ares_build.h"
-+
-+#ifdef CARES_HAVE_ARPA_NAMESER_H
- #  include <arpa/nameser.h>
- #endif
--#ifdef HAVE_ARPA_NAMESER_COMPAT_H
-+#ifdef CARES_HAVE_ARPA_NAMESER_COMPAT_H
- #  include <arpa/nameser_compat.h>
- #endif
- 
-@@ -68,7 +70,7 @@
-  * provide them
-  * ============================================================================
-  */
--#ifndef HAVE_ARPA_NAMESER_H
-+#ifndef CARES_HAVE_ARPA_NAMESER_H
- 
- typedef enum __ns_class {
-     ns_c_invalid = 0,       /* Cookie. */
-@@ -173,7 +175,7 @@ typedef enum __ns_rcode {
-     ns_r_badtime = 18
- } ns_rcode;
- 
--#endif /* HAVE_ARPA_NAMESER_H */
-+#endif /* CARES_HAVE_ARPA_NAMESER_H */
- 
- 
- /* ============================================================================
-diff --git a/src/lib/Makefile.inc b/src/lib/Makefile.inc
-index 7426c3de..47bc8cdd 100644
---- a/src/lib/Makefile.inc
-+++ b/src/lib/Makefile.inc
-@@ -73,7 +73,6 @@ HHEADERS = ares_android.h                        \
-   ares_strsplit.h			\
-   ares_writev.h				\
-   bitncmp.h				\
--  ares_nameser.h			\
-   ares_setup.h				\
-   setup_once.h
- 
diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 28657645df..af1f076aab 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  4803c844ce20ce510ef0eb83f8ea41fa24ecaae9d280c468c582d2bb25b3913d  c-ares-1.17.2.tar.gz
+sha256  1a7d52a8a84a9fbffb1be9133c0f6e17217d91ea5a6fa61f6b4729cda78ebbcf  c-ares-1.18.1.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 71bfa110a1..0152759ebc 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.17.2
+C_ARES_VERSION = 1.18.1
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
 C_ARES_CPE_ID_VENDOR = c-ares_project
-# We're patching configure.ac
-C_ARES_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

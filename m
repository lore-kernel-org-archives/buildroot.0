Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5125C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E736056B
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64E736056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEF07401D3;
	Sun, 29 Aug 2021 22:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-2THMfUCEJG; Sun, 29 Aug 2021 22:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 924D7401E1;
	Sun, 29 Aug 2021 22:50:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8C91BF94B
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A72E80E78
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahbsR3be99rh for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 22:50:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45E3680E79
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 22:50:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8D43D866FF; Sun, 29 Aug 2021 22:49:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 23:19:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6be5219c4122e7844f842205f343f9006a2146ab
X-Git-Newrev: a9ca15cf9263becea9fd2ba79ba2a8f9884765ba
X-Patchwork-Hint: ignore
Message-Id: <20210829224905.8D43D866FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: fix build with latest
 nodejs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a9ca15cf9263becea9fd2ba79ba2a8f9884765ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with nodejs raised since bump to version
12.22.5 in commit 7038b029d8c8774eca6d7888d6642d7e84ff5165:

../src/cares_wrap.cc:42:11: fatal error: ares_nameser.h: No such file or directory
   42 | # include <ares_nameser.h>
      |           ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a0f867d5e765fc1aa052de5e53ed350b3b20743f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...vide-ares_nameser-h-as-a-public-interface.patch | 170 +++++++++++++++++++++
 package/c-ares/c-ares.mk                           |   2 +
 2 files changed, 172 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

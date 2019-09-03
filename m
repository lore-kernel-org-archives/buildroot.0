From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:44 -0000
Subject: [Buildroot] [git commit] package/syslog-ng: bump version to 3.22.1
Message-ID: <20190903133619.DE7F08A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9695f3e06935e28b6737b3509c349433c217d105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import new version an drop two patches that have been applied upstream.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../syslog-ng/0002-build-make-dlsym-optional.patch | 160 ---------------------
 ...for-pthread-atfork-also-in-libc-nonshared.patch |  49 -------
 package/syslog-ng/syslog-ng.hash                   |   2 +-
 package/syslog-ng/syslog-ng.mk                     |   2 +-
 4 files changed, 2 insertions(+), 211 deletions(-)

diff --git a/package/syslog-ng/0002-build-make-dlsym-optional.patch b/package/syslog-ng/0002-build-make-dlsym-optional.patch
deleted file mode 100644
index bb29e1ed7c..0000000000
--- a/package/syslog-ng/0002-build-make-dlsym-optional.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From d85121c0dc700cad4bd9735b0ee1dab9addf9dd7 Mon Sep 17 00:00:00 2001
-From: Kokan <kokaipeter@gmail.com>
-Date: Thu, 17 Jan 2019 18:44:41 +0100
-Subject: [PATCH] build: make dlsym optional
-
-In case of static uClibc-ng lib, the <dlfcn.h> does not exists.
-
-The signal-handler.c solves an issue in case of program src/dst
-and Java destination. That combination is really rare if not impossible.
-
-This patch simply disables own sigaction if <dlfcn.h> is not present.
-
-Signed-off-by: Kokan <kokaipeter@gmail.com>
-
-Downloaded from upstream commit
-https://github.com/balabit/syslog-ng/commit/d85121c0dc700cad4bd9735b0ee1dab9addf9dd7
-
-Signed-off-by: Chris Packham <judge.packham@gmail.com>
----
- CMakeLists.txt        |  1 +
- configure.ac          |  1 +
- lib/CMakeLists.txt    |  1 -
- lib/Makefile.am       |  1 -
- lib/signal-handler.c  |  8 ++++----
- lib/signal-handler.h  | 31 -------------------------------
- syslog-ng-config.h.in |  1 +
- 7 files changed, 7 insertions(+), 37 deletions(-)
- delete mode 100644 lib/signal-handler.h
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c847a547b..dee691388 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -106,6 +106,7 @@ check_symbol_exists("getrandom" "sys/random.h" SYSLOG_NG_HAVE_GETRANDOM)
- 
- check_include_files(utmp.h SYSLOG_NG_HAVE_UTMP_H)
- check_include_files(utmpx.h SYSLOG_NG_HAVE_UTMPX_H)
-+check_include_files(dlfcn.h SYSLOG_NG_HAVE_DLFCN_H)
- 
- check_struct_has_member("struct utmpx" "ut_type" "utmpx.h" UTMPX_HAS_UT_TYPE LANGUAGE C)
- check_struct_has_member("struct utmp" "ut_type" "utmp.h" UTMP_HAS_UT_TYPE LANGUAGE C)
-diff --git a/configure.ac b/configure.ac
-index 6bdd8d252..6ef0ad2b4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -627,6 +627,7 @@ dnl ***************************************************************************
- 
- AC_HEADER_STDC
- AC_CHECK_HEADER(dmalloc.h)
-+AC_CHECK_HEADER(dlfcn.h)
- AC_CHECK_HEADERS(strings.h	\
- 	getopt.h		\
- 	stropts.h		\
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index be2da32a4..5268712e9 100644
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -91,7 +91,6 @@ set (LIB_HEADERS
-     logthrdestdrv.h
-     logwriter.h
-     mainloop.h
--    signal-handler.h
-     mainloop-call.h
-     mainloop-worker.h
-     mainloop-io-worker.h
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index ec1928795..5f9e93d79 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -129,7 +129,6 @@ pkginclude_HEADERS			+= \
- 	lib/logthrdestdrv.h		\
- 	lib/logwriter.h			\
- 	lib/mainloop.h			\
--	lib/signal-handler.h		\
- 	lib/mainloop-call.h		\
- 	lib/mainloop-worker.h		\
- 	lib/mainloop-io-worker.h	\
-diff --git a/lib/signal-handler.c b/lib/signal-handler.c
-index 5657ba182..8f52f675b 100644
---- a/lib/signal-handler.c
-+++ b/lib/signal-handler.c
-@@ -21,14 +21,15 @@
-  * COPYING for details.
-  *
-  */
--#include "signal-handler.h"
- 
- #include "syslog-ng.h"
- #include "children.h"
- 
--#ifndef _WIN32
-+#include <signal.h>
-+
-+#if SYSLOG_NG_HAVE_DLFCN_H
-+
- #include <dlfcn.h>
--#endif
- 
- static const struct sigaction *sgchld_handler;
- 
-@@ -41,7 +42,6 @@ trigger_sigchld_handler_chain(int signum)
-     }
- }
- 
--#ifndef _WIN32
- static int
- call_original_sigaction(int signum, const struct sigaction *act, struct sigaction *oldact)
- {
-diff --git a/lib/signal-handler.h b/lib/signal-handler.h
-deleted file mode 100644
-index 36e5ac293..000000000
---- a/lib/signal-handler.h
-+++ /dev/null
-@@ -1,31 +0,0 @@
--/*
-- * Copyright (c) 2018 Balabit
-- * Copyright (c) 2018 Kokan
-- *
-- * This library is free software; you can redistribute it and/or
-- * modify it under the terms of the GNU Lesser General Public
-- * License as published by the Free Software Foundation; either
-- * version 2.1 of the License, or (at your option) any later version.
-- *
-- * This library is distributed in the hope that it will be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- * Lesser General Public License for more details.
-- *
-- * You should have received a copy of the GNU Lesser General Public
-- * License along with this library; if not, write to the Free Software
-- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-- *
-- * As an additional exemption you are allowed to compile & link against the
-- * OpenSSL libraries as published by the OpenSSL project. See the file
-- * COPYING for details.
-- *
-- */
--#ifndef SIGNAL_HANDLER_H_INCLUDED
--#define SIGNAL_HANDLER_H_INCLUDED
--
--#include <signal.h>
--
--void trigger_sigchld_handler_chain(int);
--
--#endif
-diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
-index 9e372f103..d8208eedd 100644
---- a/syslog-ng-config.h.in
-+++ b/syslog-ng-config.h.in
-@@ -38,6 +38,7 @@
- #cmakedefine SYSLOG_NG_PATH_XSDDIR "@SYSLOG_NG_PATH_XSDDIR@"
- #cmakedefine SYSLOG_NG_HAVE_GETUTENT @SYSLOG_NG_HAVE_GETUTENT@
- #cmakedefine SYSLOG_NG_HAVE_GETUTXENT @SYSLOG_NG_HAVE_GETUTXENT@
-+#cmakedefine SYSLOG_NG_HAVE_DLFCN_H @SYSLOG_NG_HAVE_DLFCN_H@
- #cmakedefine SYSLOG_NG_HAVE_UTMPX_H @SYSLOG_NG_HAVE_UTMPX_H@
- #cmakedefine SYSLOG_NG_HAVE_UTMP_H @SYSLOG_NG_HAVE_UTMP_H@
- #cmakedefine SYSLOG_NG_HAVE_MODERN_UTMP @SYSLOG_NG_HAVE_MODERN_UTMP@
--- 
-2.20.1
-
diff --git a/package/syslog-ng/0003-look-for-pthread-atfork-also-in-libc-nonshared.patch b/package/syslog-ng/0003-look-for-pthread-atfork-also-in-libc-nonshared.patch
deleted file mode 100644
index 0f8454af97..0000000000
--- a/package/syslog-ng/0003-look-for-pthread-atfork-also-in-libc-nonshared.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a844abca43349739c36a4cdb7ea6f3bce560bd7f Mon Sep 17 00:00:00 2001
-From: Rolf Eike Beer <eb@emlix.com>
-Date: Thu, 8 Nov 2018 08:14:46 +0100
-Subject: [PATCH] look for pthread_atfork() also in lib c_nonshared
-
-Newer versions of glibc do not have pthread_nonshared anymore, instead the
-symbol is in c_nonshared. This fixes a crash on start on those platforms
-(namely with syslog-ng).
-
-Signed-off-by: Rolf Eike Beer <eb@emlix.com>
-[ThomasDS: backport from https://github.com/buytenh/ivykis/pull/16, at this
-moment not yet merged upstream.
-See also:
-- https://github.com/buytenh/ivykis/issues/15
-- https://github.com/balabit/syslog-ng/issues/2263
-]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-
----
- configure.ac | 2 ++
- src/pthr.h   | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/ivykis/configure.ac b/lib/ivykis/configure.ac
-index e9b10c0..56440d1 100644
---- a/lib/ivykis/configure.ac
-+++ b/lib/ivykis/configure.ac
-@@ -88,6 +88,8 @@ esac
- # link in libpthread_nonshared.a if it is available.
- #
- AC_CHECK_LIB([pthread_nonshared], [pthread_atfork])
-+# the lib is gone in glibc 2.28, things are now in c_nonshared
-+AC_CHECK_LIB([c_nonshared], [pthread_atfork])
- 
- # Checks for header files.
- AC_CHECK_HEADERS([process.h])
-diff --git a/lib/ivykis/src/pthr.h b/lib/ivykis/src/pthr.h
-index a41eaf3..32c1af2 100644
---- a/lib/ivykis/src/pthr.h
-+++ b/lib/ivykis/src/pthr.h
-@@ -42,7 +42,7 @@ static inline int pthreads_available(void)
-  * symbol because that causes it to be undefined even if you link
-  * libpthread_nonshared.a in explicitly.
-  */
--#ifndef HAVE_LIBPTHREAD_NONSHARED
-+#if !defined(HAVE_LIBPTHREAD_NONSHARED) && !defined(HAVE_LIBC_NONSHARED)
- #pragma weak pthread_atfork
- #endif
- 
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 1f83e39ff0..1a71224d91 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 5cf931a9d7bead0e6d9a2c65eee8f6005a005878f59aa280f3c4294257ed5178  syslog-ng-3.19.1.tar.gz
+sha256 0656443776fa554320cb81bbebeac72bdf871298dd2ebef7413c393aec4d74c8  syslog-ng-3.22.1.tar.gz
 sha256 835219c8ca76156e6337236d1bcb8e617c0b1c2783b4a8bc478e18a86743d607  COPYING
 sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 4ac25a675b..05ccd751e4 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.19.1
+SYSLOG_NG_VERSION = 3.22.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt

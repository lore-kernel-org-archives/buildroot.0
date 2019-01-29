From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jan 2019 23:00:04 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: allow building with
 static libraries
Message-ID: <20190129220040.D8583827FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cac823b0074fc65a2a04d6ecec7d2482a5a9a02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bring in an upstream patch to fix builds for targets which lack dlfcn.h
and revert "package/syslog-ng: depend on !BR2_STATIC_LIBS".

This reverts commit 44dbd2907c5995b0b0c56cb2274dc60415205dd8. Now that
upstream has different fix for the build issues with a static libc we
can re-enable syslog-ng on these systems.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../syslog-ng/0002-build-make-dlsym-optional.patch | 160 +++++++++++++++++++++
 package/syslog-ng/Config.in                        |   6 +-
 2 files changed, 162 insertions(+), 4 deletions(-)

diff --git a/package/syslog-ng/0002-build-make-dlsym-optional.patch b/package/syslog-ng/0002-build-make-dlsym-optional.patch
new file mode 100644
index 0000000000..bb29e1ed7c
--- /dev/null
+++ b/package/syslog-ng/0002-build-make-dlsym-optional.patch
@@ -0,0 +1,160 @@
+From d85121c0dc700cad4bd9735b0ee1dab9addf9dd7 Mon Sep 17 00:00:00 2001
+From: Kokan <kokaipeter@gmail.com>
+Date: Thu, 17 Jan 2019 18:44:41 +0100
+Subject: [PATCH] build: make dlsym optional
+
+In case of static uClibc-ng lib, the <dlfcn.h> does not exists.
+
+The signal-handler.c solves an issue in case of program src/dst
+and Java destination. That combination is really rare if not impossible.
+
+This patch simply disables own sigaction if <dlfcn.h> is not present.
+
+Signed-off-by: Kokan <kokaipeter@gmail.com>
+
+Downloaded from upstream commit
+https://github.com/balabit/syslog-ng/commit/d85121c0dc700cad4bd9735b0ee1dab9addf9dd7
+
+Signed-off-by: Chris Packham <judge.packham@gmail.com>
+---
+ CMakeLists.txt        |  1 +
+ configure.ac          |  1 +
+ lib/CMakeLists.txt    |  1 -
+ lib/Makefile.am       |  1 -
+ lib/signal-handler.c  |  8 ++++----
+ lib/signal-handler.h  | 31 -------------------------------
+ syslog-ng-config.h.in |  1 +
+ 7 files changed, 7 insertions(+), 37 deletions(-)
+ delete mode 100644 lib/signal-handler.h
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c847a547b..dee691388 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -106,6 +106,7 @@ check_symbol_exists("getrandom" "sys/random.h" SYSLOG_NG_HAVE_GETRANDOM)
+ 
+ check_include_files(utmp.h SYSLOG_NG_HAVE_UTMP_H)
+ check_include_files(utmpx.h SYSLOG_NG_HAVE_UTMPX_H)
++check_include_files(dlfcn.h SYSLOG_NG_HAVE_DLFCN_H)
+ 
+ check_struct_has_member("struct utmpx" "ut_type" "utmpx.h" UTMPX_HAS_UT_TYPE LANGUAGE C)
+ check_struct_has_member("struct utmp" "ut_type" "utmp.h" UTMP_HAS_UT_TYPE LANGUAGE C)
+diff --git a/configure.ac b/configure.ac
+index 6bdd8d252..6ef0ad2b4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -627,6 +627,7 @@ dnl ***************************************************************************
+ 
+ AC_HEADER_STDC
+ AC_CHECK_HEADER(dmalloc.h)
++AC_CHECK_HEADER(dlfcn.h)
+ AC_CHECK_HEADERS(strings.h	\
+ 	getopt.h		\
+ 	stropts.h		\
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index be2da32a4..5268712e9 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -91,7 +91,6 @@ set (LIB_HEADERS
+     logthrdestdrv.h
+     logwriter.h
+     mainloop.h
+-    signal-handler.h
+     mainloop-call.h
+     mainloop-worker.h
+     mainloop-io-worker.h
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index ec1928795..5f9e93d79 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -129,7 +129,6 @@ pkginclude_HEADERS			+= \
+ 	lib/logthrdestdrv.h		\
+ 	lib/logwriter.h			\
+ 	lib/mainloop.h			\
+-	lib/signal-handler.h		\
+ 	lib/mainloop-call.h		\
+ 	lib/mainloop-worker.h		\
+ 	lib/mainloop-io-worker.h	\
+diff --git a/lib/signal-handler.c b/lib/signal-handler.c
+index 5657ba182..8f52f675b 100644
+--- a/lib/signal-handler.c
++++ b/lib/signal-handler.c
+@@ -21,14 +21,15 @@
+  * COPYING for details.
+  *
+  */
+-#include "signal-handler.h"
+ 
+ #include "syslog-ng.h"
+ #include "children.h"
+ 
+-#ifndef _WIN32
++#include <signal.h>
++
++#if SYSLOG_NG_HAVE_DLFCN_H
++
+ #include <dlfcn.h>
+-#endif
+ 
+ static const struct sigaction *sgchld_handler;
+ 
+@@ -41,7 +42,6 @@ trigger_sigchld_handler_chain(int signum)
+     }
+ }
+ 
+-#ifndef _WIN32
+ static int
+ call_original_sigaction(int signum, const struct sigaction *act, struct sigaction *oldact)
+ {
+diff --git a/lib/signal-handler.h b/lib/signal-handler.h
+deleted file mode 100644
+index 36e5ac293..000000000
+--- a/lib/signal-handler.h
++++ /dev/null
+@@ -1,31 +0,0 @@
+-/*
+- * Copyright (c) 2018 Balabit
+- * Copyright (c) 2018 Kokan
+- *
+- * This library is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU Lesser General Public
+- * License as published by the Free Software Foundation; either
+- * version 2.1 of the License, or (at your option) any later version.
+- *
+- * This library is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * Lesser General Public License for more details.
+- *
+- * You should have received a copy of the GNU Lesser General Public
+- * License along with this library; if not, write to the Free Software
+- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+- *
+- * As an additional exemption you are allowed to compile & link against the
+- * OpenSSL libraries as published by the OpenSSL project. See the file
+- * COPYING for details.
+- *
+- */
+-#ifndef SIGNAL_HANDLER_H_INCLUDED
+-#define SIGNAL_HANDLER_H_INCLUDED
+-
+-#include <signal.h>
+-
+-void trigger_sigchld_handler_chain(int);
+-
+-#endif
+diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
+index 9e372f103..d8208eedd 100644
+--- a/syslog-ng-config.h.in
++++ b/syslog-ng-config.h.in
+@@ -38,6 +38,7 @@
+ #cmakedefine SYSLOG_NG_PATH_XSDDIR "@SYSLOG_NG_PATH_XSDDIR@"
+ #cmakedefine SYSLOG_NG_HAVE_GETUTENT @SYSLOG_NG_HAVE_GETUTENT@
+ #cmakedefine SYSLOG_NG_HAVE_GETUTXENT @SYSLOG_NG_HAVE_GETUTXENT@
++#cmakedefine SYSLOG_NG_HAVE_DLFCN_H @SYSLOG_NG_HAVE_DLFCN_H@
+ #cmakedefine SYSLOG_NG_HAVE_UTMPX_H @SYSLOG_NG_HAVE_UTMPX_H@
+ #cmakedefine SYSLOG_NG_HAVE_UTMP_H @SYSLOG_NG_HAVE_UTMP_H@
+ #cmakedefine SYSLOG_NG_HAVE_MODERN_UTMP @SYSLOG_NG_HAVE_MODERN_UTMP@
+-- 
+2.20.1
+
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index 6407645974..fbc236221a 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
@@ -16,8 +15,7 @@ config BR2_PACKAGE_SYSLOG_NG
 
 	  https://syslog-ng.org/
 
-comment "syslog-ng needs a toolchain w/ dynamic library, wchar, threads"
+comment "syslog-ng needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

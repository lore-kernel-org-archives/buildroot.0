From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 11:38:35 -0400
Subject: [Buildroot] [PATCH 1/1] sngrep: remove ncurses wchar support
Message-ID: <20170714153835.3117-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sngrep currently doesn't really use wchar support anyways, and when
checking for wchar support, it's checking the host systems ncurses
libraries.

Remove support for ncurses wchar until it's used in sngrep, and remove
the patches used to fix ncurses wchar detection.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...001-autotools-fix-ncurses-wchar-detection.patch | 158 ---------------------
 ...002-autotools-fix-ncurses-wchar-detection.patch |  45 ------
 package/sngrep/sngrep.mk                           |   4 -
 3 files changed, 207 deletions(-)
 delete mode 100644 package/sngrep/0001-autotools-fix-ncurses-wchar-detection.patch
 delete mode 100644 package/sngrep/0002-autotools-fix-ncurses-wchar-detection.patch

diff --git a/package/sngrep/0001-autotools-fix-ncurses-wchar-detection.patch b/package/sngrep/0001-autotools-fix-ncurses-wchar-detection.patch
deleted file mode 100644
index 876909685..000000000
--- a/package/sngrep/0001-autotools-fix-ncurses-wchar-detection.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 9a6550055f828c39a4f910f631041a4883f71dc6 Mon Sep 17 00:00:00 2001
-From: Kaian <kaian@irontec.com>
-Date: Tue, 30 May 2017 11:15:49 +0200
-Subject: [PATCH] autotools: fix ncurses wchar detection
-
-[Upstream commit: https://github.com/irontec/sngrep/commit/9a6550055f828c39a4f910f631041a4883f71dc6]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am            |  1 +
- configure.ac           | 15 +++++++------
- m4/sngrep.m4           | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
- src/curses/scrollbar.h |  5 ++---
- src/curses/ui_panel.h  |  5 ++---
- 5 files changed, 74 insertions(+), 13 deletions(-)
- create mode 100644 m4/sngrep.m4
-
-diff --git a/Makefile.am b/Makefile.am
-index b0dd2a5..8cd4df7 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,2 +1,3 @@
-+ACLOCAL_AMFLAGS = -I m4
- SUBDIRS=src config doc tests
- EXTRA_DIST=bootstrap.sh
-diff --git a/configure.ac b/configure.ac
-index fe28cef..2821c55 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,6 +3,7 @@ AC_INIT([sngrep], [1.4.3], [kaian at irontec.com], [sngrep], [http://www.irontec.co
- AM_INIT_AUTOMAKE([1.9])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- AC_CONFIG_HEADERS([src/config.h])
-+AC_CONFIG_MACRO_DIRS([m4])
- 
- AC_COPYRIGHT("Irontec S.L.")
- 
-@@ -53,13 +54,13 @@ AS_IF([test "x$enable_unicode" == "xyes"], [
- 	# Ncurses with wide-character support
- 	AC_DEFINE([WITH_UNICODE], [], [Compile With Unicode compatibility])
- 
--	AC_CHECK_HEADER([ncursesw/ncurses.h], [], [
--	    AC_MSG_ERROR([ You need to have ncurses development files installed to compile sngrep.])
--	])
--
--	AC_CHECK_LIB([ncursesw], [initscr], [], [
--	    AC_MSG_ERROR([ You need to have libncursesw installed to compile sngrep.])
--	])
-+   SNGREP_CHECK_SCRIPT([ncursesw6], [addnwstr], [WITH_UNICODE], "ncursesw6-config",
-+    SNGREP_CHECK_SCRIPT([ncursesw], [addnwstr], [WITH_UNICODE], "ncursesw5-config",
-+     SNGREP_CHECK_SCRIPT([ncurses], [addnwstr], [WITH_UNICODE], "ncurses5-config",
-+      SNGREP_CHECK_LIB([ncursesw6], [addnwstr], [WITH_UNICODE],
-+       SNGREP_CHECK_LIB([ncursesw], [addnwstr], [WITH_UNICODE],
-+        SNGREP_CHECK_LIB([ncurses], [addnwstr], [WITH_UNICODE],
-+	))))))
- 
- 	AC_CHECK_LIB([panelw], [new_panel], [], [
- 	    AC_MSG_ERROR([ You need to have ncurses panelw library installed to compile sngrep.])
-diff --git a/m4/sngrep.m4 b/m4/sngrep.m4
-new file mode 100644
-index 0000000..9c5377a
---- /dev/null
-+++ b/m4/sngrep.m4
-@@ -0,0 +1,61 @@
-+# serial 100
-+# sngrep.m4: Custom autotools macros for sngrep
-+#
-+# @author Adam Duskett <aduskett@codeblue.com>
-+# @version 2017-05-25
-+# @license GNU General Public License 3.0
-+#
-+# This program is free software; you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation; either version 2, or (at your option)
-+# any later version.
-+#
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+#
-+# You should have received a copy of the GNU General Public License
-+# along with this program; if not, write to the Free Software
-+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+# 02110-1301, USA.
-+#
-+# As a special exception, the you may copy, distribute and modify the
-+# configure scripts that are the output of Autoconf when processing
-+# the Macro.  You need not follow the terms of the GNU General Public
-+# License when using or distributing such scripts.
-+#
-+
-+# SNGREP_CHECK_SCRIPT(LIBNAME, FUNCTION, DEFINE, CONFIG_SCRIPT, ELSE_PART)
-+AC_DEFUN([SNGREP_CHECK_SCRIPT],
-+[
-+   if test ! -z "m4_toupper($SNGREP_[$1]_CONFIG_SCRIPT)"; then
-+      # to be used to set the path to *-config when cross-compiling
-+      sngrep_config_script=$(m4_toupper($SNGREP_[$1]_CONFIG_SCRIPT) --libs 2> /dev/null)
-+   else
-+      sngrep_config_script=$([$4] --libs 2> /dev/null)
-+   fi
-+   sngrep_script_success=no
-+   sngrep_save_LDFLAGS="$LDFLAGS"
-+   if test ! "x$sngrep_config_script" = x; then
-+      LDFLAGS="$sngrep_config_script $LDFLAGS"
-+      AC_CHECK_LIB([$1], [$2], [
-+         AC_DEFINE([$3], 1, [The library is present.])
-+         LIBS="$sngrep_config_script $LIBS "
-+         sngrep_script_success=yes
-+      ], [])
-+      LDFLAGS="$save_LDFLAGS"
-+   fi
-+   if test "x$sngrep_script_success" = xno; then
-+      [$5]
-+   fi
-+])
-+
-+# SNGREP_CHECK_LIB(LIBNAME, FUNCTION, DEFINE, ELSE_PART)
-+AC_DEFUN([SNGREP_CHECK_LIB],
-+[
-+   AC_CHECK_LIB([$1], [$2], [
-+      AC_DEFINE([$3], 1, [The library is present.])
-+      LIBS="-l[$1] $LIBS "
-+   ], [$4])
-+])
-diff --git a/src/curses/scrollbar.h b/src/curses/scrollbar.h
-index 960b936..c9fbfdc 100644
---- a/src/curses/scrollbar.h
-+++ b/src/curses/scrollbar.h
-@@ -32,10 +32,9 @@
- 
- #ifdef WITH_UNICODE
- #define _X_OPEN_SOURCE_EXTENDED
--#include <ncursesw/ncurses.h>
--#else
--#include <ncurses.h>
-+#include <wctype.h>
- #endif
-+#include <ncurses.h>
- 
- //! Shorter declaration of scrollbar
- typedef struct scrollbar scrollbar_t;
-diff --git a/src/curses/ui_panel.h b/src/curses/ui_panel.h
-index 9a4082a..549b593 100644
---- a/src/curses/ui_panel.h
-+++ b/src/curses/ui_panel.h
-@@ -33,10 +33,9 @@
- 
- #ifdef WITH_UNICODE
- #define _X_OPEN_SOURCE_EXTENDED
--#include <ncursesw/ncurses.h>
--#else
--#include <ncurses.h>
-+#include <wctype.h>
- #endif
-+#include <ncurses.h>
- #include <panel.h>
- #include <form.h>
- #include <stdbool.h>
diff --git a/package/sngrep/0002-autotools-fix-ncurses-wchar-detection.patch b/package/sngrep/0002-autotools-fix-ncurses-wchar-detection.patch
deleted file mode 100644
index 372f87487..000000000
--- a/package/sngrep/0002-autotools-fix-ncurses-wchar-detection.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ca6bd26fff5c679c8838c29e1e2913ccbcc0b0cd Mon Sep 17 00:00:00 2001
-From: Kaian <kaian@irontec.com>
-Date: Tue, 30 May 2017 11:15:49 +0200
-Subject: [PATCH] autotools: fix ncurses wchar detection
-
-Author: Adam Duskett <aduskett@codeblue.com>
-
-Ncurses detection is currently broken in buildroot.
-
-This patch does the following:
- - Add SNGREP_CHECK_SCRIPT to configure.ac which checks for a
-   libname, a function in that library, sets a define if found, and
-   if not found, moves on to the next part. This is taken from the
-   htop configure.ac.
-
- - Adds SNGREP_CHECK_LIB to configure.ac which checks for a
-   library, a function within that library, sets a define if that function
-   is found, and if not found, moves on to the next part.
-   This is taken from the htop configure.ac
-
- - Modifies scrollbar.h and ui_panel.h to include <wctypes.h> instead of
-   <ncursesw/ncurses.h> if unicode is supported.
-
-[Upstream commit: https://github.com/irontec/sngrep/commit/ca6bd26fff5c679c8838c29e1e2913ccbcc0b0cd]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2821c55..10c83ab 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,9 +1,9 @@
- AC_PREREQ([2.59])
- AC_INIT([sngrep], [1.4.3], [kaian at irontec.com], [sngrep], [http://www.irontec.com/])
- AM_INIT_AUTOMAKE([1.9])
--m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- AC_CONFIG_HEADERS([src/config.h])
--AC_CONFIG_MACRO_DIRS([m4])
-+m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-+m4_ifdef([AC_CONFIG_MACRO_DIRS], AC_CONFIG_MACRO_DIRS([m4]), m4_include([m4/sngrep.m4]))
- 
- AC_COPYRIGHT("Irontec S.L.")
- 
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 9b6240875..67ef882e2 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -14,11 +14,7 @@ SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 SNGREP_CONF_ENV += \
 	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
 
-ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-SNGREP_CONF_OPTS += --enable-unicode
-else
 SNGREP_CONF_OPTS += --disable-unicode
-endif
 
 # openssl and gnutls can't be enabled at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.13.0

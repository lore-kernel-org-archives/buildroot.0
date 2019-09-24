From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Sep 2019 21:38:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: bump to version 1.25.6
Message-ID: <20190924193822.2985-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches (already in version) and so drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...old-ln-versions-without-the-r-option.patch | 214 ------------------
 ...otext.c-link-with-libiconv-if-needed.patch | 122 ----------
 package/cups-filters/cups-filters.hash        |   2 +-
 package/cups-filters/cups-filters.mk          |   4 +-
 4 files changed, 2 insertions(+), 340 deletions(-)
 delete mode 100644 package/cups-filters/0001-install-support-old-ln-versions-without-the-r-option.patch
 delete mode 100644 package/cups-filters/0002-filter-texttotext.c-link-with-libiconv-if-needed.patch

diff --git a/package/cups-filters/0001-install-support-old-ln-versions-without-the-r-option.patch b/package/cups-filters/0001-install-support-old-ln-versions-without-the-r-option.patch
deleted file mode 100644
index 1f155fcefc..0000000000
--- a/package/cups-filters/0001-install-support-old-ln-versions-without-the-r-option.patch
+++ /dev/null
@@ -1,214 +0,0 @@
-From edd44df686b4ec983a327cabc5035106addb274f Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Mon, 16 Sep 2019 22:22:37 -0300
-Subject: [PATCH] install: support old ln versions without the -r option
-
-Oldish enterprise-class Linux distributions have outdated versions of
-coreutils whose ln command do not support the -r option. Also non-Linux
-systems like FreeBSD don't support that option. Use a shell script that
-mimics the missing functionality.
-
-The script creates minimalist relative paths, like ln -r does, but in
-order to simplify the logic, it requires that the arguments be absolute
-paths and do not end with '/'. This is enough for our purposes.
-
-Add configuration logic to detect if ln supports the -r option, based on
-the logic used by Autoconf to check if ln supports the -s option.
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- Makefile.am     |  6 ++--
- configure.ac    |  2 ++
- ln-srf          | 49 ++++++++++++++++++++++++++
- m4/ac_ln_srf.m4 | 91 +++++++++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 145 insertions(+), 3 deletions(-)
- create mode 100755 ln-srf
- create mode 100644 m4/ac_ln_srf.m4
-
-diff --git a/Makefile.am b/Makefile.am
-index 76b81de5..beb2882e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -988,11 +988,11 @@ install-exec-hook:
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(pkgfilterdir)
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(pkgbackenddir)
- if ENABLE_FOOMATIC
--	$(LN_S) -r -f $(DESTDIR)$(pkgfilterdir)/foomatic-rip $(DESTDIR)$(bindir)
-+	$(LN_SRF) $(DESTDIR)$(pkgfilterdir)/foomatic-rip $(DESTDIR)$(bindir)
- endif
- if ENABLE_DRIVERLESS
--	$(LN_S) -r -f $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(bindir)
--	$(LN_S) -r -f $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(pkgbackenddir)
-+	$(LN_SRF) $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(bindir)
-+	$(LN_SRF) $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(pkgbackenddir)
- endif
- if ENABLE_BRAILLE
- 	$(LN_S) -f imagetobrf $(DESTDIR)$(pkgfilterdir)/imagetoubrl
-diff --git a/configure.ac b/configure.ac
-index d5a539b6..fbcf829a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,6 +58,8 @@ AM_ICONV
- AC_PROG_CPP
- AC_PROG_INSTALL
- AC_PROG_LN_S
-+AS_LN_SRF_PREPARE
-+AC_PROG_LN_SRF
- AC_PROG_MAKE_SET
- AC_PROG_LIBTOOL
- PKG_PROG_PKG_CONFIG([0.20])
-diff --git a/ln-srf b/ln-srf
-new file mode 100755
-index 00000000..f395a760
---- /dev/null
-+++ b/ln-srf
-@@ -0,0 +1,49 @@
-+#!/bin/sh
-+#
-+# Author: Carlos Santos <unixmania@gmail.com>
-+# This file is in public domain.
-+#
-+
-+error() {
-+	echo "$@" 1>&2
-+	exit 1
-+}
-+
-+src="$1"
-+dst="$2"
-+
-+check_path() {
-+	case "$2" in
-+		*/../*|*/./*|*/.|*/..) error "$1 path '$2' must be absolute";;
-+		*/) error "$1 path '$2' must not end with '/'";;
-+		/?*) ;;
-+		*) error "$1 path '$2' must start with '/'";;
-+	esac
-+}
-+
-+check_path "source" "$src"
-+check_path "destination" "$dst"
-+
-+# strip leading '/'
-+src=${src#/*}
-+tmp=${dst#/*}
-+
-+s_prefix=${src%%/*}
-+d_prefix=${tmp%%/*}
-+
-+# strip leading common
-+while [ "$s_prefix" = "$d_prefix" ]; do
-+	src="${src#$s_prefix/}"
-+	tmp="${tmp#$d_prefix/}"
-+	s_prefix=${src%%/*}
-+	d_prefix=${tmp%%/*}
-+done
-+
-+s_prefix="../"
-+while [ -n "$d_prefix" ] && [ "$tmp" != "$d_prefix" ]; do
-+	s_prefix="../$s_prefix"
-+	tmp="${tmp#$d_prefix/}"
-+	d_prefix=${tmp%%/*}
-+done
-+
-+ln -s -f "$s_prefix$src" "$dst"
-diff --git a/m4/ac_ln_srf.m4 b/m4/ac_ln_srf.m4
-new file mode 100644
-index 00000000..204b3439
---- /dev/null
-+++ b/m4/ac_ln_srf.m4
-@@ -0,0 +1,91 @@
-+# Adapted from Autoconf Version 2.63 (GPLv2).
-+#
-+# Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
-+# Free Software Foundation, Inc.
-+#
-+# This program is free software: you can redistribute it and/or modify
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
-+# As a special exception, the Free Software Foundation gives unlimited
-+# permission to copy, distribute and modify the configure scripts that
-+# are the output of Autoconf.  You need not follow the terms of the GNU
-+# General Public License when using or distributing such scripts, even
-+# though portions of the text of Autoconf appear in them.  The GNU
-+# General Public License (GPL) does govern all other use of the material
-+# that constitutes the Autoconf program.
-+#
-+# Certain portions of the Autoconf source text are designed to be copied
-+# (in certain cases, depending on the input) into the output of
-+# Autoconf.  We call these the "data" portions.  The rest of the Autoconf
-+# source text consists of comments plus executable code that decides which
-+# of the data portions to output in any given case.  We call these
-+# comments and executable code the "non-data" portions.  Autoconf never
-+# copies any of the non-data portions into its output.
-+#
-+# This special exception to the GPL applies to versions of Autoconf
-+# released by the Free Software Foundation.  When you make and
-+# distribute a modified version of Autoconf, you may extend this special
-+# exception to the GPL to apply to your modified version as well, *unless*
-+# your modified version has the potential to copy into its output some
-+# of the text that was the non-data portion of the version that you started
-+# with.  (In other words, unless your change moves or copies text from
-+# the non-data portions to the data portions.)  If your modification has
-+# such potential, you must delete any notice of this special exception
-+# to the GPL from your modified version.
-+
-+# AS_LN_SRF_PREPARE
-+# ------------------------------------
-+m4_defun([AS_LN_SRF_PREPARE],
-+[rm -f conf$$ conf$$.exe conf$$.file
-+if test -d conf$$.dir; then
-+  rm -f conf$$.dir/conf$$.file
-+else
-+  rm -f conf$$.dir
-+  mkdir conf$$.dir 2>/dev/null
-+fi
-+if (echo >conf$$.file) 2>/dev/null; then
-+  if ln -s -r conf$$.file conf$$ 2>/dev/null; then
-+    as_ln_srf='ln -s -r -f'
-+  elif ln -s conf$$.file conf$$ 2>/dev/null; then
-+    as_ln_srf='./ln-srf'
-+    # ... but there are two gotchas:
-+    # 1) On MSYS, both `ln -s file dir' and `ln file dir' fail.
-+    # 2) DJGPP < 2.04 has no symlinks; `ln -s' creates a wrapper executable.
-+    # In both cases, we have to default to `cp -pRf'.
-+    ln -s conf$$.file conf$$.dir 2>/dev/null && test ! -f conf$$.exe ||
-+      as_ln_srf='cp -pRf'
-+  elif ln conf$$.file conf$$ 2>/dev/null; then
-+    as_ln_srf=ln
-+  else
-+    as_ln_srf='cp -pRf'
-+  fi
-+else
-+  as_ln_srf='cp -pRf'
-+fi
-+rm -f conf$$ conf$$.exe conf$$.dir/conf$$.file conf$$.file
-+rmdir conf$$.dir 2>/dev/null
-+])# AS_LN_SRF_PREPARE
-+
-+# AC_PROG_LN_SRF
-+# --------------------------------
-+AC_DEFUN([AC_PROG_LN_SRF],
-+[AC_MSG_CHECKING([whether ln -s -r -f works])
-+AC_SUBST([LN_SRF], [$as_ln_srf])dnl
-+if test "$LN_SRF" = "ln -s -r -f"; then
-+  AC_MSG_RESULT([yes])
-+else
-+  AC_MSG_RESULT([no, using $LN_SRF])
-+fi
-+])# AC_PROG_LN_SRF
--- 
-2.18.1
-
diff --git a/package/cups-filters/0002-filter-texttotext.c-link-with-libiconv-if-needed.patch b/package/cups-filters/0002-filter-texttotext.c-link-with-libiconv-if-needed.patch
deleted file mode 100644
index cace0773ae..0000000000
--- a/package/cups-filters/0002-filter-texttotext.c-link-with-libiconv-if-needed.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 734ef160b428c545d8c6ae16c4bfe3c036173aa4 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Sun, 21 Jul 2019 23:54:29 -0300
-Subject: [PATCH] filter/texttotext.c: link with libiconv if needed
-
-texttotext.c uses iconv so it should link with libiconv on platforms
-where it is a separate library (e.g. uClibc-ng without built-in NLS)
-otherwise texttotext fails to link:
-
-  CCLD     texttotext
-[...]/ld: texttotext-texttotext.o: in function `main':
-texttotext.c:(.text.startup+0xde0): undefined reference to `libiconv_open'
-[...]/ld: texttotext.c:(.text.startup+0xf9d): undefined reference to `libiconv'
-[...]/ld: texttotext.c:(.text.startup+0xfd6): undefined reference to `libiconv'
-[...]/ld: texttotext.c:(.text.startup+0x16c3): undefined reference to `libiconv_close'
-
-Modify autogen.sh to call autopoint, which adds the libiconv discovery.
-It also creates a "po" skeleton but we can discard it, since it is not
-really necessary.
-
-Fixes: https://bugs.busybox.net/show_bug.cgi?id=12031
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- Makefile.am  |  4 +++-
- autogen.sh   | 17 +++++++++++++++++
- configure.ac |  6 +++++-
- 3 files changed, 25 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 72e023ed..76b81de5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -778,7 +778,7 @@ texttotext_SOURCES = \
- 	filter/texttotext.c
- EXTRA_texttotext_SOURCES = filter/strcasestr.c
- texttotext_CFLAGS = $(CUPS_CFLAGS)
--texttotext_LDADD = $(STRCASESTR) $(CUPS_LIBS)
-+texttotext_LDADD = $(STRCASESTR) $(CUPS_LIBS) $(LIBICONV)
- texttotext_DEPENDENCIES = $(STRCASESTR)
- 
- pdftops_SOURCES = \
-@@ -1049,3 +1049,5 @@ if ENABLE_BRAILLE
- 	$(RM) $(DESTDIR)$(pkgfilterdir)/vectortoubrl
- 	$(RM) $(DESTDIR)$(pkgfilterdir)/textbrftoindexv4
- endif
-+
-+SUBDIRS =
-diff --git a/autogen.sh b/autogen.sh
-index 5462a323..cd7397a9 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -13,11 +13,22 @@ aclocal --version > /dev/null 2> /dev/null || {
-     echo "error: aclocal not found"
-     exit 1
- }
-+
- automake --version > /dev/null 2> /dev/null || {
-     echo "error: automake not found"
-     exit 1
- }
- 
-+autopoint --version > /dev/null 2> /dev/null || {
-+    echo "error: autopoint not found"
-+    exit 1
-+}
-+
-+gettext --version > /dev/null 2> /dev/null || {
-+    echo "error: gettext not found"
-+    exit 1
-+}
-+
- for i in $TESTLIBTOOLIZE; do
- 	if which $i > /dev/null 2>&1; then
- 		LIBTOOLIZE=$i
-@@ -39,6 +50,12 @@ fi
- 
- rm -rf autom4te*.cache
- 
-+autopoint --force || {
-+    echo "error: autopoint failed"
-+    exit 1
-+}
-+# autopoint is for libiconv discovery; we don't want the po directory
-+rm -rf po
- $LIBTOOLIZE --force --copy || {
-     echo "error: libtoolize failed"
-     exit 1
-diff --git a/configure.ac b/configure.ac
-index 607dc17a..d5a539b6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,7 +18,7 @@ AC_CONFIG_MACRO_DIR([m4])
- m4_include([m4/ac_define_dir.m4])
- m4_include([m4/ax_compare_version.m4])
- m4_include([m4/basic-directories.m4])
--AM_INIT_AUTOMAKE([1.11 gnu dist-xz dist-bzip2])
-+AM_INIT_AUTOMAKE([1.11 gnu dist-xz dist-bzip2 subdir-objects])
- AM_SILENT_RULES([yes])
- AC_LANG([C++])
- AC_CONFIG_HEADERS([config.h])
-@@ -54,6 +54,7 @@ AC_PROG_CC
- AC_PROG_CXX
- AX_CXX_COMPILE_STDCXX([11],[noext],[mandatory])
- AM_PROG_CC_C_O
-+AM_ICONV
- AC_PROG_CPP
- AC_PROG_INSTALL
- AC_PROG_LN_S
-@@ -61,6 +62,9 @@ AC_PROG_MAKE_SET
- AC_PROG_LIBTOOL
- PKG_PROG_PKG_CONFIG([0.20])
- 
-+AM_GNU_GETTEXT_VERSION([0.18.3])
-+AM_GNU_GETTEXT([external])
-+
- # ========================================
- # Specify the fontdir patch if not default
- # ========================================
--- 
-2.18.1
-
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index dd3cbe3dbf..dace8845e0 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ecc4169a3253e14e5d0a0d6b923adfeeeae4faef8eca27822f25134e968a024c  cups-filters-1.25.4.tar.gz
+sha256 d936f1f07a8d79dcb188ba7fdf0800bbe25085c1af875169d45a9615a5ffb6cb  cups-filters-1.25.6.tar.gz
 sha256 527463af65312372111804589a9624f4c52813e253062ae351e75af5003f317f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 7f8defb2cb..30d109e56a 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.25.4
+CUPS_FILTERS_VERSION = 1.25.6
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-# 0001-install-support-old-ln-versions-without-the-r-option.patch
-CUPS_FILTERS_AUTORECONF = YES
 
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
-- 
2.23.0

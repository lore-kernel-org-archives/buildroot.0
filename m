From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 19 Sep 2019 00:51:21 -0300
Subject: [Buildroot] [PATCH] package/cups-filters: fix broken symlink in
 installation
Message-ID: <20190919035121.19223-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The patch used previously to support versions of ln lacking the '-r'
option generated broken links:

    $ file target/usr/lib/cups/backend/driverless
    target/usr/lib/cups/backend/driverless: broken symbolic link to ../../usr/lib/cups/driver/driverless

Add a squashing of two patches already sent upstream that provide a
better solution:

    https://github.com/OpenPrinting/cups-filters/pull/154
    https://github.com/OpenPrinting/cups-filters/pull/157

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 ...lative-linking-with-absolute-linking.patch |  46 ----
 ...old-ln-versions-without-the-r-option.patch | 214 ++++++++++++++++++
 package/cups-filters/cups-filters.mk          |   2 +-
 3 files changed, 215 insertions(+), 47 deletions(-)
 delete mode 100644 package/cups-filters/0001-Replace-relative-linking-with-absolute-linking.patch
 create mode 100644 package/cups-filters/0001-install-support-old-ln-versions-without-the-r-option.patch

diff --git a/package/cups-filters/0001-Replace-relative-linking-with-absolute-linking.patch b/package/cups-filters/0001-Replace-relative-linking-with-absolute-linking.patch
deleted file mode 100644
index e4b35cda39..0000000000
--- a/package/cups-filters/0001-Replace-relative-linking-with-absolute-linking.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c26b4c3550557442890f2f790d4f8b61a3734c1f Mon Sep 17 00:00:00 2001
-From: Olivier Schonken <olivier.schonken@gmail.com>
-Date: Thu, 8 Mar 2018 12:32:23 +0200
-Subject: [PATCH] install: don't use ln -r
-
-Oldish enterprise-class distributions have too old versions of
-coreutils, with ln not supporting -r.
-
-So we fake it.
-
-ln -r would create minimalist relative paths, but they are not
-trivial to generate. Instead, we always create paths relative to the
-root, i.e.:
-
-    ln -s -r /usr/bin/foo /usr/sbin/foo
-
-would create:  /usr/sbin/foo -> ../bin/foo
-while we do :  /usr/sbin/foo -> ../../usr/bin/foo
-
-Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
----
- Makefile.am | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d959227..b49914a 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -998,11 +998,11 @@ install-exec-hook:
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(pkgfilterdir)
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(pkgbackenddir)
- if ENABLE_FOOMATIC
--	$(LN_S) -r -f $(DESTDIR)$(pkgfilterdir)/foomatic-rip $(DESTDIR)$(bindir)
-+	$(LN_S) -f ../..$(pkgfilterdir)/foomatic-rip $(DESTDIR)$(bindir)
- endif
- if ENABLE_DRIVERLESS
--	$(LN_S) -r -f $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(bindir)
--	$(LN_S) -r -f $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(pkgbackenddir)
-+	$(LN_S) -f ../..$(pkgppdgendir)/driverless $(DESTDIR)$(bindir)
-+	$(LN_S) -f ../..$(pkgppdgendir)/driverless $(DESTDIR)$(pkgbackenddir)
- endif
- if ENABLE_BRAILLE
- 	$(LN_S) -f imagetobrf $(DESTDIR)$(pkgfilterdir)/imagetoubrl
--- 
-2.14.1
-
diff --git a/package/cups-filters/0001-install-support-old-ln-versions-without-the-r-option.patch b/package/cups-filters/0001-install-support-old-ln-versions-without-the-r-option.patch
new file mode 100644
index 0000000000..1f155fcefc
--- /dev/null
+++ b/package/cups-filters/0001-install-support-old-ln-versions-without-the-r-option.patch
@@ -0,0 +1,214 @@
+From edd44df686b4ec983a327cabc5035106addb274f Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Mon, 16 Sep 2019 22:22:37 -0300
+Subject: [PATCH] install: support old ln versions without the -r option
+
+Oldish enterprise-class Linux distributions have outdated versions of
+coreutils whose ln command do not support the -r option. Also non-Linux
+systems like FreeBSD don't support that option. Use a shell script that
+mimics the missing functionality.
+
+The script creates minimalist relative paths, like ln -r does, but in
+order to simplify the logic, it requires that the arguments be absolute
+paths and do not end with '/'. This is enough for our purposes.
+
+Add configuration logic to detect if ln supports the -r option, based on
+the logic used by Autoconf to check if ln supports the -s option.
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ Makefile.am     |  6 ++--
+ configure.ac    |  2 ++
+ ln-srf          | 49 ++++++++++++++++++++++++++
+ m4/ac_ln_srf.m4 | 91 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 145 insertions(+), 3 deletions(-)
+ create mode 100755 ln-srf
+ create mode 100644 m4/ac_ln_srf.m4
+
+diff --git a/Makefile.am b/Makefile.am
+index 76b81de5..beb2882e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -988,11 +988,11 @@ install-exec-hook:
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(pkgfilterdir)
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(pkgbackenddir)
+ if ENABLE_FOOMATIC
+-	$(LN_S) -r -f $(DESTDIR)$(pkgfilterdir)/foomatic-rip $(DESTDIR)$(bindir)
++	$(LN_SRF) $(DESTDIR)$(pkgfilterdir)/foomatic-rip $(DESTDIR)$(bindir)
+ endif
+ if ENABLE_DRIVERLESS
+-	$(LN_S) -r -f $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(bindir)
+-	$(LN_S) -r -f $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(pkgbackenddir)
++	$(LN_SRF) $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(bindir)
++	$(LN_SRF) $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(pkgbackenddir)
+ endif
+ if ENABLE_BRAILLE
+ 	$(LN_S) -f imagetobrf $(DESTDIR)$(pkgfilterdir)/imagetoubrl
+diff --git a/configure.ac b/configure.ac
+index d5a539b6..fbcf829a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,6 +58,8 @@ AM_ICONV
+ AC_PROG_CPP
+ AC_PROG_INSTALL
+ AC_PROG_LN_S
++AS_LN_SRF_PREPARE
++AC_PROG_LN_SRF
+ AC_PROG_MAKE_SET
+ AC_PROG_LIBTOOL
+ PKG_PROG_PKG_CONFIG([0.20])
+diff --git a/ln-srf b/ln-srf
+new file mode 100755
+index 00000000..f395a760
+--- /dev/null
++++ b/ln-srf
+@@ -0,0 +1,49 @@
++#!/bin/sh
++#
++# Author: Carlos Santos <unixmania@gmail.com>
++# This file is in public domain.
++#
++
++error() {
++	echo "$@" 1>&2
++	exit 1
++}
++
++src="$1"
++dst="$2"
++
++check_path() {
++	case "$2" in
++		*/../*|*/./*|*/.|*/..) error "$1 path '$2' must be absolute";;
++		*/) error "$1 path '$2' must not end with '/'";;
++		/?*) ;;
++		*) error "$1 path '$2' must start with '/'";;
++	esac
++}
++
++check_path "source" "$src"
++check_path "destination" "$dst"
++
++# strip leading '/'
++src=${src#/*}
++tmp=${dst#/*}
++
++s_prefix=${src%%/*}
++d_prefix=${tmp%%/*}
++
++# strip leading common
++while [ "$s_prefix" = "$d_prefix" ]; do
++	src="${src#$s_prefix/}"
++	tmp="${tmp#$d_prefix/}"
++	s_prefix=${src%%/*}
++	d_prefix=${tmp%%/*}
++done
++
++s_prefix="../"
++while [ -n "$d_prefix" ] && [ "$tmp" != "$d_prefix" ]; do
++	s_prefix="../$s_prefix"
++	tmp="${tmp#$d_prefix/}"
++	d_prefix=${tmp%%/*}
++done
++
++ln -s -f "$s_prefix$src" "$dst"
+diff --git a/m4/ac_ln_srf.m4 b/m4/ac_ln_srf.m4
+new file mode 100644
+index 00000000..204b3439
+--- /dev/null
++++ b/m4/ac_ln_srf.m4
+@@ -0,0 +1,91 @@
++# Adapted from Autoconf Version 2.63 (GPLv2).
++#
++# Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
++# Free Software Foundation, Inc.
++#
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 2, or (at your option)
++# any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
++# 02110-1301, USA.
++#
++# As a special exception, the Free Software Foundation gives unlimited
++# permission to copy, distribute and modify the configure scripts that
++# are the output of Autoconf.  You need not follow the terms of the GNU
++# General Public License when using or distributing such scripts, even
++# though portions of the text of Autoconf appear in them.  The GNU
++# General Public License (GPL) does govern all other use of the material
++# that constitutes the Autoconf program.
++#
++# Certain portions of the Autoconf source text are designed to be copied
++# (in certain cases, depending on the input) into the output of
++# Autoconf.  We call these the "data" portions.  The rest of the Autoconf
++# source text consists of comments plus executable code that decides which
++# of the data portions to output in any given case.  We call these
++# comments and executable code the "non-data" portions.  Autoconf never
++# copies any of the non-data portions into its output.
++#
++# This special exception to the GPL applies to versions of Autoconf
++# released by the Free Software Foundation.  When you make and
++# distribute a modified version of Autoconf, you may extend this special
++# exception to the GPL to apply to your modified version as well, *unless*
++# your modified version has the potential to copy into its output some
++# of the text that was the non-data portion of the version that you started
++# with.  (In other words, unless your change moves or copies text from
++# the non-data portions to the data portions.)  If your modification has
++# such potential, you must delete any notice of this special exception
++# to the GPL from your modified version.
++
++# AS_LN_SRF_PREPARE
++# ------------------------------------
++m4_defun([AS_LN_SRF_PREPARE],
++[rm -f conf$$ conf$$.exe conf$$.file
++if test -d conf$$.dir; then
++  rm -f conf$$.dir/conf$$.file
++else
++  rm -f conf$$.dir
++  mkdir conf$$.dir 2>/dev/null
++fi
++if (echo >conf$$.file) 2>/dev/null; then
++  if ln -s -r conf$$.file conf$$ 2>/dev/null; then
++    as_ln_srf='ln -s -r -f'
++  elif ln -s conf$$.file conf$$ 2>/dev/null; then
++    as_ln_srf='./ln-srf'
++    # ... but there are two gotchas:
++    # 1) On MSYS, both `ln -s file dir' and `ln file dir' fail.
++    # 2) DJGPP < 2.04 has no symlinks; `ln -s' creates a wrapper executable.
++    # In both cases, we have to default to `cp -pRf'.
++    ln -s conf$$.file conf$$.dir 2>/dev/null && test ! -f conf$$.exe ||
++      as_ln_srf='cp -pRf'
++  elif ln conf$$.file conf$$ 2>/dev/null; then
++    as_ln_srf=ln
++  else
++    as_ln_srf='cp -pRf'
++  fi
++else
++  as_ln_srf='cp -pRf'
++fi
++rm -f conf$$ conf$$.exe conf$$.dir/conf$$.file conf$$.file
++rmdir conf$$.dir 2>/dev/null
++])# AS_LN_SRF_PREPARE
++
++# AC_PROG_LN_SRF
++# --------------------------------
++AC_DEFUN([AC_PROG_LN_SRF],
++[AC_MSG_CHECKING([whether ln -s -r -f works])
++AC_SUBST([LN_SRF], [$as_ln_srf])dnl
++if test "$LN_SRF" = "ln -s -r -f"; then
++  AC_MSG_RESULT([yes])
++else
++  AC_MSG_RESULT([no, using $LN_SRF])
++fi
++])# AC_PROG_LN_SRF
+-- 
+2.18.1
+
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 784cedfc1e..5355fc019e 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -8,7 +8,7 @@ CUPS_FILTERS_VERSION = 1.25.4
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-# 0001-Replace-relative-linking-with-absolute-linking.patch
+# 0001-install-support-old-ln-versions-without-the-r-option.patch
 CUPS_FILTERS_AUTORECONF = YES
 
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
-- 
2.18.1

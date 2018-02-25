From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 25 Feb 2018 19:34:15 +0100
Subject: [Buildroot] [PATCH 3/3] package/strace: enable demangling of C++
 symbol names in stack trace
In-Reply-To: <20180225183415.8362-1-romain.naour@gmail.com>
References: <20180225183415.8362-1-romain.naour@gmail.com>
Message-ID: <20180225183415.8362-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a new feature of strace 4.21 but the configure check need to
be fixed for Buildroot.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...1-configure-allow-autoreconf-from-tarball.patch | 36 ++++++++++++++++++++++
 ...0002-configure-fix-libiberty-header-check.patch | 33 ++++++++++++++++++++
 package/strace/strace.mk                           | 12 ++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 package/strace/0001-configure-allow-autoreconf-from-tarball.patch
 create mode 100644 package/strace/0002-configure-fix-libiberty-header-check.patch

diff --git a/package/strace/0001-configure-allow-autoreconf-from-tarball.patch b/package/strace/0001-configure-allow-autoreconf-from-tarball.patch
new file mode 100644
index 0000000000..92dc7ed585
--- /dev/null
+++ b/package/strace/0001-configure-allow-autoreconf-from-tarball.patch
@@ -0,0 +1,36 @@
+From b2247bbd30989c707f3cb5bbd9635c52e5c962e6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 17 Feb 2018 13:23:25 +0100
+Subject: [PATCH] configure: allow autoreconf from tarball
+
+git-version-gen copyright-year-gen file-date-gen tools
+are missing from the strace tarball breaking autoreconf.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 86b8a8eb..f1a47b97 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,12 +32,12 @@
+ 
+ AC_PREREQ(2.57)
+ AC_INIT([strace],
+-	m4_esyscmd([./git-version-gen .tarball-version]),
++	4.21,
+ 	[strace-devel at lists.sourceforge.net],
+ 	[strace],
+ 	[https://strace.io])
+-m4_define([copyright_year], m4_esyscmd([./copyright-year-gen .year]))
+-m4_define([manpage_date], m4_esyscmd([./file-date-gen strace.1.in]))
++m4_define([copyright_year], 2018)
++m4_define([manpage_date], 2018-02-11)
+ AC_COPYRIGHT([Copyright (c) 1999-]copyright_year[ The strace developers.])
+ AC_CONFIG_SRCDIR([strace.c])
+ AC_CONFIG_AUX_DIR([.])
+-- 
+2.14.3
+
diff --git a/package/strace/0002-configure-fix-libiberty-header-check.patch b/package/strace/0002-configure-fix-libiberty-header-check.patch
new file mode 100644
index 0000000000..29bfb40ac3
--- /dev/null
+++ b/package/strace/0002-configure-fix-libiberty-header-check.patch
@@ -0,0 +1,33 @@
+From 9487aac43518272074a1e1131c517b35b2529580 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 17 Feb 2018 12:38:37 +0100
+Subject: [PATCH] configure: fix libiberty header check
+
+The demangle.h header check for libiberty is looking at two potential
+file location. If one is missing the check fail.
+
+Since binutils package install demangle.h in
+"STAGING_DIR/usr/include/libiberty/demangle.h", remove the wrong
+path.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f1a47b97..052ce971 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -922,7 +922,7 @@ use_libiberty=no
+ AS_IF([test "x$use_libunwind" = xyes && test "x$with_libiberty" != xno],
+       [saved_CPPFLAGS="$CPPFLAGS"
+        CPPFLAGS="$CPPFLAGS $libiberty_CPPFLAGS"
+-       AC_CHECK_HEADERS([demangle.h libiberty/demangle.h],
++       AC_CHECK_HEADERS([libiberty/demangle.h],
+ 	 [saved_LDFLAGS="$LDFLAGS"
+ 	  LDFLAGS="$LDFLAGS $libiberty_LDFLAGS"
+ 	  AC_CHECK_LIB([iberty],[cplus_demangle],
+-- 
+2.14.3
+
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 9c1fab3871..f55755429d 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -10,6 +10,10 @@ STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSI
 STRACE_LICENSE = BSD-3-Clause
 STRACE_LICENSE_FILES = COPYING
 
+# 0001-configure-allow-autoreconf-from-tarball.patch
+# 0002-configure-fix-libiberty-header-check.patch
+STRACE_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 STRACE_DEPENDENCIES += libunwind
 STRACE_CONF_OPTS += --with-libunwind
@@ -17,6 +21,14 @@ else
 STRACE_CONF_OPTS += --without-libunwind
 endif
 
+# Demangling symbols in stack trace needs libunwind and libiberty.
+ifeq ($(BR2_PACKAGE_BINUTILS)$(BR2_PACKAGE_LIBUNWIND),yy)
+STRACE_DEPENDENCIES += binutils
+STRACE_CONF_OPTS += --with-libiberty=$(STAGING_DIR)/usr
+else
+STRACE_CONF_OPTS += --without-libiberty
+endif
+
 # strace bundle some kernel headers to build libmpers, this mixes userspace
 # headers and kernel headers which break the build with musl.
 # The stddef.h from gcc is used instead of the one from musl.
-- 
2.14.3

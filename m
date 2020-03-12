From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 13:10:02 -0700
Subject: [Buildroot] [PATCH v2 2/3] package/gettext-gnu: bump version to
 0.20.1
In-Reply-To: <20200312201004.3848419-1-aduskett@gmail.com>
References: <20200312201004.3848419-1-aduskett@gmail.com>
Message-ID: <20200312201004.3848419-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Update license hash due to http -> https URL changes.
  - Depend on libtextstyle.
  - Update 0001-error_print_progname.patch to apply cleanly.
  - Remove upstream 0002-Update-after-gnulib-changed.patch
  - Add 0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
    which allows gettext-tools to build with an external libtextstyle.

Tested under Debian 8 with test-pkg -a:
44 builds, 5 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0001-error_print_progname.patch           |  14 +-
 .../0002-Update-after-gnulib-changed.patch    |  86 -----------
 ...-buld-gettext-tools-seperately-part1.patch | 142 ++++++++++++++++++
 package/gettext-gnu/Config.in                 |   1 +
 package/gettext-gnu/gettext-gnu.hash          |  11 +-
 package/gettext-gnu/gettext-gnu.mk            |   9 +-
 6 files changed, 164 insertions(+), 99 deletions(-)
 delete mode 100644 package/gettext-gnu/0002-Update-after-gnulib-changed.patch
 create mode 100644 package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch

diff --git a/package/gettext-gnu/0001-error_print_progname.patch b/package/gettext-gnu/0001-error_print_progname.patch
index 189d28b576..7e1d3c55cf 100644
--- a/package/gettext-gnu/0001-error_print_progname.patch
+++ b/package/gettext-gnu/0001-error_print_progname.patch
@@ -1,6 +1,11 @@
---- gettext-0.16.1.oorig/gettext-tools/gnulib-lib/error.h	2006-11-27 18:14:50.000000000 +0100
-+++ gettext-0.16.1/gettext-tools/gnulib-lib/error.h	2007-06-20 13:29:32.000000000 +0200
-@@ -50,7 +50,10 @@ extern void error_at_line (int __status,
+[Updated to apply cleanly with 0.20.1]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+diff --git a/gettext-tools/gnulib-lib/error.h b/gettext-tools/gnulib-lib/error.h
+index 61771cc..4221684 100644
+--- a/gettext-tools/gnulib-lib/error.h
++++ b/gettext-tools/gnulib-lib/error.h
+@@ -68,7 +68,10 @@ extern void error_at_line (int __status, int __errnum, const char *__fname,
  /* If NULL, error will flush stdout, then print on stderr the program
     name, a colon and a space.  Otherwise, error will call this
     function without parameters instead.  */
@@ -10,5 +15,6 @@
 +#endif
 +void (*error_print_progname) (void);
  
- /* This variable is incremented each time `error' is called.  */
+ /* This variable is incremented each time 'error' is called.  */
  extern DLL_VARIABLE unsigned int error_message_count;
+--
diff --git a/package/gettext-gnu/0002-Update-after-gnulib-changed.patch b/package/gettext-gnu/0002-Update-after-gnulib-changed.patch
deleted file mode 100644
index 5f5e5f6c25..0000000000
--- a/package/gettext-gnu/0002-Update-after-gnulib-changed.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From a6f9caf8cc7614665d1be694485dd7bc30399e0f Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Tue, 16 May 2017 00:27:57 +0200
-Subject: [PATCH] Update after gnulib changed.
-
-For buildroot we only need to update wint_t.m4 to fix autoreconf with
-certain packages which already contain the updated version of this file.
-Otherwise autoreconf will break:
-
-http://git.net/ml/bug-gnulib-gnu/2017-01/msg00067.html
-https://git.busybox.net/buildroot/commit/package/wget?id=c36f0d65ad63589f1b21833ef53d429c018b6f8a
-
-Patch backported from upstream commit:
-http://git.savannah.gnu.org/cgit/gettext.git/commit/?id=a6f9caf8cc7614665d1be694485dd7bc30399e0f
-
-Needed for coreutils bump to 8.27
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/gettext-runtime/m4/wint_t.m4 b/gettext-runtime/m4/wint_t.m4
-index 8ff2a5b5a..d30b8bcf8 100644
---- a/gettext-runtime/m4/wint_t.m4
-+++ b/gettext-runtime/m4/wint_t.m4
-@@ -1,11 +1,12 @@
--# wint_t.m4 serial 5 (gettext-0.18.2)
--dnl Copyright (C) 2003, 2007-2016 Free Software Foundation, Inc.
-+# wint_t.m4 serial 7
-+dnl Copyright (C) 2003, 2007-2017 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
- 
- dnl From Bruno Haible.
--dnl Test whether <wchar.h> has the 'wint_t' type.
-+dnl Test whether <wchar.h> has the 'wint_t' type and whether gnulib's
-+dnl <wchar.h> or <wctype.h> would, if present, override 'wint_t'.
- dnl Prerequisite: AC_PROG_CC
- 
- AC_DEFUN([gt_TYPE_WINT_T],
-@@ -28,5 +29,46 @@ AC_DEFUN([gt_TYPE_WINT_T],
-        [gt_cv_c_wint_t=no])])
-   if test $gt_cv_c_wint_t = yes; then
-     AC_DEFINE([HAVE_WINT_T], [1], [Define if you have the 'wint_t' type.])
-+
-+    dnl Determine whether gnulib's <wchar.h> or <wctype.h> would, if present,
-+    dnl override 'wint_t'.
-+    AC_CACHE_CHECK([whether wint_t is too small],
-+      [gl_cv_type_wint_t_too_small],
-+      [AC_COMPILE_IFELSE(
-+           [AC_LANG_PROGRAM([[
-+/* Tru64 with Desktop Toolkit C has a bug: <stdio.h> must be included before
-+   <wchar.h>.
-+   BSD/OS 4.0.1 has a bug: <stddef.h>, <stdio.h> and <time.h> must be
-+   included before <wchar.h>.  */
-+#if !(defined __GLIBC__ && !defined __UCLIBC__)
-+# include <stddef.h>
-+# include <stdio.h>
-+# include <time.h>
-+#endif
-+#include <wchar.h>
-+              int verify[sizeof (wint_t) < sizeof (int) ? -1 : 1];
-+              ]])],
-+           [gl_cv_type_wint_t_too_small=no],
-+           [gl_cv_type_wint_t_too_small=yes])])
-+    if test $gl_cv_type_wint_t_too_small = yes; then
-+      GNULIB_OVERRIDES_WINT_T=1
-+    else
-+      GNULIB_OVERRIDES_WINT_T=0
-+    fi
-+  else
-+    GNULIB_OVERRIDES_WINT_T=0
-+  fi
-+  AC_SUBST([GNULIB_OVERRIDES_WINT_T])
-+])
-+
-+dnl Prerequisites of the 'wint_t' override.
-+AC_DEFUN([gl_TYPE_WINT_T_PREREQ],
-+[
-+  AC_CHECK_HEADERS_ONCE([crtdefs.h])
-+  if test $ac_cv_header_crtdefs_h = yes; then
-+    HAVE_CRTDEFS_H=1
-+  else
-+    HAVE_CRTDEFS_H=0
-   fi
-+  AC_SUBST([HAVE_CRTDEFS_H])
- ])
diff --git a/package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch b/package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
new file mode 100644
index 0000000000..5334a36bb7
--- /dev/null
+++ b/package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
@@ -0,0 +1,142 @@
+From e4b3a3f56fa6fc2a51769e286545f0631bb4837c Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Sat, 18 May 2019 23:33:06 +0200
+Subject: [PATCH] build: Restore the ability to build gettext-tools separately, part 1.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Reported by Hanspeter Niederstrasser <nieder@users.sourceforge.net>
+in <https://savannah.gnu.org/bugs/?56333>.
+
+Code based on patch by Miguel ?ngel Arruga Vivas <rosen644835@gmail.com>.
+
+* autogen.sh: Copy libtextstyle.m4 for use by gettext-tools.
+* gettext-tools/configure.ac: New option --with-installed-libtextstyle.
+(USE_INSTALLED_LIBTEXTSTYLE): New conditional.
+* gettext-tools/src/Makefile.am (textstyle.h): Disable rule if
+USE_INSTALLED_LIBTEXTSTYLE is true.
+(LT_LIBTEXTSTYLE): New variable.
+(libgettextsrc_la_LDFLAGS): Use it instead of hardcoding a relative filename of
+libtextstyle.la.
+* configure.ac: Filter out --with-installed-libtextstyle from inherited --help
+output.
+* Makefile.am (distcheck-hook): Compare different copies of libtextstyle.m4.
+* PACKAGING: Document that gettext-tools's configure needs to be invoked with
+--with-installed-libtextstyle.
+
+Upstream-status: committed.
+https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=e4b3a3f56fa6fc2a51769e286545f0631bb4837c
+
+Signed-off-by: Bruno Haible <bruno@clisp.org>
+[Backported to 0.20.1]
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ PACKAGING                     |  2 +-
+ autogen.sh                    |  1 +
+ configure.ac                  |  2 +-
+ gettext-tools/configure.ac    | 16 ++++++++++++++++
+ gettext-tools/src/Makefile.am |  8 +++++++-
+ 5 files changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/PACKAGING b/PACKAGING
+index a8ce979..52b80ac 100644
+--- a/PACKAGING
++++ b/PACKAGING
+@@ -42,7 +42,7 @@ The 'libtextstyle' binary package can be installed by doing
+ The 'gettext-tools' binary package can be installed by doing
+ 
+       cd gettext-tools
+-      ./configure
++      ./configure --with-installed-libtextstyle
+       make
+       make install
+ 
+diff --git a/autogen.sh b/autogen.sh
+index 5c28b6f..2ccf373 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -268,6 +268,7 @@ if ! $skip_gnulib; then
+   $GNULIB_TOOL --dir=gettext-tools --lib=libgettextlib --source-base=gnulib-lib --m4-base=gnulib-m4 --tests-base=gnulib-tests --makefile-name=Makefile.gnulib --libtool --with-tests --local-dir=gnulib-local --local-symlink \
+     --import --avoid=array-list-tests --avoid=linkedhash-list-tests --avoid=hash-tests --avoid=fdutimensat-tests --avoid=futimens-tests --avoid=utime-tests --avoid=utimens-tests --avoid=utimensat-tests \
+     `for m in $GNULIB_MODULES_TOOLS_LIBUNISTRING_TESTS; do echo --avoid=$m; done` $GNULIB_MODULES_TOOLS_FOR_SRC $GNULIB_MODULES_TOOLS_FOR_SRC_COMMON_DEPENDENCIES $GNULIB_MODULES_TOOLS_OTHER || exit $?
++  $GNULIB_TOOL --copy-file m4/libtextstyle.m4 gettext-tools/gnulib-m4/libtextstyle.m4 || exit $?
+   # In gettext-tools/libgrep:
+   GNULIB_MODULES_TOOLS_FOR_LIBGREP='
+     mbrlen
+diff --git a/configure.ac b/configure.ac
+index 38db6fd..0c84bdd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -49,7 +49,7 @@ AC_CANONICAL_HOST
+ dnl Optional Features: AC_ARG_ENABLE calls
+ dnl Optional Packages: AC_ARG_WITH calls
+ dnl Some influential environment variables: AC_ARG_VAR calls
+-esyscmd([{ cd gettext-runtime && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; cd libtextstyle && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; cd gettext-tools && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; } | sed -f build-aux/ac-help.sed ])
++esyscmd([{ cd gettext-runtime && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; cd libtextstyle && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; { cd gettext-tools && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; } | grep -v installed.libtextstyle; } | sed -f build-aux/ac-help.sed ])
+ 
+ AC_CONFIG_FILES([Makefile])
+ 
+diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
+index cf1dd73..a6816b8 100644
+--- a/gettext-tools/configure.ac
++++ b/gettext-tools/configure.ac
+@@ -121,6 +121,22 @@ AM_CONDITIONAL([PACKAGE_IS_GETTEXT_TOOLS], [true])
+ AM_CONDITIONAL([PRELOADABLE_LIBINTL],
+   [test $USE_INCLUDED_LIBINTL = no && test $GLIBC2 = yes])
+ 
++dnl This option allows to build gettext-tools without (re)building libtextstyle.
++AC_ARG_WITH([installed-libtextstyle],
++  [AS_HELP_STRING([--with-installed-libtextstyle],
++     [Use an already installed libtextstyle.])],
++  [gt_use_installed_libtextstyle=$withval],
++  [gt_use_installed_libtextstyle=no])
++if test "$gt_use_installed_libtextstyle" != no; then
++  gl_LIBTEXTSTYLE
++else
++  test -f ../libtextstyle/Makefile || {
++    AC_MSG_ERROR([When building the gettext-tools package without building the entire gettext package, you need to pass the --with-installed-libtextstyle option to configure.])
++  }
++fi
++AM_CONDITIONAL([USE_INSTALLED_LIBTEXTSTYLE],
++  [test "$gt_use_installed_libtextstyle" != no])
++
+ dnl This line internationalizes the bison generated parsers.
+ BISON_I18N
+ 
+diff --git a/gettext-tools/src/Makefile.am b/gettext-tools/src/Makefile.am
+index b98b7ab..af3dcee 100644
+--- a/gettext-tools/src/Makefile.am
++++ b/gettext-tools/src/Makefile.am
+@@ -250,6 +250,9 @@ cldr_plurals_SOURCES = cldr-plural.y cldr-plural-exp.c cldr-plurals.c
+ cldr_plurals_CFLAGS = $(AM_CFLAGS) $(INCXML)
+ cldr_plurals_LDADD = libgettextsrc.la $(LDADD)
+ 
++if USE_INSTALLED_LIBTEXTSTYLE
++LT_LIBTEXTSTYLE = @LTLIBTEXTSTYLE@
++else
+ # How to get the include files of libtextstyle.
+ textstyle.h textstyle/stdbool.h textstyle/version.h textstyle/woe32dll.h:
+ 	here=`pwd`; \
+@@ -257,6 +260,9 @@ textstyle.h textstyle/stdbool.h textstyle/version.h textstyle/woe32dll.h:
+ 	  $(MAKE) install-nobase_includeHEADERS install-nobase_nodist_includeHEADERS includedir="$$here"
+ BUILT_SOURCES    += textstyle.h textstyle/stdbool.h textstyle/version.h textstyle/woe32dll.h
+ MOSTLYCLEANFILES += textstyle.h textstyle/stdbool.h textstyle/version.h textstyle/woe32dll.h
++# Where to find the built libtextstyle library.
++LT_LIBTEXTSTYLE = ../../libtextstyle/lib/libtextstyle.la
++endif
+ 
+ # How to build libgettextsrc.la.
+ # Need ../gnulib-lib/libgettextlib.la.
+@@ -268,7 +274,7 @@ MOSTLYCLEANFILES += textstyle.h textstyle/stdbool.h textstyle/version.h textstyl
+ # use iconv().
+ libgettextsrc_la_LDFLAGS = \
+   -release @VERSION@ \
+-  ../gnulib-lib/libgettextlib.la $(LTLIBUNISTRING) ../../libtextstyle/lib/libtextstyle.la @LTLIBINTL@ @LTLIBICONV@ -lc -no-undefined
++  ../gnulib-lib/libgettextlib.la $(LTLIBUNISTRING) $(LT_LIBTEXTSTYLE) @LTLIBINTL@ @LTLIBICONV@ -lc -no-undefined
+ 
+ # OS/2 does not support a DLL name longer than 8 characters.
+ if OS2
+-- 
+2.24.1
+
diff --git a/package/gettext-gnu/Config.in b/package/gettext-gnu/Config.in
index 27e7a3da4c..85ddb62788 100644
--- a/package/gettext-gnu/Config.in
+++ b/package/gettext-gnu/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GETTEXT_GNU
 	bool
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_HAS_GETTEXT
+	select BR2_PACKAGE_LIBTEXTSTYLE
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
 	  framework to help other GNU packages produce multi-lingual
diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index 5a621ae2d3..4c17fb3e04 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,6 +1,7 @@
-# From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
-md5	df3f5690eaa30fd228537b00cb7b7590	gettext-0.19.8.1.tar.xz
-sha1	e0fe90ede22f7f16bbde7bdea791a835f2773fc9	gettext-0.19.8.1.tar.xz
-# License files, locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
+sha1  62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90  gettext-0.20.1.tar.xz
+
+# Locally calculated
+sha256  53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800  gettext-0.20.1.tar.xz
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 28662e0dec..937b0f5262 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_GNU_VERSION = 0.19.8.1
+GETTEXT_GNU_VERSION = 0.20.1
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
@@ -13,10 +13,10 @@ GETTEXT_GNU_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
 # 0002-Update-after-gnulib-changed.patch
 GETTEXT_GNU_AUTORECONF = YES
 GETTEXT_GNU_PROVIDES = gettext
-GETTEXT_GNU_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+GETTEXT_GNU_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv) libtextstyle
 
 # Avoid using the bundled subset of libxml2
-HOST_GETTEXT_GNU_DEPENDENCIES = host-libxml2
+HOST_GETTEXT_GNU_DEPENDENCIES = host-libxml2 host-libtextstyle
 
 GETTEXT_GNU_CONF_OPTS += \
 	--disable-libasprintf \
@@ -38,7 +38,8 @@ HOST_GETTEXT_GNU_CONF_OPTS = \
 	--disable-native-java \
 	--disable-csharp \
 	--disable-relocatable \
-	--without-emacs
+	--without-emacs \
+	--with-installed-libtextstyle
 
 # Force the build of libintl, even if the C library provides a stub
 # gettext implementation
-- 
2.24.1

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:55:35 +0200
Subject: [Buildroot] [git commit] package/popt: fix build without wchar
Message-ID: <20200919194742.73DF88282D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cb057314a406afd9925b22686e1633b4e9ff697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 82442b54b640fd4fbd5677e02690346a59f6cf13 removed
0001-no-wchar.patch but without importing an upstream patch that
"should" have been equivalent to our patch but resulted in a build
failure on toolchains with wchar but without mbsrtowcs

So add a bunch of upstream patches and a new patch to fix this build
failure

While at it, also put back 0003-glob-detection.patch which, again, has
been upstreamed but is not in version 1.18 ...

Fixes:
 - http://autobuild.buildroot.org/results/27f184af35468941173628e5e847a284c0b80d73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/popt/0002-Detect-glob_pattern_p.patch      | 53 +++++++++++++++
 .../0003-configure-replace-deprecated-macros.patch | 76 ++++++++++++++++++++++
 package/popt/0004-fix-build-without-wchar.patch    | 53 +++++++++++++++
 .../popt/0005-fix-build-without-mbstate_t.patch    | 68 +++++++++++++++++++
 package/popt/popt.mk                               |  2 +
 5 files changed, 252 insertions(+)

diff --git a/package/popt/0002-Detect-glob_pattern_p.patch b/package/popt/0002-Detect-glob_pattern_p.patch
new file mode 100644
index 0000000000..f64ad36f86
--- /dev/null
+++ b/package/popt/0002-Detect-glob_pattern_p.patch
@@ -0,0 +1,53 @@
+From 3938da1286534e4b280340411336eed5b6311d1b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 Jul 2020 23:21:32 +0200
+Subject: [PATCH] Detect glob_pattern_p()
+
+The current popt build system tests the existence of <glob.h>, and
+then assumes that if __GLIBC__ is defined, then glob_pattern_p() must
+be available. Unfortunately, that's not true with uClibc: <glob.h> may
+be installed, but not necessarily the GNU glob extensions... and
+uClibc defines __GLIBC__. This is causing build issues with certain
+uClibc toolchains that do not have GNU glob extensions enabled.
+
+To fix this, this patch adds an AC_CHECK_FUNCS() test for
+glob_pattern_p, and uses that to find out whether glob_pattern_p() is
+available or not.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Retrieved (and slightly updated) from:
+https://git.buildroot.net/buildroot/tree/package/popt/0003-glob-detection.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rpm-software-management/popt/commit/3938da1286534e4b280340411336eed5b6311d1b]
+---
+ configure.ac     | 2 +-
+ src/poptconfig.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a5568c4..3b71d1a 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -50,7 +50,7 @@ AC_ARG_ENABLE(build-gcov,
+ ])
+ 
+ AC_SEARCH_LIBS(setreuid, [ucb])
+-AC_CHECK_FUNCS(getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom)
++AC_CHECK_FUNCS(getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p)
+ 
+ AM_GNU_GETTEXT_VERSION([0.18.2])
+ AM_GNU_GETTEXT([external])
+diff --git a/src/poptconfig.c b/src/poptconfig.c
+index 9d97ccd..b4d1b76 100644
+--- a/src/poptconfig.c
++++ b/src/poptconfig.c
+@@ -21,7 +21,7 @@
+ #if defined(HAVE_GLOB_H)
+ #include <glob.h>
+ 
+-#if !defined(__GLIBC__)
++#if !defined(HAVE_GLOB_PATTERN_P)
+ /* Return nonzero if PATTERN contains any metacharacters.
+    Metacharacters can be quoted with backslashes if QUOTE is nonzero.  */
+ static int
diff --git a/package/popt/0003-configure-replace-deprecated-macros.patch b/package/popt/0003-configure-replace-deprecated-macros.patch
new file mode 100644
index 0000000000..32a6a8dc27
--- /dev/null
+++ b/package/popt/0003-configure-replace-deprecated-macros.patch
@@ -0,0 +1,76 @@
+From f492b19f59229b0494b5b9ffe5c660a35493a405 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Mon, 29 Jun 2020 18:58:09 +0200
+Subject: [PATCH] configure: replace deprecated macros
+
+* use LT_INIT instead of deprecated AC_PROG_LIBTOOL
+* use AS_HELP_STRING instead of deprecated AC_HELP_STRING
+* quote macros
+
+[Retrieved from:
+https://github.com/rpm-software-management/popt/commit/f492b19f59229b0494b5b9ffe5c660a35493a405]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+ mode change 100755 => 100644 configure.ac
+
+diff --git a/configure.ac b/configure.ac
+old mode 100755
+new mode 100644
+index 3b71d1a..009ae7b
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,5 @@
+-AC_PREREQ(2.57)
+-AC_INIT(popt, 1.18, rpm-maint at lists.rpm.org)
++AC_PREREQ([2.57])
++AC_INIT([popt], [1.18], [rpm-maint at lists.rpm.org])
+ AC_CONFIG_SRCDIR([src/popt.h])
+ AC_CONFIG_HEADERS([config.h])
+ 
+@@ -14,11 +14,11 @@ AC_USE_SYSTEM_EXTENSIONS
+ AM_PROG_AR
+ 
+ AC_PROG_INSTALL
+-AC_PROG_LIBTOOL
++LT_INIT
+ 
+ AC_SYS_LARGEFILE
+ 
+-AC_CHECK_HEADERS(fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h)
++AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h])
+ 
+ # For some systems we know that we have ld_version scripts.
+ # Use it then as default.
+@@ -32,15 +32,15 @@ case "${host}" in
+         ;;
+ esac
+ AC_ARG_ENABLE([ld-version-script],
+-              AC_HELP_STRING([--enable-ld-version-script],
++              [AS_HELP_STRING([--enable-ld-version-script],
+                              [enable/disable use of linker version script.
+-                              (default is system dependent)]),
++                              (default is system dependent)])],
+               [have_ld_version_script=$enableval],
+               [ : ] )
+ AM_CONDITIONAL(HAVE_LD_VERSION_SCRIPT, test "$have_ld_version_script" = "yes")
+ 
+-AC_ARG_ENABLE(build-gcov,
+-    AS_HELP_STRING([--enable-build-gcov], [build POPT instrumented for gcov]), [dnl
++AC_ARG_ENABLE([build-gcov],
++    [AS_HELP_STRING([--enable-build-gcov], [build POPT instrumented for gcov])], [dnl
+     if test ".$enableval" = .yes; then
+         if test ".`$CC --version 2>&1 | grep 'GCC'`" != .; then
+             dnl # GNU GCC (usually "gcc")
+@@ -49,8 +49,8 @@ AC_ARG_ENABLE(build-gcov,
+     fi
+ ])
+ 
+-AC_SEARCH_LIBS(setreuid, [ucb])
+-AC_CHECK_FUNCS(getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p)
++AC_SEARCH_LIBS([setreuid], [ucb])
++AC_CHECK_FUNCS([getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p])
+ 
+ AM_GNU_GETTEXT_VERSION([0.18.2])
+ AM_GNU_GETTEXT([external])
diff --git a/package/popt/0004-fix-build-without-wchar.patch b/package/popt/0004-fix-build-without-wchar.patch
new file mode 100644
index 0000000000..a5bb09918d
--- /dev/null
+++ b/package/popt/0004-fix-build-without-wchar.patch
@@ -0,0 +1,53 @@
+From 41911aac46d69df6a205af59d60f23a418b0e875 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Sep 2020 11:55:17 +0200
+Subject: [PATCH] fix build without wchar
+
+Check for wchar.h and use HAVE_WCHAR_H instead of hardcoding
+POPT_WCHAR_HACK to fix the build with (embedded) toolchains that don't
+support wchar
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rpm-software-management/popt/commit/41911aac46d69df6a205af59d60f23a418b0e875]
+---
+ configure.ac   | 2 +-
+ src/popthelp.c | 5 ++---
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 009ae7b..1fce6df 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,7 +18,7 @@ LT_INIT
+ 
+ AC_SYS_LARGEFILE
+ 
+-AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h])
++AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h wchar.h])
+ 
+ # For some systems we know that we have ld_version scripts.
+ # Use it then as default.
+diff --git a/src/popthelp.c b/src/popthelp.c
+index 9a3f489..5cbc1f4 100644
+--- a/src/popthelp.c
++++ b/src/popthelp.c
+@@ -15,8 +15,7 @@
+ #include <sys/ioctl.h>
+ #endif
+ 
+-#define	POPT_WCHAR_HACK
+-#ifdef 	POPT_WCHAR_HACK
++#ifdef HAVE_WCHAR_H
+ #include <wchar.h>			/* for mbsrtowcs */
+ #endif
+ #include "poptint.h"
+@@ -118,7 +117,7 @@ static size_t maxColumnWidth(FILE *fp)
+ static inline size_t stringDisplayWidth(const char *s)
+ {
+     size_t n = strlen(s);
+-#ifdef	POPT_WCHAR_HACK
++#ifdef HAVE_WCHAR_H
+     mbstate_t t;
+ 
+     memset ((void *)&t, 0, sizeof (t));	/* In initial state.  */
diff --git a/package/popt/0005-fix-build-without-mbstate_t.patch b/package/popt/0005-fix-build-without-mbstate_t.patch
new file mode 100644
index 0000000000..12bc73ee95
--- /dev/null
+++ b/package/popt/0005-fix-build-without-mbstate_t.patch
@@ -0,0 +1,68 @@
+From e4788a0f9d820574a165b2609ff16b717ce0baba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 19 Sep 2020 18:51:15 +0200
+Subject: [PATCH] fix build without mbstate_t
+
+Commit 41911aac46d69df6a205af59d60f23a418b0e875 tried to fix build
+without wchar by checking for the availability of wchar.h however some
+toolchains have wchar.h but does not define mbstate_t and mbsrtowcs so
+replace HAVE_WCHAR_H by HAVE_MBSRTOWCS
+
+Fixes:
+ - http://autobuild.buildroot.org/results/27f184af35468941173628e5e847a284c0b80d73
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://github.com/rpm-software-management/popt/pull/51]
+---
+ configure.ac   | 4 ++--
+ src/popthelp.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1fce6df..442086b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,7 +18,7 @@ LT_INIT
+ 
+ AC_SYS_LARGEFILE
+ 
+-AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h wchar.h])
++AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h])
+ 
+ # For some systems we know that we have ld_version scripts.
+ # Use it then as default.
+@@ -50,7 +50,7 @@ AC_ARG_ENABLE([build-gcov],
+ ])
+ 
+ AC_SEARCH_LIBS([setreuid], [ucb])
+-AC_CHECK_FUNCS([getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p])
++AC_CHECK_FUNCS([getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p mbsrtowcs])
+ 
+ AM_GNU_GETTEXT_VERSION([0.18.2])
+ AM_GNU_GETTEXT([external])
+diff --git a/src/popthelp.c b/src/popthelp.c
+index f604516..b4ab9b4 100644
+--- a/src/popthelp.c
++++ b/src/popthelp.c
+@@ -15,7 +15,7 @@
+ #include <sys/ioctl.h>
+ #endif
+ 
+-#ifdef HAVE_WCHAR_H
++#ifdef HAVE_MBSRTOWCS
+ #include <wchar.h>			/* for mbsrtowcs */
+ #endif
+ #include "poptint.h"
+@@ -117,7 +117,7 @@ static size_t maxColumnWidth(FILE *fp)
+ static inline size_t stringDisplayWidth(const char *s)
+ {
+     size_t n = strlen(s);
+-#ifdef HAVE_WCHAR_H
++#ifdef HAVE_MBSRTOWCS
+     mbstate_t t;
+ 
+     memset ((void *)&t, 0, sizeof (t));	/* In initial state.  */
+-- 
+2.28.0
+
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 45f4fb2535..5c4863ce40 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -11,6 +11,8 @@ POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
 POPT_GETTEXTIZE = YES
 POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+# We're patching configure.ac
+POPT_AUTORECONF = YES
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 

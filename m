From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:23:07 +0200
Subject: [Buildroot] [git commit] package/popt: bump to version 1.18
Message-ID: <20200919122224.A5AFF81042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82442b54b640fd4fbd5677e02690346a59f6cf13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update home page URL
- change download to new location
- remove old patches (first release since 2010)
- autoreconf now useless

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pc.patch => 0001-add-libiconv-to-popt.pc.patch} |  8 ++---
 package/popt/0001-no-wchar.patch                   | 12 -------
 package/popt/0002-fix-autoreconf.patch             | 38 --------------------
 package/popt/0003-glob-detection.patch             | 41 ----------------------
 package/popt/Config.in                             |  2 +-
 package/popt/popt.hash                             |  4 +--
 package/popt/popt.mk                               |  5 ++-
 7 files changed, 9 insertions(+), 101 deletions(-)

diff --git a/package/popt/0004-add-libiconv-to-popt.pc.patch b/package/popt/0001-add-libiconv-to-popt.pc.patch
similarity index 67%
rename from package/popt/0004-add-libiconv-to-popt.pc.patch
rename to package/popt/0001-add-libiconv-to-popt.pc.patch
index 087a30bb7a..baa3cd530d 100644
--- a/package/popt/0004-add-libiconv-to-popt.pc.patch
+++ b/package/popt/0001-add-libiconv-to-popt.pc.patch
@@ -8,12 +8,12 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
-diff -Naurp popt-1.16-vanilla/popt.pc.in popt-1.16/popt.pc.in
---- popt-1.16-vanilla/popt.pc.in	2018-11-22 20:26:55.735211662 +0100
-+++ popt-1.16/popt.pc.in	2018-11-22 20:34:11.371303724 +0100
+diff -Naurp popt-1.18-vanilla/popt.pc.in popt-1.18/popt.pc.in
+--- popt-1.18-vanilla/popt.pc.in	2020-03-24 10:36:25.000000000 +0100
++++ popt-1.18/popt.pc.in	2020-09-18 21:18:03.112609343 +0200
 @@ -7,4 +7,5 @@ Name: popt
  Version: @VERSION@
  Description: popt library.
- Libs: @POPT_PKGCONFIG_LIBS@
+ Libs: -L${libdir} -lpopt
 +Libs.private: @LTLIBICONV@
  Cflags: -I${includedir}
diff --git a/package/popt/0001-no-wchar.patch b/package/popt/0001-no-wchar.patch
deleted file mode 100644
index 161165e72c..0000000000
--- a/package/popt/0001-no-wchar.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ru popt-1.14_vanilla/popthelp.c popt-1.14_no-wchar/popthelp.c
---- popt-1.14_vanilla/popthelp.c	2008-03-27 17:33:08.000000000 +0000
-+++ popt-1.14_no-wchar/popthelp.c	2008-04-10 05:44:43.000000000 +0000
-@@ -15,7 +15,7 @@
- #include <sys/ioctl.h>
- #endif
- 
--#define	POPT_WCHAR_HACK
-+/* #define	POPT_WCHAR_HACK */
- #ifdef 	POPT_WCHAR_HACK
- #include <wchar.h>			/* for mbsrtowcs */
- /*@access mbstate_t @*/
diff --git a/package/popt/0002-fix-autoreconf.patch b/package/popt/0002-fix-autoreconf.patch
deleted file mode 100644
index f1fcc57a85..0000000000
--- a/package/popt/0002-fix-autoreconf.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Make sure we can autoreconfigure popt
-
-This commit makes a few changes in the popt build system to allow it
-to be autoreconfigured with modern autotools:
-
- - the TESTS variable shouldn't be using $(top_srcdir), and since we
-   don't care about tests in Buildroot, we just disable it.
-
- - the AM_C_PROTOTYPES macro is deprecated and should no longer be
-   used, causes an error with autoconf/automake.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -37,8 +37,6 @@
- TESTS_ENVIRONMENT = \
- test1="$(top_builddir)/test1"
- 
--TESTS = $(top_srcdir)/testit.sh
--
- include_HEADERS = popt.h
- 
- usrlibdir = $(libdir)
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -46,7 +46,6 @@
- AC_SYS_LARGEFILE
- 
- AC_ISC_POSIX
--AM_C_PROTOTYPES
- 
- AC_CHECK_HEADERS(float.h fnmatch.h glob.h langinfo.h libintl.h mcheck.h unistd.h)
- 
diff --git a/package/popt/0003-glob-detection.patch b/package/popt/0003-glob-detection.patch
deleted file mode 100644
index 7bdce7d717..0000000000
--- a/package/popt/0003-glob-detection.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Detect glob_pattern_p()
-
-The current popt build system tests the existence of <glob.h>, and
-then assumes that if __GLIBC__ is defined, then glob_pattern_p() must
-be available. Unfortunately, that's not true with uClibc: <glob.h> may
-be installed, but not necessarily the GNU glob extensions... and
-uClibc defines __GLIBC__. This is causing build issues with certain
-uClibc toolchains that do not have GNU glob extensions enabled.
-
-To fix this, this patch adds an AC_CHECK_FUNCS() test for
-glob_pattern_p, and uses that to find out whether glob_pattern_p() is
-available or not.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -81,7 +81,7 @@
- AC_CHECK_FUNC(setreuid, [], [
-     AC_CHECK_LIB(ucb, setreuid, [if echo $LIBS | grep -- -lucb >/dev/null ;then :; else LIBS="$LIBS -lc -lucb" USEUCB=y;fi])
- ])
--AC_CHECK_FUNCS(getuid geteuid iconv mtrace __secure_getenv setregid stpcpy strerror vasprintf srandom)
-+AC_CHECK_FUNCS(getuid geteuid iconv mtrace __secure_getenv setregid stpcpy strerror vasprintf srandom glob_pattern_p)
- 
- AM_GNU_GETTEXT([external])
- AM_ICONV_LINK
-Index: b/poptconfig.c
-===================================================================
---- a/poptconfig.c
-+++ b/poptconfig.c
-@@ -42,7 +42,7 @@
- /*@=declundef =exportheader =incondefs =protoparammatch =redecl =type @*/
- #endif	/* __LCLINT__ */
- 
--#if !defined(__GLIBC__)
-+#if !defined(HAVE_GLOB_PATTERN_P)
- /* Return nonzero if PATTERN contains any metacharacters.
-    Metacharacters can be quoted with backslashes if QUOTE is nonzero.  */
- static int
diff --git a/package/popt/Config.in b/package/popt/Config.in
index cbcdc15dc0..80bac7ff6a 100644
--- a/package/popt/Config.in
+++ b/package/popt/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_POPT
 	help
 	  Popt is a C library for parsing command line parameters.
 
-	  http://rpm5.org
+	  https://github.com/rpm-software-management/popt
diff --git a/package/popt/popt.hash b/package/popt/popt.hash
index 1422f4b920..9b5efe4be6 100644
--- a/package/popt/popt.hash
+++ b/package/popt/popt.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256	e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8	popt-1.16.tar.gz
-sha256	518d4f2a05064cb9a8ec0ea02e86408af4feed6916f78ef42171465db8b383c5	COPYING
+sha256  5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1  popt-1.18.tar.gz
+sha256  518d4f2a05064cb9a8ec0ea02e86408af4feed6916f78ef42171465db8b383c5  COPYING
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 99c5138bdf..45f4fb2535 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-POPT_VERSION = 1.16
-POPT_SITE = http://rpm5.org/files/popt
+POPT_VERSION = 1.18
+POPT_SITE = http://ftp.rpm.org/popt/releases/popt-1.x
 POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
-POPT_AUTORECONF = YES
 POPT_GETTEXTIZE = YES
 POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:11:48 +0200
Subject: [Buildroot] [PATCH 2/2] popt: solve the glob_pattern_p() problem
In-Reply-To: <1406657508-16244-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1406657508-16244-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1406657508-16244-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current popt build system tests the existence of <glob.h>, and
then assumes that if __GLIBC__ is defined, then glob_pattern_p() must
be available. Unfortunately, that's not true with uClibc: <glob.h> may
be installed, but not necessarily the GNU glob extensions... and
uClibc defines __GLIBC__. This is causing build issues with certain
uClibc toolchains that do not have GNU glob extensions enabled.

To fix this, we introduce a patch called popt-03-glob-detection.patch
which adds a new AC_CHECK_FUNCS() test for glob_pattern_p() and uses
the result to know if this function is available, instead of testing
__GLIBC__.

In order for this patch to work, the popt package must be
autoreconfigured, so another patch, popt-02-fix-autoreconf.patch, is
needed to make the package autoreconfigure properly. And also
POPT_AUTORECONF = YES is added to popt.mk.

Finally, this change avoids the need for the Blackfin toolchain
specific testing, which we forgot to update when introducing the
2014R1 version of the Blackfin toolchain. With this new solution,
there will be no need to update the popt.mk file when new Blackfin
toolchains are added.

Fixes:

  http://autobuild.buildroot.org/results/e09/e09e24fec240382a3197fef3e98eb9a22f76420a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Cc: Sonic Zhang <sonic.zhang@analog.com>
---
 package/popt/popt-02-fix-autoreconf.patch | 38 ++++++++++++++++++++++++++++
 package/popt/popt-03-glob-detection.patch | 41 +++++++++++++++++++++++++++++++
 package/popt/popt.mk                      |  8 +-----
 3 files changed, 80 insertions(+), 7 deletions(-)
 create mode 100644 package/popt/popt-02-fix-autoreconf.patch
 create mode 100644 package/popt/popt-03-glob-detection.patch

diff --git a/package/popt/popt-02-fix-autoreconf.patch b/package/popt/popt-02-fix-autoreconf.patch
new file mode 100644
index 0000000..f1fcc57
--- /dev/null
+++ b/package/popt/popt-02-fix-autoreconf.patch
@@ -0,0 +1,38 @@
+Make sure we can autoreconfigure popt
+
+This commit makes a few changes in the popt build system to allow it
+to be autoreconfigured with modern autotools:
+
+ - the TESTS variable shouldn't be using $(top_srcdir), and since we
+   don't care about tests in Buildroot, we just disable it.
+
+ - the AM_C_PROTOTYPES macro is deprecated and should no longer be
+   used, causes an error with autoconf/automake.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -37,8 +37,6 @@
+ TESTS_ENVIRONMENT = \
+ test1="$(top_builddir)/test1"
+ 
+-TESTS = $(top_srcdir)/testit.sh
+-
+ include_HEADERS = popt.h
+ 
+ usrlibdir = $(libdir)
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,7 +46,6 @@
+ AC_SYS_LARGEFILE
+ 
+ AC_ISC_POSIX
+-AM_C_PROTOTYPES
+ 
+ AC_CHECK_HEADERS(float.h fnmatch.h glob.h langinfo.h libintl.h mcheck.h unistd.h)
+ 
diff --git a/package/popt/popt-03-glob-detection.patch b/package/popt/popt-03-glob-detection.patch
new file mode 100644
index 0000000..7bdce7d
--- /dev/null
+++ b/package/popt/popt-03-glob-detection.patch
@@ -0,0 +1,41 @@
+Detect glob_pattern_p()
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
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -81,7 +81,7 @@
+ AC_CHECK_FUNC(setreuid, [], [
+     AC_CHECK_LIB(ucb, setreuid, [if echo $LIBS | grep -- -lucb >/dev/null ;then :; else LIBS="$LIBS -lc -lucb" USEUCB=y;fi])
+ ])
+-AC_CHECK_FUNCS(getuid geteuid iconv mtrace __secure_getenv setregid stpcpy strerror vasprintf srandom)
++AC_CHECK_FUNCS(getuid geteuid iconv mtrace __secure_getenv setregid stpcpy strerror vasprintf srandom glob_pattern_p)
+ 
+ AM_GNU_GETTEXT([external])
+ AM_ICONV_LINK
+Index: b/poptconfig.c
+===================================================================
+--- a/poptconfig.c
++++ b/poptconfig.c
+@@ -42,7 +42,7 @@
+ /*@=declundef =exportheader =incondefs =protoparammatch =redecl =type @*/
+ #endif	/* __LCLINT__ */
+ 
+-#if !defined(__GLIBC__)
++#if !defined(HAVE_GLOB_PATTERN_P)
+ /* Return nonzero if PATTERN contains any metacharacters.
+    Metacharacters can be quoted with backslashes if QUOTE is nonzero.  */
+ static int
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index f3ef43f..0413c5a 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -10,16 +10,10 @@ POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/
 POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
+POPT_AUTORECONF = YES
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
-# The external Blackfin toolchains have <glob.h>, but not all the
-# necessary uClibc options for glob functions, so we force disable the
-# usage of the glob functions for these toolchains.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
-POPT_CONF_ENV += ac_cv_header_glob_h=no
-endif
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 POPT_CONF_ENV += am_cv_lib_iconv=yes
 POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
-- 
2.0.0

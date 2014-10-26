From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 12:33:54 +0100
Subject: [Buildroot] [git commit] liblog4c-localtime: fix build issue on
	uClibc with --enable-debug
Message-ID: <20141026113359.AED8FAFE0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f97702e8f42bdd8fd30e1ef53fe195887c3670c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When --enable-debug is used, liblog4c-localtime wants to use
<mcheck.h> if __GLIBC__ is defined. Unfortunately, uClibc defines
__GLIBC__ but does not provides mcheck.h. Therefore, this commit
introduces a patch (0003) that checks if mcheck.h is available or not.

However, this patch requires autoreconfiguring the package, which is
currently broken. Therefore, the two other patches (0004 and 0005) are
meant to fix autoreconfiguration of the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-Fix-debug-mode-build-with-uClibc.patch    |   67 ++++++++++++++++++++
 ...4-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch |   28 ++++++++
 .../liblog4c-localtime/0005-Fix-C-support.patch    |   59 +++++++++++++++++
 package/liblog4c-localtime/liblog4c-localtime.mk   |    1 +
 4 files changed, 155 insertions(+), 0 deletions(-)

diff --git a/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch b/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch
new file mode 100644
index 0000000..812af9e
--- /dev/null
+++ b/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch
@@ -0,0 +1,67 @@
+From acbaee34bcb1881db97969dd2c411446f32ca4cc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 25 Oct 2014 19:45:33 +0200
+Subject: [PATCH 3/5] Fix debug mode build with uClibc
+
+When --enable-debug is passed, liblog4c-localtime wants to use
+<mcheck.h>. It takes the precaution of testing if __GLIBC__ is
+defined. But unfortunately, the uClibc C library pretends to be
+compatible with glibc by defining __GLIBC__, but it doesn't provide
+mcheck.h.
+
+To better support this situation, we add an AC_CHECK_HEADERS() check
+on mcheck.h, and then use HAVE_MCHECK_H were appropriate.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in     | 2 +-
+ src/log4c/init.c | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 612ccbe..dbf11e9 100644
+--- a/configure.in
++++ b/configure.in
+@@ -115,7 +115,7 @@ AM_CONDITIONAL(TEST, test x$enable_test = xyes)
+ AC_HEADER_STDC
+ AC_CHECK_HEADERS([fcntl.h inttypes.h langinfo.h limits.h stddef.h stdint.h \
+ stdlib.h string.h sys/time.h syslog.h unistd.h stdarg.h varargs.h getopt.h \
+-pthread.h])
++pthread.h mcheck.h])
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+diff --git a/src/log4c/init.c b/src/log4c/init.c
+index 7dd9eb4..4b88210 100644
+--- a/src/log4c/init.c
++++ b/src/log4c/init.c
+@@ -35,7 +35,7 @@ static const char version[] = "$Id$";
+ #include <layout_type_basic_r.h>
+ #include <layout_type_dated_r.h>
+ 
+-#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__)
++#if defined(__LOG4C_DEBUG__) && defined(HAVE_MCHECK_H)
+ #include <mcheck.h>
+ #endif
+ 
+@@ -100,7 +100,7 @@ extern int log4c_init(void)
+     sd_debug("log4c_init[");
+   
+     /* activate GLIBC allocation debugging */
+-#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__)
++#if defined(__LOG4C_DEBUG__) && defined(HAVE_MCHECK_H)
+     mtrace();
+ #endif
+   
+@@ -280,7 +280,7 @@ extern int log4c_fini(void)
+ 	log4c_dump_all_instances(stderr);
+     }
+ #endif
+-#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__)
++#if defined(__LOG4C_DEBUG__) && defined(HAVE_MCHECK_H)
+     muntrace();
+ #endif
+   
+-- 
+2.0.0
+
diff --git a/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch b/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch
new file mode 100644
index 0000000..1d77b80
--- /dev/null
+++ b/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch
@@ -0,0 +1,28 @@
+From a2553c203d8b8257dea1d2e2139b220935587144 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 25 Oct 2014 20:03:25 +0200
+Subject: [PATCH 4/5] Add AC_CONFIG_MACRO_DIR to configure.in
+
+Without AC_CONFIG_MACRO_DIR, when autoreconfiguring the package, it
+cannot find AM_PATH_EXPAT which is defined in config/expat.m4.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.in b/configure.in
+index dbf11e9..769b204 100644
+--- a/configure.in
++++ b/configure.in
+@@ -5,6 +5,7 @@ AC_PREREQ(2.57)
+ AC_INIT
+ AC_CONFIG_SRCDIR([configure.in])
+ AC_CONFIG_AUX_DIR(config)
++AC_CONFIG_MACRO_DIR([config])
+ AM_CONFIG_HEADER(src/config.h)
+ 
+ LOG4C_MAJOR_VERSION=1
+-- 
+2.0.0
+
diff --git a/package/liblog4c-localtime/0005-Fix-C-support.patch b/package/liblog4c-localtime/0005-Fix-C-support.patch
new file mode 100644
index 0000000..b2f8c8b
--- /dev/null
+++ b/package/liblog4c-localtime/0005-Fix-C-support.patch
@@ -0,0 +1,59 @@
+From bdccec4c374a93480a7fd303d15e20810a5d5b7e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 25 Oct 2014 21:22:40 +0200
+Subject: [PATCH 5/5] Fix C++ support
+
+Autoreconf fails with the following message:
+
+tests/log4c/Makefile.am: error: C++ source seen but 'CXX' is undefined
+
+So this commit adds the AC_PROG_CXX macro to configure.in, and ensures
+that the C++ test is only built if a C++ compiler is available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in            | 3 +++
+ tests/log4c/Makefile.am | 6 +++++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 769b204..ce75800 100644
+--- a/configure.in
++++ b/configure.in
+@@ -38,6 +38,7 @@ AC_DEFINE(_GNU_SOURCE,1,"POSIXandGNU extensions")
+ #.
+ AC_PROG_YACC
+ AC_PROG_CC
++AC_PROG_CXX
+ AC_PROG_CPP
+ AM_PROG_LEX
+ AC_PROG_AWK
+@@ -47,6 +48,8 @@ AC_PROG_MAKE_SET
+ AC_PROG_RANLIB
+ AC_PROG_LIBTOOL
+ 
++AM_CONDITIONAL([USE_CXX], [test "$ac_cv_prog_CXX" != "no"])
++
+ # platform idioms
+ case "$host" in
+     *-hp-hpux*)
+diff --git a/tests/log4c/Makefile.am b/tests/log4c/Makefile.am
+index f647f27..b1b4ed6 100644
+--- a/tests/log4c/Makefile.am
++++ b/tests/log4c/Makefile.am
+@@ -3,7 +3,11 @@ INCLUDES = \
+ 	-DSRCDIR="\"$(srcdir)\""
+ 
+ noinst_PROGRAMS = test_category test_rc bench bench_fwrite \
+-	test_stream2 test_layout_r cpp_compile_test
++	test_stream2 test_layout_r
++
++if USE_CXX
++noinst_PROGRAMS += cpp_compile_test
++endif
+ 
+ if WITH_ROLLINGFILE
+ noinst_PROGRAMS += test_rollingfile_appender test_rollingfile_appender_mt
+-- 
+2.0.0
+
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index 4af9ee5..bc6d1ab 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -12,6 +12,7 @@ LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
 LIBLOG4C_LOCALTIME_CONFIG_SCRIPTS = log4c-config
 LIBLOG4C_LOCALTIME_LICENSE = LGPLv2.1
 LIBLOG4C_LOCALTIME_LICENSE_FILES = COPYING
+LIBLOG4C_LOCALTIME_AUTORECONF = YES
 
 define LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS
 	chmod +x $(@D)/configure

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:15:06 +0200
Subject: [Buildroot] [git commit] lirc-tools: no need to check for
	clock_gettime
Message-ID: <20170620201446.1546881E67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c3d8efd9c19d79c2ecd2655d2027ceed0b2a23b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot no longer supports toolchains with glibc older than 2.17, so there
is no need to check whether librt is required for clock_* system calls.

Cc: Rhys Williams <github@wilberforce.co.nz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure-check-for-clock_gettime-in-librt.patch | 54 ----------------------
 ...-use-of-functions-killed-in-kernel-4.8.0.patch} |  0
 package/lirc-tools/lirc-tools.mk                   |  2 -
 3 files changed, 56 deletions(-)

diff --git a/package/lirc-tools/0002-configure-check-for-clock_gettime-in-librt.patch b/package/lirc-tools/0002-configure-check-for-clock_gettime-in-librt.patch
deleted file mode 100644
index 710dfd3..0000000
--- a/package/lirc-tools/0002-configure-check-for-clock_gettime-in-librt.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From e654ae139cec42a6f1b5684261787d0c241cfd3b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 19 Aug 2016 15:25:48 +0200
-Subject: [PATCH] configure: check for clock_gettime in librt
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac        | 3 +++
- daemons/Makefile.am | 2 +-
- plugins/Makefile.am | 1 +
- 3 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 73340c7..466e638 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -67,6 +67,9 @@ AC_CHECK_FUNCS(gethostname gettimeofday mkfifo select socket strdup \
- AC_SEARCH_LIBS([dlopen], [dl dld], [], [
-   AC_MSG_ERROR([unable to find the dlopen() function])
- ])
-+# glibc < 2.17 needs librt for clock_gettime()
-+AC_CHECK_LIB(rt, clock_gettime, LIBCLOCK_GETTIME="-lrt")
-+AC_SUBST(LIBCLOCK_GETTIME)
- AC_CHECK_FUNCS(daemon)
- if test "$ac_cv_func_daemon" != yes; then
-   daemon=""
-diff --git a/daemons/Makefile.am b/daemons/Makefile.am
-index 5625627..85a28f3 100644
---- a/daemons/Makefile.am
-+++ b/daemons/Makefile.am
-@@ -21,7 +21,7 @@ sbin_PROGRAMS           += lircd-uinput
- endif
- 
- lircd_SOURCES           = lircd.cpp
--lircd_LDADD             = ../lib/liblirc.la
-+lircd_LDADD             = ../lib/liblirc.la @LIBCLOCK_GETTIME@
- 
- lircd_uinput_SOURCES    = lircd-uinput.cpp
- lircd_uinput_LDADD     = ../lib/liblirc.la
-diff --git a/plugins/Makefile.am b/plugins/Makefile.am
-index ddff01d..45c012a 100644
---- a/plugins/Makefile.am
-+++ b/plugins/Makefile.am
-@@ -127,6 +127,7 @@ zotac_la_SOURCES            = zotac.c
- 
- plugin_LTLIBRARIES          += mplay.la
- mplay_la_SOURCES            = mplay.c
-+mplay_la_LIBADD             = @LIBCLOCK_GETTIME@
- endif
- 
- $(srcdir)/pluginlist.am:
--- 
-2.7.4
-
diff --git a/package/lirc-tools/0003-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch b/package/lirc-tools/0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
similarity index 100%
rename from package/lirc-tools/0003-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
rename to package/lirc-tools/0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 6fd6434..f0eff91 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -11,8 +11,6 @@ LIRC_TOOLS_LICENSE = GPL-2.0+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
-# 0002-configure-check-for-clock_gettime-in-librt.patch
-LIRC_TOOLS_AUTORECONF = YES
 
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
 LIRC_TOOLS_CONF_OPTS = --without-x

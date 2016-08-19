From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 15:50:29 +0200
Subject: [Buildroot] [PATCH] lirc-tools: fix build issue related to
	clock_gettime()
Message-ID: <1471614629-30038-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In some older versions of glibc, clock_gettime() is in librt, so we need
to link with librt when clock_gettime() is used. This commit adds a
lirc-tools patch to make sure we link with librt when needed.

Fixes:

  http://autobuild.buildroot.net/results/2770360880c9b265c8e019141925e56c35ba22dc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure-check-for-clock_gettime-in-librt.patch | 54 ++++++++++++++++++++++
 package/lirc-tools/lirc-tools.mk                   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 package/lirc-tools/0004-configure-check-for-clock_gettime-in-librt.patch

diff --git a/package/lirc-tools/0004-configure-check-for-clock_gettime-in-librt.patch b/package/lirc-tools/0004-configure-check-for-clock_gettime-in-librt.patch
new file mode 100644
index 0000000..710dfd3
--- /dev/null
+++ b/package/lirc-tools/0004-configure-check-for-clock_gettime-in-librt.patch
@@ -0,0 +1,54 @@
+From e654ae139cec42a6f1b5684261787d0c241cfd3b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 19 Aug 2016 15:25:48 +0200
+Subject: [PATCH] configure: check for clock_gettime in librt
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac        | 3 +++
+ daemons/Makefile.am | 2 +-
+ plugins/Makefile.am | 1 +
+ 3 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 73340c7..466e638 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -67,6 +67,9 @@ AC_CHECK_FUNCS(gethostname gettimeofday mkfifo select socket strdup \
+ AC_SEARCH_LIBS([dlopen], [dl dld], [], [
+   AC_MSG_ERROR([unable to find the dlopen() function])
+ ])
++# glibc < 2.17 needs librt for clock_gettime()
++AC_CHECK_LIB(rt, clock_gettime, LIBCLOCK_GETTIME="-lrt")
++AC_SUBST(LIBCLOCK_GETTIME)
+ AC_CHECK_FUNCS(daemon)
+ if test "$ac_cv_func_daemon" != yes; then
+   daemon=""
+diff --git a/daemons/Makefile.am b/daemons/Makefile.am
+index 5625627..85a28f3 100644
+--- a/daemons/Makefile.am
++++ b/daemons/Makefile.am
+@@ -21,7 +21,7 @@ sbin_PROGRAMS           += lircd-uinput
+ endif
+ 
+ lircd_SOURCES           = lircd.cpp
+-lircd_LDADD             = ../lib/liblirc.la
++lircd_LDADD             = ../lib/liblirc.la @LIBCLOCK_GETTIME@
+ 
+ lircd_uinput_SOURCES    = lircd-uinput.cpp
+ lircd_uinput_LDADD     = ../lib/liblirc.la
+diff --git a/plugins/Makefile.am b/plugins/Makefile.am
+index ddff01d..45c012a 100644
+--- a/plugins/Makefile.am
++++ b/plugins/Makefile.am
+@@ -127,6 +127,7 @@ zotac_la_SOURCES            = zotac.c
+ 
+ plugin_LTLIBRARIES          += mplay.la
+ mplay_la_SOURCES            = mplay.c
++mplay_la_LIBADD             = @LIBCLOCK_GETTIME@
+ endif
+ 
+ $(srcdir)/pluginlist.am:
+-- 
+2.7.4
+
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index ca775f7..547df46 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -13,6 +13,7 @@ LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
 # 0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
 # 0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch
+# 0004-configure-check-for-clock_gettime-in-librt.patch
 LIRC_TOOLS_AUTORECONF = YES
 
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
-- 
2.7.4

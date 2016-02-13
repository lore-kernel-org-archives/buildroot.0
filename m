From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 18:18:49 +0100
Subject: [Buildroot] [git commit] libbsd: add patch for clock_gettime usage
Message-ID: <20160213171853.9CC837FD4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e656cba53dba78b1fd3ff00ce56de1657e594bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libbsd uses clock_gettime() but doesn't check for it in librt.
This causes breakage on old glibc versions (< 2.17). Fixes:
http://autobuild.buildroot.net/results/a5b/a5b837d6d02ec96ac53c5b1c531a0c8e7eafeb9a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-build-clock_gettime-might-need-librt.patch | 49 ++++++++++++++++++++++
 package/libbsd/libbsd.mk                           |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/package/libbsd/0001-build-clock_gettime-might-need-librt.patch b/package/libbsd/0001-build-clock_gettime-might-need-librt.patch
new file mode 100644
index 0000000..ad6fcdb
--- /dev/null
+++ b/package/libbsd/0001-build-clock_gettime-might-need-librt.patch
@@ -0,0 +1,49 @@
+From 188049ac7adcabfa66e5b6a674ac28a2f7da81f3 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 12 Feb 2016 11:06:58 -0300
+Subject: [PATCH] build: clock_gettime might need librt
+
+In older glibc versions (< 2.17) clock_gettime is in librt.
+Add a check for this to avoid build breakage for programs/libraries that
+use libbsd on such systems.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: submitted upstream
+
+ configure.ac    | 5 +++++
+ src/Makefile.am | 2 ++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index d334774..1862d19 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -44,6 +44,11 @@ AC_SUBST([TESTU01_LIBS])
+ AM_CONDITIONAL([HAVE_LIBTESTU01],
+                [test "x$ac_cv_lib_testu01_unif01_CreateExternGenBits" = "xyes"])
+ 
++# In old glibc versions (< 2.17) clock_gettime() is in librt
++AC_SEARCH_LIBS([clock_gettime], [rt],
++             [LIB_CLOCK_GETTIME="-lrt"])
++AC_SUBST([LIB_CLOCK_GETTIME])
++
+ # Checks for header files.
+ AC_CHECK_HEADERS([sys/ndir.h sys/dir.h ndir.h dirent.h])
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 4649937..6b705f0 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -52,6 +52,8 @@ hash/md5hl.c: $(srcdir)/hash/helper.c
+ libbsd_la_DEPENDENCIES = \
+ 	$(libbsd_la_included_sources) \
+ 	libbsd.map
++libbsd_la_LIBADD = \
++	$(LIB_CLOCK_GETTIME)
+ libbsd_la_LDFLAGS = \
+ 	-Wl,--version-script=$(srcdir)/libbsd.map \
+ 	-version-number $(LIBBSD_ABI)
+-- 
+2.4.10
+
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 634a614..f750d75 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -9,7 +9,8 @@ LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-3c, MIT
 LIBBSD_LICENSE_FILES = COPYING
-
 LIBBSD_INSTALL_STAGING = YES
+# For 0001-build-clock_gettime-might-need-librt.patch
+LIBBSD_AUTORECONF = YES
 
 $(eval $(autotools-package))

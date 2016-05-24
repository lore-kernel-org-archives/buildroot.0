From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 May 2016 19:40:51 -0300
Subject: [Buildroot] [PATCH] libbsd: bump to version 0.8.3
Message-ID: <1464129651-32232-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...0001-build-clock_gettime-might-need-librt.patch | 49 ----------------------
 package/libbsd/libbsd.hash                         |  2 +-
 package/libbsd/libbsd.mk                           |  4 +-
 3 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 package/libbsd/0001-build-clock_gettime-might-need-librt.patch

diff --git a/package/libbsd/0001-build-clock_gettime-might-need-librt.patch b/package/libbsd/0001-build-clock_gettime-might-need-librt.patch
deleted file mode 100644
index ad6fcdb..0000000
--- a/package/libbsd/0001-build-clock_gettime-might-need-librt.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 188049ac7adcabfa66e5b6a674ac28a2f7da81f3 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 12 Feb 2016 11:06:58 -0300
-Subject: [PATCH] build: clock_gettime might need librt
-
-In older glibc versions (< 2.17) clock_gettime is in librt.
-Add a check for this to avoid build breakage for programs/libraries that
-use libbsd on such systems.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: submitted upstream
-
- configure.ac    | 5 +++++
- src/Makefile.am | 2 ++
- 2 files changed, 7 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index d334774..1862d19 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -44,6 +44,11 @@ AC_SUBST([TESTU01_LIBS])
- AM_CONDITIONAL([HAVE_LIBTESTU01],
-                [test "x$ac_cv_lib_testu01_unif01_CreateExternGenBits" = "xyes"])
- 
-+# In old glibc versions (< 2.17) clock_gettime() is in librt
-+AC_SEARCH_LIBS([clock_gettime], [rt],
-+             [LIB_CLOCK_GETTIME="-lrt"])
-+AC_SUBST([LIB_CLOCK_GETTIME])
-+
- # Checks for header files.
- AC_CHECK_HEADERS([sys/ndir.h sys/dir.h ndir.h dirent.h])
- 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 4649937..6b705f0 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -52,6 +52,8 @@ hash/md5hl.c: $(srcdir)/hash/helper.c
- libbsd_la_DEPENDENCIES = \
- 	$(libbsd_la_included_sources) \
- 	libbsd.map
-+libbsd_la_LIBADD = \
-+	$(LIB_CLOCK_GETTIME)
- libbsd_la_LDFLAGS = \
- 	-Wl,--version-script=$(srcdir)/libbsd.map \
- 	-version-number $(LIBBSD_ABI)
--- 
-2.4.10
-
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index f77c0aa..bc6c7cf 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b2f644cae94a6e2fe109449c20ad79a0f6ee4faec2205b07eefa0020565e250a	libbsd-0.8.2.tar.xz
+sha256	934b634f4dfd865b6482650b8f522c70ae65c463529de8be907b53c89c3a34a8	libbsd-0.8.3.tar.xz
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index f750d75..a932f2b 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.8.2
+LIBBSD_VERSION = 0.8.3
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-3c, MIT
 LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_INSTALL_STAGING = YES
-# For 0001-build-clock_gettime-might-need-librt.patch
-LIBBSD_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.7.3

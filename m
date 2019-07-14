From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jul 2019 17:21:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva-utils: bump version to 2.5.0
Message-ID: <20190714152126.20646-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0001, applied upstream:
https://github.com/intel/libva-utils/commit/d71e2604972d35e3803d9b66c7d2ed0a80c145dc

Removed patch 0002 after upstream fixed non-X11 build of sfcsample:
https://github.com/intel/libva-utils/commit/7be46f017caee2a23097bc8371f2fe4eb1b677a0

By removing all patches autoreconf is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-utils/0001-check-ssp.patch      | 145 ------------------
 ...failure-when-x11-support-is-disabled.patch |  33 ----
 package/libva-utils/libva-utils.hash          |   6 +-
 package/libva-utils/libva-utils.mk            |   5 +-
 4 files changed, 4 insertions(+), 185 deletions(-)
 delete mode 100644 package/libva-utils/0001-check-ssp.patch
 delete mode 100644 package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch

diff --git a/package/libva-utils/0001-check-ssp.patch b/package/libva-utils/0001-check-ssp.patch
deleted file mode 100644
index 11c1ded795..0000000000
--- a/package/libva-utils/0001-check-ssp.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From bdcf4d90f618f497311c348f984e005924cb3def Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 29 Jul 2018 20:58:06 +0200
-Subject: [PATCH] Check for -fstack-protector
-
-Not all toolchains provide support for -fstack-protector. This patch
-provides a configure check to avoid build errors like
-
-/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
-/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
-
-Patch sent upstream as PR 125.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac             | 16 ++++++++++++++++
- decode/Makefile.am       |  5 ++++-
- encode/Makefile.am       |  5 ++++-
- putsurface/Makefile.am   |  5 ++++-
- vainfo/Makefile.am       |  5 ++++-
- videoprocess/Makefile.am |  5 ++++-
- 6 files changed, 36 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index be2e00d..cfa508a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,6 +129,22 @@ if test "$ac_cv_have_gnuc_visibility_attribute" = "yes"; then
-               [Defined to 1 if GCC visibility attribute is supported])
- fi
- 
-+# Check for -fstack-protector
-+ssp_cc=yes
-+if test "X$CC-cc" != "X"; then
-+    AC_MSG_CHECKING([whether ${CC-cc} accepts -fstack-protector])
-+    ssp_old_cflags="$CFLAGS"
-+    CFLAGS="$CFLAGS -fstack-protector"
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[alloca(100);]])], [], [ssp_cc=no])
-+    AC_MSG_RESULT([$ssp_cc])
-+    if test "X$ssp_cc" = "Xno"; then
-+        CFLAGS="$ssp_old_cflags"
-+    else
-+        AC_DEFINE([ENABLE_SSP_CC], 1, [Define if SSP C support is enabled.])
-+    fi
-+fi
-+AM_CONDITIONAL(USE_SSP, test "$ssp_cc" = "yes")
-+
- # Check for DRM (mandatory)
- LIBDRM_VERSION=libdrm_version
- PKG_CHECK_MODULES([DRM], [libdrm >= $LIBDRM_VERSION])
-diff --git a/decode/Makefile.am b/decode/Makefile.am
-index febc50d..8ea9252 100644
---- a/decode/Makefile.am
-+++ b/decode/Makefile.am
-@@ -24,11 +24,14 @@ bin_PROGRAMS = mpeg2vldemo loadjpeg
- 
- AM_CPPFLAGS = \
- 	-Wall					\
--	-fstack-protector			\
- 	$(LIBVA_CFLAGS)				\
- 	-I$(top_srcdir)/common			\
- 	$(NULL)
- 
-+if USE_SSP
-+AM_CPPFLAGS += -fstack-protector
-+endif
-+
- TEST_LIBS = \
- 	$(LIBVA_LIBS)				\
- 	$(top_builddir)/common/libva-display.la	\
-diff --git a/encode/Makefile.am b/encode/Makefile.am
-index 8298b39..c107007 100644
---- a/encode/Makefile.am
-+++ b/encode/Makefile.am
-@@ -25,10 +25,13 @@ noinst_PROGRAMS = svctenc
- 
- AM_CPPFLAGS = \
- 	-Wall				\
--	-fstack-protector		\
- 	$(LIBVA_CFLAGS) 		\
- 	$(NULL)
- 
-+if USE_SSP
-+AM_CPPFLAGS += -fstack-protector
-+endif
-+
- h264encode_SOURCES	= h264encode.c
- h264encode_CFLAGS	= -I$(top_srcdir)/common -g
- h264encode_LDADD	= \
-diff --git a/putsurface/Makefile.am b/putsurface/Makefile.am
-index e7b62a1..10ae63e 100644
---- a/putsurface/Makefile.am
-+++ b/putsurface/Makefile.am
-@@ -26,9 +26,12 @@ TEST_CFLAGS = \
- 	$(LIBVA_CFLAGS)			\
- 	-I$(top_srcdir)/common		\
- 	-Wall				\
--	-fstack-protector		\
- 	$(NULL)
- 
-+if USE_SSP
-+TEST_CFLAGS += -fstack-protector
-+endif
-+
- TEST_LIBS = \
- 	$(LIBVA_LIBS)		\
- 	$(top_builddir)/common/libva-display.la	\
-diff --git a/vainfo/Makefile.am b/vainfo/Makefile.am
-index aff201f..e59f466 100644
---- a/vainfo/Makefile.am
-+++ b/vainfo/Makefile.am
-@@ -27,9 +27,12 @@ vainfo_cflags = \
- 	$(LIBVA_CFLAGS) \
- 	-DLIBVA_VERSION_S="\"$(LIBVA_VERSION)\"" \
- 	-Wall \
--	-fstack-protector \
- 	$(NULL)
- 
-+if USE_SSP
-+vainfo_cflags += -fstack-protector
-+endif
-+
- vainfo_libs = \
-        	$(LIBVA_LIBS) \
- 	$(top_builddir)/common/libva-display.la	\
-diff --git a/videoprocess/Makefile.am b/videoprocess/Makefile.am
-index eb79bc3..448da7d 100644
---- a/videoprocess/Makefile.am
-+++ b/videoprocess/Makefile.am
-@@ -24,11 +24,14 @@ bin_PROGRAMS = vavpp
- 
- AM_CPPFLAGS = \
- 	-Wall					\
--	-fstack-protector			\
- 	$(LIBVA_CFLAGS)				\
- 	-I$(top_srcdir)/common			\
- 	$(NULL)
- 
-+if USE_SSP
-+AM_CPPFLAGS += -fstack-protector
-+endif
-+
- TEST_LIBS = \
- 	$(LIBVA_LIBS)				\
- 	$(top_builddir)/common/libva-display.la	\
diff --git a/package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch b/package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch
deleted file mode 100644
index b14b662abf..0000000000
--- a/package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ad66d3c202eb72ac5808f13a0489ac836dc55aac Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 11 Feb 2019 20:31:42 +0100
-Subject: [PATCH] Fix build failure when x11 support is disabled
-
-Patch suggested on upstream bug tracker:
-https://github.com/intel/libva-utils/issues/150#issuecomment-462059528
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d28175a..12da79e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -24,10 +24,10 @@ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
- 
- AUTOMAKE_OPTIONS = foreign
- 
--SUBDIRS = common decode encode vainfo videoprocess vendor/intel vendor/intel/sfcsample
-+SUBDIRS = common decode encode vainfo videoprocess vendor/intel
- 
- if USE_X11
--SUBDIRS += putsurface
-+SUBDIRS += putsurface vendor/intel/sfcsample
- else
- if USE_WAYLAND
- SUBDIRS += putsurface
--- 
-2.20.1
-
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 4bd015002a..a50a01b4a1 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases
-sha1 98121e21dd3c679d06b1068a1b5f32246533099b  libva-utils-2.4.0.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.5.0/libva-utils-2.5.0.tar.bz2.sha1sum
+sha1 1bd6f5bf14af7a8a72e867e3dc94fcdd90f9ad0f  libva-utils-2.5.0.tar.bz2
 # Locally computed
-sha256 5b7d1954b40fcb2c0544be20125c71a0852049715ab85a3e8aba60434a40c6b3  libva-utils-2.4.0.tar.bz2
+sha256 9238c9d5110d60f935683390b8383fdac3507346384cd5f117a23c6db1d72a17  libva-utils-2.5.0.tar.bz2
 sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index be857bb4f1..9b5cbdf97b 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.4.0
+LIBVA_UTILS_VERSION = 2.5.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-# 0001-check-ssp.patch
-# 0002-Fix-build-failure-when-x11-support-is-disabled.patch
-LIBVA_UTILS_AUTORECONF = YES
 LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
 
 define LIBVA_UTILS_CREATE_M4_DIR
-- 
2.20.1

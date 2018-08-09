From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 00:01:43 +0200
Subject: [Buildroot] [git commit branch/next] package/libva-utils: bump
 version to 2.2.0
Message-ID: <20180809215529.14F7088CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f414d6489665106b2010b815fc5c9ca2c0cbe67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream moved its github repo to github.com/intel/, updated URLs, for
reference see upstream PR 110. Also updated project URL.

Added patch to fix build without stack-protector support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva-utils/0001-check-ssp.patch | 145 +++++++++++++++++++++++++++++++
 package/libva-utils/Config.in            |   2 +-
 package/libva-utils/libva-utils.hash     |   6 +-
 package/libva-utils/libva-utils.mk       |   6 +-
 4 files changed, 153 insertions(+), 6 deletions(-)

diff --git a/package/libva-utils/0001-check-ssp.patch b/package/libva-utils/0001-check-ssp.patch
new file mode 100644
index 0000000000..11c1ded795
--- /dev/null
+++ b/package/libva-utils/0001-check-ssp.patch
@@ -0,0 +1,145 @@
+From bdcf4d90f618f497311c348f984e005924cb3def Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 29 Jul 2018 20:58:06 +0200
+Subject: [PATCH] Check for -fstack-protector
+
+Not all toolchains provide support for -fstack-protector. This patch
+provides a configure check to avoid build errors like
+
+/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
+/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
+
+Patch sent upstream as PR 125.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac             | 16 ++++++++++++++++
+ decode/Makefile.am       |  5 ++++-
+ encode/Makefile.am       |  5 ++++-
+ putsurface/Makefile.am   |  5 ++++-
+ vainfo/Makefile.am       |  5 ++++-
+ videoprocess/Makefile.am |  5 ++++-
+ 6 files changed, 36 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index be2e00d..cfa508a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,6 +129,22 @@ if test "$ac_cv_have_gnuc_visibility_attribute" = "yes"; then
+               [Defined to 1 if GCC visibility attribute is supported])
+ fi
+ 
++# Check for -fstack-protector
++ssp_cc=yes
++if test "X$CC-cc" != "X"; then
++    AC_MSG_CHECKING([whether ${CC-cc} accepts -fstack-protector])
++    ssp_old_cflags="$CFLAGS"
++    CFLAGS="$CFLAGS -fstack-protector"
++    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[alloca(100);]])], [], [ssp_cc=no])
++    AC_MSG_RESULT([$ssp_cc])
++    if test "X$ssp_cc" = "Xno"; then
++        CFLAGS="$ssp_old_cflags"
++    else
++        AC_DEFINE([ENABLE_SSP_CC], 1, [Define if SSP C support is enabled.])
++    fi
++fi
++AM_CONDITIONAL(USE_SSP, test "$ssp_cc" = "yes")
++
+ # Check for DRM (mandatory)
+ LIBDRM_VERSION=libdrm_version
+ PKG_CHECK_MODULES([DRM], [libdrm >= $LIBDRM_VERSION])
+diff --git a/decode/Makefile.am b/decode/Makefile.am
+index febc50d..8ea9252 100644
+--- a/decode/Makefile.am
++++ b/decode/Makefile.am
+@@ -24,11 +24,14 @@ bin_PROGRAMS = mpeg2vldemo loadjpeg
+ 
+ AM_CPPFLAGS = \
+ 	-Wall					\
+-	-fstack-protector			\
+ 	$(LIBVA_CFLAGS)				\
+ 	-I$(top_srcdir)/common			\
+ 	$(NULL)
+ 
++if USE_SSP
++AM_CPPFLAGS += -fstack-protector
++endif
++
+ TEST_LIBS = \
+ 	$(LIBVA_LIBS)				\
+ 	$(top_builddir)/common/libva-display.la	\
+diff --git a/encode/Makefile.am b/encode/Makefile.am
+index 8298b39..c107007 100644
+--- a/encode/Makefile.am
++++ b/encode/Makefile.am
+@@ -25,10 +25,13 @@ noinst_PROGRAMS = svctenc
+ 
+ AM_CPPFLAGS = \
+ 	-Wall				\
+-	-fstack-protector		\
+ 	$(LIBVA_CFLAGS) 		\
+ 	$(NULL)
+ 
++if USE_SSP
++AM_CPPFLAGS += -fstack-protector
++endif
++
+ h264encode_SOURCES	= h264encode.c
+ h264encode_CFLAGS	= -I$(top_srcdir)/common -g
+ h264encode_LDADD	= \
+diff --git a/putsurface/Makefile.am b/putsurface/Makefile.am
+index e7b62a1..10ae63e 100644
+--- a/putsurface/Makefile.am
++++ b/putsurface/Makefile.am
+@@ -26,9 +26,12 @@ TEST_CFLAGS = \
+ 	$(LIBVA_CFLAGS)			\
+ 	-I$(top_srcdir)/common		\
+ 	-Wall				\
+-	-fstack-protector		\
+ 	$(NULL)
+ 
++if USE_SSP
++TEST_CFLAGS += -fstack-protector
++endif
++
+ TEST_LIBS = \
+ 	$(LIBVA_LIBS)		\
+ 	$(top_builddir)/common/libva-display.la	\
+diff --git a/vainfo/Makefile.am b/vainfo/Makefile.am
+index aff201f..e59f466 100644
+--- a/vainfo/Makefile.am
++++ b/vainfo/Makefile.am
+@@ -27,9 +27,12 @@ vainfo_cflags = \
+ 	$(LIBVA_CFLAGS) \
+ 	-DLIBVA_VERSION_S="\"$(LIBVA_VERSION)\"" \
+ 	-Wall \
+-	-fstack-protector \
+ 	$(NULL)
+ 
++if USE_SSP
++vainfo_cflags += -fstack-protector
++endif
++
+ vainfo_libs = \
+        	$(LIBVA_LIBS) \
+ 	$(top_builddir)/common/libva-display.la	\
+diff --git a/videoprocess/Makefile.am b/videoprocess/Makefile.am
+index eb79bc3..448da7d 100644
+--- a/videoprocess/Makefile.am
++++ b/videoprocess/Makefile.am
+@@ -24,11 +24,14 @@ bin_PROGRAMS = vavpp
+ 
+ AM_CPPFLAGS = \
+ 	-Wall					\
+-	-fstack-protector			\
+ 	$(LIBVA_CFLAGS)				\
+ 	-I$(top_srcdir)/common			\
+ 	$(NULL)
+ 
++if USE_SSP
++AM_CPPFLAGS += -fstack-protector
++endif
++
+ TEST_LIBS = \
+ 	$(LIBVA_LIBS)				\
+ 	$(top_builddir)/common/libva-display.la	\
diff --git a/package/libva-utils/Config.in b/package/libva-utils/Config.in
index ad299234c3..597419f7de 100644
--- a/package/libva-utils/Config.in
+++ b/package/libva-utils/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBVA_UTILS
 	  Libva-utils is a collection of tests for VA-API (Video
 	  Acceleration API)
 
-	  https://01.org/linuxmedia/vaapi
+	  https://01.org/vaapi
 
 comment "libva-utils needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 46674a3675..e86cb6e09c 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/01org/libva-utils/releases
-sha1 9902eb944c3ace00be4fe95627708f156fc5ace7 libva-utils-2.1.0.tar.bz2
+# From https://github.com/intel/libva-utils/releases
+sha1 ef15d40d6bec847c74f21ee3431b7e7b06fec3b4  libva-utils-2.2.0.tar.bz2
 # Locally computed
-sha256 f6a7790c3dcc56537372c90a83036a3136194a8b397e84e97bf9cc9254fa2c51  libva-utils-2.1.0.tar.bz2
+sha256 ed7a6ed1fab657df4e83ea11f90310efcf31c27828f32d65351a28ca3c404dc0  libva-utils-2.2.0.tar.bz2
 sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 85ee3083fd..348d419745 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.1.0
+LIBVA_UTILS_VERSION = 2.2.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
-LIBVA_UTILS_SITE = https://github.com/01org/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
+# 0001-check-ssp.patch
+LIBVA_UTILS_AUTORECONF = YES
 LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
 
 $(eval $(autotools-package))

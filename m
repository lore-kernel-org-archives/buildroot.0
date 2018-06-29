From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Jun 2018 21:52:48 +0200
Subject: [Buildroot] [PATCH 2/2] libv4l: fix build with sdl2_image
In-Reply-To: <20180629195248.4008-1-fontaine.fabrice@gmail.com>
References: <20180629195248.4008-1-fontaine.fabrice@gmail.com>
Message-ID: <20180629195248.4008-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sdlcam test includes jpeglib.h so add an option to disable tests

Fixes:
 - http://autobuild.buildroot.net/results/1eded8b44cc369550566c6ce0b3c042f1aec8d44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libv4l/0004-Add-disable-tests-option.patch | 59 ++++++++++++++++++++++
 package/libv4l/libv4l.mk                           |  8 ++-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 package/libv4l/0004-Add-disable-tests-option.patch

diff --git a/package/libv4l/0004-Add-disable-tests-option.patch b/package/libv4l/0004-Add-disable-tests-option.patch
new file mode 100644
index 0000000000..7d1e458112
--- /dev/null
+++ b/package/libv4l/0004-Add-disable-tests-option.patch
@@ -0,0 +1,59 @@
+From d244fc440dd18dacf9b820f333134cd842e2f970 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 29 Jun 2018 21:15:10 +0200
+Subject: [PATCH] Add --disable-tests option
+
+Offer the possibiity to disable tests especially sdlcam test which
+includes jpeglib.h
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac        | 11 +++++++++++
+ contrib/Makefile.am |  6 +++++-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index dc1e9cbf..45c7b1fc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -431,6 +431,16 @@ AC_ARG_ENABLE(gconv,
+    esac]
+ )
+ 
++AC_ARG_ENABLE(tests,
++   AS_HELP_STRING([--disable-tests], [disable tests compilation]),
++   [case "${enableval}" in
++     yes | no ) ;;
++     *) AC_MSG_ERROR(bad value ${enableval} for --disable-tests) ;;
++   esac],
++   enable_tests=yes
++)
++AM_CONDITIONAL([HAVE_TESTS], [test x$enable_tests = xyes])
++
+ PKG_CHECK_MODULES([SDL2], [sdl2 SDL2_image], [sdl_pc=yes], [sdl_pc=no])
+ AM_CONDITIONAL([HAVE_SDL], [test x$sdl_pc = xyes])
+ 
+@@ -518,4 +528,5 @@ compile time options summary
+     qv4l2                      : $USE_QV4L2
+     v4l2-ctl uses libv4l       : $USE_V4L2_CTL_LIBV4L
+     v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
++    tests                      : $enable_tests
+ EOF
+diff --git a/contrib/Makefile.am b/contrib/Makefile.am
+index d41dc539..ed83d71c 100644
+--- a/contrib/Makefile.am
++++ b/contrib/Makefile.am
+@@ -1,5 +1,9 @@
+ if LINUX_OS
+-SUBDIRS = test xc3028-firmware
++SUBDIRS = xc3028-firmware
++
++if HAVE_TESTS
++SUBDIRS += test
++endif
+ 
+ if HAVE_LINUX_I2C_DEV
+ SUBDIRS += \
+-- 
+2.14.1
+
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 95a700b2d5..dc24b90114 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -9,7 +9,13 @@ LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc
+LIBV4L_CONF_OPTS = \
+	--disable-doxygen-doc \
+	--disable-tests
+# We're patching configure.ac
+LIBV4L_AUTORECONF = YES
+# add host-gettext for AM_ICONV macro
+LIBV4L_DEPENDENCIES += host-gettext
 
 # fix uclibc-ng configure/compile
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.14.1

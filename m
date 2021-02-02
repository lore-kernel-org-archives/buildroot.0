From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Feb 2021 20:27:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgpiod: disable examples
Message-ID: <20210202192703.123317-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a build failure with libgpiod in version 1.6.2

Fixes:
 - http://autobuild.buildroot.org/results/321004b185213099c7c5633b5ec35ceadd0293bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nfigure-switch-for-building-examples.patch | 91 +++++++++++++++++++
 package/libgpiod/libgpiod.mk                  |  5 +-
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch

diff --git a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch b/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
new file mode 100644
index 0000000000..a21c767006
--- /dev/null
+++ b/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
@@ -0,0 +1,91 @@
+From 5e9e7223a3633ee82b557d21b1f18aa15becd450 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+Date: Mon, 7 Dec 2020 20:38:30 +0100
+Subject: build: add a configure switch for building examples
+
+Example code for bindings is currently always built if bindings are
+enabled. Make it conditional with a new configure switch.
+
+Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+[Retrieved from:
+https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=5e9e7223a3633ee82b557d21b1f18aa15becd450]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ bindings/cxx/Makefile.am    |  8 +++++++-
+ bindings/python/Makefile.am | 10 ++++++++--
+ configure.ac                |  6 ++++++
+ 3 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
+index 5c40ceb..87463b0 100644
+--- a/bindings/cxx/Makefile.am
++++ b/bindings/cxx/Makefile.am
+@@ -18,10 +18,16 @@ include_HEADERS = gpiod.hpp
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libgpiodcxx.pc
+ 
+-SUBDIRS = . examples
++SUBDIRS = .
+ 
+ if WITH_TESTS
+ 
+ SUBDIRS += tests
+ 
+ endif
++
++if WITH_EXAMPLES
++
++SUBDIRS += examples
++
++endif
+diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
+index 124f152..5403bcb 100644
+--- a/bindings/python/Makefile.am
++++ b/bindings/python/Makefile.am
+@@ -6,8 +6,6 @@
+ # Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
+ #
+ 
+-SUBDIRS = . examples
+-
+ pyexec_LTLIBRARIES = gpiod.la
+ 
+ gpiod_la_SOURCES = gpiodmodule.c
+@@ -17,8 +15,16 @@ gpiod_la_CFLAGS += -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
+ gpiod_la_LDFLAGS = -module -avoid-version
+ gpiod_la_LIBADD = $(top_builddir)/lib/libgpiod.la $(PYTHON_LIBS)
+ 
++SUBDIRS = .
++
+ if WITH_TESTS
+ 
+ SUBDIRS += tests
+ 
+ endif
++
++if WITH_EXAMPLES
++
++SUBDIRS += examples
++
++endif
+diff --git a/configure.ac b/configure.ac
+index 57c99a8..90a6324 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -155,6 +155,12 @@ then
+ 	fi
+ fi
+ 
++AC_ARG_ENABLE([examples],
++	[AS_HELP_STRING([--enable-examples], [enable building code examples[default=no]])],
++	[if test "x$enableval" = xyes; then with_examples=true; fi],
++	[with_examples=false])
++AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
++
+ AC_ARG_ENABLE([bindings-cxx],
+ 	[AS_HELP_STRING([--enable-bindings-cxx],[enable C++ bindings [default=no]])],
+ 	[if test "x$enableval" = xyes; then with_bindings_cxx=true; fi],
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 72f8ae772c..f78d69158b 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -12,7 +12,10 @@ LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
 LIBGPIOD_LICENSE_FILES = COPYING
 LIBGPIOD_INSTALL_STAGING = YES
-LIBGPIOD_DEPENDENCIES = host-pkgconf
+# We're patching configure.ac
+LIBGPIOD_AUTORECONF = YES
+LIBGPIOD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+LIBGPIOD_DEPENDENCIES = host-pkgconf host-autoconf-archive
 LIBGPIOD_CONF_OPTS = --disable-tests
 
 ifeq ($(BR2_PACKAGE_LIBGPIOD_TOOLS),y)
-- 
2.29.2

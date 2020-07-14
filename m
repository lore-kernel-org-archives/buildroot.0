From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:54:16 +0200
Subject: [Buildroot] [git commit] package/libnfc: bump to version 1.8.0
Message-ID: <20200714205028.85D6E86D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bea92206bc050d78e044aa78c5eb50a0a50c512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Retrieve first patch from upstream (BUILD_EXAMPLES is already in
  CMakeLists.txt)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-autotools-make-example-build-optional.patch | 69 ++++++++++++++++++
 ...build-systems-make-example-build-optional.patch | 82 ----------------------
 package/libnfc/libnfc.hash                         |  4 +-
 package/libnfc/libnfc.mk                           |  2 +-
 4 files changed, 72 insertions(+), 85 deletions(-)

diff --git a/package/libnfc/0001-autotools-make-example-build-optional.patch b/package/libnfc/0001-autotools-make-example-build-optional.patch
new file mode 100644
index 0000000000..ce01de74a0
--- /dev/null
+++ b/package/libnfc/0001-autotools-make-example-build-optional.patch
@@ -0,0 +1,69 @@
+From 874d9605aa9cd028aed149c2dd1bb410856477fb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jun 2020 23:28:37 +0200
+Subject: [PATCH] autotools: make example build optional
+
+This patch makes example build optional for autotools build system.
+
+In order to keep the former behavior, example build is enabled by default.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Retrieved (and slightly updated to remove CMakeLists.txt) from:
+https://git.buildroot.net/buildroot/tree/package/libnfc/0001-build-systems-make-example-build-optional.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/nfc-tools/libnfc/commit/874d9605aa9cd028aed149c2dd1bb410856477fb]
+---
+ Makefile.am  |  8 +++++++-
+ configure.ac | 11 +++++++++++
+ 2 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d2f6fc8e..516ebee2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,13 @@ ACLOCAL_AMFLAGS = -I m4
+ 
+ AM_CFLAGS = $(LIBNFC_CFLAGS)
+ 
+-SUBDIRS = libnfc utils examples include contrib cmake test
++SUBDIRS = libnfc utils
++
++if EXAMPLE_ENABLED
++SUBDIRS += examples
++endif
++
++SUBDIRS += include contrib cmake test
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libnfc.pc
+diff --git a/configure.ac b/configure.ac
+index 280a6d08..46b65d33 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -157,6 +157,14 @@ then
+ fi
+ AM_CONDITIONAL(DOC_ENABLED, [test x"$enable_doc" = xyes])
+ 
++# Example build (default: yes)
++AC_ARG_ENABLE([example],AS_HELP_STRING([--enable-example],[Enable example build.]),[enable_example=$enableval],[enable_example="yes"])
++
++AC_MSG_CHECKING(for example build)
++AC_MSG_RESULT($enable_example)
++
++AM_CONDITIONAL(EXAMPLE_ENABLED, [test x"$enable_example" = xyes])
++
+ # Dependencies
+ PKG_CONFIG_REQUIRES=""
+ 
+@@ -175,7 +183,10 @@ if test x$ac_cv_with_cutter = xyes -a x$ac_cv_use_cutter = xno; then
+ fi
+ AM_CONDITIONAL([WITH_CUTTER], [test "$ac_cv_use_cutter" != "no"])
+ 
++if test x"$enable_example" = "xyes"
++then
+ AC_CHECK_READLINE
++fi
+ 
+ # Help us to write great code ;-)
+ CFLAGS="$CFLAGS -Wall -pedantic -Wextra"
diff --git a/package/libnfc/0001-build-systems-make-example-build-optional.patch b/package/libnfc/0001-build-systems-make-example-build-optional.patch
deleted file mode 100644
index 06577c58ec..0000000000
--- a/package/libnfc/0001-build-systems-make-example-build-optional.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 40a4871b171293d98acb40cf54be9ee9b78a3244 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Wed, 6 Jun 2012 00:49:25 +0200
-Subject: [PATCH 1/1] build systems: make example build optional
-
-This patch makes example build optional for both cmake and autotools build
-systems.
-
-In order to keep the former behavior, example build is enabled by default.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
-diff -Nurp a/CMakeLists.txt b/CMakeLists.txt
---- a/CMakeLists.txt	2013-12-08 18:51:01.000000000 +0000
-+++ b/CMakeLists.txt	2014-01-08 12:51:42.435096403 +0000
-@@ -39,6 +39,7 @@ IF(LIBNFC_ENVVARS)
-   ADD_DEFINITIONS(-DENVVARS)
- ENDIF(LIBNFC_ENVVARS)
- 
-+SET(BUILD_EXAMPLES ON CACHE BOOL "Build examples")
- SET(LIBNFC_DEBUG_MODE OFF CACHE BOOL "Debug mode")
- IF(LIBNFC_DEBUG_MODE)
-   ADD_DEFINITIONS(-DDEBUG)
-@@ -155,7 +156,10 @@ ENDIF(WIN32)
- ADD_SUBDIRECTORY(libnfc)
- ADD_SUBDIRECTORY(include)
- ADD_SUBDIRECTORY(utils)
--ADD_SUBDIRECTORY(examples)
-+
-+IF(BUILD_EXAMPLES)
-+  ADD_SUBDIRECTORY(examples)
-+ENDIF(BUILD_EXAMPLES)
- 
- # Binary Package
- IF(WIN32)
-diff -Nurp a/Makefile.am b/Makefile.am
---- a/Makefile.am	2013-12-08 18:51:01.000000000 +0000
-+++ b/Makefile.am	2014-01-08 12:52:12.807018593 +0000
-@@ -2,7 +2,13 @@ ACLOCAL_AMFLAGS = -I m4
- 
- AM_CFLAGS = $(LIBNFC_CFLAGS)
- 
--SUBDIRS = libnfc utils examples include contrib cmake test
-+SUBDIRS = libnfc utils
-+
-+if EXAMPLE_ENABLED
-+SUBDIRS += examples
-+endif
-+
-+SUBDIRS += include contrib cmake test
- 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = libnfc.pc
-diff -Nurp a/configure.ac b/configure.ac
---- a/configure.ac	2013-12-08 18:51:01.000000000 +0000
-+++ b/configure.ac	2014-01-08 12:53:02.054872564 +0000
-@@ -142,6 +142,14 @@ then
- fi
- AM_CONDITIONAL(DOC_ENABLED, [test x"$enable_doc" = xyes])
- 
-+# Example build (default: yes)
-+AC_ARG_ENABLE([example],AS_HELP_STRING([--enable-example],[Enable example build.]),[enable_example=$enableval],[enable_example="yes"])
-+
-+AC_MSG_CHECKING(for example build)
-+AC_MSG_RESULT($enable_example)
-+
-+AM_CONDITIONAL(EXAMPLE_ENABLED, [test x"$enable_example" = xyes])
-+
- # Dependencies
- PKG_CONFIG_REQUIRES=""
- 
-@@ -160,7 +168,10 @@ if test x$ac_cv_with_cutter = xyes -a x$
- fi
- AM_CONDITIONAL([WITH_CUTTER], [test "$ac_cv_use_cutter" != "no"])
- 
-+if test x"$enable_example" = "xyes"
-+then
- AC_CHECK_READLINE
-+fi
- 
- # Help us to write great code ;-)
- CFLAGS="$CFLAGS -Wall -pedantic -Wextra"
diff --git a/package/libnfc/libnfc.hash b/package/libnfc/libnfc.hash
index 32decf2d03..8a346cbfc7 100644
--- a/package/libnfc/libnfc.hash
+++ b/package/libnfc/libnfc.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 945e74d8e27683f9b8a6f6e529557b305d120df347a960a6a7ead6cb388f4072  libnfc-1.7.1.tar.bz2
-sha256 9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING
+sha256  6d9ad31c86408711f0a60f05b1933101c7497683c2e0d8917d1611a3feba3dd5  libnfc-1.8.0.tar.bz2
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index ca8700484b..1971563334 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFC_VERSION = 1.7.1
+LIBNFC_VERSION = 1.8.0
 LIBNFC_SOURCE = libnfc-$(LIBNFC_VERSION).tar.bz2
 LIBNFC_SITE = https://github.com/nfc-tools/libnfc/releases/download/libnfc-$(LIBNFC_VERSION)
 LIBNFC_LICENSE = LGPL-3.0+

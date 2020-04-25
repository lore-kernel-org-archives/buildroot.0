From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:30:58 +0200
Subject: [Buildroot] [git commit] package/{apparmor,
 libapparmor}: bump to version 2.13.4
Message-ID: <20200425131643.697848FFA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29acee6e650a238e50c5f8a23a498f805a49b576
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apparmor/apparmor.hash                      |  2 +-
 package/apparmor/apparmor.mk                        |  2 +-
 ...on_devel-fixing-for-crosscompiling-environ.patch | 21 ++++++++-------------
 package/libapparmor/libapparmor.hash                |  2 +-
 package/libapparmor/libapparmor.mk                  |  2 +-
 5 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 91ab51f6ab..c7caef7beb 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  267053234c68cdb122c5294d7c276b6e2f5fa7e75c6c2d23e3ce69f95d9a7639  apparmor-2.13.3.tar.gz
+sha256  90bf86c07ffbe2c22be46d75c7345fad12d5911653c59750a37d59c63ad5d10e  apparmor-2.13.4.tar.gz
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
 sha256  dd54950fa69a3096fe907a466a454d217ccca9bca77398d5232704766d5a0040  parser/COPYING.GPL
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 9180fcd803..097c9cfba7 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 2.13
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).3
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).4
 APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
diff --git a/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch b/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
index 7b902d5970..ecd8d6c163 100644
--- a/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
+++ b/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
@@ -1,4 +1,4 @@
-From 235ce271f3fee53b918317ebb73a47b3c6a7ae03 Mon Sep 17 00:00:00 2001
+From 64e5c6b23de9c147881680f3daccb995263c34a3 Mon Sep 17 00:00:00 2001
 From: Angelo Compagnucci <angelo@amarulasolutions.com>
 Date: Tue, 24 Mar 2020 22:53:37 +0100
 Subject: [PATCH] m4: ac_python_devel: fixing for crosscompiling environments
@@ -14,11 +14,11 @@ python-config and fixes the rest of the m4 accordingly.
 
 Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 ---
- libraries/libapparmor/m4/ac_python_devel.m4 | 25 ++++++++++++++++-----
- 1 file changed, 19 insertions(+), 6 deletions(-)
+ libraries/libapparmor/m4/ac_python_devel.m4 | 23 ++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
 
 diff --git a/libraries/libapparmor/m4/ac_python_devel.m4 b/libraries/libapparmor/m4/ac_python_devel.m4
-index 2ea7dc77..6454e2d8 100644
+index 29cf090d..6454e2d8 100644
 --- a/libraries/libapparmor/m4/ac_python_devel.m4
 +++ b/libraries/libapparmor/m4/ac_python_devel.m4
 @@ -13,6 +13,11 @@ AC_DEFUN([AC_PYTHON_DEVEL],[
@@ -55,7 +55,7 @@ index 2ea7dc77..6454e2d8 100644
          fi
          if test -z "$PYTHON_LDFLAGS"; then
                  # (makes two attempts to ensure we've got a version number
-@@ -136,10 +141,14 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
+@@ -136,6 +141,10 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
          # libraries which must be linked in when embedding
          #
          AC_MSG_CHECKING(python extra libraries)
@@ -66,12 +66,7 @@ index 2ea7dc77..6454e2d8 100644
          if test -z "$PYTHON_EXTRA_LIBS"; then
             PYTHON_EXTRA_LIBS=`$PYTHON -c "import sys; import distutils.sysconfig; \
  conf = distutils.sysconfig.get_config_var; \
--sys.stdout.write('%s %s\n' % (conf('LOCALMODLIBS'), conf('LIBS')))"`
-+sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf('LIBS')))"`
-         fi
-         AC_MSG_RESULT([$PYTHON_EXTRA_LIBS])
-         AC_SUBST(PYTHON_EXTRA_LIBS)
-@@ -148,6 +157,10 @@ sys.stdout.write('%s %s\n' % (conf('LOCALMODLIBS'), conf('LIBS')))"`
+@@ -148,6 +157,10 @@ sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf(
          # linking flags needed when embedding
          #
          AC_MSG_CHECKING(python extra linking flags)
@@ -86,11 +81,11 @@ index 2ea7dc77..6454e2d8 100644
          # save current global flags
          ac_save_LIBS="$LIBS"
          ac_save_CPPFLAGS="$CPPFLAGS"
--        LIBS="$ac_save_LIBS $PYTHON_LDFLAGS"
+-        LIBS="$ac_save_LIBS $PYTHON_LDFLAGS $PYTHON_EXTRA_LIBS"
 +        LIBS="$ac_save_LIBS $PYTHON_EXTRA_LIBS $PYTHON_LDFLAGS"
          CPPFLAGS="$ac_save_CPPFLAGS $PYTHON_CPPFLAGS"
          AC_TRY_LINK([
                  #include <Python.h>
 -- 
-2.17.1
+2.25.1
 
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 3bff2bc853..a0ff221914 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  267053234c68cdb122c5294d7c276b6e2f5fa7e75c6c2d23e3ce69f95d9a7639  apparmor-2.13.3.tar.gz
+sha256  90bf86c07ffbe2c22be46d75c7345fad12d5911653c59750a37d59c63ad5d10e  apparmor-2.13.4.tar.gz
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libraries/libapparmor/COPYING.LGPL
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 98037c64a6..db5839b07c 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 2.13
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).3
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).4
 LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
 LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
 LIBAPPARMOR_LICENSE = LGPL-2.1

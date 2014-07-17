From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 10:04:33 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Remove dependency for the
	libxml2 module of host-python
Message-ID: <20140717080455.D46949D265@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7150edb8e2ff1074aeeab97cc32af3522f13f979
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the ugly BR2_PACKAGE_HOST_LIBXML2_PYTHON hack as well as
mesa3d was the only package needing it, this is not the case
anymore since:

http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=2de70fe23f320ce4f559e37057fe07b7af99cf5a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/Config.in             |    3 ---
 package/libxml2/libxml2-python2.patch |   27 ---------------------------
 package/libxml2/libxml2.mk            |   16 +---------------
 package/mesa3d/Config.in              |    1 -
 package/mesa3d/mesa3d.mk              |    1 -
 5 files changed, 1 insertions(+), 47 deletions(-)

diff --git a/package/libxml2/Config.in b/package/libxml2/Config.in
index 85694f9..ebd63fe 100644
--- a/package/libxml2/Config.in
+++ b/package/libxml2/Config.in
@@ -4,6 +4,3 @@ config BR2_PACKAGE_LIBXML2
 	  XML C Parser
 
 	  http://xmlsoft.org/
-
-config BR2_PACKAGE_HOST_LIBXML2_PYTHON
-	bool
diff --git a/package/libxml2/libxml2-python2.patch b/package/libxml2/libxml2-python2.patch
deleted file mode 100644
index 19195a6..0000000
--- a/package/libxml2/libxml2-python2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Prefer python2 binary in case python points to python3
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libxml2-2.9.1.org/configure.in libxml2-2.9.1/configure.in
---- libxml2-2.9.1.org/configure.in	2013-04-19 09:25:20.000000000 +0200
-+++ libxml2-2.9.1/configure.in	2014-04-12 14:16:26.579361068 +0200
-@@ -748,6 +748,11 @@
- PYTHON_TESTS=
- pythondir=
- if test "$with_python" != "no" ; then
-+    if test -x "$with_python/bin/python2"
-+    then
-+        echo Found python2 in $with_python/bin/python2
-+        PYTHON="$with_python/bin/python2"
-+    else
-     if test -x "$with_python/bin/python"
-     then
-         echo Found python in $with_python/bin/python
-@@ -773,6 +778,7 @@
- 	    fi
- 	fi
-     fi
-+    fi
-     if test "$PYTHON" != ""
-     then
-         PYTHON_VERSION=`$PYTHON -c "from distutils import sysconfig; print(sysconfig.get_python_version())"`
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 62f3e27..9bf4c28 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -20,21 +20,7 @@ LIBXML2_CONF_OPT = --with-gnu-ld --without-python --without-debug --without-lzma
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
-HOST_LIBXML2_CONF_OPT = --without-zlib --without-lzma
-
-# mesa3d uses functions that are only available with debug
-ifeq ($(BR2_PACKAGE_MESA3D),y)
-HOST_LIBXML2_CONF_OPT += --with-debug
-else
-HOST_LIBXML2_CONF_OPT += --without-debug
-endif
-
-ifeq ($(BR2_PACKAGE_HOST_LIBXML2_PYTHON),y)
-HOST_LIBXML2_DEPENDENCIES += host-python
-HOST_LIBXML2_CONF_OPT += --with-python=$(HOST_DIR)/usr
-else
-HOST_LIBXML2_CONF_OPT += --without-python
-endif
+HOST_LIBXML2_CONF_OPT = --without-zlib --without-lzma --without-python
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBXML2_DEPENDENCIES += zlib
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 852d6d0..c1be9e3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -2,7 +2,6 @@ menuconfig BR2_PACKAGE_MESA3D
 	bool "mesa3d"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4a00dac..6b9383b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -20,7 +20,6 @@ MESA3D_DEPENDENCIES = \
 	host-bison \
 	host-flex \
 	host-gettext \
-	host-libxml2 \
 	host-python \
 	host-xutil_makedepend \
 	libdrm

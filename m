From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:13 +0200
Subject: [Buildroot] [PATCH v12 13/32] mesa3d: Remove dependency for the
	libxml2 module of host-python
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402144292-27837-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the ugly BR2_PACKAGE_HOST_LIBXML2_PYTHON hack as well as
mesa3d was the only package needing it, this is not the case
anymore since:

http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=2de70fe23f320ce4f559e37057fe07b7af99cf5a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libxml2/Config.in             |    3 ---
 package/libxml2/libxml2-python2.patch |   27 ---------------------------
 package/libxml2/libxml2.mk            |   16 +---------------
 package/mesa3d/Config.in              |    1 -
 package/mesa3d/mesa3d.mk              |    1 -
 5 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 package/libxml2/libxml2-python2.patch

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
index 0bea798..10a5f96 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -2,7 +2,6 @@ menuconfig BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1604dbc..02a065f 100644
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
-- 
1.7.10.4

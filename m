From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:03 +0100
Subject: [Buildroot] [PATCH 13/33] sconeserver: fix imagemagick dependency
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-14-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* only depends on imagemagick when C++ support is enable
* use 'pkg-config Magick++' instead of Magick++-config

Fixes:
http://autobuild.buildroot.net/results/e8a71a731dafb2eaee0454b5b1a51cd6de4ecdc6/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/sconeserver/Config.in                      |  3 ++
 ...-dependency-use-pkg-config-instead-of-Mag.patch | 41 ++++++++++++++++++++++
 package/sconeserver/sconeserver.mk                 |  2 +-
 3 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/sconeserver/sconeserver-180-ImageMagick-dependency-use-pkg-config-instead-of-Mag.patch

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index a7e5c75..74722a0 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -26,6 +26,9 @@ config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
 config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
 	bool "http::sconesite::image"
 	depends on BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
+	# sconesite-image requires Magick++.h which is only available if
+	# C++ compiler is working.
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_IMAGEMAGICK
 	help
 	  http::sconesite::image module for Sconeserver
diff --git a/package/sconeserver/sconeserver-180-ImageMagick-dependency-use-pkg-config-instead-of-Mag.patch b/package/sconeserver/sconeserver-180-ImageMagick-dependency-use-pkg-config-instead-of-Mag.patch
new file mode 100644
index 0000000..58298c8
--- /dev/null
+++ b/package/sconeserver/sconeserver-180-ImageMagick-dependency-use-pkg-config-instead-of-Mag.patch
@@ -0,0 +1,41 @@
+From 278cacf17370756a1d620ffa8898c889051d19bf Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 17 Nov 2012 18:18:17 +0100
+Subject: [PATCH 1/1] ImageMagick dependency: use pkg-config instead of
+ Magick++-config
+
+Magick++-config is nothing more than a wrapper using pkg-config.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 241e66b..936130f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -185,7 +185,7 @@ fi
+ 
+ # Look for ImageMagick settings
+ AC_CHECK_LIB([Magick++],[InitializeMagick],
+-  [CPPFLAGS="$CPPFLAGS `Magick++-config --cppflags`"],,
++  [CPPFLAGS="$CPPFLAGS `pkg-config Magick++ --cflags`"],,
+ )
+ 
+ # Sconesite:image module
+@@ -202,9 +202,9 @@ if test "x$SCONESITE_IMAGE" == "xyes"; then
+   if test "x$ac_cv_lib_Magickpp_InitializeMagick" != "xyes"; then
+     AC_MSG_ERROR([library 'Magick++' is required for Sconesite:image])
+   fi
+-  SCONESITE_IMAGE_LIBADD=`Magick++-config --libs`
++  SCONESITE_IMAGE_LIBADD=`pkg-config Magick++ --libs`
+   AC_SUBST(SCONESITE_IMAGE_LIBADD)
+-  SCONESITE_IMAGE_LDFLAGS=`Magick++-config --ldflags`
++  SCONESITE_IMAGE_LDFLAGS=`pkg-config Magick++ --libs`
+   AC_SUBST(SCONESITE_IMAGE_LDFLAGS)
+ fi
+ 
+-- 
+1.8.0
+
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index d6c9639..aa5688a 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -53,7 +53,7 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
-	SCONESERVER_DEPENDENCIES += imagemagick
+	SCONESERVER_DEPENDENCIES += imagemagick host-pkgconf
 	SCONESERVER_CONF_OPT += --with-sconesite-image
 else
 	SCONESERVER_CONF_OPT += --without-sconesite-image
-- 
1.8.0

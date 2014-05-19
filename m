From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 May 2014 00:31:42 +0200
Subject: [Buildroot] [git commit] package/webkit: Fix OpenGL-related
	dependencies
Message-ID: <20140520063609.57BB69CC4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=042a3b7efab17c44d8a9b5d1f61103e73b19d8c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fixes
http://autobuild.buildroot.net/results/27a/27a674c6a19a729fae5cc33de0360b2a061930c1/

This patch indeed fixes several problems based on the autobuilder-defconfig used.

1) Add missing dependencies when opengl is detected by webkit to satisfy autobuilder:

checking which GPU acceleration backend to use... opengl
checking for XCOMPOSITE... yes
checking for XDAMAGE... no
configure: error: Package requirements (xdamage) were not met:

2) ... but opengl should not have been detected with the used defconfig:
$ grep MESA .config
BR2_PACKAGE_MESA3D=y

which will lead to a link error although webkit configure found all dependencies:

/home/br2/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.7.3/../../../../mips-linux-gnu/bin/ld: cannot find -lGL

3) same is valid for glx, having GL/glx.h means nothing

4) add some configure options for gles/egl as well, just to make sure ;)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkit/Config.in |    2 ++
 package/webkit/webkit.mk |   21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 21da2b2..c86eb94 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -31,6 +31,8 @@ config BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_HAS_LIBGL
 	help
 	  WebKit is an open source, standards compliant web browser engine.
 
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 21b535f..6b04ccd 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -11,6 +11,10 @@ WEBKIT_INSTALL_STAGING = YES
 WEBKIT_DEPENDENCIES = host-ruby host-flex host-bison host-gperf enchant harfbuzz \
 	icu jpeg libcurl libgail libsecret libsoup libxml2 libxslt libgtk2 sqlite webp
 
+WEBKIT_DEPENDENCIES += \
+	$(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
+	$(if $(BR_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
+
 # webkit-disable-tests.patch changes configure.ac therefore autoreconf required
 WEBKIT_AUTORECONF = YES
 WEBKIT_AUTORECONF_OPT = -I $(@D)/Source/autotools
@@ -48,4 +52,21 @@ WEBKIT_CONF_OPT += \
 WEBKIT_CONF_OPT += --with-target=x11
 WEBKIT_DEPENDENCIES += xlib_libXt
 
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+WEBKIT_CONF_OPT += --enable-gles2
+WEBKIT_DEPENDENCIES += libegl libgles
+else
+WEBKIT_CONF_OPT += --disable-gles2
+endif
+
+# gles/egl support is prefered over opengl by webkit configure
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+WEBKIT_CONF_OPT += --with-acceleration-backend=opengl
+WEBKIT_DEPENDENCIES += libgl
+else
+# OpenGL/glx is auto-detected due to the presence of gl.h/glx.h, which is not
+# enough, so disable glx and the use of the OpenGL acceleration backend here
+WEBKIT_CONF_OPT += --disable-glx --with-acceleration-backend=none
+endif
+
 $(eval $(autotools-package))

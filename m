From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 22 Mar 2017 11:56:43 +0000
Subject: [Buildroot] [PATCH v2] libepoxy: OpenGL EGL and OpenGL ES
	dependencies are mandatory
Message-ID: <20170322115643.48653-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --disable-egl configure option doesn't exist:

configure: WARNING: unrecognized options: [snip] --disable-egl

If you don't have EGL support the configure script will fail like this:

checking for EGL... no
configure: error: Package requirements (egl) were not met:

Also, libepoxy use dlsym to load a GLES2 library when EGL support is
enabled, see src/dispatch_common.c:

So, OpenGL ES dependency is also mandatory.

Fixes:
  http://autobuild.buildroot.net/results/3eca5ba26a521f6cc5a611309ba066472af7769c
  http://autobuild.buildroot.net/results/cf9ec7da196d70548ae1413e4a3730314f6434d6
  http://autobuild.buildroot.net/results/069b80101afc4719db6d6d41cf5fc923be21ddc0

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
---
Changes v1 -> v2:
 - Add OpenGL ES dependency and modify commit log accordingly.
   (Thanks Romain)
---
 package/libepoxy/Config.in   | 10 +++++++---
 package/libepoxy/libepoxy.mk |  9 +--------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index c87366a..301e3ed 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,12 +1,16 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
-	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	# OpenGL EGL is mandatory and libepoxy uses dlsym to load a
+	# GLES2 library when EGL support is enabled. Details in
+	# src/dispatch/dispatch_common.c
+	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Epoxy is a library for handling OpenGL function pointer
 	  management for you.
 
 	  https://github.com/anholt/libepoxy
 
-comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
+comment "libepoxy needs OpenGL EGL and OpenGL ES backends"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+	depends on !BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index be8c55e..4dbdefc 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -9,17 +9,10 @@ LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).1
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-LIBEPOXY_DEPENDENCIES = host-pkgconf xutil_util-macros
+LIBEPOXY_DEPENDENCIES = host-pkgconf libegl libgles xutil_util-macros
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-LIBEPOXY_CONF_OPTS += --enable-egl
-LIBEPOXY_DEPENDENCIES += libegl
-else
-LIBEPOXY_CONF_OPTS += --disable-egl
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_XLIB_LIBX11),yy)
 LIBEPOXY_CONF_OPTS += --enable-glx
 LIBEPOXY_DEPENDENCIES += libgl xlib_libX11
-- 
2.10.2

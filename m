From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:23:07 +0200
Subject: [Buildroot] [git commit] package/x11r7/libepoxy: fix OpenGL / EGL
	dependencies
Message-ID: <20150809092312.099BC81991@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a2aa343c8656abaede9f5b4972be93d4de5e598
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libepoxy depends on egl, opengl is an optional dependency

Fixes
http://autobuild.buildroot.net/results/f7e/f7e6a42f53cb4ca523d2eeefde85c44770f6011e
http://autobuild.buildroot.net/results/025/025a3d3b4d3dd4f496dcbf09f2dd279116250207

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libepoxy/Config.in   |   10 ++++++++--
 package/x11r7/libepoxy/libepoxy.mk |    7 ++++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
index c4f5794..5628bf7 100644
--- a/package/x11r7/libepoxy/Config.in
+++ b/package/x11r7/libepoxy/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "epoxy"
-	depends on BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	help
-	  Epoxy is a library for handling OpenGL function pointer management for you.
+	  Epoxy is a library for handling OpenGL function pointer
+	  management for you.
 
 	  https://github.com/anholt/libepoxy
+
+comment "epoxy needs an OpenGL EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
index d908893..58b094a 100644
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -8,8 +8,13 @@ LIBEPOXY_VERSION = v1.2
 LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
 LIBEPOXY_AUTORECONF = YES
-LIBEPOXY_DEPENDENCIES = mesa3d
+LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros libegl \
+	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
 
+# needed for rpi-userland
+LIBEPOXY_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
+LIBEPOXY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(LIBEPOXY_CFLAGS)"
+
 $(eval $(autotools-package))

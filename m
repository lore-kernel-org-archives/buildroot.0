From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 May 2015 22:15:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/libepoxy: Fix OpenGL / EGL
	dependencies
Message-ID: <1430943308-13319-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/596/596f44a26aad45c027f0f4f97d63e97a1f4fd001

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Add missing select lines to Config.in (Thomas)

 package/x11r7/libepoxy/Config.in   |   10 ++++++++--
 package/x11r7/libepoxy/libepoxy.mk |   12 +++++++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
index c4f5794..1b1ca3f 100644
--- a/package/x11r7/libepoxy/Config.in
+++ b/package/x11r7/libepoxy/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "epoxy"
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
-	  Epoxy is a library for handling OpenGL function pointer management for you.
+	  Epoxy is a library for handling OpenGL function pointer
+	  management for you.
 
 	  https://github.com/anholt/libepoxy
+
+comment "epoxy needs an OpenGL EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
index d908893..fc1ede4 100644
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -8,8 +8,18 @@ LIBEPOXY_VERSION = v1.2
 LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
 LIBEPOXY_AUTORECONF = YES
-LIBEPOXY_DEPENDENCIES = mesa3d
+LIBEPOXY_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
+	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+LIBEPOXY_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) \
+		-I$(STAGING_DIR)/usr/include/IL \
+		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:16 +0200
Subject: [Buildroot] [PATCH v4 21/37] libva: new package
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in       |    1 +
 package/libva/Config.in |   12 ++++++++++
 package/libva/libva.mk  |   59 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 package/libva/Config.in
 create mode 100644 package/libva/libva.mk

diff --git a/package/Config.in b/package/Config.in
index e816603..b45c6e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -593,6 +593,7 @@ source "package/libsvg/Config.in"
 source "package/libsvg-cairo/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
+source "package/libva/Config.in"
 source "package/opencv/Config.in"
 source "package/opengl/Config.in"
 source "package/pango/Config.in"
diff --git a/package/libva/Config.in b/package/libva/Config.in
new file mode 100644
index 0000000..98a5ee8
--- /dev/null
+++ b/package/libva/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBVA
+	bool "libva"
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XSERVER_XORG_SERVER
+	help
+	  The main motivation for VA-API (Video Acceleration API) is to enable
+	  hardware accelerated video decode/encode at various entry-points (VLD,
+	  IDCT, Motion Compensation etc.) for the prevailing coding standards
+	  today (MPEG-2, MPEG-4 ASP/H.263, MPEG-4 AVC/H.264, and VC-1/VMW3).
+
+	  http://www.freedesktop.org/wiki/Software/vaapi/
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
new file mode 100644
index 0000000..1c7e6e0
--- /dev/null
+++ b/package/libva/libva.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# libva
+#
+################################################################################
+
+LIBVA_VERSION = 1.3.0
+LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
+LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
+LIBVA_LICENSE = MIT
+LIBVA_INSTALL_STAGING = YES
+
+LIBVA_DEPENDENCIES = \
+	host-pkgconf \
+	libdrm
+
+LIBVA_CONF_OPT = \
+	--enable-drm \
+	--disable-dummy-driver \
+	--with-drivers-path="/usr/lib/va"
+
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+LIBVA_DEPENDENCIES += \
+	mesa3d
+LIBVA_CONF_OPT += \
+	--enable-glx
+endif
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+LIBVA_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXfixes
+LIBVA_CONF_OPT += \
+	--enable-x11
+else
+LIBVA_CONF_OPT += \
+	--disable-x11
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBVA_DEPENDENCIES += \
+	wayland
+LIBVA_CONF_OPT += \
+	--enable-wayland
+else
+LIBVA_CONF_OPT += \
+	--disable-wayland
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y)
+LIBVA_CONF_OPT += \
+	--enable-egl
+else
+LIBVA_CONF_OPT += \
+	--disable-egl
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4

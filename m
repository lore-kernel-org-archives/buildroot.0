From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Jun 2021 21:22:37 +0200
Subject: [Buildroot] [PATCH 4/4] package/mpv: Add optional support for
 DRM/EGL-based vaapi acceleration
In-Reply-To: <20210618192237.808519-1-bernd.kuhls@t-online.de>
References: <20210618192237.808519-1-bernd.kuhls@t-online.de>
Message-ID: <20210618192237.808519-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/mpv-player/mpv/blob/master/wscript#L647

Runtime-tested using mesa3d iris driver on a non-x11 system.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpv/Config.in |  6 ++++++
 package/mpv/mpv.mk    | 11 +++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 812491e3a9..81b1e24b5f 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -1,3 +1,9 @@
+config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
+	bool
+	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_OPENGL_EGL
+	default y if BR2_PACKAGE_WAYLAND
+	default y if BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_MPV
 	bool "mpv"
 	depends on BR2_INSTALL_LIBSTDCPP # libass
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 4292abb876..d4d4d4811d 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -178,17 +178,16 @@ MPV_CONF_OPTS += --disable-rpi
 endif
 
 # va-api support
-# This requires one or more of the egl-drm, wayland, x11 backends
-# For now we support wayland and x11
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-ifneq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XORG7),)
+ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+MPV_CONF_OPTS += --enable-vaapi-drm
 else
-MPV_CONF_OPTS += --disable-vaapi
+MPV_CONF_OPTS += --disable-vaapi-drm
 endif
 else
-MPV_CONF_OPTS += --disable-vaapi
+MPV_CONF_OPTS += --disable-vaapi --disable-vaapi-drm
 endif
 
 # wayland support
-- 
2.30.2

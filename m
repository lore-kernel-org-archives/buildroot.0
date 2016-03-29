From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:39:02 -0300
Subject: [Buildroot] [PATCH v3 03/11] weston: add DRM compoitor support
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459262350-10974-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/Config.in | 10 ++++++++++
 package/weston/weston.mk | 10 +++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index aaf1706..8cefa41 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -37,6 +37,16 @@ if BR2_PACKAGE_WESTON
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
 
+config BR2_PACKAGE_WESTON_DRM
+	bool "DRM compositor"
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
+
+# Uses libgbm from mesa3d
+comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
 
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5af23df..d600bc3 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -18,7 +18,6 @@ WESTON_CONF_OPTS = \
 	--disable-simple-egl-clients \
 	--disable-xwayland \
 	--disable-x11-compositor \
-	--disable-drm-compositor \
 	--disable-wayland-compositor \
 	--disable-headless-compositor \
 	--disable-weston-launch \
@@ -56,6 +55,15 @@ else
 WESTON_CONF_OPTS += --disable-fbdev-compositor
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
+WESTON_CONF_OPTS += \
+	--enable-drm-compositor \
+	WESTON_NATIVE_BACKEND=drm-backend.so
+WESTON_DEPENDENCIES += libdrm
+else
+WESTON_CONF_OPTS += --disable-drm-compositor
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
 WESTON_DEPENDENCIES += rpi-userland
 WESTON_CONF_OPTS += --enable-rpi-compositor \
-- 
2.7.3

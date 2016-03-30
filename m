From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 16:59:11 +0200
Subject: [Buildroot] [git commit] weston: add DRM compoitor support
Message-ID: <20160330150132.14DDC81D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c2ef71d3871999a51bd65152d29a6d0313e2e9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

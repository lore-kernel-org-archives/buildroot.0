From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:39:00 -0300
Subject: [Buildroot] [PATCH v3 01/11] weston: add EGL support
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459262350-10974-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop simple-egl-clients from the rpi compositor since it's a
duplicate of the global one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index d818071..e7ad97e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -15,7 +15,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-egl \
 	--disable-simple-egl-clients \
 	--disable-xwayland \
 	--disable-x11-compositor \
@@ -28,6 +27,14 @@ WESTON_CONF_OPTS = \
 WESTON_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
 
+# Needs wayland-egl, which normally only mesa provides
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
+WESTON_CONF_OPTS += --enable-egl
+WESTON_DEPENDENCIES += libegl
+else
+WESTON_CONF_OPTS += --disable-egl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
@@ -53,7 +60,6 @@ WESTON_CONF_OPTS += --enable-rpi-compositor \
 	--disable-resize-optimization \
 	--disable-setuid-install \
 	--disable-xwayland-test \
-	--disable-simple-egl-clients \
 	WESTON_NATIVE_BACKEND=rpi-backend.so
 else
 WESTON_CONF_OPTS += --disable-rpi-compositor
-- 
2.7.3

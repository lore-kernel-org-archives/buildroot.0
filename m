From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 18:22:13 -0300
Subject: [Buildroot] [PATCH 1/4] weston: add EGL support
Message-ID: <1459200136-30632-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop simple-egl-clients from the rpi compositor since it's a duplicate
of the global one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index d818071..beab7b4 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -15,7 +15,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-egl \
 	--disable-simple-egl-clients \
 	--disable-xwayland \
 	--disable-x11-compositor \
@@ -28,6 +27,12 @@ WESTON_CONF_OPTS = \
 WESTON_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
 
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+WESTON_DEPENDENCIES += libegl
+else
+WESTON_CONF_OPTS += --disable-egl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
@@ -53,7 +58,6 @@ WESTON_CONF_OPTS += --enable-rpi-compositor \
 	--disable-resize-optimization \
 	--disable-setuid-install \
 	--disable-xwayland-test \
-	--disable-simple-egl-clients \
 	WESTON_NATIVE_BACKEND=rpi-backend.so
 else
 WESTON_CONF_OPTS += --disable-rpi-compositor
-- 
2.7.3

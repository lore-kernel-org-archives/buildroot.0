From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 May 2016 16:44:57 -0300
Subject: [Buildroot] [PATCH 1/3] weston: add support for X11 backend
Message-ID: <1464291899-1854-1-git-send-email-gustavo@zacarias.com.ar>
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
index 8cefa41..44f954a 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -82,4 +82,14 @@ config BR2_PACKAGE_WESTON_RPI
 	depends on BR2_PACKAGE_RPI_USERLAND
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 
+config BR2_PACKAGE_WESTON_X11
+	bool "X11 compositor"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
+
+comment "X11 compositor needs X.org enabled"
+	depends on !BR2_PACKAGE_XORG7
+
 endif
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 63c43a3..3a0189f 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -19,7 +19,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
 	--disable-xwayland \
-	--disable-x11-compositor \
 	--disable-wayland-compositor \
 	--disable-headless-compositor \
 	--disable-colord \
@@ -103,6 +102,15 @@ else
 WESTON_CONF_OPTS += --disable-rpi-compositor
 endif # BR2_PACKAGE_WESTON_RPI
 
+ifeq ($(BR2_PACKAGE_WESTON_X11),y)
+WESTON_CONF_OPTS += \
+	--enable-x11-compositor \
+	WESTON_NATIVE_BACKEND=x11-backend.so
+WESTON_DEPENDENCIES += libxcb xlib_libX11
+else
+WESTON_CONF_OPTS += --disable-x11-compositor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVA),y)
 WESTON_CONF_OPTS += --enable-vaapi-recorder
 WESTON_DEPENDENIES += libva
-- 
2.7.3

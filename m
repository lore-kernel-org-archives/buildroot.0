From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 23:06:10 +0200
Subject: [Buildroot] [git commit branch/next] weston: add support for
	XWayland
Message-ID: <20160527210630.DDAB781801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36366add9754244730607a3397c9393c4fbe8f5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/Config.in | 12 ++++++++++++
 package/weston/weston.mk |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 44f954a..0812279 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -92,4 +92,16 @@ config BR2_PACKAGE_WESTON_X11
 comment "X11 compositor needs X.org enabled"
 	depends on !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_WESTON_XWAYLAND
+	bool "XWayland support"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+
+comment "XWayland support needs libepoxy and X.org enabled"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
+
 endif
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 3a0189f..38a0d37 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -18,7 +18,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-xwayland \
 	--disable-wayland-compositor \
 	--disable-headless-compositor \
 	--disable-colord \
@@ -111,6 +110,13 @@ else
 WESTON_CONF_OPTS += --disable-x11-compositor
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
+WESTON_CONF_OPTS += --enable-xwayland
+WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
+else
+WESTON_CONF_OPTS += --disable-xwayland
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVA),y)
 WESTON_CONF_OPTS += --enable-vaapi-recorder
 WESTON_DEPENDENIES += libva

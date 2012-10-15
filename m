From: Valentine Barshak <gvaxon@gmail.com>
Date: Mon, 15 Oct 2012 20:44:58 +0400
Subject: [Buildroot] [PATCH] links: Enable graphics for X11
Message-ID: <1350319498-28551-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Graphics can be enabled for X11 as well.
Do not select DirectFB for graphics,
set DirectFB or X11 dependencies instead.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/links/Config.in |  8 ++++----
 package/links/links.mk  | 15 +++++++++++++--
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/links/Config.in b/package/links/Config.in
index fddf3d2..474aa6a 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -6,10 +6,10 @@ config BR2_PACKAGE_LINKS
 	  http://links.twibright.com/
 
 config BR2_PACKAGE_LINKS_GRAPHICS
-	bool "use graphics (directfb)"
-	depends on BR2_PACKAGE_LINKS
-	select BR2_PACKAGE_DIRECTFB
+	bool "use graphics"
+	depends on BR2_PACKAGE_LINKS && (BR2_PACKAGE_DIRECTFB || BR2_PACKAGE_XORG7)
+	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	help
-	  Enable graphics output.
+	  Enable graphics output for DirectFB or X11.
 	  Otherwise links will be text-mode only.
diff --git a/package/links/links.mk b/package/links/links.mk
index 9dbf0ad..857343b 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -6,13 +6,24 @@
 
 LINKS_VERSION = 2.5
 LINKS_SITE = http://links.twibright.com/download
-LINKS_CONF_OPT = --without-x
 LINKS_DEPENDENCIES = host-pkg-config
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPT += --enable-graphics
+LINKS_DEPENDENCIES += libpng
+ifeq ($(BR2_PACKAGE_XLIB_LIBXT),y)
+LINKS_CONF_OPT += --with-x
+LINKS_DEPENDENCIES += xlib_libXt
+else
+LINKS_CONF_OPT += --without-x
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-LINKS_DEPENDENCIES += directfb libpng
+LINKS_CONF_OPT += --with-directfb
+LINKS_DEPENDENCIES += directfb
+else
+LINKS_CONF_OPT += --without-directfb
+endif
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LINKS_DEPENDENCIES += jpeg
 endif
-- 
1.7.11.7

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 12:01:37 +0100
Subject: [Buildroot] [git commit] links: Enable graphics for X11
Message-ID: <20121104110519.31C7A99A65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c592cb4dffc1a0f18d2106e15ebfb7c3d316fd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Graphics can be enabled for X11 as well.
Do not select DirectFB for graphics,
set DirectFB or X11 dependencies instead.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/links/Config.in |    8 ++++----
 package/links/links.mk  |   15 +++++++++++++--
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
index 4537b3a..5db2ff7 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -6,13 +6,24 @@
 
 LINKS_VERSION = 2.5
 LINKS_SITE = http://links.twibright.com/download
-LINKS_CONF_OPT = --without-x
 LINKS_DEPENDENCIES = host-pkgconf
 
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

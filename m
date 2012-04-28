From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 28 Apr 2012 23:16:21 +0200
Subject: [Buildroot] [PATCH 3/3] cairo: use CONF_ENABLE and CONF_PKG_ENABLE
In-Reply-To: <1335647781-16536-1-git-send-email-arnout@mind.be>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
Message-ID: <1335647781-16536-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cairo/cairo.mk |   44 ++++++--------------------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 55068dd..5486372 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -36,45 +36,13 @@ CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 CAIRO_DEPENDENCIES = host-pkg-config fontconfig pixman
 
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-	CAIRO_CONF_OPT += --enable-directfb
-	CAIRO_DEPENDENCIES += directfb
-else
-	CAIRO_CONF_OPT += --disable-directfb
-endif
+$(eval $(call CONF_PKG_ENABLE,CAIRO,directfb))
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-	CAIRO_CONF_OPT += --enable-xlib --with-x
-	CAIRO_DEPENDENCIES += xserver_xorg-server
-else
-	CAIRO_CONF_OPT += --disable-xlib --without-x
-endif
+$(eval $(call CONF_ENABLE,CAIRO,$(BR2_PACKAGE_XORG7),xserver_xorg-server,--enable-xlib --with-x,--disable-xlib --without-x))
 
-ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
-	CAIRO_CONF_OPT += --enable-ps
-	CAIRO_DEPENDENCIES += zlib
-else
-	CAIRO_CONF_OPT += --disable-ps
-endif
-
-ifeq ($(BR2_PACKAGE_CAIRO_PDF),y)
-	CAIRO_CONF_OPT += --enable-pdf
-	CAIRO_DEPENDENCIES += zlib
-else
-	CAIRO_CONF_OPT += --disable-pdf
-endif
-
-ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
-	CAIRO_CONF_OPT += --enable-png
-	CAIRO_DEPENDENCIES += libpng
-else
-	CAIRO_CONF_OPT += --disable-png
-endif
-
-ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
-	CAIRO_CONF_OPT += --enable-svg
-else
-	CAIRO_CONF_OPT += --disable-svg
-endif
+$(eval $(call CONF_ENABLE,CAIRO,$(BR2_PACKAGE_CAIRO_PS),zlib,ps))
+$(eval $(call CONF_ENABLE,CAIRO,$(BR2_PACKAGE_CAIRO_PDF),zlib,pdf))
+$(eval $(call CONF_ENABLE,CAIRO,$(BR2_PACKAGE_CAIRO_PNG),libpng,png))
+$(eval $(call CONF_ENABLE,CAIRO,$(BR2_PACKAGE_CAIRO_SVG),,svg))
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.10

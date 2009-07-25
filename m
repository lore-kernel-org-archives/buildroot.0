From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2009 09:13:44 +0200
Subject: [Buildroot] [git commit] xorg: use BR2_PACKAGE_XORG instead of
	BR2_PACKAGE_XSERVER_none
Message-ID: <20090725071549.5DECA77713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6beeb755fa41a24ef54c189b8ae723534fa15c92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_XSERVER_none option has gone, so use BR2_PACKAGE_XORG7
instead. It is more logical to test if BR2_PACKAGE_XORG7 is set to
know if an X.org server is available, than testing if
BR2_PACKAGE_XSERVER_none is set to know if an X.org server is *not*
available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.mk                  |    2 +-
 package/cairo/cairo.mk              |    2 +-
 package/cups/cups.mk                |    2 +-
 package/directfb/Config.in          |    2 +-
 package/games/lxdoom/Config.in      |    2 +-
 package/java/classpath/classpath.mk |    2 +-
 package/java/jamvm/jamvm.mk         |    2 +-
 package/libgtk2/libgtk2.mk          |    2 +-
 package/pango/pango.mk              |    4 ++--
 package/xpdf/xpdf.mk                |    2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 199ec7d..2d3a4e5 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -45,7 +45,7 @@ ATK_CONF_OPT =  --enable-shared \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
-ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 ATK_CONF_OPT += --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 048351e..7a7e532 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -48,7 +48,7 @@ else
 	CAIRO_CONF_OPT += --disable-directfb
 endif
 
-ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 	CAIRO_CONF_OPT += --enable-xlib --with-x
 	CAIRO_DEPENDENCIES += $(XSERVER)
 else
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 9051e0d..a22651f 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -18,7 +18,7 @@ else
 	CUPS_CONF_OPT += --disable-dbus
 endif
 
-ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 	CUPS_DEPENDENCIES += xlib_libX11
 endif
 
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 1f08174..fce9ed4 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_DIRECTFB_MULTI
 config BR2_PACKAGE_DIRECTFB_XSERVER
 	bool "build with X server backend"
 	depends on BR2_PACKAGE_DIRECTFB
-	depends on !BR2_PACKAGE_XSERVER_none
+	depends on BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_DIRECTFB_UNIQUE
 	bool "enable unique window manager"
diff --git a/package/games/lxdoom/Config.in b/package/games/lxdoom/Config.in
index 8eb7d52..ebef9f5 100644
--- a/package/games/lxdoom/Config.in
+++ b/package/games/lxdoom/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LXDOOM
 	bool "lxdoom"
-	depends on !BR2_PACKAGE_XSERVER_none
+	depends on BR2_PACKAGE_XORG7
 	help
 	  This is the linux version of the popular doom game.
diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index 71c18a0..b62e29c 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -77,7 +77,7 @@ else
 	CLASSPATH_CONF_OPT+= --disable-gtk-peer
 endif
 
-ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 	CLASSPATH_DEPENDENCIES+= $(XSERVER)
 	CLASSPATH_CONF_OPT+= --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index dff089a..92ae4a6 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -52,7 +52,7 @@ JAMVM_CONF_OPT = \
 JAMVM_DEPENDENCIES = uclibc host-pkgconfig classpath
 
 #Include X libraries when we have an X server
-ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 	JAMVM_DEPENDENCIES+= $(XSERVER)
 	JAMVM_CONF_OPT+= --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 7db0067..5c9e542 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -85,7 +85,7 @@ ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	LIBGTK2_DEPENDENCIES += directfb
 endif
 
-ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 	LIBGTK2_CONF_OPT += \
 		--with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index c1aac86..8cccae6 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,7 +40,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
-ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT_X = --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
@@ -85,7 +85,7 @@ $(STAMP_DIR)/host_pango_configured: $(STAMP_DIR)/host_pango_unpacked $(STAMP_DIR
 		--prefix="$(HOST_DIR)/usr" \
 		--sysconfdir="$(HOST_DIR)/etc" \
 		--disable-static \
-		$(if $(BR2_PACKAGE_XSERVER_none),--without-x,--with-x) \
+		$(if $(BR2_PACKAGE_XORG7),--with-x,--without-x) \
 		--disable-debug \
 	)
 	touch $@
diff --git a/package/xpdf/xpdf.mk b/package/xpdf/xpdf.mk
index 1fbe711..1f09a9d 100644
--- a/package/xpdf/xpdf.mk
+++ b/package/xpdf/xpdf.mk
@@ -17,7 +17,7 @@ ifeq ($(BR2_SOFT_FLOAT),y)
 	XPDF_CONF_OPT += --enable-fixedpoint
 endif
 
-ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 	XPDF_DEPENDENCIES += $(XSERVER) openmotif
 	XPDF_CONF_OPT += --with-Xm-library=$(STAGING_DIR)/usr/lib --with-Xm-includes=$(STAGING_DIR)/usr/include/Xm \
 					--with-x --with-freetype2-includes=$(STAGING_DIR)/usr/include \
-- 
1.6.3.3

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 18:03:20 +0200
Subject: [Buildroot] [PATCH 13/13] xorg: remove the XSERVER variable
In-Reply-To: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
Message-ID: <819f2c4b5e1a34e02969c51d65275398b8f50615.1247846597.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The XSERVER variable used to be defined by package/Makefile.in because
the X server package name was different depending on the type of X
server that was choosen. Nowadays, the name of the package is always
xserver_xorg-server, so there's no point in having this XSERVER
intermediate variable.

This patch makes all packages use xserver_xorg-server directly as a
dependency, and removes the XSERVER variable from package/Makefile.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in                              |    6 ------
 package/blackbox/blackbox.mk                     |    2 +-
 package/cairo/cairo.mk                           |    2 +-
 package/dillo/dillo.mk                           |    2 +-
 package/docker/docker.mk                         |    2 +-
 package/fltk/fltk.mk                             |    2 +-
 package/games/ace_of_penguins/ace_of_penguins.mk |    2 +-
 package/java/classpath/classpath.mk              |    2 +-
 package/java/jamvm/jamvm.mk                      |    2 +-
 package/libgtk12/libgtk12.mk                     |    2 +-
 package/libgtk2/libgtk2.mk                       |    2 +-
 package/metacity/metacity.mk                     |    2 +-
 package/midori/midori.mk                         |    2 +-
 package/pango/pango.mk                           |   16 ++++++++--------
 package/rdesktop/rdesktop.mk                     |    2 +-
 package/rxvt/rxvt.mk                             |    2 +-
 package/synergy/synergy.mk                       |    2 +-
 package/xpdf/xpdf.mk                             |    2 +-
 package/xvkbd/Config.in                          |    1 +
 package/xvkbd/xvkbd.mk                           |    2 +-
 20 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 32aa259..3511244 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -380,14 +380,8 @@ else
 ENABLE_DEBUG:=
 endif
 
-
 # X Windowing system
 
-XSERVER:=
-ifeq ($(BR2_PACKAGE_XORG7),y)
-XSERVER+=xserver_xorg-server
-endif
-
 X11_PREFIX:=$(strip $(subst ",, $(BR2_X11_PREFIX)))
 #"))
 
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index a85c753..371a4a4 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -14,6 +14,6 @@ BLACKBOX_INSTALL_TARGET:=YES
 BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
 
-BLACKBOX_DEPENDENCIES:=uclibc $(XSERVER)
+BLACKBOX_DEPENDENCIES:=uclibc xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,blackbox))
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 7a7e532..a084083 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -50,7 +50,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	CAIRO_CONF_OPT += --enable-xlib --with-x
-	CAIRO_DEPENDENCIES += $(XSERVER)
+	CAIRO_DEPENDENCIES += xserver_xorg-server
 else
 	CAIRO_CONF_OPT += --disable-xlib --without-x
 endif
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 12d9a5c..1dcfd55 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -39,7 +39,7 @@ $(DILLO_DIR)/.installed: $(DILLO_DIR)/src/dillo
 	$(MAKE) -C $(DILLO_DIR) DESTDIR=$(TARGET_DIR) install
 	touch $(DILLO_DIR)/.installed
 
-dillo: uclibc $(XSERVER) libglib12 libgtk12 jpeg libpng $(DILLO_DIR)/.installed
+dillo: uclibc xserver_xorg-server libglib12 libgtk12 jpeg libpng $(DILLO_DIR)/.installed
 
 dillo-source: $(DL_DIR)/$(DILLO_SOURCE)
 
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 860cd7e..3b8c25c 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -19,7 +19,7 @@ DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
-DOCKER_DEPENDENCIES = uclibc host-pkgconfig libglib2 $(XSERVER)
+DOCKER_DEPENDENCIES = uclibc host-pkgconfig libglib2 xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,docker))
 
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index f4a0498..9574cb8 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -18,6 +18,6 @@ FLTK_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
 		--sysconfdir=/etc --enable-shared --enable-threads --with-x
 
-FLTK_DEPENDENCIES = uclibc $(XSERVER)
+FLTK_DEPENDENCIES = uclibc xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,fltk))
\ No newline at end of file
diff --git a/package/games/ace_of_penguins/ace_of_penguins.mk b/package/games/ace_of_penguins/ace_of_penguins.mk
index 2aaf7aa..2e4fda6 100644
--- a/package/games/ace_of_penguins/ace_of_penguins.mk
+++ b/package/games/ace_of_penguins/ace_of_penguins.mk
@@ -10,6 +10,6 @@ ACE_OF_PENGUINS_AUTORECONF = YES
 ACE_OF_PENGUINS_STAGING = NO
 ACE_OF_PENGUINS_TARGET = YES
 
-ACE_OF_PENGUINS_DEPENDENCIES = uclibc libpng $(XSERVER)
+ACE_OF_PENGUINS_DEPENDENCIES = uclibc libpng xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package/games,ace_of_penguins))
diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index b62e29c..d037adf 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -78,7 +78,7 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	CLASSPATH_DEPENDENCIES+= $(XSERVER)
+	CLASSPATH_DEPENDENCIES+= xserver_xorg-server
 	CLASSPATH_CONF_OPT+= --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index 92ae4a6..750bfae 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -53,7 +53,7 @@ JAMVM_DEPENDENCIES = uclibc host-pkgconfig classpath
 
 #Include X libraries when we have an X server
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	JAMVM_DEPENDENCIES+= $(XSERVER)
+	JAMVM_DEPENDENCIES+= xserver_xorg-server
 	JAMVM_CONF_OPT+= --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
diff --git a/package/libgtk12/libgtk12.mk b/package/libgtk12/libgtk12.mk
index a578ae8..bb121f0 100644
--- a/package/libgtk12/libgtk12.mk
+++ b/package/libgtk12/libgtk12.mk
@@ -86,7 +86,7 @@ $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1: $(STAGING_DIR)/lib/$(LIBGTK12_BINARY)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgdk-1.2.so.0.9.1
 	touch -c $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
 
-libgtk12: uclibc libglib12 $(XSERVER) $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
+libgtk12: uclibc libglib12 xserver_xorg-server $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
 
 libgtk12-clean:
 	rm -f $(TARGET_DIR)/lib/libgtk* $(TARGET_DIR)/lib/libgdk*
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 5c9e542..3b85f63 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -91,7 +91,7 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--with-gdktarget=x11
-	LIBGTK2_DEPENDENCIES += xlib_libXcomposite $(XSERVER)
+	LIBGTK2_DEPENDENCIES += xlib_libXcomposite xserver_xorg-server
 else
 	LIBGTK2_CONF_OPT += --without-x
 endif
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index d5d5bb7..6861165 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -16,7 +16,7 @@ METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--disable-dependency-tracking \
 		--disable-sm --disable-startup-notification
 
-METACITY_DEPENDENCIES = uclibc libgtk2 $(XSERVER)
+METACITY_DEPENDENCIES = uclibc libgtk2 xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,metacity))
 
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 805b028..6861d4c 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -11,6 +11,6 @@ MIDORI_AUTORECONF = YES
 MIDORI_INSTALL_STAGING = NO
 MIDORI_INSTALL_TARGET = YES
 
-MIDORI_DEPENDENCIES = uclibc host-pkgconfig webkit libsexy $(XSERVER)
+MIDORI_DEPENDENCIES = uclibc host-pkgconfig webkit libsexy xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,midori))
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 8cccae6..2bcebf3 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,20 +40,20 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
+PANGO_CONF_OPT = --enable-shared --enable-static \
+		--enable-explicit-deps=no --disable-debug
+
+PANGO_DEPENDENCIES = uclibc gettext libintl host-pkgconfig libglib2 cairo
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
-        PANGO_CONF_OPT_X = --with-x \
+        PANGO_CONF_OPT += --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
+	PANGO_DEPENDENCIES += xserver_xorg-server
 else
-        PANGO_CONF_OPT_X = --without-x
+        PANGO_CONF_OPT += --without-x
 endif
 
-PANGO_CONF_OPT = --enable-shared --enable-static \
-		$(PANGO_CONF_OPT_X) \
-		--enable-explicit-deps=no --disable-debug
-
-PANGO_DEPENDENCIES = uclibc gettext libintl host-pkgconfig libglib2 $(XSERVER) cairo
-
 $(eval $(call AUTOTARGETS,package,pango))
 
 $(PANGO_HOOK_POST_INSTALL):
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index 63be0b8..e94fd77 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -38,7 +38,7 @@ $(RDESKTOP_DIR)/rdesktop: $(RDESKTOP_DIR)/.configured
 $(TARGET_DIR)/usr/bin/rdesktop: $(RDESKTOP_DIR)/rdesktop
 	cp $^ $@
 
-rdesktop: uclibc openssl $(XSERVER) $(TARGET_DIR)/usr/bin/rdesktop
+rdesktop: uclibc openssl xserver_xorg-server $(TARGET_DIR)/usr/bin/rdesktop
 
 rdesktop-source: $(DL_DIR)/$(RDESKTOP_SOURCE)
 
diff --git a/package/rxvt/rxvt.mk b/package/rxvt/rxvt.mk
index 1a0a826..14d08d2 100644
--- a/package/rxvt/rxvt.mk
+++ b/package/rxvt/rxvt.mk
@@ -65,7 +65,7 @@ $(TARGET_DIR)$(X11_PREFIX)/bin/rxvt: $(RXVT_BINARY)
 	$(INSTALL) -m 0755 -D $^ $@
 	(cd $(@D); ln -fs rxvt xterm)
 
-rxvt: $(XSERVER) $(TARGET_DIR)$(X11_PREFIX)/bin/rxvt
+rxvt: xserver_xorg-server $(TARGET_DIR)$(X11_PREFIX)/bin/rxvt
 
 rxvt-clean:
 	rm -f $(TARGET_DIR)$(X11_PREFIX)/bin/rxvt
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index b89f3cd..763e57b 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -14,6 +14,6 @@ SYNERGY_INSTALL_TARGET = YES
 SYNERGY_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr --sysconfdir=/etc
 
-SYNERGY_DEPENDENCIES = uclibc $(XSERVER)
+SYNERGY_DEPENDENCIES = uclibc xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,synergy))
diff --git a/package/xpdf/xpdf.mk b/package/xpdf/xpdf.mk
index 1f09a9d..ab60b2b 100644
--- a/package/xpdf/xpdf.mk
+++ b/package/xpdf/xpdf.mk
@@ -18,7 +18,7 @@ ifeq ($(BR2_SOFT_FLOAT),y)
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	XPDF_DEPENDENCIES += $(XSERVER) openmotif
+	XPDF_DEPENDENCIES += xserver_xorg-server openmotif
 	XPDF_CONF_OPT += --with-Xm-library=$(STAGING_DIR)/usr/lib --with-Xm-includes=$(STAGING_DIR)/usr/include/Xm \
 					--with-x --with-freetype2-includes=$(STAGING_DIR)/usr/include \
 					--with-freetype2-library=$(STAGING_DIR)/usr/lib CFLAGS="-I$(STAGING_DIR)/usr/include/freetype2" \
diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in
index eeef152..888367a 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XVKBD
 	bool "xvkbd"
+	depends on BR2_PACKAGE_XORG7
 	help
 	  on-screen keyboard for X
 
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 510e3c4..d287809 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -15,7 +15,7 @@ XVKBD_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) \
 
 XVKBD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XVKBD_DEPENDENCIES = uclibc $(XSERVER)
+XVKBD_DEPENDENCIES = uclibc xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,xvkbd))
 
-- 
1.6.0.4

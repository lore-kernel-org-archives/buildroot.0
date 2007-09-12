From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 11 Sep 2007 21:37:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: atk cairo
	gtk2-engines libglib2 libgtk1 etc...
Message-ID: <20070912043732.C877FA657F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-11 21:37:31 -0700 (Tue, 11 Sep 2007)
New Revision: 19820

Log:
Update various packages to make X run

Modified:
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/cairo/Config.in
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/matchbox/matchbox.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-09-12 04:37:31 UTC (rev 19820)
@@ -147,7 +147,8 @@
 $(BUILD_DIR)/%/.stamp_patched:
 	$(call MESSAGE,"Patching")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
-	$(Q)(if test -d package/$($(PKG)_NAME) ; then \
+	$(Q)(\
+	if test -d package/$($(PKG)_NAME) ; then \
 	  if test "$(wildcard package/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
 	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
 	  else \
@@ -156,7 +157,17 @@
 	      toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
 	    fi; \
 	  fi; \
-	fi)
+	else \
+	  if test "$(wildcard package/x11r7/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
+	    toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
+	  else \
+	    toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1 ; \
+	    if test -d package/x11r7/$($(PKG)_NAME)/$(NAMEVER) ; then \
+	      toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
+	    fi; \
+	  fi; \
+	fi; \
+	)
 ifeq ($(strip $(BR2_UPDATE_CONFIG)),y)
 	$(Q)(for file in config.guess config.sub; do \
 		for i in $$(find $(@D) -name $$file); do \

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/Makefile.in	2007-09-12 04:37:31 UTC (rev 19820)
@@ -237,6 +237,9 @@
 ifeq ($(strip $(BR2_PACKAGE_XORG)),y)
 XSERVER+=xorg
 endif
+ifeq ($(strip $(BR2_PACKAGE_XORG7)),y)
+XSERVER+=xserver_xorg-server
+endif
 ifeq ($(strip $(BR2_PACKAGE_XGGI)),y)
 XSERVER+=xggi
 endif

Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/atk/atk.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -82,6 +82,8 @@
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_prog_F77=no \
+		ac_cv_prog_CXX=no \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(REAL_GNU_TARGET_NAME) \
@@ -101,8 +103,8 @@
 		--enable-shared \
 		--enable-static \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/usr/X11R6/include \
-		--x-libraries=$(STAGING_DIR)/usr/X11R6/lib \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug \

Modified: trunk/buildroot/package/cairo/Config.in
===================================================================
--- trunk/buildroot/package/cairo/Config.in	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/cairo/Config.in	2007-09-12 04:37:31 UTC (rev 19820)
@@ -3,6 +3,8 @@
 	default n
 	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_FONTCONFIG
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
 	help
 	  Cairo is a 2D graphics library with support for multiple

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/cairo/cairo.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -101,8 +101,8 @@
 		--enable-shared \
 		--enable-static \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/usr/include \
-		--x-libraries=$(STAGING_DIR)/lib \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--enable-ps=yes \
 		--enable-pdf=yes \
 		--enable-svg=no \
@@ -128,7 +128,7 @@
 	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libcairo.so.2.*
 	touch -c $(TARGET_DIR)/lib/libcairo.so.2.9.3
 
-cairo: uclibc gettext libintl pkgconfig libglib2 $(XSERVER) $(TARGET_DIR)/lib/libcairo.so.2.9.3
+cairo: uclibc gettext libintl pkgconfig libglib2 zlib png fontconfig $(XSERVER) $(TARGET_DIR)/lib/libcairo.so.2.9.3
 
 cairo-clean:
 	rm -f $(TARGET_DIR)/lib/$(CAIRO_BINARY)

Modified: trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
===================================================================
--- trunk/buildroot/package/gtk2-engines/gtk2-engines.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/gtk2-engines/gtk2-engines.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -104,8 +104,8 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/usr/include \
-		--x-libraries=$(STAGING_DIR)/lib \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug \

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -83,6 +83,8 @@
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_prog_F77=no \
+		ac_cv_prog_CXX=no \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/libgtk12/libgtk12.mk
===================================================================
--- trunk/buildroot/package/libgtk12/libgtk12.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/libgtk12/libgtk12.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -44,8 +44,8 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \
-		--x-includes=$(STAGING_DIR)/usr/X11R6/include \
-		--x-libraries=$(STAGING_DIR)/usr/X11R6/lib \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--enable-debug=no \
 		--disable-glibtest \
 		--disable-xim \

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -70,6 +70,8 @@
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_prog_F77=no \
+		ac_cv_prog_CXX=no \
 		ac_cv_path_CUPS_CONFIG=no
 
 
@@ -111,8 +113,8 @@
 		--enable-shared \
 		--enable-static \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/usr/include \
-		--x-libraries=$(STAGING_DIR)/lib \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug \

Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -154,15 +154,15 @@
 MATCHBOX_LIB_DEPS:=
 
 MATCHBOX_WM_OPTS:=
-MATCHBOX_WM_DEPS:=x11r7-libxdamage
-MATCHBOX_WM_DEPS+=x11r7-libxcursor
+MATCHBOX_WM_DEPS:=xlib_libXdamage
+MATCHBOX_WM_DEPS+=xlib_libXcursor
 
 ifeq ($(strip $(BR2_PACKAGE_X11R7_LIBXCOMPOSITE)),y)
 ifeq ($(strip $(BR2_PACKAGE_X11R7_LIBXPM)),y)
   MATCHBOX_WM_OPTS+=--enable-composite
-  MATCHBOX_WM_DEPS+=x11r7-libxcomposite
-  MATCHBOX_WM_DEPS+=x11r7-libxpm
-  MATCHBOX_LIB_DEPS+=x11r7-libxpm
+  MATCHBOX_WM_DEPS+=xlib_libXcomposite
+  MATCHBOX_WM_DEPS+=xlib_libXpm
+  MATCHBOX_LIB_DEPS+=xlib_libXpm
 endif
 endif
 
@@ -172,7 +172,7 @@
 
 ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_SNOTIFY)),y)
   MATCHBOX_SNOTIFY_OPTS+=--enable-startup-notification
-  MATCHBOX_SNOTIFY_DEPS+=x11r7-libxsm
+  MATCHBOX_SNOTIFY_DEPS+=xlib_libSM
   MATCHBOX_SNOTIFY_DEPS+=$(TARGET_DIR)/usr/lib/$(MATCHBOX_SNOTIFY_BIN)
   MATCHBOX_PANEL_DEPS+=$(TARGET_DIR)/usr/bin/$(MATCHBOX_SM_BIN)
 else
@@ -202,9 +202,9 @@
 
 ifeq ($(strip $(BR2_PACKAGE_X11R7_LIBXFT2)),y)
   MATCHBOX_LIB_OPTS+=--enable-xft
-  MATCHBOX_LIB_DEPS+=x11r7-libxft2
+  MATCHBOX_LIB_DEPS+=xlib_libXft2
   #MATCHBOX_WM_OPTS+=--enable-standalone-xft
-  MATCHBOX_WM_DEPS+=x11r7-libxft2
+  MATCHBOX_WM_DEPS+=xlib_libXft2
 else
   MATCHBOX_LIB_OPTS+=--disable-xft
   #MATCHBOX_WM_OPTS+=--disable-standalone-xft
@@ -232,7 +232,7 @@
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	$(MATCHBOX_LIB_OPTS) \
 	)
@@ -256,7 +256,7 @@
 	--libdir=$(STAGING_DIR)/usr/lib \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	)
 	touch $(MATCHBOX_SNOTIFY_DIR)/.configured
@@ -281,7 +281,7 @@
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	$(MATCHBOX_WM_OPTS) \
 	$(MATCHBOX_SNOTIFY_OPTS) \
@@ -308,7 +308,7 @@
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	$(MATCHBOX_SNOTIFY_OPTS) \
 	)
@@ -334,7 +334,7 @@
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	)
 	touch $(MATCHBOX_CN_DIR)/.configured
@@ -359,7 +359,7 @@
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	$(MATCHBOX_SNOTIFY_OPTS) \
 	)
@@ -385,7 +385,7 @@
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	$(MATCHBOX_SNOTIFY_OPTS) \
 	)
@@ -411,7 +411,7 @@
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	)
 	$(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' $(MATCHBOX_FK_DIR)/Makefile
@@ -437,7 +437,7 @@
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
 	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	)
 	touch $(MATCHBOX_KB_DIR)/.configured
@@ -624,7 +624,7 @@
 
 matchbox-desktop: uclibc matchbox $(TARGET_DIR)/usr/bin/$(MATCHBOX_DP_BIN)
 
-matchbox-keyboard: uclibc matchbox x11r7-libxtst $(TARGET_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN)
+matchbox-keyboard: uclibc matchbox xlib_libXtst $(TARGET_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN)
 
 matchbox-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libmb.*

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/pango/pango.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -106,8 +106,8 @@
 		--enable-shared \
 		--enable-static \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/usr/include \
-		--x-libraries=$(STAGING_DIR)/lib \
+		--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug \

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2007-09-12 04:34:16 UTC (rev 19819)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2007-09-12 04:37:31 UTC (rev 19820)
@@ -9,7 +9,7 @@
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_AUTORECONF = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
-XSERVER_XORG_SERVER_DEPENDENCIES = xlib_libXfont libdrm xlib_libxkbui xproto_compositeproto xproto_damageproto xproto_fixesproto xproto_glproto xproto_kbproto xproto_randrproto freetype xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu xlib_libXpm xlib_libXrender xlib_libXres xlib_libXtst xlib_libXxf86misc xlib_libXxf86vm xlib_liblbxutil xlib_libxkbfile xlib_xtrans xdata_xbitmaps xproto_bigreqsproto xproto_evieext xproto_fontsproto xproto_inputproto xproto_recordproto xproto_renderproto xproto_resourceproto xproto_trapproto xproto_videoproto xproto_xcmiscproto xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto xproto_xf86driproto xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto
-XSERVER_XORG_SERVER_CONF_OPT = --disable-xprint --disable-xinerama --disable-xnest --disable-xvfb --disable-dmx --enable-dri --disable-xdmcp --disable-screensaver
+XSERVER_XORG_SERVER_DEPENDENCIES = xutil_util-macros xlib_libXfont libdrm xlib_libxkbui xproto_compositeproto xproto_damageproto xproto_fixesproto xproto_glproto xproto_kbproto xproto_randrproto freetype xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu xlib_libXpm xlib_libXrender xlib_libXres xlib_libXtst xlib_libXft xlib_libXcursor xlib_libXinerama xlib_libXrandr xlib_libXdamage xlib_libXxf86misc xlib_libXxf86vm xlib_liblbxutil xlib_libxkbfile xlib_xtrans xdata_xbitmaps xproto_bigreqsproto xproto_evieext xproto_fontsproto xproto_inputproto xproto_recordproto xproto_renderproto xproto_resourceproto xproto_trapproto xproto_videoproto xproto_xcmiscproto xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto xproto_xf86driproto xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto
+XSERVER_XORG_SERVER_CONF_OPT = --disable-xprint --disable-xinerama --disable-xnest --disable-xvfb --disable-dmx --disable-dri --disable-xdmcp --disable-screensaver
 
 $(eval $(call AUTOTARGETS,xserver_xorg-server))

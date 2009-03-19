From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Mar 2009 11:06:48 +0000 (UTC)
Subject: [Buildroot] svn commit: [25755] trunk/buildroot: package
	package/atk package/cairo packa etc...
Message-ID: <20090319110648.9242F7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-19 11:06:47 +0000 (Thu, 19 Mar 2009)
New Revision: 25755

Log:
package: add STAMP_DIR and use for host builds

Move stamp (dependency) files outside the (version specific) source
directories, so other packages can hardcode dependencies on them instead
of having to use <PACKAGE>_VERSION variables.

This is important as the variables in the make rules are evaluated when
the rules is seen, which might be before the dependent makefile is parsed
(and hence <PACKAGE>_VERSION variable is known, screwing up stuff.

The downside of this is that the package isn't automatically rebuilt
when the version changes (E.G. by a svn update) and you now also have to
remove the stamp files next to $(BUILD_DIR)/<PACKAGE>-* to force a rebuild.

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/pixman/pixman.mk
   trunk/buildroot/package/pkgconfig/pkgconfig.mk
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/Makefile	2009-03-19 11:06:47 UTC (rev 25755)
@@ -283,7 +283,7 @@
 
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
-	$(PROJECT_BUILD_DIR)/autotools-stamps
+	$(PROJECT_BUILD_DIR)/autotools-stamps $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs
 
@@ -295,7 +295,7 @@
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
-	$(PROJECT_BUILD_DIR)/autotools-stamps
+	$(PROJECT_BUILD_DIR)/autotools-stamps $(STAMP_DIR)
 
 #############################################################
 #
@@ -304,7 +304,7 @@
 #
 #############################################################
 $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(HOST_DIR) $(PROJECT_BUILD_DIR) \
-	$(PROJECT_BUILD_DIR)/autotools-stamps $(BINARIES_DIR):
+	$(PROJECT_BUILD_DIR)/autotools-stamps $(BINARIES_DIR) $(STAMP_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -365,10 +365,10 @@
 #
 #############################################################
 clean: $(TARGETS_CLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps
+	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps $(STAMP_DIR)
 
 dirclean: $(TARGETS_DIRCLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps
+	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps $(STAMP_DIR)
 
 distclean:
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/Makefile.in	2009-03-19 11:06:47 UTC (rev 25755)
@@ -252,7 +252,7 @@
 		DEFAULT_LINKER="$(TARGET_LD)" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig$(PKG_CONFIG_PATH)" \
 		STAGING_DIR="$(STAGING_DIR)"
 
 TARGET_CONFIGURE_ENV=\
@@ -297,7 +297,7 @@
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"
+		PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig$(PKG_CONFIG_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH)
 

Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/atk/atk.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -59,41 +59,41 @@
 
 # atk for the host
 ATK_HOST_DIR:=$(BUILD_DIR)/atk-$(ATK_VERSION)-host
-ATK_HOST_BINARY:=$(HOST_DIR)/usr/lib/libatk-1.0.a
 
-$(ATK_HOST_DIR)/.unpacked: $(DL_DIR)/$(ATK_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_atk_unpacked: $(DL_DIR)/$(ATK_SOURCE)
+	mkdir -p $(ATK_HOST_DIR)
 	$(INFLATE$(suffix $(ATK_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(ATK_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(ATK_HOST_DIR)/.configured: $(ATK_HOST_DIR)/.unpacked $(LIBGLIB2_HOST_BINARY) $(PKG_CONFIG_HOST_BINARY)
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_atk_configured: $(STAMP_DIR)/host_atk_unpacked $(STAMP_DIR)/host_libglib2_installed $(STAMP_DIR)/host_pkgconfig_installed
+	(cd $(ATK_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--enable-shared \
 		--disable-static \
 		--disable-glibtest \
 	)
 	touch $@
 
-$(ATK_HOST_DIR)/.compiled: $(ATK_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_atk_compiled: $(STAMP_DIR)/host_atk_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(ATK_HOST_DIR)
 	touch $@
 
-$(ATK_HOST_BINARY): $(ATK_HOST_DIR)/.compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_atk_installed: $(STAMP_DIR)/host_atk_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(ATK_HOST_DIR) install
+	touch $@
 
-host-atk: $(ATK_HOST_BINARY)
+host-atk: $(STAMP_DIR)/host_atk_installed
 
 host-atk-source: atk-source
 
 host-atk-clean:
-	rm -f $(addprefix $(ATK_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_atk_,unpacked configured compiled installed)
 	-$(MAKE) -C $(ATK_HOST_DIR) uninstall
 	-$(MAKE) -C $(ATK_HOST_DIR) clean
 

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -86,22 +86,21 @@
 
 # cairo for the host
 CAIRO_HOST_DIR:=$(BUILD_DIR)/cairo-$(CAIRO_VERSION)-host
-CAIRO_HOST_BINARY:=$(HOST_DIR)/usr/lib/libcairo.a
 
-$(CAIRO_HOST_DIR)/.unpacked: $(DL_DIR)/$(CAIRO_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_cairo_unpacked: $(DL_DIR)/$(CAIRO_SOURCE)
+	mkdir -p $(CAIRO_HOST_DIR)
 	$(INFLATE$(suffix $(CAIRO_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(CAIRO_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(CAIRO_HOST_DIR)/.configured: $(CAIRO_HOST_DIR)/.unpacked $(PKG_CONFIG_HOST_BINARY) $(FONTCONFIG_HOST_BINARY) $(PIXMAN_HOST_BINARY)
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_cairo_configured: $(STAMP_DIR)/host_cairo_unpacked $(STAMP_DIR)/host_pkgconfig_installed $(STAMP_DIR)/host_fontconfig_installed $(STAMP_DIR)/host_pixman_installed
+	(cd $(CAIRO_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--enable-ps \
 		--enable-pdf \
 		--enable-xlib \
@@ -111,19 +110,20 @@
 	)
 	touch $@
 
-$(CAIRO_HOST_DIR)/.compiled: $(CAIRO_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_cairo_compiled: $(STAMP_DIR)/host_cairo_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(CAIRO_HOST_DIR)
 	touch $@
 
-$(CAIRO_HOST_BINARY): $(CAIRO_HOST_DIR)/.compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_cairo_installed: $(STAMP_DIR)/host_cairo_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(CAIRO_HOST_DIR) install
+	touch $@
 
-host-cairo: $(CAIRO_HOST_BINARY)
+host-cairo: $(STAMP_DIR)/host_cairo_installed
 
 host-cairo-source: cairo-source
 
 host-cairo-clean:
-	rm -f $(addprefix $(CAIRO_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_cairo_,unpacked configured compiled installed)
 	-$(MAKE) -C $(CAIRO_HOST_DIR) uninstall
 	-$(MAKE) -C $(CAIRO_HOST_DIR) clean
 

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -56,23 +56,22 @@
 
 # dbus for the host
 DBUS_HOST_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VERSION)-host
-DBUS_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-daemon
 DBUS_HOST_INTROSPECT:=$(DBUS_HOST_DIR)/introspect.xml
 
-$(DBUS_HOST_DIR)/.unpacked: $(DL_DIR)/$(DBUS_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_dbus_unpacked: $(DL_DIR)/$(DBUS_SOURCE)
+	mkdir -p $(DBUS_HOST_DIR)
 	$(INFLATE$(suffix $(DBUS_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DBUS_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(DBUS_HOST_DIR)/.configured: $(DBUS_HOST_DIR)/.unpacked $(EXPAT_HOST_BINARY)
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_dbus_configured: $(DBUS_HOST_DIR)/.unpacked $(STAMP_DIR)/host_expat_installed $(STAMP_DIR)/host_pkgconfig_installed
+	(cd $(DBUS_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--with-dbus-user=dbus \
 		--disable-tests \
 		--disable-asserts \
@@ -87,25 +86,24 @@
 	)
 	touch $@
 
-$(DBUS_HOST_DIR)/.compiled: $(DBUS_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_dbus_compiled: $(STAMP_DIR)/host_dbus_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(DBUS_HOST_DIR)
 	touch $@
 
-$(DBUS_HOST_BINARY): $(DBUS_HOST_DIR)/.compiled
-	$(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_dbus_installed: $(STAMP_DIR)/host_dbus_compiled
+	$(MAKE) -C $(DBUS_HOST_DIR) install
+	$(HOST_DIR)/usr/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
+	touch $@
 
-$(DBUS_HOST_INTROSPECT): $(DBUS_HOST_BINARY)
-	$(DBUS_HOST_BINARY) --introspect > $@
+host-dbus: $(STAMP_DIR)/host_dbus_installed
 
-host-dbus: $(DBUS_HOST_INTROSPECT)
-
 host-dbus-source: dbus-source
 
 host-dbus-clean:
-	rm -f $(addprefix $(DBUS_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_dbus_,unpacked configured compiled installed)
 	rm -f $(DBUS_HOST_INTROSPECT)
-	$(MAKE) -C $(DBUS_HOST_DIR) uninstall
-	$(MAKE) -C $(DBUS_HOST_DIR) clean
+	-$(MAKE) -C $(DBUS_HOST_DIR) uninstall
+	-$(MAKE) -C $(DBUS_HOST_DIR) clean
 
 host-dbus-dirclean:
 	rm -rf $(DBUS_HOST_DIR)

Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -31,20 +31,20 @@
 DBUS_GLIB_HOST_DIR:=$(BUILD_DIR)/dbus-glib-$(DBUS_GLIB_VERSION)-host
 DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
 
-$(DBUS_GLIB_HOST_DIR)/.unpacked: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_dbusglib_unpacked: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
+	mkdir -p $(DBUS_GLIB_HOST_DIR)
 	$(INFLATE$(suffix $(DBUS_GLIB_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DBUS_GLIB_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(DBUS_GLIB_HOST_DIR)/.configured: $(DBUS_GLIB_HOST_DIR)/.unpacked $(EXPAT_HOST_BINARY)
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_dbusglib_configured: $(STAMP_DIR)/host_dbusglib_unpacked $(STAMP_DIR)/host_dbus_installed
+	(cd $(DBUS_GLIB_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--disable-tests \
 		--disable-xml-docs \
 		--disable-bash-completion \
@@ -53,21 +53,22 @@
 	)
 	touch $@
 
-$(DBUS_GLIB_HOST_DIR)/.compiled: $(DBUS_GLIB_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_dbusglib_compiled: $(STAMP_DIR)/host_dbusglib_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(DBUS_GLIB_HOST_DIR)
 	touch $@
 
-$(DBUS_GLIB_HOST_BINARY): $(DBUS_GLIB_HOST_DIR)/.compiled
-	$(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_dbusglib_installed: $(STAMP_DIR)/host_dbusglib_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(DBUS_GLIB_HOST_DIR) install
+	touch $@
 
-host-dbus-glib: $(DBUS_GLIB_HOST_BINARY)
+host-dbus-glib: $(STAMP_DIR)/host_dbusglib_installed
 
 host-dbus-glib-source: dbus-glib-source
 
 host-dbus-glib-clean:
-	rm -f $(addprefix $(DBUS_GLIB_HOST_DIR)/,.unpacked .configured .compiled)
-	$(MAKE) -C $(DBUS_GLIB_HOST_DIR) uninstall
-	$(MAKE) -C $(DBUS_GLIB_HOST_DIR) clean
+	rm -f $(addprefix $(STAMP_DIR)/host_dbusglib_,unpacked configured compiled installed)
+	-$(MAKE) -C $(DBUS_GLIB_HOST_DIR) uninstall
+	-$(MAKE) -C $(DBUS_GLIB_HOST_DIR) clean
 
 host-dbus-glib-dirclean:
 	rm -rf $(DBUS_GLIB_HOST_DIR)

Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/expat/expat.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -26,40 +26,40 @@
 
 # expat for the host
 EXPAT_HOST_DIR:=$(BUILD_DIR)/expat-$(EXPAT_VERSION)-host
-EXPAT_HOST_BINARY:=$(HOST_DIR)/usr/lib/libexpat.a
 
-$(EXPAT_HOST_DIR)/.unpacked: $(DL_DIR)/$(EXPAT_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_expat_unpacked: $(DL_DIR)/$(EXPAT_SOURCE)
+	mkdir -p $(EXPAT_HOST_DIR)
 	$(INFLATE$(suffix $(EXPAT_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(EXPAT_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(EXPAT_HOST_DIR)/.configured: $(EXPAT_HOST_DIR)/.unpacked
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_expat_configured: $(STAMP_DIR)/host_expat_unpacked
+	(cd $(EXPAT_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 	)
 	touch $@
 
-$(EXPAT_HOST_DIR)/.compiled: $(EXPAT_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_expat_compiled: $(STAMP_DIR)/host_expat_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(EXPAT_HOST_DIR)
 	touch $@
 
-$(EXPAT_HOST_BINARY): $(EXPAT_HOST_DIR)/.compiled
-	$(MAKE) -C $(<D) installlib
+$(STAMP_DIR)/host_expat_installed: $(STAMP_DIR)/host_expat_compiled
+	$(MAKE) -C $(EXPAT_HOST_DIR) installlib
+	touch $@
 
-host-expat: $(EXPAT_HOST_BINARY)
+host-expat: $(STAM_DIR)/host_expat_installed
 
 host-expat-source: expat-source
 
 host-expat-clean:
-	rm -f $(addprefix $(EXPAT_HOST_DIR)/,.unpacked .configured .compiled)
-	$(MAKE) -C $(EXPAT_HOST_DIR) uninstall
-	$(MAKE) -C $(EXPAT_HOST_DIR) clean
+	rm -f $(addprefix $(STAMP_DIR)/host_expat_,unpacked configured compiled installed)
+	-$(MAKE) -C $(EXPAT_HOST_DIR) uninstall
+	-$(MAKE) -C $(EXPAT_HOST_DIR) clean
 
 host-expat-dirclean:
 	rm -rf $(EXPAT_HOST_DIR)

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -27,40 +27,40 @@
 
 # fontconfig for the host
 FONTCONFIG_HOST_DIR:=$(BUILD_DIR)/fontconfig-$(FONTCONFIG_VERSION)-host
-FONTCONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/fc-cache
 
-$(FONTCONFIG_HOST_DIR)/.unpacked: $(DL_DIR)/$(FONTCONFIG_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_fontconfig_unpacked: $(DL_DIR)/$(FONTCONFIG_SOURCE)
+	mkdir -p $(FONTCONFIG_HOST_DIR)
 	$(INFLATE$(suffix $(FONTCONFIG_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(FONTCONFIG_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(FONTCONFIG_HOST_DIR)/.configured: $(FONTCONFIG_HOST_DIR)/.unpacked $(FREETYPE_HOST_BINARY) $(EXPAT_HOST_BINARY)
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_fontconfig_configured: $(STAMP_DIR)/host_fontconfig_unpacked $(STAMP_DIR)/host_freetype_installed $(STAMP_DIR)/host_expat_installed
+	(cd $(FONTCONFIG_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--disable-docs \
 		--disable-static \
 	)
 	touch $@
 
-$(FONTCONFIG_HOST_DIR)/.compiled: $(FONTCONFIG_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_fontconfig_compiled: $(STAMP_DIR)/host_fontconfig_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(FONTCONFIG_HOST_DIR)
 	touch $@
 
-$(FONTCONFIG_HOST_BINARY): $(FONTCONFIG_HOST_DIR)/.compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_fontconfig_installed: $(STAMP_DIR)/host_fontconfig_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(FONTCONFIG_HOST_DIR) install
+	touch $@
 
-host-fontconfig: $(FONTCONFIG_HOST_BINARY)
+host-fontconfig: $(STAMP_DIR)/host_fontconfig_installed
 
 host-fontconfig-source: fontconfig-source
 
 host-fontconfig-clean:
-	rm -f $(addprefix $(FONTCONFIG_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_fontconfig_,unpacked configured compiled installed)
 	-$(MAKE) -C $(FONTCONFIG_HOST_DIR) uninstall
 	-$(MAKE) -C $(FONTCONFIG_HOST_DIR) clean
 

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -25,38 +25,38 @@
 
 # freetype for the host
 FREETYPE_HOST_DIR:=$(BUILD_DIR)/freetype-$(FREETYPE_VERSION)-host
-FREETYPE_HOST_BINARY:=$(HOST_DIR)/usr/bin/freetype-config
 
-$(FREETYPE_HOST_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_freetype_unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
+	mkdir -p $(FREETYPE_HOST_DIR)
 	$(INFLATE$(suffix $(FREETYPE_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(FREETYPE_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(FREETYPE_HOST_DIR)/.configured: $(FREETYPE_HOST_DIR)/.unpacked $(PKG_CONFIG_HOST_BINARY)
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_freetype_configured: $(STAMP_DIR)/host_freetype_unpacked $(STAMP_DIR)/host_pkgconfig_installed
+	(cd $(FREETYPE_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 	)
 	touch $@
 
-$(FREETYPE_HOST_DIR)/.compiled: $(FREETYPE_HOST_DIR)/.configured
-	$(MAKE) -C $(@D)
+$(STAMP_DIR)/host_freetype_compiled: $(STAMP_DIR)/host_freetype_configured
+	$(MAKE) -C $(FREETYPE_HOST_DIR)
 	touch $@
 
-$(FREETYPE_HOST_BINARY): $(FREETYPE_HOST_DIR)/.compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_freetype_installed: $(STAMP_DIR)/host_freetype_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(FREETYPE_HOST_DIR) install
+	touch $@
 
-host-freetype: $(FREETYPE_HOST_BINARY)
+host-freetype: $(STAMP_DIR)/host_freetype_installed
 
 host-freetype-source: freetype-source
 
 host-freetype-clean:
-	rm -f $(addprefix $(FREETYPE_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_freetype_,unpacked configured compiled installed)
 	-$(MAKE) -C $(FREETYPE_HOST_DIR) uninstall
 	-$(MAKE) -C $(FREETYPE_HOST_DIR) clean
 

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -68,20 +68,20 @@
 LIBGLIB2_HOST_DIR:=$(BUILD_DIR)/libglib2-$(LIBGLIB2_VERSION)-host
 LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
 
-$(LIBGLIB2_HOST_DIR)/.unpacked: $(DL_DIR)/$(LIBGLIB2_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_libglib2_unpacked: $(DL_DIR)/$(LIBGLIB2_SOURCE)
+	mkdir -p $(LIBGLIB2_HOST_DIR)
 	$(INFLATE$(suffix $(LIBGLIB2_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LIBGLIB2_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(LIBGLIB2_HOST_DIR)/.configured: $(LIBGLIB2_HOST_DIR)/.unpacked
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_libglib2_configured: $(STAMP_DIR)/host_libglib2_unpacked $(STAMP_DIR)/host_pkgconfig_installed
+	(cd $(LIBGLIB2_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--enable-shared \
 		--disable-static \
 		--disable-gtk-doc \
@@ -89,21 +89,22 @@
 	)
 	touch $@
 
-$(LIBGLIB2_HOST_DIR)/.compiled: $(LIBGLIB2_HOST_DIR)/.configured
-	$(MAKE) -C $(@D)
+$(STAMP_DIR)/host_libglib2_compiled: $(STAMP_DIR)/host_libglib2_configured
+	$(MAKE) -C $(LIBGLIB2_HOST_DIR)
 	touch $@
 
-$(LIBGLIB2_HOST_BINARY): $(LIBGLIB2_HOST_DIR)/.compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_libglib2_installed: $(STAMP_DIR)/host_libglib2_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(LIBGLIB2_HOST_DIR) install
+	touch $@
 
-host-libglib2: $(LIBGLIB2_HOST_BINARY)
+host-libglib2: $(STAMP_DIR)/host_libglib2_installed
 
 host-libglib2-source: libglib2-source
 
 host-libglib2-clean:
-	rm -f $(addprefix $(LIBGLIB2_HOST_DIR)/,.unpacked .configured .compiled)
-	$(MAKE) -C $(LIBGLIB2_HOST_DIR) uninstall
-	$(MAKE) -C $(LIBGLIB2_HOST_DIR) clean
+	rm -f $(addprefix $(STAMP_DIR)/host_libglib2_,unpacked configured compiled installed)
+	-$(MAKE) -C $(LIBGLIB2_HOST_DIR) uninstall
+	-$(MAKE) -C $(LIBGLIB2_HOST_DIR) clean
 
 host-libglib2-dirclean:
 	rm -rf $(LIBGLIB2_HOST_DIR)

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -134,22 +134,21 @@
 
 # libgtk2 for the host
 LIBGTK2_HOST_DIR:=$(BUILD_DIR)/libgtk2-$(LIBGTK2_VERSION)-host
-LIBGTK2_HOST_BINARY:=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource
 
-$(LIBGTK2_HOST_DIR)/.unpacked: $(DL_DIR)/$(LIBGTK2_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_libgtk2_unpacked: $(DL_DIR)/$(LIBGTK2_SOURCE)
+	mkdir -p $(LIBGTK2_HOST_DIR)
 	$(INFLATE$(suffix $(LIBGTK2_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LIBGTK2_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(LIBGTK2_HOST_DIR)/.configured: $(LIBGTK2_HOST_DIR)/.unpacked $(PKG_CONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY) $(PANGO_HOST_BINARY) $(ATK_HOST_BINARY)
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_libgtk2_configured: $(STAMP_DIR)/host_libgtk2_unpacked $(STAMP_DIR)/host_cairo_installed $(STAMP_DIR)/host_libglib2_installed $(STAMP_DIR)/host_pango_installed $(STAMP_DIR)/host_atk_installed
+	(cd $(LIBGTK2_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--disable-static \
 		--disable-glibtest \
 		--without-libtiff \
@@ -162,19 +161,20 @@
 	)
 	touch $@
 
-$(LIBGTK2_HOST_DIR)/.compiled: $(LIBGTK2_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_libgtk2_compiled: $(STAMP_DIR)/host_libgtk2_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(LIBGTK2_HOST_DIR)
 	touch $@
 
-$(LIBGTK2_HOST_BINARY): $(LIBGTK2_HOST_DIR)/.compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_libgtk2_installed: $(STAMP_DIR)/host_libgtk2_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(LIBGTK2_HOST_DIR) install
+	touch $@
 
-host-libgtk2: $(LIBGTK2_HOST_BINARY)
+host-libgtk2: $(STAMP_DIR)/host_libgtk2_installed
 
 host-libgtk2-source: libgtk2-source
 
 host-libgtk2-clean:
-	rm -f $(addprefix $(LIBGTK2_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_libgtk2_,unpacked configured compiled installed)
 	-$(MAKE) -C $(LIBGTK2_HOST_DIR) uninstall
 	-$(MAKE) -C $(LIBGTK2_HOST_DIR) clean
 

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -66,40 +66,41 @@
 PANGO_HOST_DIR:=$(BUILD_DIR)/pango-$(PANGO_VERSION)-host
 PANGO_HOST_BINARY:=$(HOST_DIR)/usr/bin/pango-querymodules
 
-$(PANGO_HOST_DIR)/.unpacked: $(DL_DIR)/$(PANGO_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_pango_unpacked: $(DL_DIR)/$(PANGO_SOURCE)
+	mkdir -p $(PANGO_HOST_DIR)
 	$(INFLATE$(suffix $(PANGO_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(@D) package/pango/ \*.patch
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(PANGO_HOST_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(PANGO_HOST_DIR) package/pango/ \*.patch
 	touch $@
 
-$(PANGO_HOST_DIR)/.configured: $(PANGO_HOST_DIR)/.unpacked $(PKG_CONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY)
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_pango_configured: $(STAMP_DIR)/host_pango_unpacked $(STAMP_DIR)/host_cairo_installed $(STAMP_DIR)/host_libglib2_installed
+	(cd $(PANGO_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--disable-static \
 		$(if $(BR2_PACKAGE_XSERVER_none),--without-x,--with-x) \
 		--disable-debug \
 	)
 	touch $@
 
-$(PANGO_HOST_DIR)/.compiled: $(PANGO_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_pango_compiled: $(STAMP_DIR)/host_pango_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(PANGO_HOST_DIR)
 	touch $@
 
-$(PANGO_HOST_BINARY): $(PANGO_HOST_DIR)/.compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_pango_installed: $(STAMP_DIR)/host_pango_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(PANGO_HOST_DIR) install
+	touch $@
 
-host-pango: $(PANGO_HOST_BINARY)
+host-pango: $(STAMP_DIR)/host_pango_installed
 
 host-pango-source: pango-source
 
 host-pango-clean:
-	rm -f $(addprefix $(PANGO_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_pango_,unpacked configured compiled installed)
 	-$(MAKE) -C $(PANGO_HOST_DIR) uninstall
 	-$(MAKE) -C $(PANGO_HOST_DIR) clean
 

Modified: trunk/buildroot/package/pixman/pixman.mk
===================================================================
--- trunk/buildroot/package/pixman/pixman.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/pixman/pixman.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -13,38 +13,38 @@
 
 # pixman for the host
 PIXMAN_HOST_DIR:=$(BUILD_DIR)/pixman-$(PIXMAN_VERSION)-host
-PIXMAN_HOST_BINARY:=$(HOST_DIR)/usr/lib/libpixman-1.0.a
 
-$(PIXMAN_HOST_DIR)/.unpacked: $(DL_DIR)/$(PIXMAN_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_pixman_unpacked: $(DL_DIR)/$(PIXMAN_SOURCE)
+	mkdir -p $(PIXMAN_HOST_DIR)
 	$(INFLATE$(suffix $(PIXMAN_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(PIXMAN_HOST_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(PIXMAN_HOST_DIR)/.configured: $(PIXMAN_HOST_DIR)/.unpacked
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_pixman_configured: $(STAMP_DIR)/host_pixman_unpacked
+	(cd $(PIXMAN_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		$(@D)/configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 	)
 	touch $@
 
-$(PIXMAN_HOST_DIR)/.compiled: $(PIXMAN_HOST_DIR)/.configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+$(STAMP_DIR)/host_pixman_compiled: $(STAMP_DIR)/host_pixman_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(PIXMAN_HOST_DIR)
 	touch $@
 
-$(PIXMAN_HOST_BINARY): $(PIXMAN_HOST_DIR)/.compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_pixman_installed: $(STAMP_DIR)/host_pixman_compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(PIXMAN_HOST_DIR) install
+	touch $@
 
-host-pixman: $(PIXMAN_HOST_BINARY)
+host-pixman: $(STAMP_DIR)/host_pixman_installed
 
 host-pixman-source: pixman-source
 
 host-pixman-clean:
-	rm -f $(addprefix $(PIXMAN_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_pixman_,unpacked configured compiled installed)
 	-$(MAKE) -C $(PIXMAN_HOST_DIR) uninstall
 	-$(MAKE) -C $(PIXMAN_HOST_DIR) clean
 

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-19 11:06:47 UTC (rev 25755)
@@ -21,34 +21,38 @@
 PKG_CONFIG_HOST_DIR:=$(BUILD_DIR)/pkg-config-$(PKG_CONFIG_VERSION)-host
 PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
 
-$(PKG_CONFIG_HOST_DIR)/.unpacked: $(DL_DIR)/$(PKG_CONFIG_SOURCE)
-	mkdir -p $(@D)
+$(STAMP_DIR)/host_pkgconfig_unpacked: $(DL_DIR)/$(PKG_CONFIG_SOURCE)
+	mkdir -p $(PKG_CONFIG_HOST_DIR)
 	$(INFLATE$(suffix $(PKG_CONFIG_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(@D) package/pkgconfig/ \*.patch
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(PKG_CONFIG_HOST_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(PKG_CONFIG_HOST_DIR) package/pkgconfig/ \*.patch
 	touch $@
 
-$(PKG_CONFIG_HOST_DIR)/.configured: $(PKG_CONFIG_HOST_DIR)/.unpacked
-	(cd $(@D); rm -rf config.cache; \
+$(STAMP_DIR)/host_pkgconfig_configured: $(STAMP_DIR)/host_pkgconfig_unpacked
+	(cd $(PKG_CONFIG_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
 		./configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(HOST_DIR)/etc \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
 		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		--disable-static \
 	)
 	touch $@
 
-$(PKG_CONFIG_HOST_DIR)/.compiled: $(PKG_CONFIG_HOST_DIR)/.configured
-	$(MAKE) -C $(@D)
+$(STAMP_DIR)/host_pkgconfig_compiled: $(STAMP_DIR)/host_pkgconfig_configured
+	$(MAKE) -C $(PKG_CONFIG_HOST_DIR)
 	touch $@
 
-$(PKG_CONFIG_HOST_BINARY): $(PKG_CONFIG_HOST_DIR)/.compiled
-	$(MAKE) -C $(<D) install
+$(STAMP_DIR)/host_pkgconfig_installed: $(STAMP_DIR)/host_pkgconfig_compiled
+	$(MAKE) -C $(PKG_CONFIG_HOST_DIR) install
+	touch $@
 
-host-pkgconfig: $(PKG_CONFIG_HOST_BINARY)
+host-pkgconfig: $(STAMP_DIR)/host_pkgconfig_installed
 
 host-pkgconfig-clean:
-	rm -f $(addprefix $(PKG_CONFIG_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(addprefix $(STAMP_DIR)/host_pkgconfig_,unpacked configured compiled installed)
 	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) uninstall
 	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) clean
 

Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2009-03-19 08:34:23 UTC (rev 25754)
+++ trunk/buildroot/project/Makefile.in	2009-03-19 11:06:47 UTC (rev 25755)
@@ -71,6 +71,9 @@
 # packages compiled for the host goes here
 HOST_DIR:=$(BUILD_DIR)/host_dir
 
+# stamp (dependency) files go here
+STAMP_DIR:=$(BUILD_DIR)/stamps
+
 # All configurable packages (like Busybox,Linux etc) should be built
 # in PROJECT_BUILD_DIR
 PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)

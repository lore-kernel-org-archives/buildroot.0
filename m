From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Mar 2009 08:30:20 +0000 (UTC)
Subject: [Buildroot] svn commit: [25753] trunk/buildroot/package: atk cairo
	freetype libgtk2 pango pkgcon etc...
Message-ID: <20090319083020.D13707763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-19 08:30:20 +0000 (Thu, 19 Mar 2009)
New Revision: 25753

Log:
pkg-config: rename pkgconfig to pkg-config

This matches upstream tarball, doesn't screw up existing .config's with
BR2_PACKAGE_PKGCONFIG and makes sure the patch gets applied for target
compilation.

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/pkgconfig/Config.in
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-03-19 08:29:55 UTC (rev 25752)
+++ trunk/buildroot/package/Makefile.in	2009-03-19 08:30:20 UTC (rev 25753)
@@ -251,7 +251,7 @@
 		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
 		DEFAULT_LINKER="$(TARGET_LD)" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
-		PKG_CONFIG="$(PKGCONFIG_HOST_BINARY)" \
+		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		STAGING_DIR="$(STAGING_DIR)"
 
@@ -296,7 +296,7 @@
 		ORIGINAL_LD_FOR_TARGET="$(TARGET_LD)" \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
-		PKG_CONFIG="$(PKGCONFIG_HOST_BINARY)" \
+		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH)

Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2009-03-19 08:29:55 UTC (rev 25752)
+++ trunk/buildroot/package/atk/atk.mk	2009-03-19 08:30:20 UTC (rev 25753)
@@ -67,7 +67,7 @@
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	touch $@
 
-$(ATK_HOST_DIR)/.configured: $(ATK_HOST_DIR)/.unpacked $(LIBGLIB2_HOST_BINARY) $(PKGCONFIG_HOST_BINARY)
+$(ATK_HOST_DIR)/.configured: $(ATK_HOST_DIR)/.unpacked $(LIBGLIB2_HOST_BINARY) $(PKG_CONFIG_HOST_BINARY)
 	(cd $(@D); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-03-19 08:29:55 UTC (rev 25752)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-03-19 08:30:20 UTC (rev 25753)
@@ -94,7 +94,7 @@
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	touch $@
 
-$(CAIRO_HOST_DIR)/.configured: $(CAIRO_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY) $(FONTCONFIG_HOST_BINARY) $(PIXMAN_HOST_BINARY)
+$(CAIRO_HOST_DIR)/.configured: $(CAIRO_HOST_DIR)/.unpacked $(PKG_CONFIG_HOST_BINARY) $(FONTCONFIG_HOST_BINARY) $(PIXMAN_HOST_BINARY)
 	(cd $(@D); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-03-19 08:29:55 UTC (rev 25752)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-03-19 08:30:20 UTC (rev 25753)
@@ -33,7 +33,7 @@
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	touch $@
 
-$(FREETYPE_HOST_DIR)/.configured: $(FREETYPE_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY)
+$(FREETYPE_HOST_DIR)/.configured: $(FREETYPE_HOST_DIR)/.unpacked $(PKG_CONFIG_HOST_BINARY)
 	(cd $(@D); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-19 08:29:55 UTC (rev 25752)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-19 08:30:20 UTC (rev 25753)
@@ -142,7 +142,7 @@
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	touch $@
 
-$(LIBGTK2_HOST_DIR)/.configured: $(LIBGTK2_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY) $(PANGO_HOST_BINARY) $(ATK_HOST_BINARY)
+$(LIBGTK2_HOST_DIR)/.configured: $(LIBGTK2_HOST_DIR)/.unpacked $(PKG_CONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY) $(PANGO_HOST_BINARY) $(ATK_HOST_BINARY)
 	(cd $(@D); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-19 08:29:55 UTC (rev 25752)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-19 08:30:20 UTC (rev 25753)
@@ -73,7 +73,7 @@
 	toolchain/patch-kernel.sh $(@D) package/pango/ \*.patch
 	touch $@
 
-$(PANGO_HOST_DIR)/.configured: $(PANGO_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY)
+$(PANGO_HOST_DIR)/.configured: $(PANGO_HOST_DIR)/.unpacked $(PKG_CONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY)
 	(cd $(@D); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \

Modified: trunk/buildroot/package/pkgconfig/Config.in
===================================================================
--- trunk/buildroot/package/pkgconfig/Config.in	2009-03-19 08:29:55 UTC (rev 25752)
+++ trunk/buildroot/package/pkgconfig/Config.in	2009-03-19 08:30:20 UTC (rev 25753)
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_PKGCONFIG
+config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
 	select BR2_PACKAGE_LIBGLIB2
 	help

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-19 08:29:55 UTC (rev 25752)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-19 08:30:20 UTC (rev 25753)
@@ -3,32 +3,32 @@
 # pkgconfig
 #
 #############################################################
-PKGCONFIG_VERSION = 0.23
-PKGCONFIG_SOURCE = pkg-config-$(PKGCONFIG_VERSION).tar.gz
-PKGCONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
+PKG_CONFIG_VERSION = 0.23
+PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
+PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
 
 ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-PKGCONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
+PKG_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
 endif
 
-PKGCONFIG_DEPENDENCIES = uclibc libglib2
+PKG_CONFIG_DEPENDENCIES = uclibc libglib2
 
-PKGCONFIG_CONF_OPT = --with-installed-glib
+PKG_CONFIG_CONF_OPT = --with-installed-glib
 
 $(eval $(call AUTOTARGETS,package,pkgconfig))
 
-# pkgconfig for the host
-PKGCONFIG_HOST_DIR:=$(BUILD_DIR)/pkgconfig-$(PKGCONFIG_VERSION)-host
-PKGCONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
+# pkg-config for the host
+PKG_CONFIG_HOST_DIR:=$(BUILD_DIR)/pkg-config-$(PKG_CONFIG_VERSION)-host
+PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
 
-$(PKGCONFIG_HOST_DIR)/.unpacked: $(DL_DIR)/$(PKGCONFIG_SOURCE)
+$(PKG_CONFIG_HOST_DIR)/.unpacked: $(DL_DIR)/$(PKG_CONFIG_SOURCE)
 	mkdir -p $(@D)
-	$(INFLATE$(suffix $(PKGCONFIG_SOURCE))) $< | \
+	$(INFLATE$(suffix $(PKG_CONFIG_SOURCE))) $< | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(@D) package/pkgconfig/ \*.patch
 	touch $@
 
-$(PKGCONFIG_HOST_DIR)/.configured: $(PKGCONFIG_HOST_DIR)/.unpacked
+$(PKG_CONFIG_HOST_DIR)/.configured: $(PKG_CONFIG_HOST_DIR)/.unpacked
 	(cd $(@D); rm -rf config.cache; \
 		./configure \
 		--prefix=$(HOST_DIR)/usr \
@@ -38,19 +38,19 @@
 	)
 	touch $@
 
-$(PKGCONFIG_HOST_DIR)/.compiled: $(PKGCONFIG_HOST_DIR)/.configured
+$(PKG_CONFIG_HOST_DIR)/.compiled: $(PKG_CONFIG_HOST_DIR)/.configured
 	$(MAKE) -C $(@D)
 	touch $@
 
-$(PKGCONFIG_HOST_BINARY): $(PKGCONFIG_HOST_DIR)/.compiled
+$(PKG_CONFIG_HOST_BINARY): $(PKG_CONFIG_HOST_DIR)/.compiled
 	$(MAKE) -C $(<D) install
 
-host-pkgconfig: $(PKGCONFIG_HOST_BINARY)
+host-pkgconfig: $(PKG_CONFIG_HOST_BINARY)
 
 host-pkgconfig-clean:
-	rm -f $(addprefix $(PKGCONFIG_HOST_DIR)/,.unpacked .configured .compiled)
-	-$(MAKE) -C $(PKGCONFIG_HOST_DIR) uninstall
-	-$(MAKE) -C $(PKGCONFIG_HOST_DIR) clean
+	rm -f $(addprefix $(PKG_CONFIG_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) uninstall
+	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) clean
 
 host-pkgconfig-dirclean:
-	rm -rf $(PKGCONFIG_HOST_DIR)
+	rm -rf $(PKG_CONFIG_HOST_DIR)

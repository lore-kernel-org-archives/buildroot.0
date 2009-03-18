From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:22:05 +0000 (UTC)
Subject: [Buildroot] svn commit: [25736] trunk/buildroot/package: cairo
	fontconfig
Message-ID: <20090318212205.CC6D07763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:22:04 +0000 (Wed, 18 Mar 2009)
New Revision: 25736

Log:
cairo: add host version

Modified:
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-03-18 21:22:00 UTC (rev 25735)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-03-18 21:22:04 UTC (rev 25736)
@@ -84,3 +84,49 @@
 endif
 
 $(eval $(call AUTOTARGETS,package,cairo))
+
+# cairo for the host
+CAIRO_HOST_DIR:=$(BUILD_DIR)/cairo-$(CAIRO_VERSION)-host
+CAIRO_HOST_BINARY:=$(HOST_DIR)/usr/lib/libcairo.a
+
+$(CAIRO_HOST_DIR)/.unpacked: $(DL_DIR)/$(CAIRO_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(CAIRO_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(CAIRO_HOST_DIR)/.configured: $(CAIRO_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY) $(FONTCONFIG_HOST_BINARY) $(PIXMAN_HOST_BINARY)
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+		--enable-ps \
+		--enable-pdf \
+		--enable-xlib \
+		--with-x \
+		--disable-png \
+		--disable-svg \
+	)
+	touch $@
+
+$(CAIRO_HOST_DIR)/.compiled: $(CAIRO_HOST_DIR)/.configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	touch $@
+
+$(CAIRO_HOST_BINARY): $(CAIRO_HOST_DIR)/.compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+
+host-cairo: $(CAIRO_HOST_BINARY)
+
+host-cairo-source: cairo-source
+
+host-cairo-clean:
+	rm -f $(addprefix $(CAIRO_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(CAIRO_HOST_DIR) uninstall
+	-$(MAKE) -C $(CAIRO_HOST_DIR) clean
+
+host-cairo-dirclean:
+	rm -rf $(CAIRO_HOST_DIR)

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-18 21:22:00 UTC (rev 25735)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2009-03-18 21:22:04 UTC (rev 25736)
@@ -24,3 +24,45 @@
 FONTCONFIG_DEPENDENCIES = uclibc freetype expat
 
 $(eval $(call AUTOTARGETS,package,fontconfig))
+
+# fontconfig for the host
+FONTCONFIG_HOST_DIR:=$(BUILD_DIR)/fontconfig-$(FONTCONFIG_VERSION)-host
+FONTCONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/fc-cache
+
+$(FONTCONFIG_HOST_DIR)/.unpacked: $(DL_DIR)/$(FONTCONFIG_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(FONTCONFIG_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(FONTCONFIG_HOST_DIR)/.configured: $(FONTCONFIG_HOST_DIR)/.unpacked $(FREETYPE_HOST_BINARY) $(EXPAT_HOST_BINARY)
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+		--disable-docs \
+		--disable-static \
+	)
+	touch $@
+
+$(FONTCONFIG_HOST_DIR)/.compiled: $(FONTCONFIG_HOST_DIR)/.configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	touch $@
+
+$(FONTCONFIG_HOST_BINARY): $(FONTCONFIG_HOST_DIR)/.compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+
+host-fontconfig: $(FONTCONFIG_HOST_BINARY)
+
+host-fontconfig-source: fontconfig-source
+
+host-fontconfig-clean:
+	rm -f $(addprefix $(FONTCONFIG_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(FONTCONFIG_HOST_DIR) uninstall
+	-$(MAKE) -C $(FONTCONFIG_HOST_DIR) clean
+
+host-fontconfig-dirclean:
+	rm -rf $(FONTCONFIG_HOST_DIR)

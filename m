From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:22:17 +0000 (UTC)
Subject: [Buildroot] svn commit: [25739] trunk/buildroot/package/libgtk2
Message-ID: <20090318212217.E58A87763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:22:17 +0000 (Wed, 18 Mar 2009)
New Revision: 25739

Log:
libgtk2: build host version, use it for build time binaries

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-18 21:22:13 UTC (rev 25738)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-18 21:22:17 UTC (rev 25739)
@@ -67,8 +67,8 @@
 		ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GTK_UPDATE_ICON_CACHE=/usr/bin/gtk-update-icon-cache \
-		ac_cv_path_GDK_PIXBUF_CSOURCE=/usr/bin/gdk-pixbuf-csource \
+		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
+		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
 		ac_cv_prog_F77=no \
 		ac_cv_path_CUPS_CONFIG=no
 
@@ -78,7 +78,7 @@
 		--enable-explicit-deps=no \
 		--disable-debug
 
-LIBGTK2_DEPENDENCIES = host-pkgconfig libglib2 cairo pango atk
+LIBGTK2_DEPENDENCIES = host-pkgconfig host-libgtk2 libglib2 cairo pango atk
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	LIBGTK2_CONF_OPT += --with-gdktarget=directfb
@@ -131,3 +131,52 @@
 	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
 	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
 	touch $@
+
+# libgtk2 for the host
+LIBGTK2_HOST_DIR:=$(BUILD_DIR)/libgtk2-$(LIBGTK2_VERSION)-host
+LIBGTK2_HOST_BINARY:=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource
+
+$(LIBGTK2_HOST_DIR)/.unpacked: $(DL_DIR)/$(LIBGTK2_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(LIBGTK2_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(LIBGTK2_HOST_DIR)/.configured: $(LIBGTK2_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY) $(PANGO_HOST_BINARY) $(ATK_HOST_BINARY)
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+		--disable-static \
+		--disable-glibtest \
+		--without-libtiff \
+		--without-libpng \
+		--without-libjpeg \
+		--with-x \
+		--with-gdktarget=x11 \
+		--disable-cups \
+		--disable-debug \
+	)
+	touch $@
+
+$(LIBGTK2_HOST_DIR)/.compiled: $(LIBGTK2_HOST_DIR)/.configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	touch $@
+
+$(LIBGTK2_HOST_BINARY): $(LIBGTK2_HOST_DIR)/.compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+
+host-libgtk2: $(LIBGTK2_HOST_BINARY)
+
+host-libgtk2-source: libgtk2-source
+
+host-libgtk2-clean:
+	rm -f $(addprefix $(LIBGTK2_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(LIBGTK2_HOST_DIR) uninstall
+	-$(MAKE) -C $(LIBGTK2_HOST_DIR) clean
+
+host-libgtk2-dirclean:
+	rm -rf $(LIBGTK2_HOST_DIR)

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:22:14 +0000 (UTC)
Subject: [Buildroot] svn commit: [25738] trunk/buildroot/package/pango
Message-ID: <20090318212214.3AAE37763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:22:13 +0000 (Wed, 18 Mar 2009)
New Revision: 25738

Log:
pango: add host version

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-18 21:22:08 UTC (rev 25737)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-18 21:22:13 UTC (rev 25738)
@@ -59,3 +59,46 @@
 $(PANGO_HOOK_POST_INSTALL):
 	$(INSTALL) -m 755 package/pango/S25pango $(TARGET_DIR)/etc/init.d/
 	touch $@
+
+# pango for the host
+PANGO_HOST_DIR:=$(BUILD_DIR)/pango-$(PANGO_VERSION)-host
+PANGO_HOST_BINARY:=$(HOST_DIR)/usr/bin/pango-querymodules
+
+$(PANGO_HOST_DIR)/.unpacked: $(DL_DIR)/$(PANGO_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(PANGO_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(PANGO_HOST_DIR)/.configured: $(PANGO_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY) $(CAIRO_HOST_BINARY) $(LIBGLIB2_HOST_BINARY)
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+		--disable-static \
+		--with-x \
+		--disable-debug \
+	)
+	touch $@
+
+$(PANGO_HOST_DIR)/.compiled: $(PANGO_HOST_DIR)/.configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	touch $@
+
+$(PANGO_HOST_BINARY): $(PANGO_HOST_DIR)/.compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+
+host-pango: $(PANGO_HOST_BINARY)
+
+host-pango-source: pango-source
+
+host-pango-clean:
+	rm -f $(addprefix $(PANGO_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(PANGO_HOST_DIR) uninstall
+	-$(MAKE) -C $(PANGO_HOST_DIR) clean
+
+host-pango-dirclean:
+	rm -rf $(PANGO_HOST_DIR)

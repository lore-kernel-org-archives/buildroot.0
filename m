From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:22:00 +0000 (UTC)
Subject: [Buildroot] svn commit: [25735] trunk/buildroot/package/freetype
Message-ID: <20090318212200.9D7347763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:22:00 +0000 (Wed, 18 Mar 2009)
New Revision: 25735

Log:
freetype: add host version

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-03-18 21:21:56 UTC (rev 25734)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-03-18 21:22:00 UTC (rev 25735)
@@ -23,3 +23,42 @@
 		$(STAGING_DIR)/usr/bin/freetype-config
 	touch $@
 
+# freetype for the host
+FREETYPE_HOST_DIR:=$(BUILD_DIR)/freetype-$(FREETYPE_VERSION)-host
+FREETYPE_HOST_BINARY:=$(HOST_DIR)/usr/bin/freetype-config
+
+$(FREETYPE_HOST_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(FREETYPE_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(FREETYPE_HOST_DIR)/.configured: $(FREETYPE_HOST_DIR)/.unpacked $(PKGCONFIG_HOST_BINARY)
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+	)
+	touch $@
+
+$(FREETYPE_HOST_DIR)/.compiled: $(FREETYPE_HOST_DIR)/.configured
+	$(MAKE) -C $(@D)
+	touch $@
+
+$(FREETYPE_HOST_BINARY): $(FREETYPE_HOST_DIR)/.compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+
+host-freetype: $(FREETYPE_HOST_BINARY)
+
+host-freetype-source: freetype-source
+
+host-freetype-clean:
+	rm -f $(addprefix $(FREETYPE_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(FREETYPE_HOST_DIR) uninstall
+	-$(MAKE) -C $(FREETYPE_HOST_DIR) clean
+
+host-freetype-dirclean:
+	rm -rf $(FREETYPE_HOST_DIR)

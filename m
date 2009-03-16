From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 20:58:12 +0000 (UTC)
Subject: [Buildroot] svn commit: [25694] trunk/buildroot/package/expat
Message-ID: <20090316205812.6BCB07649F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 20:58:12 +0000 (Mon, 16 Mar 2009)
New Revision: 25694

Log:
expat: add host-expat support

Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2009-03-16 20:58:08 UTC (rev 25693)
+++ trunk/buildroot/package/expat/expat.mk	2009-03-16 20:58:12 UTC (rev 25694)
@@ -23,3 +23,43 @@
 $(EXPAT_HOOK_POST_INSTALL): $(EXPAT_TARGET_INSTALL_TARGET)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libexpat.so.*
 	touch $@
+
+# expat for the host
+EXPAT_HOST_DIR:=$(BUILD_DIR)/expat-$(EXPAT_VERSION)-host
+EXPAT_HOST_BINARY:=$(HOST_DIR)/usr/lib/libexpat.a
+
+$(EXPAT_HOST_DIR)/.unpacked: $(DL_DIR)/$(EXPAT_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(EXPAT_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(EXPAT_HOST_DIR)/.configured: $(EXPAT_HOST_DIR)/.unpacked
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
+$(EXPAT_HOST_DIR)/.compiled: $(EXPAT_HOST_DIR)/.configured
+	$(MAKE) -C $(@D)
+	touch $@
+
+$(EXPAT_HOST_BINARY): $(EXPAT_HOST_DIR)/.compiled
+	$(MAKE) -C $(<D) installlib
+
+host-expat: $(EXPAT_HOST_BINARY)
+
+host-expat-source: expat-source
+
+host-expat-clean:
+	rm -f $(addprefix $(EXPAT_HOST_DIR)/,.unpacked .configured .compiled)
+	$(MAKE) -C $(EXPAT_HOST_DIR) uninstall
+	$(MAKE) -C $(EXPAT_HOST_DIR) clean
+
+host-expat-dirclean:
+	rm -rf $(EXPAT_HOST_DIR)

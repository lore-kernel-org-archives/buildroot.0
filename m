From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:21:27 +0000 (UTC)
Subject: [Buildroot] svn commit: [25728] trunk/buildroot/package/pixman
Message-ID: <20090318212127.DB6AF7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:21:27 +0000 (Wed, 18 Mar 2009)
New Revision: 25728

Log:
pixman: add host version

Modified:
   trunk/buildroot/package/pixman/pixman.mk


Changeset:
Modified: trunk/buildroot/package/pixman/pixman.mk
===================================================================
--- trunk/buildroot/package/pixman/pixman.mk	2009-03-18 21:21:14 UTC (rev 25727)
+++ trunk/buildroot/package/pixman/pixman.mk	2009-03-18 21:21:27 UTC (rev 25728)
@@ -10,3 +10,43 @@
 PIXMAN_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package,pixman))
+
+# pixman for the host
+PIXMAN_HOST_DIR:=$(BUILD_DIR)/pixman-$(PIXMAN_VERSION)-host
+PIXMAN_HOST_BINARY:=$(HOST_DIR)/usr/lib/libpixman-1.0.a
+
+$(PIXMAN_HOST_DIR)/.unpacked: $(DL_DIR)/$(PIXMAN_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(PIXMAN_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(PIXMAN_HOST_DIR)/.configured: $(PIXMAN_HOST_DIR)/.unpacked
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
+$(PIXMAN_HOST_DIR)/.compiled: $(PIXMAN_HOST_DIR)/.configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	touch $@
+
+$(PIXMAN_HOST_BINARY): $(PIXMAN_HOST_DIR)/.compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+
+host-pixman: $(PIXMAN_HOST_BINARY)
+
+host-pixman-source: pixman-source
+
+host-pixman-clean:
+	rm -f $(addprefix $(PIXMAN_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(PIXMAN_HOST_DIR) uninstall
+	-$(MAKE) -C $(PIXMAN_HOST_DIR) clean
+
+host-pixman-dirclean:
+	rm -rf $(PIXMAN_HOST_DIR)

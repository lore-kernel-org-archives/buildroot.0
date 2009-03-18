From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:21:06 +0000 (UTC)
Subject: [Buildroot] svn commit: [25726] trunk/buildroot/package/atk
Message-ID: <20090318212106.AECB17763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:21:06 +0000 (Wed, 18 Mar 2009)
New Revision: 25726

Log:
atk: add host version

Modified:
   trunk/buildroot/package/atk/atk.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2009-03-18 21:20:22 UTC (rev 25725)
+++ trunk/buildroot/package/atk/atk.mk	2009-03-18 21:21:06 UTC (rev 25726)
@@ -56,3 +56,46 @@
 ATK_DEPENDENCIES = libglib2 host-pkgconfig
 
 $(eval $(call AUTOTARGETS,package,atk))
+
+# atk for the host
+ATK_HOST_DIR:=$(BUILD_DIR)/atk-$(ATK_VERSION)-host
+ATK_HOST_BINARY:=$(HOST_DIR)/usr/lib/libatk-1.0.a
+
+$(ATK_HOST_DIR)/.unpacked: $(DL_DIR)/$(ATK_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(ATK_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(ATK_HOST_DIR)/.configured: $(ATK_HOST_DIR)/.unpacked $(LIBGLIB2_HOST_BINARY) $(PKGCONFIG_HOST_BINARY)
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+		--enable-shared \
+		--disable-static \
+		--disable-glibtest \
+	)
+	touch $@
+
+$(ATK_HOST_DIR)/.compiled: $(ATK_HOST_DIR)/.configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	touch $@
+
+$(ATK_HOST_BINARY): $(ATK_HOST_DIR)/.compiled
+	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
+
+host-atk: $(ATK_HOST_BINARY)
+
+host-atk-source: atk-source
+
+host-atk-clean:
+	rm -f $(addprefix $(ATK_HOST_DIR)/,.unpacked .configured .compiled)
+	-$(MAKE) -C $(ATK_HOST_DIR) uninstall
+	-$(MAKE) -C $(ATK_HOST_DIR) clean
+
+host-atk-dirclean:
+	rm -rf $(ATK_HOST_DIR)

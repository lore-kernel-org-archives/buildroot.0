From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 20:58:15 +0000 (UTC)
Subject: [Buildroot] svn commit: [25695] trunk/buildroot/package/dbus
Message-ID: <20090316205816.10E0F7649F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 20:58:15 +0000 (Mon, 16 Mar 2009)
New Revision: 25695

Log:
dbus: add host-dbus support

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-03-16 20:58:12 UTC (rev 25694)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-03-16 20:58:15 UTC (rev 25695)
@@ -53,3 +53,54 @@
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
 	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
 	touch $@
+
+# dbus for the host
+DBUS_HOST_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VERSION)-host
+DBUS_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-daemon
+
+$(DBUS_HOST_DIR)/.unpacked: $(DL_DIR)/$(DBUS_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(DBUS_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(DBUS_HOST_DIR)/.configured: $(DBUS_HOST_DIR)/.unpacked $(EXPAT_HOST_BINARY)
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+		--with-dbus-user=dbus \
+		--disable-tests \
+		--disable-asserts \
+		--enable-abstract-sockets \
+		--disable-selinux \
+		--disable-xml-docs \
+		--disable-doxygen-docs \
+		--disable-static \
+		--enable-dnotify \
+		--without-x \
+		--with-xml=expat \
+	)
+	touch $@
+
+$(DBUS_HOST_DIR)/.compiled: $(DBUS_HOST_DIR)/.configured
+	$(MAKE) -C $(@D)
+	touch $@
+
+$(DBUS_HOST_BINARY): $(DBUS_HOST_DIR)/.compiled
+	$(MAKE) -C $(<D) install
+
+host-dbus: $(DBUS_HOST_BINARY)
+
+host-dbus-source: dbus-source
+
+host-dbus-clean:
+	rm -f $(addprefix $(DBUS_HOST_DIR)/,.unpacked .configured .compiled)
+	$(MAKE) -C $(DBUS_HOST_DIR) uninstall
+	$(MAKE) -C $(DBUS_HOST_DIR) clean
+
+host-dbus-dirclean:
+	rm -rf $(DBUS_HOST_DIR)

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Nov 2007 07:45:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20071123154531.980CC30048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-23 07:45:30 -0800 (Fri, 23 Nov 2007)
New Revision: 20503

Log:
Cleaned up install + clean targets, handle dbus files

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-11-23 15:40:32 UTC (rev 20502)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-11-23 15:45:30 UTC (rev 20503)
@@ -142,12 +142,13 @@
 	$(MAKE) -C $(AVAHI_DIR)
 	touch $@
 
-$(STAGING_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-autoipd install
-	touch -c $@
+$(AVAHI_DIR)/.installed: $(AVAHI_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR) install
+	touch $@
 
-$(TARGET_DIR)/usr/sbin/avahi-autoipd: $(STAGING_DIR)/usr/sbin/avahi-autoipd
-	cp $^ $@
+$(TARGET_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.installed
+	cp $(STAGING_DIR)/usr/sbin/avahi-autoipd \
+		 $(TARGET_DIR)/usr/sbin/avahi-autoipd
 	mkdir -p $(TARGET_DIR)/etc/avahi
 	mkdir -p $(TARGET_DIR)/var/lib
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
@@ -157,34 +158,32 @@
 	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-$(STAGING_DIR)/usr/lib/libavahi-common.so: $(AVAHI_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-common install
-	touch -c $@
-
-$(STAGING_DIR)/usr/lib/libavahi-core.so: $(AVAHI_DIR)/.compiled $(STAGING_DIR)/usr/lib/libavahi-common.so
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-core install
-	touch -c $@
-
-$(STAGING_DIR)/usr/sbin/avahi-daemon: $(AVAHI_DIR)/.compiled $(STAGING_DIR)/usr/lib/libavahi-core.so $(STAGING_DIR)/usr/lib/libavahi-common.so
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR)/avahi-daemon install
-	touch -c $@
-
-$(TARGET_DIR)/usr/sbin/avahi-daemon: $(STAGING_DIR)/usr/sbin/avahi-daemon
-	cp $^ $@
-	cp -dpf $(STAGING_DIR)/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
+$(TARGET_DIR)/usr/sbin/avahi-daemon: $(AVAHI_DIR)/.installed
+	cp $(STAGING_DIR)/usr/sbin/avahi-daemon \
+		 $(TARGET_DIR)/usr/sbin/avahi-daemon
+	cp -dpf $(STAGING_DIR)/usr/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/etc/avahi/services
+	cp -af $(STAGING_DIR)/etc/avahi/avahi-daemon.conf $(TARGET_DIR)/etc/avahi/
 	cp -af $(BASE_DIR)/package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libavahi-*.so*
+ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
+	cp -dpf $(STAGING_DIR)/usr/bin/avahi-* $(TARGET_DIR)/usr/bin
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/avahi-*
+	cp -r $(STAGING_DIR)/etc/dbus-1/system.d/avahi-* \
+		$(TARGET_DIR)/etc/dbus-1/system.d/
+endif
 
 avahi: uclibc busybox libdaemon $(AVAHI_TARGETS)
 
 avahi-clean:
 	$(MAKE) -C $(AVAHI_DIR) distclean
-	rm -rf $(TARGET_DIR)/etc/avahi
-	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
-	rm -f $(TARGET_DIR)/etc/init.d/S*avahi*
-	rm -f $(TARGET_DIR)/usr/sbin/avahi-*
+	-rm -rf $(TARGET_DIR)/etc/avahi
+	-rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
+	-rm -f $(TARGET_DIR)/etc/init.d/S*avahi*
+	-rm -f $(TARGET_DIR)/usr/sbin/avahi-*
+	-rm -f $(TARGET_DIR)/usr/bin/avahi-*
+	-rm -f $(TARGET_DIR)/usr/lib/libavahi-*
 
 avahi-dirclean:
 	rm -rf $(AVAHI_DIR)

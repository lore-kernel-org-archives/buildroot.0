From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Nov 2007 04:23:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20071126122314.2648830041@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-26 04:23:13 -0800 (Mon, 26 Nov 2007)
New Revision: 20542

Log:
Create target file at end of rule so it gets rerun on failure on any of the
sub steps (thanks Ulf).


Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-11-26 07:23:27 UTC (rev 20541)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-11-26 12:23:13 UTC (rev 20542)
@@ -147,32 +147,31 @@
 	touch $@
 
 $(TARGET_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.installed
-	cp $(STAGING_DIR)/usr/sbin/avahi-autoipd \
-		 $(TARGET_DIR)/usr/sbin/avahi-autoipd
 	mkdir -p $(TARGET_DIR)/etc/avahi
 	mkdir -p $(TARGET_DIR)/var/lib
-	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action $(TARGET_DIR)/etc/avahi/
 	cp -af $(BASE_DIR)/package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
-	cp -af $(BASE_DIR)/package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
+	cp -af $(BASE_DIR)/package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
+	cp $(STAGING_DIR)/usr/sbin/avahi-autoipd $(TARGET_DIR)/usr/sbin/avahi-autoipd
+	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 $(TARGET_DIR)/usr/sbin/avahi-daemon: $(AVAHI_DIR)/.installed
-	cp $(STAGING_DIR)/usr/sbin/avahi-daemon \
-		 $(TARGET_DIR)/usr/sbin/avahi-daemon
-	cp -dpf $(STAGING_DIR)/usr/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/etc/avahi/services
+	cp -dpf $(STAGING_DIR)/usr/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libavahi-*.so*
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-daemon.conf $(TARGET_DIR)/etc/avahi/
 	cp -af $(BASE_DIR)/package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libavahi-*.so*
 ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
 	cp -dpf $(STAGING_DIR)/usr/bin/avahi-* $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/avahi-*
 	cp -r $(STAGING_DIR)/etc/dbus-1/system.d/avahi-* \
 		$(TARGET_DIR)/etc/dbus-1/system.d/
 endif
+	cp $(STAGING_DIR)/usr/sbin/avahi-daemon \
+		 $(TARGET_DIR)/usr/sbin/avahi-daemon
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 avahi: uclibc busybox libdaemon $(AVAHI_TARGETS)
 

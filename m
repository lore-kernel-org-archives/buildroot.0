From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 15 Dec 2008 08:09:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20081215160904.029513C2C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-15 08:09:03 -0800 (Mon, 15 Dec 2008)
New Revision: 24419

Log:
avahi: make sure destination dirs exists

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-12-15 15:28:48 UTC (rev 24418)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-12-15 16:09:03 UTC (rev 24419)
@@ -151,20 +151,19 @@
 	touch $@
 
 $(TARGET_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.installed
-	mkdir -p $(TARGET_DIR)/etc/avahi
-	mkdir -p $(TARGET_DIR)/etc/init.d
-	mkdir -p $(TARGET_DIR)/var/lib
-	mkdir -p $(TARGET_DIR)/usr/share/udhcpc
+	mkdir -p $(addprefix $(TARGET_DIR),\
+		/etc/avahi /etc/init.d /var/lib /usr/share/udhcpc /usr/sbin)
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action $(TARGET_DIR)/etc/avahi/
 	cp -af package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
 	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
 	cp -af package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
-	cp $(STAGING_DIR)/usr/sbin/avahi-autoipd $(TARGET_DIR)/usr/sbin/avahi-autoipd
+	cp $(STAGING_DIR)/usr/sbin/avahi-autoipd $@
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 $(TARGET_DIR)/usr/sbin/avahi-daemon: $(AVAHI_DIR)/.installed
-	mkdir -p $(TARGET_DIR)/etc/avahi/services $(TARGET_DIR)/usr/lib
+	mkdir -p $(addprefix $(TARGET_DIR),\
+		/etc/avahi/services /usr/lib /usr/bin /usr/sbin)
 	cp -dpf $(STAGING_DIR)/usr/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libavahi-*.so*
 	cp -af $(STAGING_DIR)/etc/avahi/avahi-daemon.conf $(TARGET_DIR)/etc/avahi/
@@ -176,8 +175,7 @@
 	cp -r $(STAGING_DIR)/etc/dbus-1/system.d/avahi-* \
 		$(TARGET_DIR)/etc/dbus-1/system.d/
 endif
-	cp $(STAGING_DIR)/usr/sbin/avahi-daemon \
-		 $(TARGET_DIR)/usr/sbin/avahi-daemon
+	cp $(STAGING_DIR)/usr/sbin/avahi-daemon $@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 avahi: host-autoconf uclibc libdaemon $(if $(BR2_ENABLE_LOCALE),gettext libintl) $(AVAHI_TARGETS)

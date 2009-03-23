From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 09:44:08 +0000 (UTC)
Subject: [Buildroot] svn commit: [25790] trunk/buildroot/package/dbus
Message-ID: <20090323094408.449C67656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 09:44:07 +0000 (Mon, 23 Mar 2009)
New Revision: 25790

Log:
dbus: fix for read-only rootfs

Similar to how it's handled by avahi - Make sure /var/lib/dbus is a
symlink to /tmp/dbus.

Modified:
   trunk/buildroot/package/dbus/S30dbus
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/S30dbus
===================================================================
--- trunk/buildroot/package/dbus/S30dbus	2009-03-23 08:44:02 UTC (rev 25789)
+++ trunk/buildroot/package/dbus/S30dbus	2009-03-23 09:44:07 UTC (rev 25790)
@@ -16,6 +16,7 @@
 # Create needed directories.
 [ -d /var/run/dbus ] || mkdir -p /var/run/dbus
 [ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
+[ -d /tmp/dbus ] || mkdir -p /tmp/dbus
 
 RETVAL=0
 

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-03-23 08:44:02 UTC (rev 25789)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-03-23 09:44:07 UTC (rev 25790)
@@ -52,6 +52,8 @@
 
 $(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
+	rm -rf $(TARGET_DIR)/var/lib/dbus
+	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
 	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
 	touch $@
 

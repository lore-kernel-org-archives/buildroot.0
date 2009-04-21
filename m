From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 21 Apr 2009 15:10:39 +0000 (UTC)
Subject: [Buildroot] svn commit: [26175] trunk/buildroot/package/dbus
Message-ID: <20090421151039.EDDE277137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-21 15:10:39 +0000 (Tue, 21 Apr 2009)
New Revision: 26175

Log:
dbus: fix rebuild if /var/lib is a symlink to /tmp for target

/tmp/dbus will end up being a recursive symlink to itself on the build host.

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-04-21 11:23:56 UTC (rev 26174)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-04-21 15:10:39 UTC (rev 26175)
@@ -50,6 +50,11 @@
 
 $(eval $(call AUTOTARGETS,package,dbus))
 
+# fix rebuild if /var/lib is a symlink to /tmp
+$(DBUS_HOOK_POST_BUILD): $(DBUS_TARGET_BUILD)
+	rm -rf /tmp/dbus
+	touch $@
+
 $(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
 	rm -rf $(TARGET_DIR)/var/lib/dbus

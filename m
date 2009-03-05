From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 19:00:18 +0000 (UTC)
Subject: [Buildroot] svn commit: [25555] trunk/buildroot/package/logrotate
Message-ID: <20090305190018.85BAD76465@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 19:00:17 +0000 (Thu, 05 Mar 2009)
New Revision: 25555

Log:
logrotate: only install logrotate.conf if not present in target_skeleton

Allow platforms to provide a custom logrotate.conf in their target_skeleton.

Modified:
   trunk/buildroot/package/logrotate/logrotate.mk


Changeset:
Modified: trunk/buildroot/package/logrotate/logrotate.mk
===================================================================
--- trunk/buildroot/package/logrotate/logrotate.mk	2009-03-05 19:00:11 UTC (rev 25554)
+++ trunk/buildroot/package/logrotate/logrotate.mk	2009-03-05 19:00:17 UTC (rev 25555)
@@ -18,7 +18,9 @@
 
 $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY): $(LOGROTATE_DIR)/$(LOGROTATE_BINARY)
 	$(MAKE) PREFIX=$(TARGET_DIR) -C $(LOGROTATE_DIR) install
-	$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf
+	if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then
+		$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf;
+	fi
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 
 logrotate: popt $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)

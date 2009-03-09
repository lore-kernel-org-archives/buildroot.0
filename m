From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Mar 2009 14:09:25 +0000 (UTC)
Subject: [Buildroot] svn commit: [25587] trunk/buildroot/package/sysklogd
Message-ID: <20090309140925.C3280764AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-09 14:09:25 +0000 (Mon, 09 Mar 2009)
New Revision: 25587

Log:
sysklogd: only install init script / config file if not present in skeleton

Allow platforms to provide a custom initscript / syslog.conf in their
target_skeleton.

Modified:
   trunk/buildroot/package/sysklogd/sysklogd.mk


Changeset:
Modified: trunk/buildroot/package/sysklogd/sysklogd.mk
===================================================================
--- trunk/buildroot/package/sysklogd/sysklogd.mk	2009-03-09 14:09:20 UTC (rev 25586)
+++ trunk/buildroot/package/sysklogd/sysklogd.mk	2009-03-09 14:09:25 UTC (rev 25587)
@@ -32,8 +32,12 @@
 $(TARGET_DIR)/$(SYSKLOGD_TARGET_BINARY): $(SYSKLOGD_DIR)/$(SYSKLOGD_BINARY)
 	$(INSTALL) -m 0755 -D $(SYSKLOGD_DIR)/$(SYSKLOGD_SYSLOGD_BINARY) $(TARGET_DIR)/$(SYSKLOGD_SYSLOGD_TARGET_BINARY)
 	$(INSTALL) -m 0755 -D $(SYSKLOGD_DIR)/$(SYSKLOGD_KLOGD_BINARY) $(TARGET_DIR)/$(SYSKLOGD_KLOGD_TARGET_BINARY)
-	$(INSTALL) -m 0755 -D package/sysklogd/S25syslog $(TARGET_DIR)/etc/init.d
-	$(INSTALL) -m 0644 -D package/sysklogd/syslog.conf $(TARGET_DIR)/etc/syslog.conf
+	if [ ! -f $(TARGET_DIR)/etc/init.d/S25syslog ]; then \
+		$(INSTALL) -m 0755 -D package/sysklogd/S25syslog $(TARGET_DIR)/etc/init.d; \
+	fi
+	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
+		$(INSTALL) -m 0644 -D package/sysklogd/syslog.conf $(TARGET_DIR)/etc/syslog.conf; \
+	fi
 
 sysklogd: uclibc $(TARGET_DIR)/$(SYSKLOGD_TARGET_BINARY)
 

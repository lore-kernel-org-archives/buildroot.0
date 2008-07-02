From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  2 Jul 2008 00:20:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ifplugd
Message-ID: <20080702072017.7DBCC3C6FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-02 00:20:16 -0700 (Wed, 02 Jul 2008)
New Revision: 22606

Log:
ifplugd: only install default config if not provided in skeleton

Modified:
   trunk/buildroot/package/ifplugd/ifplugd.mk


Changeset:
Modified: trunk/buildroot/package/ifplugd/ifplugd.mk
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd.mk	2008-07-02 00:17:21 UTC (rev 22605)
+++ trunk/buildroot/package/ifplugd/ifplugd.mk	2008-07-02 07:20:16 UTC (rev 22606)
@@ -18,12 +18,13 @@
 
 $(IFPLUGD_HOOK_POST_INSTALL):
 	$(INSTALL) -d $(TARGET_DIR)/etc/ifplugd
-	$(INSTALL) $(IFPLUGD_DIR)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/
+	@if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
+		$(INSTALL) $(IFPLUGD_DIR)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/; \
+		$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
+	fi
 	$(INSTALL) -m 0755 $(IFPLUGD_DIR)/conf/ifplugd.action \
 		$(TARGET_DIR)/etc/ifplugd/
 	$(INSTALL) -m 0755 $(IFPLUGD_DIR)/conf/ifplugd.init \
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
-	# continue booting without waiting for fork (no -w option)
-	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf
 	# don't use bash for init script
 	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd

From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Tue,  7 Oct 2008 10:08:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/logrotate
Message-ID: <20081007170826.2B7FCF801A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-07 10:08:25 -0700 (Tue, 07 Oct 2008)
New Revision: 23619

Log:
logrotate: remove duplicate deps.  Clean up '/etc'
 on make clean.  Some other syntactic niceties.

Modified:
   trunk/buildroot/package/logrotate/logrotate.mk


Changeset:
Modified: trunk/buildroot/package/logrotate/logrotate.mk
===================================================================
--- trunk/buildroot/package/logrotate/logrotate.mk	2008-10-07 17:00:58 UTC (rev 23618)
+++ trunk/buildroot/package/logrotate/logrotate.mk	2008-10-07 17:08:25 UTC (rev 23619)
@@ -21,18 +21,20 @@
 	$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 
-logrotate: uclibc busybox popt $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
+logrotate: popt $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
 
 logrotate-source: $(DL_DIR)/$(LOGROTATE_SOURCE)
 
 logrotate-clean:
 	rm -f $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/etc/logrotate.conf
+	-rmdir $(TARGET_DIR)/etc/logrotate.d
 	-$(MAKE) -C $(LOGROTATE_DIR) clean
 
 logrotate-dirclean:
-	rm -Rf $(LOGROTATE_DIR)
+	rm -rf $(LOGROTATE_DIR)
 
-ifeq ($(strip $(BR2_PACKAGE_LOGROTATE)),y)
+ifeq ($(BR2_PACKAGE_LOGROTATE),y)
 TARGETS+=logrotate
 endif
 

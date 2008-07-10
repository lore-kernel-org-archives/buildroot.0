From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 01:17:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ifplugd
Message-ID: <20080710081740.6782D3C799@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 01:17:39 -0700 (Thu, 10 Jul 2008)
New Revision: 22738

Log:
ifplugd: only run post-install hook when needed

Modified:
   trunk/buildroot/package/ifplugd/ifplugd.mk


Changeset:
Modified: trunk/buildroot/package/ifplugd/ifplugd.mk
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd.mk	2008-07-10 08:17:35 UTC (rev 22737)
+++ trunk/buildroot/package/ifplugd/ifplugd.mk	2008-07-10 08:17:39 UTC (rev 22738)
@@ -16,7 +16,7 @@
 
 $(eval $(call AUTOTARGETS,package,ifplugd))
 
-$(IFPLUGD_HOOK_POST_INSTALL):
+$(IFPLUGD_HOOK_POST_INSTALL): $(IFPLUGD_TARGET_INSTALL_TARGET)
 	$(INSTALL) -d $(TARGET_DIR)/etc/ifplugd
 	@if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
 		$(INSTALL) $(IFPLUGD_DIR)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/; \
@@ -28,3 +28,4 @@
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
 	# don't use bash for init script
 	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd
+	touch $@
\ No newline at end of file

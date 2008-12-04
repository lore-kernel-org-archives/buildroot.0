From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  4 Dec 2008 04:14:57 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ifplugd
Message-ID: <20081204121457.F2C073C586@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-04 04:14:57 -0800 (Thu, 04 Dec 2008)
New Revision: 24258

Log:
ifplugd: don't overwrite target etc/init.d/ifplugd.*

install-strip unconditionally overwrites $(TARGET_DIR)/etc/init.d/ifplugd.*,
so the check in _HOOK_POST_INSTALL is useless.

Fix it by using install-exec and manually stripping the target binaries
instead.

Modified:
   trunk/buildroot/package/ifplugd/ifplugd.mk


Changeset:
Modified: trunk/buildroot/package/ifplugd/ifplugd.mk
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd.mk	2008-12-04 12:05:26 UTC (rev 24257)
+++ trunk/buildroot/package/ifplugd/ifplugd.mk	2008-12-04 12:14:57 UTC (rev 24258)
@@ -9,6 +9,8 @@
 IFPLUGD_AUTORECONF = NO
 IFPLUGD_INSTALL_STAGING = NO
 IFPLUGD_INSTALL_TARGET = YES
+# install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
+IFPLUGD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
 
 IFPLUGD_CONF_OPT = --disable-lynx
 
@@ -17,6 +19,8 @@
 $(eval $(call AUTOTARGETS,package,ifplugd))
 
 $(IFPLUGD_HOOK_POST_INSTALL): $(IFPLUGD_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/ifplugd
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/ifplugstatus
 	$(INSTALL) -d $(TARGET_DIR)/etc/ifplugd
 	@if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
 		$(INSTALL) $(IFPLUGD_DIR)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/; \

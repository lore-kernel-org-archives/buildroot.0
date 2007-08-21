From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 10:00:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/at
Message-ID: <20070821170018.8E5EAA470F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 10:00:18 -0700 (Tue, 21 Aug 2007)
New Revision: 19622

Log:
- honour BR2_HAVE_MANPAGES


Modified:
   trunk/buildroot/package/at/at.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-08-21 16:51:46 UTC (rev 19621)
+++ trunk/buildroot/package/at/at.mk	2007-08-21 17:00:18 UTC (rev 19622)
@@ -48,9 +48,12 @@
 $(TARGET_DIR)/$(AT_TARGET_SCRIPT): $(AT_DIR)/$(AT_BINARY)
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root ' \
-		'$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install' \
+	 '$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install' \
 		> $(PROJECT_BUILD_DIR)/.fakeroot.at
-	echo 'rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/doc/at' >> $(PROJECT_BUILD_DIR)/.fakeroot.at
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	echo 'rm -rf $(TARGET_DIR)/usr/man' >> $(PROJECT_BUILD_DIR)/.fakeroot.at
+endif
+	echo 'rm -rf $(TARGET_DIR)/usr/doc/at' >> $(PROJECT_BUILD_DIR)/.fakeroot.at
 	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/$(AT_TARGET_SCRIPT)
 
 at: uclibc host-fakeroot $(TARGET_DIR)/$(AT_TARGET_SCRIPT)

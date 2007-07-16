From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 01:12:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/at
Message-ID: <20070716081216.64627A5E1B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 01:12:15 -0700 (Mon, 16 Jul 2007)
New Revision: 19106

Log:
Get rid of repeated rebuild of 'at'

Modified:
   trunk/buildroot/package/at/at.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-07-16 07:55:50 UTC (rev 19105)
+++ trunk/buildroot/package/at/at.mk	2007-07-16 08:12:15 UTC (rev 19106)
@@ -8,8 +8,8 @@
 AT_SITE:=http://ftp.debian.org/debian/pool/main/a/at
 AT_DIR:=$(BUILD_DIR)/at-$(AT_VERSION)
 AT_CAT:=$(ZCAT)
-AT_TARGET_BINARY:=usr/bin/at
-AT_BINARY:=at
+AT_TARGET_SCRIPT:=etc/init.d/S99at
+AT_BINARY:=.at
 
 $(DL_DIR)/$(AT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AT_SITE)/$(AT_SOURCE)
@@ -43,22 +43,21 @@
 
 $(AT_DIR)/$(AT_BINARY): $(AT_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(AT_DIR)
-	touch -c $(AT_DIR)/$(AT_BINARY)
+	touch $@
 
-$(TARGET_DIR)/$(AT_TARGET_BINARY): $(AT_DIR)/$(AT_BINARY)
+$(TARGET_DIR)/$(AT_TARGET_SCRIPT): $(AT_DIR)/$(AT_BINARY)
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root ' \
 		'$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install' \
 		> $(STAGING_DIR)/.fakeroot.at
 	echo 'rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/doc/at' >> $(STAGING_DIR)/.fakeroot.at
-	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/etc/init.d/S99at
-	touch -c $(TARGET_DIR)/$(AT_TARGET_BINARY)
+	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/$(AT_TARGET_SCRIPT)
 
-at: uclibc host-fakeroot $(TARGET_DIR)/$(AT_TARGET_BINARY)
+at: uclibc host-fakeroot $(TARGET_DIR)/$(AT_TARGET_SCRIPT)
 
 at-clean:
 	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(AT_DIR) uninstall
-	rm -f $(TARGET_DIR)/$(AT_TARGET_BINARY) $(TARGET_DIR)/etc/init.d/S99at
+	rm -f $(TARGET_DIR)/$(AT_TARGET_SCRIPT) $(TARGET_DIR)/etc/init.d/S99at
 	-$(MAKE) -C $(AT_DIR) clean
 
 at-dirclean:

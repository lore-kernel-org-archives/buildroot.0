From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  1 Apr 2009 20:52:41 +0000 (UTC)
Subject: [Buildroot] svn commit: [25924] trunk/buildroot/package/ncftp
Message-ID: <20090401205241.8940677673@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-01 20:52:41 +0000 (Wed, 01 Apr 2009)
New Revision: 25924

Log:
ncftp: convert to Makefile.autotools.in

- ncftpspooler is just a link to ncftpbatch
- only ncftpbookmarks needs ncurses, also change from "depends" to "select"

[ Peter: Small cleanups ]

Modified:
   trunk/buildroot/package/ncftp/Config.in
   trunk/buildroot/package/ncftp/ncftp.mk


Changeset:
Modified: trunk/buildroot/package/ncftp/Config.in
===================================================================
--- trunk/buildroot/package/ncftp/Config.in	2009-04-01 19:48:05 UTC (rev 25923)
+++ trunk/buildroot/package/ncftp/Config.in	2009-04-01 20:52:41 UTC (rev 25924)
@@ -25,18 +25,13 @@
 	depends on BR2_PACKAGE_NCFTP
 
 config BR2_PACKAGE_NCFTP_BATCH
-	bool "NcFTPBatch - background FTP program for individual users"
+	bool "NcFTPBatch & NcFTPSpooler - background FTP program for individual users"
 	default y
 	depends on BR2_PACKAGE_NCFTP
 
-config BR2_PACKAGE_NCFTP_SPOOLER
-	bool "NcFTPSpooler - spooler - not working properly"
-	depends on BR2_PACKAGE_NCFTP
-	depends on BR2_PACKAGE_NCURSES
-
 config BR2_PACKAGE_NCFTP_BOOKMARKS
-	bool "NcFTPBookmarks"
+	bool "NcFTPBookmarks - ncurses based Bookmark Editor"
 	depends on BR2_PACKAGE_NCFTP
-	depends on BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES
 
 endmenu

Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2009-04-01 19:48:05 UTC (rev 25923)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2009-04-01 20:52:41 UTC (rev 25924)
@@ -6,7 +6,6 @@
 NCFTP_VERSION:=3.2.2
 NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
 NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
-NCFTP_DIR:=$(BUILD_DIR)/ncftp-$(NCFTP_VERSION)
 
 NCFTP_TARGET_BINS:=ncftp
 
@@ -26,63 +25,25 @@
 NCFTP_TARGET_BINS+=ncftpbatch
 endif
 
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-ifeq ($(BR2_PACKAGE_NCFTP_SPOOLER),y)
-#Someone needs to figure out what to do...
-NCFTP_TARGET_BINS+=
-endif
-
-# only set if NCURSES is available
 ifeq ($(BR2_PACKAGE_NCFTP_BOOKMARKS),y)
 NCFTP_TARGET_BINS+=ncftpbookmarks
+NCFTP_DEPENDENCIES:=ncurses
 endif
 
-NCFTP_DEPS += ncurses
-endif
+$(eval $(call AUTOTARGETS,package,ncftp))
 
-ncftp-source: $(DL_DIR)/$(NCFTP_SOURCE)
-
-$(DL_DIR)/$(NCFTP_SOURCE):
-	$(call DOWNLOAD,$(NCFTP_SITE),$(NCFTP_SOURCE))
-
-$(NCFTP_DIR)/.source: $(DL_DIR)/$(NCFTP_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(NCFTP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+$(NCFTP_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing to target")
+	$(INSTALL) -m 0755 $(addprefix $(NCFTP_DIR)/bin/, $(NCFTP_TARGET_BINS)) $(TARGET_DIR)/usr/bin
+ifeq ($(BR2_PACKAGE_NCFTP_BATCH),y)
+	ln -s /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
+endif
+ifeq ($(BR2_ENABLE_DEBUG),)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
+endif
 	touch $@
 
-$(NCFTP_DIR)/.configured: $(NCFTP_DIR)/.source
-	(cd $(NCFTP_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-	)
-	touch $@
-
-$(NCFTP_DIR)/bin/%: $(NCFTP_DIR)/.configured
-	$(MAKE) -C $(NCFTP_DIR)
-
-$(TARGET_DIR)/usr/bin/ncftp $(TARGET_DIR)/usr/bin/ncftp%: $(addprefix $(NCFTP_DIR)/bin/, $(NCFTP_TARGET_BINS))
-	$(INSTALL) -m 0755 $(NCFTP_DIR)/bin/$(notdir $@) $(TARGET_DIR)/usr/bin
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-ncftp: uclibc $(NCFTP_DEPS) $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
-
-ncftp-clean:
-	-$(MAKE) -C $(NCFTP_DIR) clean
-	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
-
-ncftp-dirclean:
-	rm -rf $(NCFTP_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NCFTP),y)
-TARGETS+=ncftp
-endif
+$(NCFTP_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS) ncftpspooler)
+	rm -f $(NCFTP_TARGET_INSTALL_TARGET)

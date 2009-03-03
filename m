From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:25 +0100
Subject: [Buildroot] ncftp: convert to Makefile.autotools.in
In-Reply-To: <1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
References: <> <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
Message-ID: <1236077910-15674-4-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- ncftpspooler is just a link to ncftpbatch
- only ncftpbookmarks needs ncurses, also change from "depends" to "select"
---
 package/ncftp/Config.in |   11 ++-----
 package/ncftp/ncftp.mk  |   69 +++++++++++-----------------------------------
 2 files changed, 20 insertions(+), 60 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 8025c05..e1e4e56 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -25,18 +25,13 @@ config BR2_PACKAGE_NCFTP_LS
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
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 4a4a9a6..5f30f08 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -6,7 +6,6 @@
 NCFTP_VERSION:=3.2.2
 NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
 NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
-NCFTP_DIR:=$(BUILD_DIR)/ncftp-$(NCFTP_VERSION)
 
 NCFTP_TARGET_BINS:=ncftp
 
@@ -26,63 +25,29 @@ ifeq ($(BR2_PACKAGE_NCFTP_BATCH),y)
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
-
-ncftp-source: $(DL_DIR)/$(NCFTP_SOURCE)
-
-$(DL_DIR)/$(NCFTP_SOURCE):
-	$(call DOWNLOAD,$(NCFTP_SITE),$(NCFTP_SOURCE))
+$(eval $(call AUTOTARGETS,package,ncftp))
 
-$(NCFTP_DIR)/.source: $(DL_DIR)/$(NCFTP_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(NCFTP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+$(NCFTP_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing to target")
+	$(INSTALL) -m 0755 $(addprefix $(NCFTP_DIR)/bin/, $(NCFTP_TARGET_BINS)) $(TARGET_DIR)/usr/bin
+ifeq ($(BR2_PACKAGE_NCFTP_BATCH),y)
+	ln -s /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
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
+ifeq ($(BR2_ENABLE_DEBUG),)
+$(NCFTP_HOOK_POST_INSTALL): $(NCFTP_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
 	touch $@
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
 endif
+
+$(NCFTP_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
+	-unlink $(TARGET_DIR)/usr/bin/ncftpspooler
+	rm -f $(NCFTP_TARGET_INSTALL_TARGET) $(NCFTP_HOOK_POST_INSTALL)
-- 
1.5.4.3

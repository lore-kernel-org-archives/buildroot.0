From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 08:18:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncftp
Message-ID: <20090125081836.3DB9676D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 08:18:35 +0000 (Sun, 25 Jan 2009)
New Revision: 25013

Log:
Part of NcFTP depends on ncurses, create dependencies, if needed

Modified:
   trunk/buildroot/package/ncftp/Config.in
   trunk/buildroot/package/ncftp/ncftp.mk


Changeset:
Modified: trunk/buildroot/package/ncftp/Config.in
===================================================================
--- trunk/buildroot/package/ncftp/Config.in	2009-01-25 08:16:53 UTC (rev 25012)
+++ trunk/buildroot/package/ncftp/Config.in	2009-01-25 08:18:35 UTC (rev 25013)
@@ -30,11 +30,13 @@
 	depends on BR2_PACKAGE_NCFTP
 
 config BR2_PACKAGE_NCFTP_SPOOLER
-	bool "NcFTPSpooler - spooler - not working properly"
+	bool "NcFTPSpooler - spooler"
 	depends on BR2_PACKAGE_NCFTP
+	depends on BR2_PACKAGE_NCURSES
 
 config BR2_PACKAGE_NCFTP_BOOKMARKS
-	bool "NcFTPBookmarks - not working properly"
+	bool "NcFTPBookmarks"
 	depends on BR2_PACKAGE_NCFTP
+	depends on BR2_PACKAGE_NCURSES
 
 endmenu

Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2009-01-25 08:16:53 UTC (rev 25012)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2009-01-25 08:18:35 UTC (rev 25013)
@@ -26,15 +26,20 @@
 NCFTP_TARGET_BINS+=ncftpbatch
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
 ifeq ($(BR2_PACKAGE_NCFTP_SPOOLER),y)
 #Someone needs to figure out what to do...
 NCFTP_TARGET_BINS+=
 endif
 
+# only set if NCURSES is available
 ifeq ($(BR2_PACKAGE_NCFTP_BOOKMARKS),y)
 NCFTP_TARGET_BINS+=ncftpbookmarks
 endif
 
+NCFTP_DEPS += ncurses
+endif
+
 ncftp-source: $(DL_DIR)/$(NCFTP_SOURCE)
 
 $(DL_DIR)/$(NCFTP_SOURCE):
@@ -64,7 +69,7 @@
 	$(INSTALL) -m 0755 $(NCFTP_DIR)/bin/$(notdir $@) $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
-ncftp: uclibc $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
+ncftp: uclibc $(NCFTP_DEPS) $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
 
 ncftp-clean:
 	-$(MAKE) -C $(NCFTP_DIR) clean

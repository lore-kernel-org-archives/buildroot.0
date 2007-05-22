From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 May 2007 04:59:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  ncftp
Message-ID: <20070522115922.44C3848597@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-22 04:59:22 -0700 (Tue, 22 May 2007)
New Revision: 18668

Log:
ncftp package. Patch from #1355

Added:
   trunk/buildroot/package/ncftp/
   trunk/buildroot/package/ncftp/Config.in
   trunk/buildroot/package/ncftp/ncftp.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-05-22 11:17:27 UTC (rev 18667)
+++ trunk/buildroot/package/Config.in	2007-05-22 11:59:22 UTC (rev 18668)
@@ -145,6 +145,7 @@
 source "package/lrzsz/Config.in"
 source "package/mrouted/Config.in"
 source "package/nbd/Config.in"
+source "package/ncftp/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/netcat/Config.in"
 endif

Added: trunk/buildroot/package/ncftp/Config.in
===================================================================
--- trunk/buildroot/package/ncftp/Config.in	                        (rev 0)
+++ trunk/buildroot/package/ncftp/Config.in	2007-05-22 11:59:22 UTC (rev 18668)
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_NCFTP
+	bool "ncftp"
+	default n
+	help
+	  NcFTP Client (also known as just NcFTP) is a set of FREE application
+	  programs implementing the File Transfer Protocol (FTP).
+
+	  http://www.ncftp.com/ncftp/
+
+config BR2_PACKAGE_NCFTP_UTILS
+	bool "install utils (ncftpput, ncftpget, ncftpls)"
+	default n
+	depends on BR2_PACKAGE_NCFTP
+	help
+	  This will also install:
+	  - NcFTPGet - command-line utility program
+	  - NcFTPPut - command-line utility program
+	  - NcFTPLs - command-line utility program
+	  - NcFTPBatch - background FTP program for individual users
+	  - NcFTPSpooler - background batch FTP service for systems

Added: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	                        (rev 0)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2007-05-22 11:59:22 UTC (rev 18668)
@@ -0,0 +1,61 @@
+#############################################################
+#
+# ncftp client
+#
+#############################################################
+NCFTP_VERSION:=3.2.0
+NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
+NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
+NCFTP_DIR:=$(BUILD_DIR)/ncftp-$(NCFTP_VERSION)
+
+NCFTP_TARGET_BINS:=ncftp
+
+ifeq ($(strip $(BR2_PACKAGE_NCFTP_UTILS)),y)
+NCFTP_TARGET_BINS+=ncftpbatch ncftpbookmarks ncftpget ncftpls ncftpput
+endif
+
+ncftp-source: $(DL_DIR)/$(NCFTP_SOURCE)
+
+$(DL_DIR)/$(NCFTP_SOURCE):
+	$(WGET) -P $(DL_DIR) $(NCFTP_SITE)/$(NCFTP_SOURCE)
+
+$(NCFTP_DIR)/.source: $(DL_DIR)/$(NCFTP_SOURCE)
+	bzcat $(DL_DIR)/$(NCFTP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(NCFTP_DIR)/.configured: $(NCFTP_DIR)/.source
+	(cd $(NCFTP_DIR); \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+	);
+	touch $@
+
+$(NCFTP_DIR)/bin/%: $(NCFTP_DIR)/.configured
+	$(MAKE) -C $(NCFTP_DIR)
+
+$(TARGET_DIR)/usr/bin/ncftp $(TARGET_DIR)/usr/bin/ncftp%: $(addprefix $(NCFTP_DIR)/bin/, $(NCFTP_TARGET_BINS))
+	$(INSTALL) -m 0755 $(NCFTP_DIR)/bin/$(notdir $@) $(TARGET_DIR)/usr/bin
+
+ncftp: uclibc $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
+
+ncftp-clean:
+	$(MAKE) -C $(NCFTP_DIR) clean
+	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
+
+ncftp-dirclean:
+	rm -rf $(NCFTP_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_NCFTP)),y)
+TARGETS+=ncftp
+endif

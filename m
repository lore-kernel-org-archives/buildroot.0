From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 23:37:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncftp
Message-ID: <20071031063744.0C1CAA65C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 23:37:44 -0700 (Tue, 30 Oct 2007)
New Revision: 20345

Log:
Improve config for nCFTP

Modified:
   trunk/buildroot/package/ncftp/Config.in
   trunk/buildroot/package/ncftp/ncftp.mk


Changeset:
Modified: trunk/buildroot/package/ncftp/Config.in
===================================================================
--- trunk/buildroot/package/ncftp/Config.in	2007-10-31 06:36:04 UTC (rev 20344)
+++ trunk/buildroot/package/ncftp/Config.in	2007-10-31 06:37:44 UTC (rev 20345)
@@ -7,14 +7,37 @@
 
 	  http://www.ncftp.com/ncftp/
 
-config BR2_PACKAGE_NCFTP_UTILS
-	bool "install utils (ncftpput, ncftpget, ncftpls)"
+menu "ncFTP tools selection"
+	depends BR2_PACKAGE_NCFTP
+
+config BR2_PACKAGE_NCFTP_GET
+	bool "NcFTPGet - command-line utility program"
+	default y
+	depends BR2_PACKAGE_NCFTP
+
+config BR2_PACKAGE_NCFTP_PUT
+	bool "NcFTPPut - command-line utility program"
+	default y
+	depends BR2_PACKAGE_NCFTP
+
+config BR2_PACKAGE_NCFTP_LS
+	bool "NcFTPLs - command-line utility program"
+	default y
+	depends BR2_PACKAGE_NCFTP
+
+config BR2_PACKAGE_NCFTP_BATCH
+	bool "NcFTPBatch - background FTP program for individual users"
+	default y
+	depends BR2_PACKAGE_NCFTP
+
+config BR2_PACKAGE_NCFTP_SPOOLER
+	bool "NcFTPSpooler - spooler - not working properly"
 	default n
-	depends on BR2_PACKAGE_NCFTP
-	help
-	  This will also install:
-	  - NcFTPGet - command-line utility program
-	  - NcFTPPut - command-line utility program
-	  - NcFTPLs - command-line utility program
-	  - NcFTPBatch - background FTP program for individual users
-	  - NcFTPSpooler - background batch FTP service for systems
+	depends BR2_PACKAGE_NCFTP
+
+config BR2_PACKAGE_NCFTP_BOOKMARKS
+	bool "NcFTPBookmarks - not working properly"
+	default n
+	depends BR2_PACKAGE_NCFTP
+
+endmenu

Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2007-10-31 06:36:04 UTC (rev 20344)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2007-10-31 06:37:44 UTC (rev 20345)
@@ -10,10 +10,31 @@
 
 NCFTP_TARGET_BINS:=ncftp
 
-ifeq ($(strip $(BR2_PACKAGE_NCFTP_UTILS)),y)
-NCFTP_TARGET_BINS+=ncftpbatch ncftpbookmarks ncftpget ncftpls ncftpput
+ifeq ($(strip $(BR2_PACKAGE_NCFTP_GET)),y)
+NCFTP_TARGET_BINS+=ncftpget
 endif
 
+ifeq ($(strip $(BR2_PACKAGE_NCFTP_PUT)),y)
+NCFTP_TARGET_BINS+=ncftpput
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_NCFTP_LS)),y)
+NCFTP_TARGET_BINS+=ncftpls
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_NCFTP_BATCH)),y)
+NCFTP_TARGET_BINS+=ncftpbatch
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_NCFTP_SPOOLER)),y)
+#Someone needs to figure out what to do...
+NCFTP_TARGET_BINS+=
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_NCFTP_BOOKMARKS)),y)
+NCFTP_TARGET_BINS+=ncftpbookmarks
+endif
+
 ncftp-source: $(DL_DIR)/$(NCFTP_SOURCE)
 
 $(DL_DIR)/$(NCFTP_SOURCE):

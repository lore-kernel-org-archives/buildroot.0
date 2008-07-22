From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 12:47:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  vsftpd
Message-ID: <20080722194741.76AD23C860@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-22 12:47:41 -0700 (Tue, 22 Jul 2008)
New Revision: 22921

Log:
vsftp: enable and fix linking

Patch by Wade Berrier.

It still errors out on sysdeputil.c for me, but this is no worse than
it was before, so committing.

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/vsftpd/vsftpd.mk


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-07-22 19:38:57 UTC (rev 22920)
+++ trunk/buildroot/package/Config.in	2008-07-22 19:47:41 UTC (rev 22921)
@@ -227,6 +227,7 @@
 #endif
 source "package/udpcast/Config.in"
 source "package/vpnc/Config.in"
+source "package/vsftpd/Config.in"
 source "package/vtun/Config.in"
 source "package/webif/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS

Modified: trunk/buildroot/package/vsftpd/vsftpd.mk
===================================================================
--- trunk/buildroot/package/vsftpd/vsftpd.mk	2008-07-22 19:38:57 UTC (rev 22920)
+++ trunk/buildroot/package/vsftpd/vsftpd.mk	2008-07-22 19:47:41 UTC (rev 22921)
@@ -9,9 +9,13 @@
 VSFTPD_DIR:=$(BUILD_DIR)/vsftpd-$(VSFTPD_VERSION)
 VSFTPD_CAT:=$(ZCAT)
 VSFTPD_BINARY:=vsftpd
+VSFTPD_TARGET_BINARY:=usr/sbin/vsftpd
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 VSFTPF_PREREQ:=openssl
+VSFTPD_LIBS:=-lcrypt -lssl
+else
+VSFTPD_LIBS:=-lcrypt
 endif
 ifeq ($(BR2_LARGEFILE),)
 #BR2_VSFTPD_CFLAGS:=-U_LARGEFILE64_SOURCE -U_FILE_OFFSET_BITS
@@ -45,7 +49,7 @@
 
 
 $(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPF_PREREQ) $(VSFTPD_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) $(BR2_VSFTPD_CFLAGS)" -C $(VSFTPD_DIR)
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) $(BR2_VSFTPD_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)
 
 $(TARGET_DIR)/usr/sbin/$(VSFTPD_BINARY): $(VSFTPD_DIR)/$(VSFTPD_BINARY)
 	cp -dpf $< $@

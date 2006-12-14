From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 06:23:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  vsftpd
Message-ID: <20061214142351.244B648579@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 06:23:50 -0800 (Thu, 14 Dec 2006)
New Revision: 16920

Log:
- Add skeleton for vsftpd, an FTP daemon.
  sysdeputil needs treatment, perhaps it get's Claudio Leonel started


Added:
   trunk/buildroot/package/vsftpd/
   trunk/buildroot/package/vsftpd/Config.in
   trunk/buildroot/package/vsftpd/vsftpd-2.0.5-uclibc_lfs.patch
   trunk/buildroot/package/vsftpd/vsftpd.mk


Changeset:
Added: trunk/buildroot/package/vsftpd/Config.in
===================================================================
--- trunk/buildroot/package/vsftpd/Config.in	2006-12-14 11:27:58 UTC (rev 16919)
+++ trunk/buildroot/package/vsftpd/Config.in	2006-12-14 14:23:50 UTC (rev 16920)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_VSFTPD
+        bool "vsftpd"
+        default n
+        help
+	  vsftpd is an ftp daemon written with security in mind.
+          http://vsftpd.beasts.org/
+

Added: trunk/buildroot/package/vsftpd/vsftpd-2.0.5-uclibc_lfs.patch
===================================================================
--- trunk/buildroot/package/vsftpd/vsftpd-2.0.5-uclibc_lfs.patch	2006-12-14 11:27:58 UTC (rev 16919)
+++ trunk/buildroot/package/vsftpd/vsftpd-2.0.5-uclibc_lfs.patch	2006-12-14 14:23:50 UTC (rev 16920)
@@ -0,0 +1,19 @@
+diff -rdup vsftpd-2.0.5.orig/sysutil.c vsftpd-2.0.5/sysutil.c
+--- vsftpd-2.0.5.orig/sysutil.c	2006-07-03 18:26:40.000000000 +0200
++++ vsftpd-2.0.5/sysutil.c	2006-12-14 15:13:15.000000000 +0100
+@@ -16,11 +16,15 @@
+ #include "utility.h"
+ #include "tunables.h"
+ 
++#include "builddefs.h"
++
++#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
+ /* Activate 64-bit file support on Linux/32bit plus others */
+ #define _FILE_OFFSET_BITS 64
+ #define _LARGEFILE_SOURCE 1
+ #define _LARGEFILE64_SOURCE 1
+ #define _LARGE_FILES 1
++#endif
+ 
+ /* For Linux, this adds nothing :-) */
+ #include "port/porting_junk.h"

Added: trunk/buildroot/package/vsftpd/vsftpd.mk
===================================================================
--- trunk/buildroot/package/vsftpd/vsftpd.mk	2006-12-14 11:27:58 UTC (rev 16919)
+++ trunk/buildroot/package/vsftpd/vsftpd.mk	2006-12-14 14:23:50 UTC (rev 16920)
@@ -0,0 +1,69 @@
+#############################################################
+#
+# vsftpd
+#
+#############################################################
+VSFTPD_VERSION:=2.0.5
+VSFTPD_SOURCE:=vsftpd-$(VSFTPD_VERSION).tar.gz
+VSFTPD_SITE:=ftp://vsftpd.beasts.org/users/cevans
+VSFTPD_DIR:=$(BUILD_DIR)/vsftpd-$(VSFTPD_VERSION)
+VSFTPD_CAT:=$(ZCAT)
+VSFTPD_BINARY:=vsftpd
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+VSFTPF_PREREQ:=openssl
+endif
+ifeq ($(BR2_LARGEFILE),)
+#BR2_VSFTPD_CFLAGS:=-U_LARGEFILE64_SOURCE -U_FILE_OFFSET_BITS
+endif
+
+$(DL_DIR)/$(VSFTPD_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(VSFTPD_SITE)/$(VSFTPD_SOURCE)
+
+vsftpd-source: $(DL_DIR)/$(VSFTPD_SOURCE)
+
+$(VSFTPD_DIR)/.unpacked: $(DL_DIR)/$(VSFTPD_SOURCE)
+	$(VSFTPD_CAT) $(DL_DIR)/$(VSFTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(VSFTPD_DIR) package/vsftpd/ vsftpd\*.patch
+	touch $(VSFTPD_DIR)/.unpacked
+
+$(VSFTPD_DIR)/.configured: $(VSFTPD_DIR)/.unpacked
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	$(SED) 's,#undef[ 	]*VSF_BUILD_SSL.*,#define VSF_BUILD_SSL,g' $(VSFTPD_DIR)/builddefs.h
+else
+	$(SED) 's,#define[ 	]*VSF_BUILD_SSL.*,#undef VSF_BUILD_SSL,g' $(VSFTPD_DIR)/builddefs.h
+endif
+ifneq ($(findstring uclibc,$(BR2_GNU_TARGET_SUFFIX)),)
+	$(SED) 's,#define[ 	]*VSF_BUILDDEFS_H.*,#define VSF_BUILDDEFS_H\n#define __UCLIBC__,g' $(VSFTPD_DIR)/builddefs.h
+	$(SED) 's,.*__UCLIBC_HAS_LFS__.*,,g' $(VSFTPD_DIR)/builddefs.h
+ifeq ($(BR2_LARGEFILE),y)
+	$(SED) 's,#define[ 	]*VSF_BUILDDEFS_H.*,#define VSF_BUILDDEFS_H\n#define __UCLIBC_HAS_LFS__,g' $(VSFTPD_DIR)/builddefs.h
+endif
+else # not uclibc
+	$(SED) 's,.*__UCLIBC_.*,,g' $(VSFTPD_DIR)/builddefs.h
+endif
+
+
+$(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPF_PREREQ) $(VSFTPD_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) $(BR2_VSFTPD_CFLAGS)" -C $(VSFTPD_DIR)
+
+$(TARGET_DIR)/usr/sbin/$(VSFTPD_BINARY): $(VSFTPD_DIR)/$(VSFTPD_BINARY)
+	cp -dpf $< $@
+
+vsftpd: uclibc libgmp $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY)
+
+vsftpd-clean:
+	-$(MAKE) -C $(VSFTPD_DIR) clean
+	rm -f $(TARGET_DIR)/usr/sbin/$(VSFTPD_BINARY)
+
+vsftpd-dirclean:
+	rm -rf $(VSFTPD_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_VSFTPD)),y)
+TARGETS+=vsftpd
+endif

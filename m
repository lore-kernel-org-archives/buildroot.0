From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 3 Nov 2008 10:29:20 -0800
Subject: [Buildroot] [buildroot 0005944]: New Package: unzip
Message-ID: <db2a8a5aa9a6e1044ee4fc0ce95602f8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5944 
====================================================================== 
Reported By:                Chris David
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5944
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-03-2008 10:29 PST
Last Modified:              11-03-2008 10:29 PST
====================================================================== 
Summary:                    New Package: unzip
Description: 
Hello,

This patch adds the unzip program to buildroot.

I successfully built it on a recent version of buildroot.  I am not as
confident about it installing into the correct target location.  It
works for me on a two year old version of buildroot.

Note patch is inline and attached in mantis.

thanks,

-Chris

Signed-off-by: Chris David <cd@chrisdavid.com>

diff -Naur buildroot.orig/package/Config.in buildroot/package/Config.in
--- buildroot.orig/package/Config.in    2008-10-28 13:56:57.000000000
-0700
+++ buildroot/package/Config.in 2008-10-29 15:30:24.000000000 -0700
@@ -427,6 +427,7 @@
 endif
 source "package/lzo/Config.in"
 source "package/lzma/Config.in"
+source "package/unzip/Config.in"
 source "package/zlib/Config.in"
 endif

--- buildroot.orig/package/unzip/Config.in      1969-12-31
16:00:00.000000000 -0800
+++ buildroot/package/unzip/Config.in   2008-10-29 14:35:23.000000000
-0700
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_UNZIP
+       bool "unzip"
+       default n
+       help
+               Package for managing zip archives
diff -Naur buildroot.orig/package/unzip/unzip.mk
buildroot/package/unzip/unzip.mk
--- buildroot.orig/package/unzip/unzip.mk       1969-12-31
16:00:00.000000000 -0800
+++ buildroot/package/unzip/unzip.mk    2008-10-29 14:35:37.000000000
-0700
@@ -0,0 +1,53 @@
+#############################################################
+#
+# unzip
+#
+#############################################################
+UNZIP_SOURCE:=unzip_5.52.orig.tar.gz
+UNZIP_PATCH:=unzip_5.52-9.diff.gz
+UNZIP_SITE:=http://ftp.debian.org/debian/pool/main/u/unzip
+UNZIP_DIR:=$(BUILD_DIR)/unzip-5.52
+UNZIP_CAT:=zcat
+UNZIP_BINARY:=funzip
+UNZIP_TARGET_BINARY:=usr/bin/funzip
+
+$(DL_DIR)/$(UNZIP_SOURCE):
+        $(WGET) -P $(DL_DIR) $(UNZIP_SITE)/$(UNZIP_SOURCE)
+
+$(DL_DIR)/$(UNZIP_PATCH):
+        $(WGET) -P $(DL_DIR) $(UNZIP_SITE)/$(UNZIP_PATCH)
+
+unzip-source: $(DL_DIR)/$(UNZIP_SOURCE) $(DL_DIR)/$(UNZIP_PATCH)
+
+$(UNZIP_DIR)/.unpacked: $(DL_DIR)/$(UNZIP_SOURCE)
$(DL_DIR)/$(UNZIP_PATCH)
+       $(UNZIP_CAT) $(DL_DIR)/$(UNZIP_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
+       toolchain/patch-kernel.sh $(UNZIP_DIR) $(DL_DIR) $(UNZIP_PATCH)
+       touch $(UNZIP_DIR)/.unpacked
+
+$(UNZIP_DIR)/.configured: $(UNZIP_DIR)/.unpacked
+       (cd $(UNZIP_DIR); cp -f unix/Makefile . );
+       touch $(UNZIP_DIR)/.configured
+
+$(UNZIP_DIR)/$(UNZIP_BINARY): $(UNZIP_DIR)/.configured
+       $(MAKE) CC=$(TARGET_CROSS)gcc -C $(UNZIP_DIR) mips
+
+$(TARGET_DIR)/$(UNZIP_TARGET_BINARY): $(UNZIP_DIR)/$(UNZIP_BINARY)
+       cp -f $(UNZIP_DIR)/$(UNZIP_BINARY)
$(TARGET_DIR)/$(UNZIP_TARGET_BINARY)
+
+unzip: uclibc $(TARGET_DIR)/$(UNZIP_TARGET_BINARY)
+
+unzip-clean:
+       rm -f $(TARGET_DIR)/bin/unzip
+       -$(MAKE) -C $(UNZIP_DIR) clean
+
+unzip-dirclean:
+       rm -rf $(UNZIP_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_UNZIP)),y)
+TARGETS+=unzip
+endif



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-03-08 10:29  Chris David    New Issue                                    
11-03-08 10:29  Chris David    Status                   new => assigned     
11-03-08 10:29  Chris David    Assigned To               => buildroot       
11-03-08 10:29  Chris David    File Added: add_package_unzip.patch              
     
======================================================================

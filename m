From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:35 -0800
Subject: [Buildroot] [buildroot 0000898]: [PATCH] New feature: iscsi support
Message-ID: <a1626029c01b660083d0affa91b726c7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=898 
====================================================================== 
Reported By:                Gregory Haskins
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   898
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-07-2006 09:28 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    [PATCH] New feature: iscsi support
Description: 
Index: package/Config.in
===================================================================
--- package/Config.in	(revision 15298)
+++ package/Config.in	(working copy)
@@ -97,6 +97,7 @@
 source "package/netsnmp/Config.in"
 source "package/newt/Config.in"
 source "package/ntp/Config.in"
+source "package/open-iscsi/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
 source "package/openssl/Config.in"
Index: package/open-iscsi/open-iscsi.mk
===================================================================
--- package/open-iscsi/open-iscsi.mk	(revision 0)
+++ package/open-iscsi/open-iscsi.mk	(revision 0)
@@ -0,0 +1,57 @@
+#############################################################
+#
+# open-iscsi
+#
+#############################################################
+
+OPENISCSI_VER:=1.0-485
+OPENISCSI_SITE:=http://www.open-iscsi.org/bits
+OPENISCSI_DIR:=$(BUILD_DIR)/open-iscsi-$(OPENISCSI_VER)
+OPENISCSI_SOURCE:=open-iscsi-$(OPENISCSI_VER).tar.gz
+
+$(DL_DIR)/$(OPENISCSI_SOURCE):
+	$(WGET) -P $(DL_DIR) $(OPENISCSI_SITE)/$(OPENISCSI_SOURCE)
+
+$(OPENISCSI_DIR)/.unpacked: $(DL_DIR)/$(OPENISCSI_SOURCE)
+	zcat $(DL_DIR)/$(OPENISCSI_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS)
-;
+	cat package/open-iscsi/open-iscsi-$(OPENISCSI_VER).patch | (cd
$(OPENISCSI_DIR); patch -p1);
+	touch $(OPENISCSI_DIR)/.unpacked
+
+BINS = iscsid iscsiadm
+TARGET_BINS:=$(patsubst %,$(TARGET_DIR)/sbin/%, $(BINS))
+
+#$(OPENISCSI_DIR)/usr/%: open-iscsi-unpack
+#	@echo "Building $(notdir $@)"
+#	cd $(OPENISCSI_DIR)/usr; $(MAKE) $(notdir $@) CC=$(TARGET_CC)
+#
+#$(TARGET_DIR)/sbin/%: $(OPENISCSI_DIR)/usr/%
+#	@echo "Installing $(notdir $@)"
+#	cp $^ $@
+
+$(TARGET_DIR)/sbin/%: open-iscsi-unpack
+	@echo "Building $(notdir $@)"
+	cd $(OPENISCSI_DIR)/usr; $(MAKE) $(notdir $@) CC=$(TARGET_CC)
+	@echo "Installing $(notdir $@)"
+	cp $(OPENISCSI_DIR)/usr/$(notdir $@) $@
+
+open-iscsi: berkeleydb $(TARGET_BINS)
+
+open-iscsi-source: $(DL_DIR)/$(OPENISCSI_SOURCE)
+
+open-iscsi-unpack: $(OPENISCSI_DIR)/.unpacked
+
+open-iscsi-clean: 
+	-$(MAKE) -C $(OPENISCSI_DIR) clean
+	-rm -f $(TARGET_BINS)
+
+open-iscsi-dirclean: 
+	rm -rf $(OPENISCSI_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_OPENISCSI)),y)
+TARGETS+=open-iscsi
+endif
Index: package/open-iscsi/open-iscsi-1.0-485.patch
===================================================================
--- package/open-iscsi/open-iscsi-1.0-485.patch	(revision 0)
+++ package/open-iscsi/open-iscsi-1.0-485.patch	(revision 0)
@@ -0,0 +1,12 @@
+diff -Naur open-iscsi-1.0-485.orig/usr/Makefile
open-iscsi-1.0-485/usr/Makefile
+--- open-iscsi-1.0-485.orig/usr/Makefile	2006-02-02 03:13:44.000000000
-0500
++++ open-iscsi-1.0-485/usr/Makefile	2006-06-07 11:16:59.000000000 -0400
+@@ -21,7 +21,7 @@
+ 	endif
+ 	endif
+ IPC_OBJ=netlink.o
+-DBM_LIB=-ldb
++DBM_LIB=-ldb -lpthread
+ else
+ ifeq ($(OSNAME),FreeBSD)
+ IPC_CFLAGS=
Index: package/open-iscsi/Config.in
===================================================================
--- package/open-iscsi/Config.in	(revision 0)
+++ package/open-iscsi/Config.in	(revision 0)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_OPENISCSI
+	bool "open-iscsi"
+	default n
+	select BR2_PACKAGE_BERKELEYDB
+	help
+	  An iSCSI Initiator tools package.  Requires kernel support
+
+	  http://www.open-iscsi.com/

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-27-07 15:14  
---------------------------------------------------------------------- 
Can you please attach a patch?

+ zcat $(DL_DIR)/$(OPENISCSI_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS)
-;

Use $(ZCAT)

+ cat package/open-iscsi/open-iscsi-$(OPENISCSI_VER).patch | (cd
$(OPENISCSI_DIR); patch -p1);

Use 
toolchain/patch-kernel.sh $(OPENISCSI_DIR) package/open-iscsi/
open-iscsi-$(OPENISCSI_VER)\*.patch 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-07-06 09:28  Gregory HaskinsNew Issue                                    
06-07-06 09:28  Gregory HaskinsStatus                   new => assigned     
06-07-06 09:28  Gregory HaskinsAssigned To               => uClibc          
01-27-07 15:14  bernhardf      Note Added: 0002062                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================

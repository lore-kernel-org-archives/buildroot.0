From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 15 May 2007 04:25:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20070515112541.DCFFD48029@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-15 04:25:41 -0700 (Tue, 15 May 2007)
New Revision: 18623

Log:
- bump version


Modified:
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2007-05-15 11:24:27 UTC (rev 18622)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2007-05-15 11:25:41 UTC (rev 18623)
@@ -4,18 +4,32 @@
 #
 #############################################################
 MDADM_VERSION:=2.6.1
-MDADM_SOURCE:=mdadm-$(MDADM_VERSION).tar.bz2
-MDADM_CAT:=$(BZCAT)
-MDADM_SITE:=http://www.kernel.org/pub/linux/utils/raid/mdadm
+MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
+MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1~exp.5.diff.gz
+MDADM_CAT:=$(ZCAT)
+MDADM_SITE:=http://ftp.debian.org/debian/pool/main/m/mdadm
 MDADM_DIR:=$(BUILD_DIR)/mdadm-$(MDADM_VERSION)
 MDADM_BINARY:=mdadm
 MDADM_TARGET_BINARY:=sbin/mdadm
 
-$(DL_DIR)/$(MDADM_SOURCE):
+ifneq ($(MDADM_PATCH),)
+MDADM_PATCH_FILE:=$(DL_DIR)/$(MDADM_PATCH)
+$(MDADM_PATCH_FILE):
+	$(WGET) -P $(DL_DIR) $(MDADM_SITE)/$(MDADM_PATCH)
+endif
+
+$(DL_DIR)/$(MDADM_SOURCE): $(MDADM_PATCH_FILE)
 	$(WGET) -P $(DL_DIR) $(MDADM_SITE)/$(MDADM_SOURCE)
+	touch -c $@
 
 $(MDADM_DIR)/.unpacked: $(DL_DIR)/$(MDADM_SOURCE)
 	$(MDADM_CAT) $(DL_DIR)/$(MDADM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+ifneq ($(MDADM_PATCH),)
+	(cd $(MDADM_DIR) && $(MDADM_CAT) $(MDADM_PATCH_FILE) | patch -p1)
+	if [ -d $(MDADM_DIR)/debian/patches ]; then \
+	  toolchain/patch-kernel.sh $(MDADM_DIR) $(MDADM_DIR)/debian/patches \*patch ; \
+	fi
+endif
 	toolchain/patch-kernel.sh $(MDADM_DIR) package/mdadm mdadm-$(MDADM_VERSION)\*.patch
 	touch $@
 

From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 06:18:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20061215141830.C8DF54856B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 06:18:30 -0800 (Fri, 15 Dec 2006)
New Revision: 16944

Log:
- use one (patched) sourcedir and build the -host and -target fakeroute in their
  own dirs. Thanks to Ulrich Hecht.


Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2006-12-15 14:05:51 UTC (rev 16943)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2006-12-15 14:18:30 UTC (rev 16944)
@@ -7,8 +7,9 @@
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
-FAKEROOT_DIR1:=$(TOOL_BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
-FAKEROOT_DIR2:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
+FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
+FAKEROOT_DIR1:=$(TOOL_BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host
+FAKEROOT_DIR2:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-target
 
 
 $(DL_DIR)/$(FAKEROOT_SOURCE):
@@ -16,23 +17,26 @@
 
 fakeroot-source: $(DL_DIR)/$(FAKEROOT_SOURCE)
 
+$(FAKEROOT_SOURCE_DIR)/.unpacked: $(DL_DIR)/$(FAKEROOT_SOURCE)
+	$(FAKEROOT_CAT) $(DL_DIR)/$(FAKEROOT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	# If using busybox getopt, make it be quiet.
+	$(SED) "s,getopt --version,getopt --version 2>/dev/null," \
+		$(FAKEROOT_SOURCE_DIR)/scripts/fakeroot.in
+	toolchain/patch-kernel.sh $(FAKEROOT_SOURCE_DIR) package/fakeroot/ \*.patch
+	touch $(FAKEROOT_SOURCE_DIR)/.unpacked
 
+
 #############################################################
 #
 # build fakeroot for use on the host system
 #
 #############################################################
-$(FAKEROOT_DIR1)/.unpacked: $(DL_DIR)/$(FAKEROOT_SOURCE)
-	$(FAKEROOT_CAT) $(DL_DIR)/$(FAKEROOT_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	$(SED) "s,getopt --version,getopt --version 2>/dev/null," \
-		$(FAKEROOT_DIR1)/scripts/fakeroot.in
-	toolchain/patch-kernel.sh $(FAKEROOT_DIR1) package/fakeroot/ \*.patch
-	touch $(FAKEROOT_DIR1)/.unpacked
 
-$(FAKEROOT_DIR1)/.configured: $(FAKEROOT_DIR1)/.unpacked
+$(FAKEROOT_DIR1)/.configured: $(FAKEROOT_SOURCE_DIR)/.unpacked
+	mkdir -p $(FAKEROOT_DIR1)
 	(cd $(FAKEROOT_DIR1); rm -rf config.cache; \
 		CC="$(HOSTCC)" \
-		./configure \
+		$(FAKEROOT_SOURCE_DIR)/configure \
 		--prefix=/usr \
 		$(DISABLE_NLS) \
 	);
@@ -61,17 +65,12 @@
 # build fakeroot for use on the target system
 #
 #############################################################
-$(FAKEROOT_DIR2)/.unpacked: $(DL_DIR)/$(FAKEROOT_SOURCE)
-	$(FAKEROOT_CAT) $(DL_DIR)/$(FAKEROOT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	# If using busybox getopt, make it be quiet.
-	$(SED) "s,getopt --version,getopt --version 2>/dev/null," \
-		$(FAKEROOT_DIR2)/scripts/fakeroot.in
-	touch $(FAKEROOT_DIR2)/.unpacked
 
-$(FAKEROOT_DIR2)/.configured: $(FAKEROOT_DIR2)/.unpacked
+$(FAKEROOT_DIR2)/.configured: $(FAKEROOT_SOURCE_DIR)/.unpacked
+	mkdir -p $(FAKEROOT_DIR2)
 	(cd $(FAKEROOT_DIR2); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
-		./configure \
+		$(FAKEROOT_SOURCE_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -103,6 +102,7 @@
 
 fakeroot-clean:
 	$(MAKE) -C $(FAKEROOT_DIR2) clean
+	rm -f $(TARGET_DIR)/usr/bin/fake{d,root}
 
 fakeroot-dirclean:
 	rm -rf $(FAKEROOT_DIR2)

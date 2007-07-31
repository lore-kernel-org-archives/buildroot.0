From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 31 Jul 2007 09:13:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lzma
Message-ID: <20070731161301.85C94A5E1E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-31 09:13:00 -0700 (Tue, 31 Jul 2007)
New Revision: 19360

Log:
- lzma needs a CXX cross-compiler
- minor cleanups while at it


Modified:
   trunk/buildroot/package/lzma/Config.in
   trunk/buildroot/package/lzma/lzma.mk


Changeset:
Modified: trunk/buildroot/package/lzma/Config.in
===================================================================
--- trunk/buildroot/package/lzma/Config.in	2007-07-31 16:02:18 UTC (rev 19359)
+++ trunk/buildroot/package/lzma/Config.in	2007-07-31 16:13:00 UTC (rev 19360)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LZMA_TARGET
 	bool "Install lzma for the target system"
 	default n
+	select BR2_GCC_CROSS_CXX
 	help
 	  lzma utils on the target
 

Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2007-07-31 16:02:18 UTC (rev 19359)
+++ trunk/buildroot/package/lzma/lzma.mk	2007-07-31 16:13:00 UTC (rev 19360)
@@ -24,19 +24,19 @@
 #
 ######################################################################
 
-$(LZMA_HOST_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
+$(LZMA_HOST_DIR)/.unpacked: $(DL_DIR)/$(LZMA_SOURCE)
 	$(LZMA_CAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LZMA_HOST_DIR) package/lzma/ lzma\*.patch
-	touch $(LZMA_HOST_DIR)/.source
+	touch $@
 
-$(LZMA_HOST_DIR)/.configured: $(LZMA_HOST_DIR)/.source
+$(LZMA_HOST_DIR)/.configured: $(LZMA_HOST_DIR)/.unpacked
 	(cd $(LZMA_HOST_DIR); rm -f config.cache ;\
 		CC="$(HOSTCC)" \
 		CXX="$(HOSTCXX)" \
 		./configure \
 		--prefix=/ \
 	);
-	touch $(LZMA_HOST_DIR)/.configured;
+	touch $@
 
 $(LZMA_HOST_DIR)/src/lzma/lzma: $(LZMA_HOST_DIR)/.configured
 	$(MAKE) -C $(LZMA_HOST_DIR) all
@@ -45,20 +45,24 @@
 $(STAGING_DIR)/bin/lzma: $(LZMA_HOST_DIR)/src/lzma/lzma
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZMA_HOST_DIR) install
 
-lzma-host: uclibc $(STAGING_DIR)/bin/lzma
-
+lzma-host: $(STAGING_DIR)/bin/lzma
+lzma-host-clean:
+	rm -f $(STAGING_DIR)/bin/lzma
+	-$(MAKE) -C $(LZMA_HOST_DIR) clean
+lzma-host-dirclean:
+	rm -rf $(LZMA_HOST_DIR)
 ######################################################################
 #
 # lzma target
 #
 ######################################################################
 
-$(LZMA_TARGET_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
+$(LZMA_TARGET_DIR)/.unpacked: $(DL_DIR)/$(LZMA_SOURCE)
 	$(LZMA_CAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LZMA_TARGET_DIR) package/lzma/ lzma\*.patch
-	touch $(LZMA_TARGET_DIR)/.source
+	touch $@
 
-$(LZMA_TARGET_DIR)/.configured: $(LZMA_TARGET_DIR)/.source
+$(LZMA_TARGET_DIR)/.configured: $(LZMA_TARGET_DIR)/.unpacked
 	(cd $(LZMA_TARGET_DIR); rm -f config.cache ;\
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -76,7 +80,7 @@
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	);
-	touch $(LZMA_TARGET_DIR)/.configured;
+	touch $@
 
 $(LZMA_TARGET_DIR)/src/lzma/lzma: $(LZMA_TARGET_DIR)/.configured
 	$(MAKE) -C $(LZMA_TARGET_DIR) all
@@ -107,6 +111,7 @@
 #############################################################
 ifeq ($(strip $(BR2_PACKAGE_LZMA_HOST)),y)
 TARGETS+=lzma-host
+HOST_SOURCE+=lzma-source
 endif
 
 ifeq ($(strip $(BR2_PACKAGE_LZMA_TARGET)),y)

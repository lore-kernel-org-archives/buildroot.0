From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  4 Nov 2006 11:15:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/lzma target/ext2
Message-ID: <20061104191556.9297E485AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-04 11:15:56 -0800 (Sat, 04 Nov 2006)
New Revision: 16495

Log:
- Patch from Thomas Lundquist to support lzma compressed ext2 rootfs.


Modified:
   trunk/buildroot/package/lzma/Config.in
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/target/ext2/Config.in
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/package/lzma/Config.in
===================================================================
--- trunk/buildroot/package/lzma/Config.in	2006-11-04 18:33:04 UTC (rev 16494)
+++ trunk/buildroot/package/lzma/Config.in	2006-11-04 19:15:56 UTC (rev 16495)
@@ -1,14 +1,22 @@
-config BR2_PACKAGE_LZMA
-	bool "lzma"
+config BR2_PACKAGE_LZMA_TARGET
+	bool "Install lzma for the target system"
 	default n
 	help
-	  Compression utility.
+	  lzma utils on the target
 
 	  http://tukaani.org/lzma/
 
 config BR2_PACKAGE_LZMA_TARGET_HEADERS
 	bool "lzma headers in target"
 	default n
-	depends on BR2_PACKAGE_LZMA
+	depends on BR2_PACKAGE_LZMA_TARGET
 	help
 	  Put headers files in the target.
+
+config BR2_PACKAGE_LZMA_HOST
+	bool "Install lzma for the host/build system"
+	default n
+	help
+	  lzma utils on the host
+
+	  http://tukaani.org/lzma/

Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2006-11-04 18:33:04 UTC (rev 16494)
+++ trunk/buildroot/package/lzma/lzma.mk	2006-11-04 19:15:56 UTC (rev 16495)
@@ -6,7 +6,8 @@
 LZMA_VER:=4.32.0beta3
 LZMA_SOURCE:=lzma-$(LZMA_VER).tar.gz
 LZMA_SITE:=http://tukaani.org/lzma/
-LZMA_DIR:=$(BUILD_DIR)/lzma-$(LZMA_VER)
+LZMA_HOST_DIR:=$(TOOL_BUILD_DIR)/lzma-$(LZMA_VER)
+LZMA_TARGET_DIR:=$(BUILD_DIR)/lzma-$(LZMA_VER)
 LZMA_CFLAGS:=$(TARGET_CFLAGS)
 ifeq ($(BR2_LARGEFILE),y)
 LZMA_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
@@ -18,13 +19,47 @@
 $(DL_DIR)/$(LZMA_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LZMA_SITE)/$(LZMA_SOURCE)
 
-$(LZMA_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LZMA_DIR) package/lzma/ lzma\*.patch
-	touch $(LZMA_DIR)/.source
+######################################################################
+#
+# lzma host
+#
+######################################################################
 
-$(LZMA_DIR)/.configured: $(LZMA_DIR)/.source
-	(cd $(LZMA_DIR); rm -f config.cache ;\
+$(LZMA_HOST_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
+	zcat $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LZMA_HOST_DIR) package/lzma/ lzma\*.patch
+	touch $(LZMA_HOST_DIR)/.source
+
+$(LZMA_HOST_DIR)/.configured: $(LZMA_HOST_DIR)/.source
+	(cd $(LZMA_HOST_DIR); rm -f config.cache ;\
+		CC="$(HOSTCC)" \
+		./configure \
+		--prefix=/ \
+	);
+	touch $(LZMA_HOST_DIR)/.configured;
+
+$(LZMA_HOST_DIR)/src/lzma/lzma: $(LZMA_HOST_DIR)/.configured
+	$(MAKE) -C $(LZMA_HOST_DIR) all
+	touch -c $@
+
+$(STAGING_DIR)/bin/lzma: $(LZMA_HOST_DIR)/src/lzma/lzma
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZMA_HOST_DIR) install
+
+lzma-host: uclibc $(STAGING_DIR)/bin/lzma
+
+######################################################################
+#
+# lzma target
+#
+######################################################################
+
+$(LZMA_TARGET_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
+	zcat $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LZMA_TARGET_DIR) package/lzma/ lzma\*.patch
+	touch $(LZMA_TARGET_DIR)/.source
+
+$(LZMA_TARGET_DIR)/.configured: $(LZMA_TARGET_DIR)/.source
+	(cd $(LZMA_TARGET_DIR); rm -f config.cache ;\
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) $(LZMA_CFLAGS)" \
 		ac_cv_func_malloc_0_nonnull=yes \
@@ -33,37 +68,33 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=$(STAGING_DIR)/usr/bin \
-		--libdir=$(STAGING_DIR)/lib \
-		--includedir=$(STAGING_DIR)/include \
+		--exec-prefix=$(TARGET_DIR)/usr/bin \
+		--libdir=$(TARGET_DIR)/lib \
+		--includedir=$(TARGET_DIR)/include \
 		--disable-debug \
 		$(DISABLE_NLS) \
 		$(LZMA_LARGEFILE) \
 	);
-	touch $(LZMA_DIR)/.configured;
+	touch $(LZMA_TARGET_DIR)/.configured;
 
-$(LZMA_DIR)/src/lzma/lzma: $(LZMA_DIR)/.configured
-	$(MAKE) -C $(LZMA_DIR) all
+$(LZMA_TARGET_DIR)/src/lzma/lzma: $(LZMA_TARGET_DIR)/.configured
+	$(MAKE) -C $(LZMA_TARGET_DIR) all
 	touch -c $@
 
-$(STAGING_DIR)/bin/lzma: $(LZMA_DIR)/src/lzma/lzma
-	-cp -dpf $(LZMA_DIR)/src/lzma/lzma $(STAGING_DIR)/bin/;
-	touch -c $(STAGING_DIR)/bin/lzma
-
-$(TARGET_DIR)/bin/lzma: $(STAGING_DIR)/bin/lzma
-	cp -dpf $(STAGING_DIR)/bin/lzma $(TARGET_DIR)/bin/;
+$(TARGET_DIR)/usr/bin/lzma: $(LZMA_TARGET_DIR)/src/lzma/lzma
+	-cp -dpf $(LZMA_TARGET_DIR)/src/lzma/lzma $(TARGET_DIR)/bin/;
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/bin/lzma
 	touch -c $(TARGET_DIR)/bin/lzma
 
 #lzma-headers: $(TARGET_DIR)/bin/lzma
 
-lzma: uclibc $(TARGET_DIR)/bin/lzma
+lzma-target: uclibc $(TARGET_DIR)/usr/bin/lzma
 
 lzma-source: $(DL_DIR)/$(LZMA_SOURCE)
 
 lzma-clean:
-	rm -f $(TARGET_DIR)/bin/lzma
-	-$(MAKE) -C $(LZMA_DIR) clean
+	rm -f $(TARGET_DIR)/usr/bin/lzma
+	-$(MAKE) -C $(LZMA_TARGET_DIR) clean
 
 lzma-dirclean:
 	rm -rf $(LZMA_DIR)
@@ -73,9 +104,14 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_LZMA)),y)
-TARGETS+=lzma
+ifeq ($(strip $(BR2_PACKAGE_LZMA_HOST)),y)
+TARGETS+=lzma-host
 endif
+
+ifeq ($(strip $(BR2_PACKAGE_LZMA_TARGET)),y)
+TARGETS+=lzma-target
+endif
+
 #ifeq ($(strip $(BR2_PACKAGE_LZMA_TARGET_HEADERS)),y)
 #TARGETS+=lzma-headers
 #endif

Modified: trunk/buildroot/target/ext2/Config.in
===================================================================
--- trunk/buildroot/target/ext2/Config.in	2006-11-04 18:33:04 UTC (rev 16494)
+++ trunk/buildroot/target/ext2/Config.in	2006-11-04 19:15:56 UTC (rev 16495)
@@ -34,6 +34,13 @@
 	depends on 	BR2_TARGET_ROOTFS_EXT2
 	default n
 
+config BR2_TARGET_ROOTFS_EXT2_LZMA
+	bool "lzma the output file" 
+	depends on	BR2_TARGET_ROOTFS_EXT2 
+	select		BR2_PACKAGE_LZMA_HOST
+	default n
+
+
 config BR2_TARGET_ROOTFS_EXT2_COPYTO
 	string "also copy the image to..."
 	depends on 	BR2_TARGET_ROOTFS_EXT2

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2006-11-04 18:33:04 UTC (rev 16494)
+++ trunk/buildroot/target/ext2/ext2root.mk	2006-11-04 19:15:56 UTC (rev 16495)
@@ -66,6 +66,10 @@
 EXT2_TARGET := $(EXT2_BASE)
 endif
 
+ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_LZMA)),y)
+EXT2_TARGET := $(EXT2_BASE).lzma
+endif
+
 $(EXT2_BASE): host-fakeroot makedevs genext2fs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	@rm -rf $(TARGET_DIR)/usr/man
@@ -102,6 +106,9 @@
 $(EXT2_BASE).gz: $(EXT2_BASE)
 	@gzip --best -fv $(EXT2_BASE)
 
+$(EXT2_BASE).lzma: lzma-host $(EXT2_BASE)
+	@$(STAGING_DIR)/bin/lzma -vc $(EXT2_BASE) > $(EXT2_BASE).lzma
+
 EXT2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO)))
 # " stupid syntax highlighting does not like unmatched quote from above line
 

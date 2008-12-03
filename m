From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 15:38:52 -0500 (EST)
Subject: [Buildroot] [PATCH 3/3] fix the ubifsroot target
Message-ID: <alpine.LFD.2.00.0812031537530.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Currently this target is broken since the mkfs.ubifs source repository
no longer exists.  It is now included with mtd-utils and built per the
previous patch.

Also it is now possible to wrap the UBIFS image into an UBI flash image.
An UBIFS image cannot be written to flash directly without special
bootloader support.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: target/ubifs/ubifsroot.mk
===================================================================
--- target/ubifs/ubifsroot.mk	(revision 24219)
+++ target/ubifs/ubifsroot.mk	(working copy)
@@ -3,39 +3,7 @@
 # mkfs.ubifs to build to target ubifs filesystems
 #
 #############################################################
-#MKFS_UBIFS_VERSION=2582f128dad78591bc3adcc87c343c690bb82e61
-#MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_VERSION=v0.4
-MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=refs/tags/mkfs.ubifs-$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_SOURCE:=mkfs.ubifs-$(MKFS_UBIFS_VERSION).tar.gz
-MKFS_UBIFS_DIR:= $(BUILD_DIR)/mkfs-ubifs-$(MKFS_UBIFS_VERSION)
-MKFS_UBIFS_CAT:=$(ZCAT)
-MKFS_UBIFS_NAME:=mkfs.ubifs
 
-$(DL_DIR)/$(MKFS_UBIFS_SOURCE):
-	$(WGET) -O $(DL_DIR)/$(MKFS_UBIFS_SOURCE) "$(MKFS_UBIFS_URL)"
-
-$(MKFS_UBIFS_DIR)/.unpacked: $(DL_DIR)/$(MKFS_UBIFS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MKFS_UBIFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	mv $(BUILD_DIR)/$(MKFS_UBIFS_NAME) $(MKFS_UBIFS_DIR)
-	toolchain/patch-kernel.sh $(MKFS_UBIFS_DIR) target/ubifs/ mkfs-ubifs-\*.patch
-	touch $@
-
-$(MKFS_UBIFS_DIR)/mkfs.ubifs: $(MKFS_UBIFS_DIR)/.unpacked
-	$(MAKE) -C $(MKFS_UBIFS_DIR)
-	touch -c $@
-
-mkfs.ubifs-dirclean:
-	rm -rf $(MKFS_UBIFS_DIR)
-
-mkfs.ubifs: $(MKFS_UBIFS_DIR)/mkfs.ubifs
-
-#############################################################
-#
-# Build the ubifs root filesystem image
-#
-#############################################################
-
 UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
 
 UBIFS_BASE := $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_OUTPUT))
@@ -51,6 +19,10 @@
 UBIFS_OPTS += -x none
 endif
 
+ifneq ($(BR2_TARGET_ROOTFS_UBIFS_SQUASH),)
+UBIFS_OPTS += -U
+endif
+
 UBIFS_ROOTFS_COMPRESSOR:=
 UBIFS_ROOTFS_COMPRESSOR_EXT:=
 UBIFS_ROOTFS_COMPRESSOR_PREREQ:=
@@ -76,7 +48,12 @@
 UBIFS_TARGET := $(UBIFS_BASE)
 endif
 
-$(UBIFS_BASE): host-fakeroot makedevs mkfs.ubifs
+#
+# ubi-host is a dependency which builds a local copy of mkfs.ubifs 
+# if it is needed. The actual build is done from
+# package/mtd/mtd-utils.git/mtd.mk.
+#
+$(UBIFS_BASE): host-fakeroot makedevs ubi-host
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
@@ -88,22 +65,20 @@
 	@test -d $(TARGET_DIR)/usr/share && \
 		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share || \
 		true
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
 	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
-	# Use fakeroot to pretend all target binaries are owned by root
+endif
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
 	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-ifneq ($(BR2_TARGET_ROOTFS_UBIFS_SQUASH),)
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-endif
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 endif
 	# Use fakeroot so mkfs.ubifs believes the previous fakery
-	echo "$(MKFS_UBIFS_DIR)/mkfs.ubifs -d $(TARGET_DIR) " \
-		"$(UBIFS_OPTS) -o $(UBIFS_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+	echo "$(MKFS_UBIFS) -d $(TARGET_DIR) $(UBIFS_OPTS) -o $(UBIFS_BASE)" \
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
@@ -113,6 +88,23 @@
 	$(UBIFS_ROOTFS_COMPRESSOR) $(UBIFS_BASE) > $(UBIFS_TARGET)
 endif
 
+UBI_IMAGE := $(UBIFS_BASE:.ubifs=).ubi_image
+
+$(UBI_IMAGE): $(UBINIZE) $(UBIFS_BASE)
+	( echo "[rootfs]"; \
+	  echo "mode=ubi"; \
+	  echo "image=$(UBIFS_BASE)"; \
+	  echo "vol_id=0"; \
+	  echo "vol_name=rootfs"; \
+	  echo "vol_type=dynamic"; \
+	  echo "vol_flags=autoresize"; \
+	) > $(PROJECT_BUILD_DIR)/_ubidata.$(notdir $(UBI_IMAGE))
+	$(UBINIZE) -o $@ -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE) \
+	  -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE) \
+	  -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE) \
+	  $(PROJECT_BUILD_DIR)/_ubidata.$(notdir $(UBI_IMAGE))
+	- at rm -f $(PROJECT_BUILD_DIR)/_ubidata.$(notdir $(UBI_IMAGE))
+
 UBIFS_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO)))
 # "))
 
@@ -122,14 +114,9 @@
 	@cp -f $(UBIFS_TARGET) $(UBIFS_COPYTO)
 endif
 
-ubifsroot-source: $(DL_DIR)/$(GENUBIFS_SOURCE)
+ubi-image: $(UBI_IMAGE)
+	@ls -l $(UBI_IMAGE)
 
-ubifsroot-clean:
-	-$(MAKE) -C $(MKFS_UBIFS_DIR) clean
-
-ubifsroot-dirclean:
-	rm -rf $(MKFS_UBIFS_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options
@@ -138,4 +125,7 @@
 ifeq ($(strip $(BR2_TARGET_ROOTFS_UBIFS)),y)
 TARGETS+=ubifsroot
 endif
+ifeq ($(strip $(BR2_TARGET_ROOTFS_UBI_IMAGE)),y)
+TARGETS+=ubi-image
+endif
 
Index: target/ubifs/Config.in
===================================================================
--- target/ubifs/Config.in	(revision 24219)
+++ target/ubifs/Config.in	(working copy)
@@ -1,25 +1,26 @@
 config BR2_TARGET_ROOTFS_UBIFS
 	bool "ubifs root filesystem"
 	select BR2_HOST_FAKEROOT
+	select BR2_PACKAGE_MTD_UTILS_GIT
 	help
 	  Build a ubifs root filesystem
 
 config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
-	hex "UBI logical erase block size"
+	int "UBI logical erase block size"
 	depends on BR2_TARGET_ROOTFS_UBIFS
-	default 0x1f800
+	default 129024
 
 config BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE
-	hex "UBI minimum I/O size"
+	int "UBI minimum I/O size"
 	depends on BR2_TARGET_ROOTFS_UBIFS
-	default 0x800
+	default 2048
 	help
 	  Some comment required here
 
 config BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT
 	int "Maximum LEB count"
 	depends on BR2_TARGET_ROOTFS_UBIFS
-	default 2048
+	default 1023
 	help
 	  Some comment required here
 
@@ -105,3 +106,21 @@
 	  Copies the resulting image to a secondary location
 	  like a tftp server's root directory.
 
+config BR2_TARGET_ROOTFS_UBI_IMAGE
+	bool "create a raw UBI image"
+	depends on BR2_TARGET_ROOTFS_UBIFS
+	help
+	  This creates a raw UBI image that can be used for initial flash
+	  initialization.
+
+config BR2_TARGET_ROOTFS_UBI_PEBSIZE
+	int "UBI physical erase block size"
+	depends on BR2_TARGET_ROOTFS_UBI_IMAGE
+	default 131072
+
+config BR2_TARGET_ROOTFS_UBI_SUBSIZE
+	int "UBI sub-page size"
+	depends on BR2_TARGET_ROOTFS_UBI_IMAGE
+	default 512
+
+

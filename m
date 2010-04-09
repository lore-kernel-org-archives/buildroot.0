From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] ubifs: convert to ROOTFS_TARGET
	infrastructure
Message-ID: <20100409142131.315B020E69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=99eb1dc9690de73d743327ae7976c925aa31af03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We also remove the BR2_TARGET_ROOTFS_UBIFS_OUTPUT option, that could
be used to specify an alternate name for the generated image file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/ubifs/Config.in    |    5 ---
 target/ubifs/ubifsroot.mk |   63 +++-----------------------------------------
 2 files changed, 5 insertions(+), 63 deletions(-)

diff --git a/target/ubifs/Config.in b/target/ubifs/Config.in
index 3222fea..9fa510e 100644
--- a/target/ubifs/Config.in
+++ b/target/ubifs/Config.in
@@ -22,11 +22,6 @@ config BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT
 	help
 	  Some comment required here
 
-config BR2_TARGET_ROOTFS_UBIFS_OUTPUT
-	string "Output File"
-	depends on BR2_TARGET_ROOTFS_UBIFS
-	default "$(IMAGE).ubifs"
-
 choice
 	prompt "ubifs runtime compression"
 	default BR2_TARGET_ROOTFS_UBIFS_RT_LZO
diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
index d0f3885..0fad234 100644
--- a/target/ubifs/ubifsroot.mk
+++ b/target/ubifs/ubifsroot.mk
@@ -6,8 +6,6 @@
 
 UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
 
-UBIFS_BASE := $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_OUTPUT))
-
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
 UBIFS_OPTS += -x zlib
 endif
@@ -18,61 +16,10 @@ ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_NONE),y)
 UBIFS_OPTS += -x none
 endif
 
-UBIFS_ROOTFS_COMPRESSOR:=
-UBIFS_ROOTFS_COMPRESSOR_EXT:=
-UBIFS_ROOTFS_COMPRESSOR_PREREQ:=
-ifeq ($(BR2_TARGET_ROOTFS_UBIFS_GZIP),y)
-UBIFS_ROOTFS_COMPRESSOR:=gzip -9 -c
-UBIFS_ROOTFS_COMPRESSOR_EXT:=gz
-endif
-ifeq ($(BR2_TARGET_ROOTFS_UBIFS_BZIP2),y)
-UBIFS_ROOTFS_COMPRESSOR:=bzip2 -9 -c
-UBIFS_ROOTFS_COMPRESSOR_EXT:=bz2
-endif
-ifeq ($(BR2_TARGET_ROOTFS_UBIFS_LZMA),y)
-UBIFS_ROOTFS_COMPRESSOR:=$(LZMA) -9 -c
-UBIFS_ROOTFS_COMPRESSOR_EXT:=lzma
-UBIFS_ROOTFS_COMPRESSOR_PREREQ:= host-lzma
-endif
-
-ifneq ($(UBIFS_ROOTFS_COMPRESSOR),)
-UBIFS_TARGET := $(UBIFS_BASE).$(UBIFS_ROOTFS_COMPRESSOR_EXT)
-else
-UBIFS_TARGET := $(UBIFS_BASE)
-endif
-
-$(UBIFS_BASE): host-fakeroot host-mtd makedevs
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-endif
-	# Use fakeroot so mkfs.ubifs believes the previous fakery
-	echo "$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) " \
-		"$(UBIFS_OPTS) -o $(UBIFS_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-
-ifneq ($(UBIFS_ROOTFS_COMPRESSOR),)
-$(UBIFS_BASE).$(UBIFS_ROOTFS_COMPRESSOR_EXT): $(UBIFS_ROOTFS_COMPRESSOR_PREREQ) $(UBIFS_BASE)
-	$(UBIFS_ROOTFS_COMPRESSOR) $(UBIFS_BASE) > $(UBIFS_TARGET)
-endif
-
-ubifsroot: $(UBIFS_TARGET)
-	@ls -l $(UBIFS_TARGET)
+ROOTFS_UBIFS_DEPENDENCIES = host-mtd
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_ROOTFS_UBIFS),y)
-TARGETS+=ubifsroot
-endif
+define ROOTFS_UBIFS_CMD
+	$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $$@
+endef
 
+$(eval $(call ROOTFS_TARGET,ubifs))
\ No newline at end of file
-- 
1.6.3.3

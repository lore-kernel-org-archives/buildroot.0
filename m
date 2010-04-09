From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:11 +0200
Subject: [Buildroot] [PATCH 33/44] ext2: convert to ROOTFS_TARGET
	infrastructure
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <208d06abf9e3e36d87042c8dc6fe4a6f1e0d9575.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We also remove the BR2_TARGET_ROOTFS_EXT2_OUTPUT option, that could be
used to specify an alternate name for the generated image file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/ext2/Config.in   |    5 ---
 target/ext2/ext2root.mk |   76 +++++++----------------------------------------
 2 files changed, 11 insertions(+), 70 deletions(-)

diff --git a/target/ext2/Config.in b/target/ext2/Config.in
index 0047309..02ec18f 100644
--- a/target/ext2/Config.in
+++ b/target/ext2/Config.in
@@ -24,11 +24,6 @@ config BR2_TARGET_ROOTFS_EXT2_SQUASH
 	depends on  BR2_TARGET_ROOTFS_EXT2
 	default y
 
-config BR2_TARGET_ROOTFS_EXT2_OUTPUT
-	string "Output File"
-	depends on BR2_TARGET_ROOTFS_EXT2
-	default "$(IMAGE).ext2"
-
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
diff --git a/target/ext2/ext2root.mk b/target/ext2/ext2root.mk
index 145b182..68b3b81 100644
--- a/target/ext2/ext2root.mk
+++ b/target/ext2/ext2root.mk
@@ -22,73 +22,19 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),)
 EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
-EXT2_BASE := $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_OUTPUT))
+ROOTFS_EXT2_DEPENDENCIES = host-genext2fs
 
-EXT2_ROOTFS_COMPRESSOR:=
-EXT2_ROOTFS_COMPRESSOR_EXT:=
-EXT2_ROOTFS_COMPRESSOR_PREREQ:=
-ifeq ($(BR2_TARGET_ROOTFS_EXT2_GZIP),y)
-EXT2_ROOTFS_COMPRESSOR:=gzip -9 -c
-EXT2_ROOTFS_COMPRESSOR_EXT:=gz
-endif
-ifeq ($(BR2_TARGET_ROOTFS_EXT2_BZIP2),y)
-EXT2_ROOTFS_COMPRESSOR:=bzip2 -9 -c
-EXT2_ROOTFS_COMPRESSOR_EXT:=bz2
-endif
-ifeq ($(BR2_TARGET_ROOTFS_EXT2_LZMA),y)
-EXT2_ROOTFS_COMPRESSOR:=$(LZMA) -9 -c
-EXT2_ROOTFS_COMPRESSOR_EXT:=lzma
-EXT2_ROOTFS_COMPRESSOR_PREREQ:=host-lzma
-endif
-
-ifneq ($(EXT2_ROOTFS_COMPRESSOR),)
-EXT2_TARGET := $(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT)
-else
-EXT2_TARGET := $(EXT2_BASE)
-endif
-
-$(EXT2_BASE): host-fakeroot host-genext2fs makedevs
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-endif
-	# Use fakeroot so genext2fs believes the previous fakery
 ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
-	GENEXT2_REALSIZE=`LC_ALL=C du -s -c -k $(TARGET_DIR) | grep total | sed -e "s/total//"`; \
-	GENEXT2_ADDTOROOTSIZE=`if [ $$GENEXT2_REALSIZE -ge 20000 ]; then echo 16384; else echo 2400; fi`; \
-	GENEXT2_SIZE=`expr $$GENEXT2_REALSIZE + $$GENEXT2_ADDTOROOTSIZE`; \
-	GENEXT2_ADDTOINODESIZE=`find $(TARGET_DIR) | wc -l`; \
-	GENEXT2_INODES=`expr $$GENEXT2_ADDTOINODESIZE + 400`; \
-	set -x; \
-	echo "$(HOST_DIR)/usr/bin/genext2fs -b $$GENEXT2_SIZE " \
-		"-N $$GENEXT2_INODES -d $(TARGET_DIR) " \
-		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-else
-	echo "$(HOST_DIR)/usr/bin/genext2fs -d $(TARGET_DIR) " \
-		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+GENEXT2_REALSIZE=$(shell LC_ALL=C du -s -c -k $(TARGET_DIR) | grep total | sed -e "s/total//")
+GENEXT2_ADDTOROOTSIZE=$(shell if [ $(GENEXT2_REALSIZE) -ge 20000 ]; then echo 16384; else echo 2400; fi)
+GENEXT2_SIZE=$(shell expr $(GENEXT2_REALSIZE) + $(GENEXT2_ADDTOROOTSIZE))
+GENEXT2_ADDTOINODESIZE=$(shell find $(TARGET_DIR) | wc -l)
+GENEXT2_INODES=$(shell expr $(GENEXT2_ADDTOINODESIZE) + 400)
+EXT2_OPTS += -b $(GENEXT2_SIZE) -N $(GENEXT2_INODES)
 endif
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 
-ifneq ($(EXT2_ROOTFS_COMPRESSOR),)
-$(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(EXT2_BASE)
-	$(EXT2_ROOTFS_COMPRESSOR) $(EXT2_BASE) > $(EXT2_TARGET)
-endif
-
-ext2root: $(EXT2_TARGET)
+define ROOTFS_EXT2_CMD
+	$(HOST_DIR)/usr/bin/genext2fs -d $(TARGET_DIR) $(EXT2_OPTS) $$@
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_ROOTFS_EXT2),y)
-TARGETS+=ext2root
-endif
+$(eval $(call ROOTFS_TARGET,ext2))
\ No newline at end of file
-- 
1.6.3.3

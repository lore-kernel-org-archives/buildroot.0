From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:06 +0200
Subject: [Buildroot] [PATCH 28/44] cpio: convert to ROOTFS_TARGET
	infrastructure
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9bda87be1bd68794617e791ac1f01d502e283dd5.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/cpio/cpioroot.mk |   62 +++++-----------------------------------------
 1 files changed, 7 insertions(+), 55 deletions(-)

diff --git a/target/cpio/cpioroot.mk b/target/cpio/cpioroot.mk
index 0984b72..ab7d546 100644
--- a/target/cpio/cpioroot.mk
+++ b/target/cpio/cpioroot.mk
@@ -4,63 +4,15 @@
 #
 #############################################################
 
-CPIO_BASE:=$(IMAGE).cpio
-
-CPIO_ROOTFS_COMPRESSOR:=
-CPIO_ROOTFS_COMPRESSOR_EXT:=
-CPIO_ROOTFS_COMPRESSOR_PREREQ:=
-ifeq ($(BR2_TARGET_ROOTFS_CPIO_GZIP),y)
-CPIO_ROOTFS_COMPRESSOR:=gzip -9 -c
-CPIO_ROOTFS_COMPRESSOR_EXT:=gz
-endif
-ifeq ($(BR2_TARGET_ROOTFS_CPIO_BZIP2),y)
-CPIO_ROOTFS_COMPRESSOR:=bzip2 -9 -c
-CPIO_ROOTFS_COMPRESSOR_EXT:=bz2
-endif
-ifeq ($(BR2_TARGET_ROOTFS_CPIO_LZMA),y)
-CPIO_ROOTFS_COMPRESSOR:=$(LZMA) -9 -c
-CPIO_ROOTFS_COMPRESSOR_EXT:=lzma
-CPIO_ROOTFS_COMPRESSOR_PREREQ:= host-lzma
-endif
-
-ifneq ($(CPIO_ROOTFS_COMPRESSOR),)
-CPIO_TARGET := $(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT)
-else
-CPIO_TARGET := $(CPIO_BASE)
-endif
-
-cpioroot-init:
+define ROOTFS_CPIO_INIT_SYMLINK
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
+endef
 
-$(CPIO_BASE): host-fakeroot makedevs cpioroot-init
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-endif
-	# Use fakeroot so tar believes the previous fakery
-	echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_BASE)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_INIT_SYMLINK
 
-ifneq ($(CPIO_ROOTFS_COMPRESSOR),)
-$(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT): $(CPIO_ROOTFS_COMPRESSOR_PREREQ) $(CPIO_BASE)
-	$(CPIO_ROOTFS_COMPRESSOR) $(CPIO_BASE) > $(CPIO_TARGET)
-endif
+define ROOTFS_CPIO_CMD
+	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $$@
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_ROOTFS_CPIO),y)
-TARGETS+=cpioroot
-endif
+$(eval $(call ROOTFS_TARGET,cpio))
\ No newline at end of file
-- 
1.6.3.3

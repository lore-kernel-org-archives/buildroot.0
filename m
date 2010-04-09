From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:12 +0200
Subject: [Buildroot] [PATCH 34/44] jffs2: convert to ROOTFS_TARGET
	infrastructure
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bd36a7273a6fa2d21589a1ab6e99bb231e0e868e.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We also remove the BR2_TARGET_ROOTFS_JFFS2_OUTPUT option, that could
be used to specify an alternate name for the generated image file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/jffs2/Config.in    |    4 ---
 target/jffs2/jffs2root.mk |   57 ++++++++++++--------------------------------
 2 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/target/jffs2/Config.in b/target/jffs2/Config.in
index a216a27..b787ec9 100644
--- a/target/jffs2/Config.in
+++ b/target/jffs2/Config.in
@@ -114,8 +114,4 @@ config BR2_TARGET_ROOTFS_JFFS2_SUMMARY
 	  A summarised image can be mounted faster if support is
 	  enabled in the kernel (CONFIG_JFFS2_SUMMARY)
 
-config BR2_TARGET_ROOTFS_JFFS2_OUTPUT
-	string "Output File"
-	default "$(IMAGE).jffs2"
-
 endif
diff --git a/target/jffs2/jffs2root.mk b/target/jffs2/jffs2root.mk
index eea0e3a..a0a563d 100644
--- a/target/jffs2/jffs2root.mk
+++ b/target/jffs2/jffs2root.mk
@@ -32,55 +32,30 @@ JFFS2_OPTS += -n
 SUMTOOL_OPTS += -n
 endif
 
-JFFS2_TARGET := $(call qstrip,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT))
 ifneq ($(TARGET_DEVICE_TABLE),)
 JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)
 endif
 
+ROOTFS_JFFS2_DEPENDENCIES = host-mtd
 
-#
-# mtd-host is a dependency which builds a local copy of mkfs.jffs2 if it is needed.
-# the actual build is done from package/mtd/mtd.mk and it sets the
-# value of MKFS_JFFS2 to either the previously installed copy or the one
-# just built.
-#
-$(JFFS2_TARGET): host-fakeroot host-mtd makedevs
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-endif
-	# Use fakeroot so mkfs.jffs2 believes the previous fakery
 ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
-	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $(JFFS2_TARGET).nosummary && " \
-		"$(SUMTOOL) $(SUMTOOL_OPTS) -i $(JFFS2_TARGET).nosummary -o $(JFFS2_TARGET) && " \
-		"rm $(JFFS2_TARGET).nosummary" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+define ROOTFS_JFFS2_CMD
+	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $$@.nosummary && \
+	$(SUMTOOL) $(SUMTOOL_OPTS) -i $$@.nosummary -o $$@ && \
+	rm $$@.nosummary
+endef
 else
-	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $(JFFS2_TARGET)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-endif
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	@ls -l $(JFFS2_TARGET)
-ifeq ($(BR2_JFFS2_TARGET_SREC),y)
-	$(TARGET_CROSS)objcopy -I binary -O srec --adjust-vma 0xa1000000 $(JFFS2_TARGET) $(JFFS2_TARGET).srec
-	@ls -l $(JFFS2_TARGET).srec
+define ROOTFS_JFFS2_CMD
+	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $$@
+endef
 endif
 
-jffs2root: $(JFFS2_TARGET)
+define JFFS2_GEN_SREC
+	$(TARGET_CROSS)objcopy -I binary -O srec --adjust-vma 0xa1000000 $$@ $$@.srec
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_ROOTFS_JFFS2),y)
-TARGETS+=jffs2root
+ifeq ($(BR2_JFFS2_TARGET_SREC),y)
+ROOTFS_JFFS2_POST_GEN_HOOKS += JFFS2_GEN_SREC
 endif
+
+$(eval $(call ROOTFS_TARGET,jffs2))
\ No newline at end of file
-- 
1.6.3.3

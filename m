From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 18:45:50 +0100
Subject: [Buildroot] [PATCH 12/14] fs: move actions common to all
 filesystems to their own rule
In-Reply-To: <cover.1510508733.git.yann.morin.1998@free.fr>
References: <cover.1510508733.git.yann.morin.1998@free.fr>
Message-ID: <f1fea6fc809c7ed68664e9a5fd6f7d9ced26f33f.1510508733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A lot of actions are common to generating the various images.
Currently, they are all done for each image being generated.

However, we can do them once and for all.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 67 +++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index c17c4585ff..67925c20c7 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -28,13 +28,42 @@
 # macro will automatically generate a compressed filesystem image.
 
 FS_DIR = $(BUILD_DIR)/buildroot-fs
-FAKEROOT_SCRIPT = $(FS_DIR)/fakeroot.fs
+FAKEROOT_SCRIPT = $(FS_DIR)/fakeroot.common
 FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 USERS_TABLE = $(FS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
+.PHONY: rootfs-common
+rootfs-common: target-finalize
+	@$(call MESSAGE,"Preparing rootfs generation script")
+	rm -f $(FAKEROOT_SCRIPT)
+	rm -f $(USERS_TABLE)
+	mkdir -p $(FS_DIR)
+	echo '#!/bin/sh' > $(FAKEROOT_SCRIPT)
+	echo "set -e" >> $(FAKEROOT_SCRIPT)
+	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+ifneq ($(ROOTFS_USERS_TABLES),)
+	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
+endif
+	$(call PRINTF,$(PACKAGES_USERS)) >> $(USERS_TABLE)
+	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
+ifneq ($(ROOTFS_DEVICE_TABLES),)
+	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(FULL_DEVICE_TABLE)
+endif
+endif
+	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
+	echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+	$(foreach s,$(call qstrip,$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
+		echo "echo '$(TERM_BOLD)>>>   Executing fakeroot script $(s)$(TERM_RESET)'" >> $(FAKEROOT_SCRIPT); \
+		echo $(s) $(TARGET_DIR) $(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $(FAKEROOT_SCRIPT)$(sep))
+ifeq ($(BR2_REPRODUCIBLE),y)
+	echo "find $(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$(SOURCE_DATE_EPOCH)" >> $(FAKEROOT_SCRIPT)
+endif
+
 # Since this function will be called from within an $(eval ...)
 # all variable references except the arguments must be $$-quoted.
 define ROOTFS_TARGET_INTERNAL
@@ -67,42 +96,20 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
-$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
+ROOTFS_$(2)_FAKEROOT_SCRIPT = $$(FS_DIR)/fakeroot.$(1)
+
+$$(BINARIES_DIR)/rootfs.$(1): TARGET_DIR=$(FINAL_TARGET_DIR)
+$$(BINARIES_DIR)/rootfs.$(1): rootfs-common target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
-	rm -rf $(FS_DIR)
-	mkdir -p $(FS_DIR)
-	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
-	echo "set -e" >> $$(FAKEROOT_SCRIPT)
-	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-ifneq ($$(ROOTFS_USERS_TABLES),)
-	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
-endif
-	$$(call PRINTF,$$(PACKAGES_USERS)) >> $$(USERS_TABLE)
-	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
-ifneq ($$(ROOTFS_DEVICE_TABLES),)
-	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
-ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	$$(call PRINTF,$$(PACKAGES_DEVICES_TABLE)) >> $$(FULL_DEVICE_TABLE)
-endif
-endif
-	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
-	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
-		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
-		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
+	$$(INSTALL) -m 0755 $$(FAKEROOT_SCRIPT) $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
 	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
-ifeq ($$(BR2_REPRODUCIBLE),y)
-	echo "find $$(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$$(SOURCE_DATE_EPOCH)" >> $$(FAKEROOT_SCRIPT)
-endif
-	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
+	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
 	$$(foreach hook,$$(ROOTFS_POST_CMD_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
-	chmod a+x $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
-	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
-- 
2.11.0

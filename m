From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Dec 2018 22:05:06 +0100
Subject: [Buildroot] [PATCH v4 1/3] fs/common.mk: rename FULL_DEVICE_TABLE
 to ROOTFS_FULL_DEVICES_TABLE
In-Reply-To: <20181203210508.27831-1-thomas.petazzoni@bootlin.com>
References: <20181203210508.27831-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181203210508.27831-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 6b50f988ad0a6044530b30344d52139da2994237 ("fs/common.mk:
rename internal variable"), USERS_TABLE was renamed to
ROOTFS_FULL_USERS_TABLE.

This commit follows the same direction by renaming the
FULL_DEVICE_TABLE variable to ROOTFS_FULL_DEVICE_TABLE.

In addition, for consistency, the file itself is renamed
full_device_table.txt.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 6c67fbfbbd..6ad4cd0b01 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -28,12 +28,12 @@
 # macro will automatically generate a compressed filesystem image.
 
 FS_DIR = $(BUILD_DIR)/buildroot-fs
-FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
+ROOTFS_FULL_DEVICES_TABLE = $(FS_DIR)/full_devices_table.txt
 ROOTFS_FULL_USERS_TABLE = $(FS_DIR)/full_users_table.txt
 
 ifeq ($(BR2_REPRODUCIBLE),y)
@@ -58,12 +58,12 @@ ifneq ($(ROOTFS_USERS_TABLES),)
 	cat $(ROOTFS_USERS_TABLES) >> $(ROOTFS_FULL_USERS_TABLE)
 endif
 ifneq ($(ROOTFS_DEVICE_TABLES),)
-	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
+	cat $(ROOTFS_DEVICE_TABLES) > $(ROOTFS_FULL_DEVICES_TABLE)
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(FULL_DEVICE_TABLE)
+	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
 endif
 endif
-	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
+	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
 
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
@@ -125,7 +125,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(ROOTFS_FULL_USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
-	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_FULL_DEVICES_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
 		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
-- 
2.19.2

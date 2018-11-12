From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Nov 2018 18:33:14 +0100
Subject: [Buildroot] [PATCH 4/6 v2] fs: split devices and permissions tables
In-Reply-To: <cover.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <84c91aa0b6b8503e5d9ece861f2215058b971082.1542043922.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we conflate device tables and permissions tables, on the
premise they are both created and applied with the same tool, makedevs.

Split the two, in to their own final aggregated tables and their own
call to makedevs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d1b6a56913..e406554914 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -28,13 +28,16 @@
 # macro will automatically generate a compressed filesystem image.
 
 FS_DIR = $(BUILD_DIR)/buildroot-fs
-FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
-ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
-	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 
+# BR2_ROOTFS_STATIC_DEVICE_TABLE is really for /dev nodes
+# BR2_ROOTFS_DEVICE_TABLE is only for permissions (legacy name...)
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
+ROOTFS_STATIC_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
+ROOTFS_PERMISSIONS_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
 
 ROOTFS_FINAL_USERS_TABLE = $(FS_DIR)/full_users_table.txt
+ROOTFS_FINAL_STATIC_DEVICES_TABLE = $(FS_DIR)/full_static_devices_table.txt
+ROOTFS_FINAL_PERMISSIONS_TABLE = $(FS_DIR)/full_permissions_table.txt
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 define ROOTFS_REPRODUCIBLE
@@ -57,13 +60,20 @@ rootfs-common: $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 ifneq ($(ROOTFS_USERS_TABLES),)
 	cat $(ROOTFS_USERS_TABLES) >> $(ROOTFS_FINAL_USERS_TABLE)
 endif
-ifneq ($(ROOTFS_DEVICE_TABLES),)
-	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
+
+	$(Q)touch $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
+ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
+	cat $(ROOTFS_STATIC_DEVICE_TABLES) >> $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(FULL_DEVICE_TABLE)
+	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FINAL_STATIC_DEVICES_TABLE)
 endif
 endif
-	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
+
+ifneq ($(ROOTFS_PERMISSIONS_TABLES),)
+	cat $(ROOTFS_PERMISSIONS_TABLES) >>$(ROOTFS_FINAL_PERMISSIONS_TABLE)
+endif
+	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(ROOTFS_FINAL_PERMISSIONS_TABLE)
+
 
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
@@ -122,7 +132,8 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(ROOTFS_FINAL_USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
-	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_FINAL_STATIC_DEVICES_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_FINAL_PERMISSIONS_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
 		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
-- 
2.14.1

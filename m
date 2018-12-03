From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:30:12 +0100
Subject: [Buildroot] [git commit] fs/common.mk: rename internal variable
Message-ID: <20181203202648.2A3A683888@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b50f988ad0a6044530b30344d52139da2994237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation of more renames, rename the variable that points to the
final users table.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: as suggested by Arnout, use ROOTFS_FULL_USERS_TABLE instead
of ROOTFS_FINAL_USERS_TABLE.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 1625b65d0e..6c67fbfbbd 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -31,9 +31,11 @@ FS_DIR = $(BUILD_DIR)/buildroot-fs
 FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
-USERS_TABLE = $(FS_DIR)/users_table.txt
+
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
+ROOTFS_FULL_USERS_TABLE = $(FS_DIR)/full_users_table.txt
+
 ifeq ($(BR2_REPRODUCIBLE),y)
 define ROOTFS_REPRODUCIBLE
 	find $(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$(SOURCE_DATE_EPOCH)
@@ -51,9 +53,9 @@ rootfs-common: $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 	rm -rf $(FS_DIR)
 	mkdir -p $(FS_DIR)
 
-	$(call PRINTF,$(PACKAGES_USERS)) >> $(USERS_TABLE)
+	$(call PRINTF,$(PACKAGES_USERS)) >> $(ROOTFS_FULL_USERS_TABLE)
 ifneq ($(ROOTFS_USERS_TABLES),)
-	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
+	cat $(ROOTFS_USERS_TABLES) >> $(ROOTFS_FULL_USERS_TABLE)
 endif
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
@@ -122,7 +124,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(ROOTFS_FULL_USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \

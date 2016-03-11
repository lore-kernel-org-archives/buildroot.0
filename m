From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:41:37 +0100
Subject: [Buildroot] [PATCH 8/9 v2] fs/common: move actions common to all
	filesystems to their own rule
In-Reply-To: <cover.1457721607.git.yann.morin.1998@free.fr>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
Message-ID: <e7baa279dac14ca71696b310a3ba7814ffb44d54.1457721607.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A lot of actions are common to generating the various images. Currently,
they are all done for each image being generated.

However, we can do them once and for all.

Also add a sha-bang to the fakeroot script, for completeness.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: when I wrote that patch, it was only a preparatory work for something
bigger and clever about how images are generated. However, I can't recall
what it was... :-(  Yet, I believe that patch to still be valid on its own.
---
 fs/common.mk | 57 ++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 0b8163c..d3733b5 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -27,13 +27,36 @@
 # BR2_TARGET_ROOTFS_$(FSTYPE)_LZMA exist and are enabled, then the
 # macro will automatically generate a compressed filesystem image.
 
-FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
-FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
+FS_DIR = $(BUILD_DIR)/fs-common
+FAKEROOT_SCRIPT = $(FS_DIR)/fakeroot.common-base
+FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
-USERS_TABLE = $(BUILD_DIR)/_users_table.txt
+USERS_TABLE = $(FS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
+.PHONY: rootfs-common
+rootfs-common: target-finalize
+	mkdir -p "$(FS_DIR)"
+	rm -f $(FAKEROOT_SCRIPT)
+	rm -f $(USERS_TABLE)
+	echo "#!/bin/sh" > $(FAKEROOT_SCRIPT)
+	echo "set -e" >> $(FAKEROOT_SCRIPT)
+	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+ifneq ($(ROOTFS_USERS_TABLES),)
+	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
+endif
+	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
+	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
+ifneq ($(ROOTFS_DEVICE_TABLES),)
+	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+	printf '$(subst $(sep),\n,$(PACKAGES_DEVICES_TABLE))' >> $(FULL_DEVICE_TABLE)
+endif
+	printf '$(subst $(sep),\n,$(PACKAGES_PERMISSIONS_TABLE))' >> $(FULL_DEVICE_TABLE)
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+endif
+
 # Since this function will be called from within an $(eval ...)
 # all variable references except the arguments must be $$-quoted.
 define ROOTFS_TARGET_INTERNAL
@@ -66,32 +89,16 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
-$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
+ROOTFS_$(2)_FAKEROOT_SCRIPT = $$(FS_DIR)/fakeroot.$(1)
+
+$$(BINARIES_DIR)/rootfs.$(1): rootfs-common $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
-	rm -f $$(FAKEROOT_SCRIPT)
+	$$(INSTALL) -D -m 0755 $$(FAKEROOT_SCRIPT) $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
+	echo "$$(ROOTFS_$(2)_CMD)" >> $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
-	rm -f $$(USERS_TABLE)
-	echo "set -e" >> $$(FAKEROOT_SCRIPT)
-	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-ifneq ($$(ROOTFS_USERS_TABLES),)
-	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
-endif
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
-	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
-ifneq ($$(ROOTFS_DEVICE_TABLES),)
-	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
-ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >> $$(FULL_DEVICE_TABLE)
-endif
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
-	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-endif
-	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
-	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
-	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
-- 
1.9.1

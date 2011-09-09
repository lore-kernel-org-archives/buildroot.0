From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  9 Sep 2011 16:05:08 +0200
Subject: [Buildroot] [PATCH 2/4] Rename the device table in the code base
In-Reply-To: <cover.1315577080.git.maxime.ripard@free-electrons.com>
References: <cover.1315577080.git.maxime.ripard@free-electrons.com>
Message-ID: <acaf90a69412d33c79e9fb716ce9f7584247827b.1315577080.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The device table has grown into something that is no longer restricted
to devices but is now used for permissions, folder creations, etc.
Rename the occurences of device_table by file_install_table, which is
closer to what is done.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 fs/common.mk                                       |   14 +++++++-------
 .../{device_table.txt => file_install_table.txt}   |    0
 target/generic/Config.in                           |    6 +++---
 .../{device_table.txt => file_install_table.txt}   |    0
 ...evice_table_dev.txt => static_device_table.txt} |    0
 target/xtensa/defconfig                            |    2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)
 rename target/device/xtensa/{device_table.txt => file_install_table.txt} (100%)
 rename target/generic/{device_table.txt => file_install_table.txt} (100%)
 rename target/generic/{device_table_dev.txt => static_device_table.txt} (100%)

diff --git a/fs/common.mk b/fs/common.mk
index f793ff9..2ee318a 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -32,9 +32,9 @@
 # macro will automatically generate a compressed filesystem image.
 
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
-FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
-ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
-	$(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
+FULL_FILE_INSTALL_TABLE = $(BUILD_DIR)/_file_install_table.txt
+ROOTFS_FILE_INSTALL_TABLES = $(call qstrip,$(BR2_ROOTFS_FILE_INSTALL_TABLE)) \
+	$(call qstrip,$(BR2_ROOTFS_STATIC_FILE_INSTALL_TABLE))
 
 define ROOTFS_TARGET_INTERNAL
 
@@ -48,14 +48,14 @@ $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 	touch $(BUILD_DIR)/.fakeroot.00000
 	cat $(BUILD_DIR)/.fakeroot* > $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
-ifneq ($(ROOTFS_DEVICE_TABLES),)
-	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+ifneq ($(ROOTFS_FILE_INSTALL_TABLES),)
+	cat $(ROOTFS_FILE_INSTALL_TABLES) > $(FULL_FILE_INSTALL_TABLE)
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_FILE_INSTALL_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)
 	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
-	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE)
+	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_FILE_INSTALL_TABLE)
 	$(foreach hook,$(ROOTFS_$(2)_POST_GEN_HOOKS),$(call $(hook))$(sep))
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 	gzip -9 -c $$@ > $$@.gz
diff --git a/target/device/xtensa/device_table.txt b/target/device/xtensa/file_install_table.txt
similarity index 100%
rename from target/device/xtensa/device_table.txt
rename to target/device/xtensa/file_install_table.txt
diff --git a/target/generic/Config.in b/target/generic/Config.in
index a91de32..a395c6c 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -32,9 +32,9 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 
 endchoice
 
-config BR2_ROOTFS_DEVICE_TABLE
+config BR2_ROOTFS_FILE_INSTALL_TABLE
 	string "Path to the permission tables"
-	default "target/generic/device_table.txt"
+	default "target/generic/file_install_table.txt"
 	help
 	  Specify a space-separated list of permission table locations,
 	  that will be passed to the makedevs utility to assign
@@ -46,7 +46,7 @@ config BR2_ROOTFS_DEVICE_TABLE
 
 config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	string "Path to the device tables"
-	default "target/generic/device_table_dev.txt"
+	default "target/generic/static_device_table.txt"
 	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
 	help
 	  Specify a space-separated list of device table locations,
diff --git a/target/generic/device_table.txt b/target/generic/file_install_table.txt
similarity index 100%
rename from target/generic/device_table.txt
rename to target/generic/file_install_table.txt
diff --git a/target/generic/device_table_dev.txt b/target/generic/static_device_table.txt
similarity index 100%
rename from target/generic/device_table_dev.txt
rename to target/generic/static_device_table.txt
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index 0eee5c0..17ee222 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -102,7 +102,7 @@ BR2_PACKAGE_PORTMAP=y
 #
 # filesystem for target device
 #
-BR2_ROOTFS_DEVICE_TABLE="target/device/xtensa/device_table.txt"
+BR2_ROOTFS_FILE_INSTALL_TABLE="target/device/xtensa/file_install_table.txt"
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
1.7.4.1

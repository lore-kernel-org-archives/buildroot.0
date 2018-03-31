From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 11:05:58 +0200
Subject: [Buildroot] [PATCH 12/15 v4] fs: use a common tarball as base for
 the other filesystems
In-Reply-To: <cover.1522487149.git.yann.morin.1998@free.fr>
References: <cover.1522487149.git.yann.morin.1998@free.fr>
Message-ID: <8b15f15c58976dd080a4daf6969828bcf8291f8c.1522487149.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, some filesystems may want to tweak the content of the target
directory, create special device nodes etc... This all means that:

  - the content of the target directory for a specific filesystems may
    depend on whether another filesystem is enabled or not; for example,
    cpio will create a /init script or symlink and a /dev/console node;

  - the filesysems can not be built in parallel, because they may change
    the content of the target directory wil another is being assembled.

Furthermore, the same fakeroot script is executed over-and-over-again
for each filesystem, to create the device nodes, the users and their
homes and files, and setting permissions...

We introduce an intermediate tarball, for which we do the full fakeroot
shebang.

That tarball then serves as the base for the other filesystems, with a
very simple fakeroot script that untars the common tarball, and calls
the actual filesystem image generator on that.

Note that we use a very simple tar command to generate the intermediate
tarball, because we are not concerned with reproducibility of the
archive itself (only of the archived files).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk | 75 +++++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 28 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 05ae107192..f3d42519f6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -42,6 +42,19 @@ endif
 
 ROOTFS_COMMON_TAR = $(FS_DIR)/rootfs.common.tar
 
+# Command to create the common tarball from the base target directory.
+define ROOTFS_COMMON_TAR_CMD
+	tar cf $(ROOTFS_COMMON_TAR) --numeric-owner \
+		--exclude=$(notdir $(TARGET_DIR_WARNING_FILE)) \
+		-C $(TARGET_DIR) .
+endef
+
+# Command to extract the common tarball into the per-rootfs target directory
+define ROOTFS_COMMON_UNTAR_CMD
+	mkdir -p $(TARGET_DIR)
+	tar xf $(ROOTFS_COMMON_TAR) -C $(TARGET_DIR)
+endef
+
 .PHONY: rootfs-common
 rootfs-common: $(ROOTFS_COMMON_TAR)
 
@@ -49,11 +62,39 @@ ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
-.PHONY: $(ROOTFS_COMMON_TAR)
 # When doing the common tarball, we're not really doing a rootfs.
 $(ROOTFS_COMMON_TAR): ROOTFS=
+$(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
 $(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
-	@:
+	@$(call MESSAGE,"Generating common rootfs tarball")
+	rm -rf $(FS_DIR)
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
+		echo $(EXTRA_ENV) $(s) $(TARGET_DIR) $(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $(FAKEROOT_SCRIPT)$(sep))
+	$(foreach hook,$(ROOTFS_PRE_CMD_HOOKS),\
+		$(call PRINTF,$($(hook))) >> $(FAKEROOT_SCRIPT)$(sep))
+	$(call PRINTF,$(ROOTFS_COMMON_TAR_CMD)) >> $(FAKEROOT_SCRIPT)
+	$(foreach hook,$(ROOTFS_POST_CMD_HOOKS),\
+		$(call PRINTF,$($(hook))) >> $(FAKEROOT_SCRIPT)$(sep))
+	chmod a+x $(FAKEROOT_SCRIPT)
+	PATH=$(BR_PATH) $(HOST_DIR)/bin/fakeroot -- $(FAKEROOT_SCRIPT)
 
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
@@ -64,7 +105,7 @@ define inner-rootfs
 
 ROOTFS_$(2)_NAME = $(1)
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
-ROOTFS_$(2)_TARGET_DIR = $$(BASE_TARGET_DIR)
+ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
 
 ROOTFS_$(2)_DEPENDENCIES += rootfs-common
 
@@ -101,39 +142,17 @@ $$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
 $$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
 $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
-	rm -rf $(FS_DIR) $$(ROOTFS_$(2)_DIR)
-	mkdir -p $(FS_DIR) $$(ROOTFS_$(2)_DIR)
+	rm -rf $$(ROOTFS_$(2)_DIR)
+	mkdir -p $$(ROOTFS_$(2)_DIR)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
+	$$(call PRINTF,$$(ROOTFS_COMMON_UNTAR_CMD)) >> $$(FAKEROOT_SCRIPT)
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
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
-		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
-	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
-		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
-	$$(foreach hook,$$(ROOTFS_POST_CMD_HOOKS),\
-		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	rm -f $$(TARGET_DIR_WARNING_FILE)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
-	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
-- 
2.14.1

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Oct 2018 09:45:58 +0200
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <cover.1540626349.git.yann.morin.1998@free.fr>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
Message-ID: <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The combination of fakeroot, tar, and capabilities is broken, because
fakeroot currently badly handles capabilities, which are currently
simply ignored.

As described in #11216, asking tar to explicitly store and restore
capabilities ends up with a failling build, when tar actually tries to
restore the capabilities. Adding support for capabilities to fakeroot
(by adding host-libcap as dependency) does not fix the problem.

Capabilities are stored in the extended attribute security.capabilty.
It turns out that tar does have special handling when extracting and
restoring that extended attribute, and that fails miserably when running
under fakeroot...

We fix that by offloading the permissions handling down to individual
filesystems.

This needs a split of the makedevs call, with the current and first one
now only responsible for creating the pseudo devices, while the new,
second call does only set the permissions.

Fixes: #11216

This changes the order of steps, and post-fakeroot scripts are now
called before the permissions are set. This could mean breaking existing
setups, but more probably, this woudl sovle some, where files created in
post-fakeroot scripts can now see their permissions appropriately set.

This also slightly breaks the idea behind the intermediate image, which
was supposed to gather all actions common to all filesystems, so that
they are not repeated. Still, most actions are still created only once,
and moving just this is purely a practical and pragmatic workaround.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 fs/common.mk | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 453da6010a..569e5d60c5 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -29,8 +29,8 @@
 
 FS_DIR = $(BUILD_DIR)/buildroot-fs
 FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
-ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
-	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
+ROOTFS_PERMISSION_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
+ROOTFS_STATIC_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 USERS_TABLE = $(FS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
@@ -81,14 +81,13 @@ ifneq ($(ROOTFS_USERS_TABLES),)
 	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
 endif
 	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
-ifneq ($(ROOTFS_DEVICE_TABLES),)
-	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
+ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
+	cat $(ROOTFS_STATIC_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(FULL_DEVICE_TABLE)
 endif
-endif
-	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
 	echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+endif
 	$(foreach s,$(call qstrip,$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$(TERM_BOLD)>>>   Executing fakeroot script $(s)$(TERM_RESET)'" >> $(FAKEROOT_SCRIPT); \
 		echo $(EXTRA_ENV) $(s) $(TARGET_DIR) $(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $(FAKEROOT_SCRIPT)$(sep))
@@ -108,6 +107,7 @@ define inner-rootfs
 
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
 ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
+ROOTFS_$(2)_PERMISSION_TABLE = $$(ROOTFS_$(2)_DIR)/permissions.txt
 
 ROOTFS_$(2)_DEPENDENCIES += rootfs-common
 
@@ -149,6 +149,11 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_COMMON_UNTAR_CMD)) >> $$(FAKEROOT_SCRIPT)
+ifneq ($$(ROOTFS_PERMISSION_TABLES),)
+	cat $$(ROOTFS_PERMISSION_TABLES) > $$(ROOTFS_$(2)_PERMISSION_TABLE)
+endif
+	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(ROOTFS_$(2)_PERMISSION_TABLE)
+	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_$(2)_PERMISSION_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
-- 
2.14.1

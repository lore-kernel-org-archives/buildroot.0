From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Jun 2014 00:54:59 +0000 (UTC)
Subject: [Buildroot] [Bug 7160] New: host-xz not built.
Message-ID: <bug-7160-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7160

           Summary: host-xz not built.
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tommygunsster at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When trying to build with xz as the compression medium for the built
rootfs-ext2, in the final steps it fails to run xz compression with a message
like:

/root/buildroot32/output/host/usr/bin/xz -9 -C crc32 -c
/root/buildroot32/output/images/rootfs.ext2 >
/root/buildroot32/output/images/rootfs.ext2.xz
/bin/bash: /root/buildroot32/output/host/usr/bin/xz: No such file or directory
make: *** [/root/buildroot32/output/images/rootfs.ext2] Error 127

The reason is because the host-xz tools are not built.

Looking at a diff between 2014.02 and 2014.05 reveals that the reasoning is in
buildroot/fs/common.mk

--- ../buildroot-2014.02/fs/common.mk   2014-02-27 15:51:23.000000000 -0500
+++ ../buildroot32/fs/common.mk 2014-05-31 03:52:49.000000000 -0400
@@ -33,6 +33,7 @@
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
        $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 USERS_TABLE = $(BUILD_DIR)/_users_table.txt
+ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))

 define ROOTFS_TARGET_INTERNAL

@@ -59,16 +60,16 @@
 ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
-ROOTFS_$(2)_DEPENDENCIES += host-xz
 ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = $$(XZ) -9 -C crc32 -c
 endif

-$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
+$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
        @$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
        $$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
        rm -f $$(FAKEROOT_SCRIPT)
        rm -f $$(TARGET_DIR_WARNING_FILE)
+       rm -f $(USERS_TABLE)
        echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
        cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
@@ -78,11 +79,14 @@
        printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >>
$$(FULL_DEVICE_TABLE)
        echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE)
$$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
-       printf '$(subst $(sep),\n,$(PACKAGES_USERS))' > $(USERS_TABLE)
-       $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >>
$(FAKEROOT_SCRIPT)
+ifneq ($$(ROOTFS_USERS_TABLES),)
+       cat $$(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
+endif
+       printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
+       PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE)
$(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
        echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
        chmod a+x $$(FAKEROOT_SCRIPT)
-       $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+       PATH=$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
        $(INSTALL) -m 0644 support/misc/target-dir-warning.txt
$$(TARGET_DIR_WARNING_FILE)
        - at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
@@ -95,7 +99,7 @@
 rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)

 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
-TARGETS += rootfs-$(1)
+TARGETS_ROOTFS += rootfs-$(1)
 endif
 endef

Re-adding this line:
ROOTFS_$(2)_DEPENDENCIES += host-xz

right below line 62 fixes the issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

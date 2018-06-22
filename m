From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 21 Jun 2018 23:31:05 -0300
Subject: [Buildroot] [RFC] fs: allow passing the image file name to
 inner-rootfs
Message-ID: <20180622023105.27865-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suppose that you want to create a filesystem image containing only the
/var/lib subtree. That would something like this on a br2-external:

fs/rootfs-var-lib/Config.in:

    menuconfig BR2_TARGET_ROOTFS_VAR_LIB
    bool "/var/lib"

    if BR2_TARGET_ROOTFS_VAR_LIB
    source "$BR2_EXTERNAL_MFS_PATH/fs/rootfs-var-lib/ext4/Config.in"
    endif

fs/rootfs-var-lib/rootfs-var-lib.mk:
    ifeq ($(BR2_TARGET_ROOTFS_VAR_LIB),y)
    rootfs-var-lib = $(call inner-rootfs,var-lib-$(pkgname),VAR_LIB_$(call UPPERCASE,$(pkgname)))
    include $(sort $(wildcard $(BR2_EXTERNAL_MFS_PATH)/fs/rootfs-var-lib/*/*.mk))
    endif

fs/rootfs-var-lib/ext4/Config.in:
    config BR2_TARGET_ROOTFS_VAR_LIB_EXT4
        bool "ext4 /var/lib filesystem"
        select BR2_PACKAGE_HOST_E2FSPROGS
        help
          Build an ext4 /var/lib filesystem

    if BR2_TARGET_ROOTFS_VAR_LIB_EXT4
        [...]
    endif # BR2_TARGET_ROOTFS_VAR_LIB_EXT4

fs/rootfs-var-lib/ext4/ext4.mk:
    # Build the ext4 /var/lib filesystem image
    [...]
    ROOTFS_VAR_LIB_EXT4_OPTS = \
        -d $(TARGET_DIR)/var/lib \
                        ^^^^^^^^---- /var/lib, only
    [...]
    define ROOTFS_VAR_LIB_EXT4_CMD
        rm -f $@
        $(HOST_DIR)/sbin/mkfs.ext4 $(ROOTFS_VAR_LIB_EXT4_OPTS) $@ "$(ROOTFS_VAR_LIB_EXT4_SIZE)"
    endef
    $(eval $(rootfs-var-lib))

Selecting BR2_TARGET_ROOTFS_VAR_LIB_EXT4 would produce the filesystem
image $(BINARIES_DIR)/rootfs.var-lib-ext4 coresponging to the contents
of $(TARGET_DIR)/var/lib. This is correct but the file name is a bit
awkward. It would be better to call it "rootfs-var-lib.ext4", instead.

This can be achieved by passing a third argument to inner-rootfs with
the desired file name:

    rootfs-var-lib = $(call inner-rootfs,var-lib-$(pkgname),VAR_LIB_$(call UPPERCASE,$(pkgname)),rootfs-var-lib.$(pkgname))

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 fs/common.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index abf35418cb..2380c1dd3f 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -139,10 +139,10 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
-$$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
-$$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
-$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
-	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
+$$(BINARIES_DIR)/$(3): ROOTFS=$(2)
+$$(BINARIES_DIR)/$(3): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
+$$(BINARIES_DIR)/$(3): $$(ROOTFS_$(2)_DEPENDENCIES)
+	@$$(call MESSAGE,"Generating root filesystem image $(3)")
 	rm -rf $$(ROOTFS_$(2)_DIR)
 	mkdir -p $$(ROOTFS_$(2)_DIR)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
@@ -163,7 +163,7 @@ endif
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
-rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
+rootfs-$(1): $$(BINARIES_DIR)/$(3)
 
 .PHONY: rootfs-$(1) rootfs-$(1)-show-depends
 
@@ -181,6 +181,6 @@ endif
 endef
 
 # $(pkgname) also works well to return the filesystem name
-rootfs = $(call inner-rootfs,$(pkgname),$(call UPPERCASE,$(pkgname)))
+rootfs = $(call inner-rootfs,$(pkgname),$(call UPPERCASE,$(pkgname)),rootfs.$(pkgname))
 
 include $(sort $(wildcard fs/*/*.mk))
-- 
2.17.1

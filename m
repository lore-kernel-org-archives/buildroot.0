From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 18:45:47 +0100
Subject: [Buildroot] [PATCH 09/14] fs: don't pollute $(BUILD_DIR) with temp
 files
In-Reply-To: <cover.1510508733.git.yann.morin.1998@free.fr>
References: <cover.1510508733.git.yann.morin.1998@free.fr>
Message-ID: <a6bfdcf6c7cf1495a15914f8f1226eeb37d7e86f.1510508733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we create a bunch of temporary files in $(BUILD_DIR), while
assembling the filesystem images.

Move those files to their own sub-directory.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d4d5c183a5..7bbc143892 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -27,11 +27,12 @@
 # BR2_TARGET_ROOTFS_$(FSTYPE)_LZMA exist and are enabled, then the
 # macro will automatically generate a compressed filesystem image.
 
-FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
-FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
+FS_DIR = $(BUILD_DIR)/buildroot-fs
+FAKEROOT_SCRIPT = $(FS_DIR)/fakeroot.fs
+FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
-USERS_TABLE = $(BUILD_DIR)/_users_table.txt
+USERS_TABLE = $(FS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
 # Since this function will be called from within an $(eval ...)
@@ -69,8 +70,8 @@ endif
 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
-	rm -f $$(FAKEROOT_SCRIPT)
-	rm -f $$(USERS_TABLE)
+	rm -rf $(FS_DIR)
+	mkdir -p $(FS_DIR)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-- 
2.11.0

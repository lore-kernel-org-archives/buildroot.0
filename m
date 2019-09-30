From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 30 Sep 2019 08:53:42 -0300
Subject: [Buildroot] [PATCH] Strip binaries in the fakeroot script instead
 of in target-finalize
Message-ID: <20190930115342.17237-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Since commit 118534fe54 the root filesystem image is generated from an
intermediary copy of TARGET_DIR, so we can move the stripping of target
binaries from target-finalize to the fakeroot script.

This allows us to easily find the non-stripped executables to debug with
gdbserver, as they are at the same relative path in TARGET_DIR as in the
target device, rather than searching inside the build directory.

We can also set sysroot to TARGET_DIR in gdb, instead of STAGING_DIR.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=10386

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Ciro Santilli <ciro.santilli@gmail.com>
---
---
 Makefile     | 34 ----------------------------------
 fs/common.mk | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/Makefile b/Makefile
index ecaae13846..57314e5f1d 100644
--- a/Makefile
+++ b/Makefile
@@ -614,38 +614,6 @@ RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
 	--exclude CVS
 
-# When stripping, obey to BR2_STRIP_EXCLUDE_DIRS and
-# BR2_STRIP_EXCLUDE_FILES
-STRIP_FIND_COMMON_CMD = \
-	find $(TARGET_DIR) \
-	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)), \
-		\( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) \
-		-prune -o \
-	) \
-	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
-		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) )
-
-# Regular stripping for everything, except libpthread, ld-*.so and
-# kernel modules:
-# - libpthread.so: a non-stripped libpthread shared library is needed for
-#   proper debugging of pthread programs using gdb.
-# - ld.so: a non-stripped dynamic linker library is needed for valgrind
-# - kernel modules (*.ko): do not function properly when stripped like normal
-#   applications and libraries. Normally kernel modules are already excluded
-#   by the executable permission check, so the explicit exclusion is only
-#   done for kernel modules with incorrect permissions.
-STRIP_FIND_CMD = \
-	$(STRIP_FIND_COMMON_CMD) \
-	-type f \( -perm /111 -o -name '*.so*' \) \
-	-not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko) \) \
-	-print0
-
-# Special stripping (only debugging symbols) for libpthread and ld-*.so.
-STRIP_FIND_SPECIAL_LIBS_CMD = \
-	$(STRIP_FIND_COMMON_CMD) \
-	\( -name 'ld-*.so*' -o -name 'libpthread*.so*' \) \
-	-print0
-
 ifeq ($(BR2_ECLIPSE_REGISTER),y)
 define TOOLCHAIN_ECLIPSE_REGISTER
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` \
@@ -761,8 +729,6 @@ endif
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
-	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
-	$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $(STRIPCMD) $(STRIP_STRIP_DEBUG) 2>/dev/null || true
 
 	test -f $(TARGET_DIR)/etc/ld.so.conf && \
 		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
diff --git a/fs/common.mk b/fs/common.mk
index 842ea924a5..d835d7dccc 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -61,6 +61,38 @@ ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES = $(sort \
 	) \
 	$(ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES__X))
 
+# When stripping, obey to BR2_STRIP_EXCLUDE_DIRS and
+# BR2_STRIP_EXCLUDE_FILES
+STRIP_FIND_COMMON_CMD = \
+	find $(TARGET_DIR) \
+	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)), \
+		\( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) \
+		-prune -o \
+	) \
+	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
+		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) )
+
+# Regular stripping for everything, except libpthread, ld-*.so and
+# kernel modules:
+# - libpthread.so: a non-stripped libpthread shared library is needed for
+#   proper debugging of pthread programs using gdb.
+# - ld.so: a non-stripped dynamic linker library is needed for valgrind
+# - kernel modules (*.ko): do not function properly when stripped like normal
+#   applications and libraries. Normally kernel modules are already excluded
+#   by the executable permission check, so the explicit exclusion is only
+#   done for kernel modules with incorrect permissions.
+STRIP_FIND_CMD = \
+	$(STRIP_FIND_COMMON_CMD) \
+	-type f \( -perm /111 -o -name '*.so*' \) \
+	-not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko) \) \
+	-print0
+
+# Special stripping (only debugging symbols) for libpthread and ld-*.so.
+STRIP_FIND_SPECIAL_LIBS_CMD = \
+	$(STRIP_FIND_COMMON_CMD) \
+	\( -name 'ld-*.so*' -o -name 'libpthread*.so*' \) \
+	-print0
+
 .PHONY: rootfs-common
 rootfs-common: $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 	@$(call MESSAGE,"Generating root filesystems common tables")
@@ -160,6 +192,8 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 
+	echo "$$(STRIP_FIND_CMD) | xargs -0 $$(STRIPCMD) 2>/dev/null || true" >> $$(FAKEROOT_SCRIPT)
+	echo "$$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $$(STRIPCMD) $$(STRIP_STRIP_DEBUG) 2>/dev/null || true" >> $$(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(ROOTFS_FULL_USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_FULL_DEVICES_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-- 
2.18.1

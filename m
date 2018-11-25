From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:30:06 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] fs: don't use an
 intermediate tarball
Message-ID: <20181125222832.1035B88439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=243742439df9dea62bd4f251a3bb982ed4bb3e41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Since 118534fe54b (fs: use a common tarball as base for the other
filesystems), the filesystem creation is split in two steps, using an
intermediate tarball to carry the generic, common finalisations to the
per-filesystem finalisation and image creation.

However, this intermediate tarball causes an issue with capabilities:
they are entirely missing in the generated filesystems.

Capabilities are stored in the extended attribute security.capability,
which tar by default will not store/restore, unless explicitly told to,
e.g. with --xattrs-include='*', which we don't pass.

Now, passing this option when creating and extracting the intermediate
tarball, both done under fakeroot, will cause fakeroot to report an
invalid filetype for files with capabilities. mksquashfs would report
such unknown files as a warning, while mkfs.ext2 would fail (with a
similar error message), e.g.:

    File [...]/usr/sbin/getcap has unrecognised filetype 0, ignoring

This is due to a poor interaction between tar and fakeroot; running as
root the exact same commands we run under fakeroot, works as expected.
Unfortunately, short of fixing fakeroot (which would first require
understanding the problem in there), we don't have much options.

The intermediate tarball was made to avoid redoing the same actions over
and over again for each filesystem to build. However, most of the time,
only one or two such filesystems would be enabled [0], and those actions
are usually pretty lightweight. So, using an intermediate tarball does
not provide a big optimisation.

The main reason to introduce the intermediate tarball, however, is that
it allows to postpone per-filesystem finalisations to be applied only
for the corresponding filesystem, not for all of them.

So, we get rid of the intermediate tarball, and simply move all of the
code to run under fakeroot to the per-filesystem fakeroot script.
Instead of extracting the intermediate tarball, we just rsync the
original target/ directory, and apply the filesystem finalisations on
that copy. The only thing still done in the rootfs-common step is to
generate the intermediate files (users file, devices file) that are used
in the fakeroot script.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=11216

Note: an alternate solution would have been to keep the intermediate
tarball to keep most of the common finalisations, and move only the
permissions to each filesystem, but that was getting a bit more complex
and changed the ordering of permissions and post-fakeroot scripts. Once
we bite the bullet of having some common finalisation done in each
filesystem, it's easier to just move all of them.

[0] Most probsably, users would enable the real filesystem to put on
their device, plus the 'tar' filesystem, to be able to easily inspect
the content on their development machine.

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 409d4c3fe9949f01b009712a1a731baf597e0f8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk                                    | 59 ++++++++-----------------
 support/testing/tests/core/test_post_scripts.py |  4 +-
 2 files changed, 20 insertions(+), 43 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 453da6010a..54979d7b07 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -40,47 +40,20 @@ define ROOTFS_REPRODUCIBLE
 endef
 endif
 
-ROOTFS_COMMON_TAR = $(FS_DIR)/rootfs.common.tar
-
-# Command to create the common tarball from the base target directory.
-define ROOTFS_COMMON_TAR_CMD
-	tar cf $(ROOTFS_COMMON_TAR) --numeric-owner \
-		--exclude=$(notdir $(TARGET_DIR_WARNING_FILE)) \
-		-C $(TARGET_DIR) .
-endef
-
-# Command to extract the common tarball into the per-rootfs target directory
-define ROOTFS_COMMON_UNTAR_CMD
-	mkdir -p $(TARGET_DIR)
-	tar xf $(ROOTFS_COMMON_TAR) -C $(TARGET_DIR)
-endef
-
-.PHONY: rootfs-common
-rootfs-common: $(ROOTFS_COMMON_TAR)
-
-# Emulate being in a filesystem, so that we can have our own TARGET_DIR.
-ROOTFS_COMMON_TARGET_DIR = $(FS_DIR)/target
-
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
-$(ROOTFS_COMMON_TAR): ROOTFS=COMMON
-$(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
-$(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
-	@$(call MESSAGE,"Generating common rootfs tarball")
+.PHONY: rootfs-common
+rootfs-common: $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
+	@$(call MESSAGE,"Generating root filesystems common tables")
 	rm -rf $(FS_DIR)
 	mkdir -p $(FS_DIR)
-	rsync -auH $(BASE_TARGET_DIR)/ $(TARGET_DIR)
-	echo '#!/bin/sh' > $(FAKEROOT_SCRIPT)
-	echo "set -e" >> $(FAKEROOT_SCRIPT)
-	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 
 	$(call PRINTF,$(PACKAGES_USERS)) >> $(USERS_TABLE)
 ifneq ($(ROOTFS_USERS_TABLES),)
 	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
 endif
-	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
@@ -88,16 +61,6 @@ ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 endif
 endif
 	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
-	echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
-	$(foreach s,$(call qstrip,$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
-		echo "echo '$(TERM_BOLD)>>>   Executing fakeroot script $(s)$(TERM_RESET)'" >> $(FAKEROOT_SCRIPT); \
-		echo $(EXTRA_ENV) $(s) $(TARGET_DIR) $(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $(FAKEROOT_SCRIPT)$(sep))
-	$(foreach hook,$(ROOTFS_PRE_CMD_HOOKS),\
-		$(call PRINTF,$($(hook))) >> $(FAKEROOT_SCRIPT)$(sep))
-	$(call PRINTF,$(ROOTFS_COMMON_TAR_CMD)) >> $(FAKEROOT_SCRIPT)
-	chmod a+x $(FAKEROOT_SCRIPT)
-	PATH=$(BR_PATH) $(HOST_DIR)/bin/fakeroot -- $(FAKEROOT_SCRIPT)
-	$(Q)rm -rf $(TARGET_DIR)
 
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
@@ -146,9 +109,23 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	rm -rf $$(ROOTFS_$(2)_DIR)
 	mkdir -p $$(ROOTFS_$(2)_DIR)
+	rsync -auH \
+		--exclude=/$$(notdir $$(TARGET_DIR_WARNING_FILE)) \
+		$$(BASE_TARGET_DIR)/ \
+		$$(TARGET_DIR)
+
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
-	$$(call PRINTF,$$(ROOTFS_COMMON_UNTAR_CMD)) >> $$(FAKEROOT_SCRIPT)
+
+	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
+	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
+		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
+		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
+	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
+		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
+
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index a0e5b6b454..40a36b7904 100644
--- a/support/testing/tests/core/test_post_scripts.py
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -41,8 +41,8 @@ class TestPostScripts(infra.basetest.BRTest):
                                  os.path.join(self.builddir, "target"),
                                  os.path.join(self.builddir, "target"))
         self.check_post_log_file("post-fakeroot.log",
-                                 os.path.join(self.builddir, "build/buildroot-fs/target"),
-                                 os.path.join(self.builddir, "build/buildroot-fs/target"))
+                                 os.path.join(self.builddir, "build/buildroot-fs/tar/target"),
+                                 os.path.join(self.builddir, "build/buildroot-fs/tar/target"))
         self.check_post_log_file("post-image.log",
                                  os.path.join(self.builddir, "images"),
                                  os.path.join(self.builddir, "target"))

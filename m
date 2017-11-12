From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 18:45:51 +0100
Subject: [Buildroot] [PATCH 13/14] core: finalise target in its own location
In-Reply-To: <cover.1510508733.git.yann.morin.1998@free.fr>
References: <cover.1510508733.git.yann.morin.1998@free.fr>
Message-ID: <70e854f47bf7a1abee15830311361ce13a110acb.1510508733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, after all packages have been installed into target/ , we run
a sanitising pass called 'target-finalize' on that directory, to:
  - apply overlays
  - remove unnecessary files (man, .h, .a ...)
  - strip files
as well as a few other miscellanous cleanups.

This means that target/ no longer contains only package-installed files,
and that target-finalize might not be idempotent (i.e. sucessive runs of
target-finalize may yield different results in target/ ). We're trying
pretty hard that all the internal target-finalize hooks are idempotent,
whether they are from the core (e.g. installing glibc locales) or
provided by packages (e.g. cleaning up perl files).

However, that might not be the case for packages from br2-external for
example, or under complex situations where a combination of packages
does not yield an idempotent sequence (quoting Wikipedia: "a combination
of idempotent methods or subroutines is not necessrily idempotent"; see:
https://en.wikipedia.org/wiki/Idempotence#Examples ).

A second issue is that we further need to further change the layout of
target/ just prior to assembling the filesystem image(s), and then
restore it just after. This is the case to support systemd on a
read-only filesystem, for example (the only example in fact).
This means that doing so is not parallel safe.

Address this issue by copying target/ to a "landing" area where both
finalising actions (target-finalize and pre-image hooks) take place.

This keeps the user-visible target/ directory to contain only what
packages have installed, helps keeping target-finalize be idempotent by
allowing packages to provide simpler target-finalize hooks, and ensures
that target/ is never left in an incorrect state in case a filesystem
image generator fails.

For simplicity for packages, we have to allow them to use $(TARGET_DIR)
everywhere, be it in target install commands or target finalize
commands, without requiring them to know whether to use $(TARGET_DIR)
or $(FINAL_TARGET_DIR). $(TARGET_DIR) always points to the directory in
which to act.

So, for target-finalize, we override TARGET_DIR to point to the landing
area. But since packages are dependencies of target-finalize, they
would also inherit from this override. So, we over-override TARGET_DIR
for packages, to point to the usual and currently used $(O)/target/
directory.

Finally, filesystem images are generated from that landing area, of
course. Similarly, we need to override TARGET_DIR for them.

This also means that we no longer need the post-filesystem command hooks
from skeleton-systemd, since we no longer need to restore target/ into
the state it was before assembling the image(s).

As a consequence, update the testsing infra to reflect the fact that the
target directoryy has moved, and is no longer pointing to the same
location at various points in the build steps.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                           | 28 +++++++++++++++++++++-
 fs/common.mk                                       |  1 +
 package/pkg-generic.mk                             |  2 --
 .../skeleton-init-systemd/skeleton-init-systemd.mk |  6 -----
 support/testing/tests/core/test_post_scripts.py    |  8 +++----
 support/testing/tests/core/test_rootfs_overlay.py  |  4 ++--
 6 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 19bfcfbee3..f38c97074b 100644
--- a/Makefile
+++ b/Makefile
@@ -215,7 +215,9 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
-TARGET_DIR := $(BASE_DIR)/target
+BUILD_TARGET_DIR := $(BASE_DIR)/target
+TARGET_DIR := $(BUILD_TARGET_DIR)
+FINAL_TARGET_DIR := $(BUILD_DIR)/target-finalize
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
@@ -676,9 +678,33 @@ endif
 
 $(TARGETS_ROOTFS): target-finalize
 
+# Finalizing the target directory involves:
+#  - applying overlays,
+#  - removing unecessary files (man, .h, .a ...)
+#  - tweaking files installed by packages (like stripping)
+# and miscellanous cleanups.
+#
+# We want to keep the $(O)/target/ directory as a perfect image of
+# what packages have actually installed, so we copy it to a landing
+# location where we'll do those cleanups.
+#
+# Still, we only document $(TARGET_DIR) so packages that want to provide
+# target-finalize hooks will be using that. Thus, we just override that
+# variable with the landing location just for target-finalize.
+#
+# However, since rule-overriden variables are inherited by the dependencies
+# of that rule, we must re-override TARGET_DIR with its original location
+# for packages.
+#
+$(PACKAGES): TARGET_DIR=$(BUILD_TARGET_DIR)
+
 .PHONY: target-finalize
+target-finalize: TARGET_DIR=$(FINAL_TARGET_DIR)
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
+	$(Q)rm -rf $(TARGET_DIR)
+	$(Q)cp -a $(BUILD_TARGET_DIR) $(TARGET_DIR)
+	$(Q)rm -f $(TARGET_DIR_WARNING_FILE)
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/fs/common.mk b/fs/common.mk
index 67925c20c7..878b81e43f 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -36,6 +36,7 @@ USERS_TABLE = $(FS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
 .PHONY: rootfs-common
+rootfs-common: TARGET_DIR=$(FINAL_TARGET_DIR)
 rootfs-common: target-finalize
 	@$(call MESSAGE,"Preparing rootfs generation script")
 	rm -f $(FAKEROOT_SCRIPT)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0e28675fbe..19527dcaf7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -620,7 +620,6 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
-$(2)_ROOTFS_POST_CMD_HOOKS      ?=
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -941,7 +940,6 @@ PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
 TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
-ROOTFS_POST_CMD_HOOKS += $$($(2)_ROOTFS_POST_CMD_HOOKS)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index a2d4e8c4b3..7da801ac4e 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -54,12 +54,6 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 endef
 SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 
-define SKELETON_INIT_SYSTEMD_POST_ROOTFS_VAR
-	rm -rf $(TARGET_DIR)/var
-	ln -s usr/share/factory/var $(TARGET_DIR)/var
-endef
-SKELETON_INIT_SYSTEMD_ROOTFS_POST_CMD_HOOKS += SKELETON_INIT_SYSTEMD_POST_ROOTFS_VAR
-
 endif
 
 define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index 1db568b0d6..3377088cca 100644
--- a/support/testing/tests/core/test_post_scripts.py
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -16,7 +16,7 @@ class TestPostScripts(infra.basetest.BRTest):
         """.format(infra.filepath("tests/core/post-build.sh"),
                    infra.filepath("tests/core/post-image.sh"))
 
-    def check_post_log_file(self, path, what):
+    def check_post_log_file(self, path, what, target_dir):
         lines = {}
         with open(path, 'rb') as csvfile:
             r = csv.reader(csvfile, delimiter=',')
@@ -26,7 +26,7 @@ class TestPostScripts(infra.basetest.BRTest):
         self.assertEqual(lines["arg1"], os.path.join(self.builddir, what))
         self.assertEqual(lines["arg2"], "foobar")
         self.assertEqual(lines["arg3"], "baz")
-        self.assertEqual(lines["TARGET_DIR"], os.path.join(self.builddir, "target"))
+        self.assertEqual(lines["TARGET_DIR"], target_dir)
         self.assertEqual(lines["BUILD_DIR"], os.path.join(self.builddir, "build"))
         self.assertEqual(lines["HOST_DIR"], os.path.join(self.builddir, "host"))
         staging = os.readlink(os.path.join(self.builddir, "staging"))
@@ -36,6 +36,6 @@ class TestPostScripts(infra.basetest.BRTest):
 
     def test_run(self):
         f = os.path.join(self.builddir, "build", "post-build.log")
-        self.check_post_log_file(f, "target")
+        self.check_post_log_file(f, "build/target-finalize", os.path.join(self.builddir, "build/target-finalize"))
         f = os.path.join(self.builddir, "build", "post-image.log")
-        self.check_post_log_file(f, "images")
+        self.check_post_log_file(f, "images", os.path.join(self.builddir, "target"))
diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
index fedd40d8ac..119169094a 100644
--- a/support/testing/tests/core/test_rootfs_overlay.py
+++ b/support/testing/tests/core/test_rootfs_overlay.py
@@ -19,12 +19,12 @@ class TestRootfsOverlay(infra.basetest.BRTest):
         """.format(rootfs_overlay_path)
 
     def test_run(self):
-        target_file = os.path.join(self.builddir, "target", "test-file1")
+        target_file = os.path.join(self.builddir, "build/target-finalize/test-file1")
         overlay_file = "{}1/test-file1".format(self.rootfs_overlay_path)
         ret = compare_file(overlay_file, target_file)
         self.assertEqual(ret, 0)
 
-        target_file = os.path.join(self.builddir, "target", "etc", "test-file2")
+        target_file = os.path.join(self.builddir, "build/target-finalize/etc/test-file2")
         overlay_file = "{}2/etc/test-file2".format(self.rootfs_overlay_path)
         ret = compare_file(overlay_file, target_file)
         self.assertEqual(ret, 0)
-- 
2.11.0

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 15:17:11 +0100
Subject: [Buildroot] [PATCH 15/17] fs: run packages' filesystem hooks in a
 copy of target/
In-Reply-To: <cover.1515939400.git.yann.morin.1998@free.fr>
References: <cover.1515939400.git.yann.morin.1998@free.fr>
Message-ID: <5e2351c0305eb06166dfa18a93f859588c293a3e.1515939400.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, some packages may regigter hooks to be run just before and
judt after the generic tarball image is generated, because they need to
prepare the filesystem for read-only or read-write operation.

However, this means that, if any of the hooks or the image generation
fails, the target directory is left in a dangling, inconsistent state.

We fix that by doing a copy of target/, run the hooks on that copy,
generate the generic tarball image out of that, and get rid of the copy.

This way, we can guarantee consistency of the target directory, and we
can even ditch support for post-fs hooks (those that restore target/).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk                                    |  7 +++++--
 support/testing/tests/core/test_post_scripts.py | 23 +++++++++++++----------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index f3d42519f6..8bb26f1146 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -58,17 +58,20 @@ endef
 .PHONY: rootfs-common
 rootfs-common: $(ROOTFS_COMMON_TAR)
 
+# Emulate being in a filesystem, so that we can have our own TARGET_DIR.
+ROOTFS_COMMON_TARGET_DIR = $(FS_DIR)/target
+
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
-# When doing the common tarball, we're not really doing a rootfs.
-$(ROOTFS_COMMON_TAR): ROOTFS=
+$(ROOTFS_COMMON_TAR): ROOTFS=COMMON
 $(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
 $(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 	@$(call MESSAGE,"Generating common rootfs tarball")
 	rm -rf $(FS_DIR)
 	mkdir -p $(FS_DIR)
+	rsync -au $(BASE_TARGET_DIR)/ $(TARGET_DIR)
 	echo '#!/bin/sh' > $(FAKEROOT_SCRIPT)
 	echo "set -e" >> $(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index edb339d8c4..a0e5b6b454 100644
--- a/support/testing/tests/core/test_post_scripts.py
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -18,17 +18,17 @@ class TestPostScripts(infra.basetest.BRTest):
                    infra.filepath("tests/core/post-fakeroot.sh"),
                    infra.filepath("tests/core/post-image.sh"))
 
-    def check_post_log_file(self, path, what):
+    def check_post_log_file(self, f, what, target_dir):
         lines = {}
-        with open(path, 'rb') as csvfile:
+        with open(os.path.join(self.builddir, "build", f), 'rb') as csvfile:
             r = csv.reader(csvfile, delimiter=',')
             for row in r:
                 lines[row[0]] = row[1]
 
-        self.assertEqual(lines["arg1"], os.path.join(self.builddir, what))
+        self.assertEqual(lines["arg1"], what)
         self.assertEqual(lines["arg2"], "foobar")
         self.assertEqual(lines["arg3"], "baz")
-        self.assertEqual(lines["TARGET_DIR"], os.path.join(self.builddir, "target"))
+        self.assertEqual(lines["TARGET_DIR"], target_dir)
         self.assertEqual(lines["BUILD_DIR"], os.path.join(self.builddir, "build"))
         self.assertEqual(lines["HOST_DIR"], os.path.join(self.builddir, "host"))
         staging = os.readlink(os.path.join(self.builddir, "staging"))
@@ -37,9 +37,12 @@ class TestPostScripts(infra.basetest.BRTest):
         self.assertEqual(lines["BR2_CONFIG"], os.path.join(self.builddir, ".config"))
 
     def test_run(self):
-        f = os.path.join(self.builddir, "build", "post-build.log")
-        self.check_post_log_file(f, "target")
-        f = os.path.join(self.builddir, "build", "post-fakeroot.log")
-        self.check_post_log_file(f, "target")
-        f = os.path.join(self.builddir, "build", "post-image.log")
-        self.check_post_log_file(f, "images")
+        self.check_post_log_file("post-build.log",
+                                 os.path.join(self.builddir, "target"),
+                                 os.path.join(self.builddir, "target"))
+        self.check_post_log_file("post-fakeroot.log",
+                                 os.path.join(self.builddir, "build/buildroot-fs/target"),
+                                 os.path.join(self.builddir, "build/buildroot-fs/target"))
+        self.check_post_log_file("post-image.log",
+                                 os.path.join(self.builddir, "images"),
+                                 os.path.join(self.builddir, "target"))
-- 
2.14.1

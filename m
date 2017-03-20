From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:36:51 +0100
Subject: [Buildroot] [PATCH v3 2/5] support/testing: add core tests
In-Reply-To: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1490042214-6762-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a few Buildroot "core" tests, testing functionalities
such as:

 - post-build and post-image scripts
 - root filesystem overlays
 - timezone support

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/core/__init__.py             |  0
 support/testing/tests/core/post-build.sh           | 12 ++++
 support/testing/tests/core/post-image.sh           | 12 ++++
 .../testing/tests/core/rootfs-overlay1/test-file1  |  1 +
 .../tests/core/rootfs-overlay2/etc/test-file2      |  1 +
 support/testing/tests/core/test_post_scripts.py    | 40 +++++++++++++
 support/testing/tests/core/test_rootfs_overlay.py  | 27 +++++++++
 support/testing/tests/core/test_timezone.py        | 66 ++++++++++++++++++++++
 8 files changed, 159 insertions(+)
 create mode 100644 support/testing/tests/core/__init__.py
 create mode 100755 support/testing/tests/core/post-build.sh
 create mode 100755 support/testing/tests/core/post-image.sh
 create mode 100644 support/testing/tests/core/rootfs-overlay1/test-file1
 create mode 100644 support/testing/tests/core/rootfs-overlay2/etc/test-file2
 create mode 100644 support/testing/tests/core/test_post_scripts.py
 create mode 100644 support/testing/tests/core/test_rootfs_overlay.py
 create mode 100644 support/testing/tests/core/test_timezone.py

diff --git a/support/testing/tests/core/__init__.py b/support/testing/tests/core/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/support/testing/tests/core/post-build.sh b/support/testing/tests/core/post-build.sh
new file mode 100755
index 0000000..b1fb834
--- /dev/null
+++ b/support/testing/tests/core/post-build.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+(
+printf "arg1,%s\n" "${1}"
+printf "arg2,%s\n" "${2}"
+printf "arg3,%s\n" "${3}"
+printf "TARGET_DIR,%s\n" "${TARGET_DIR}"
+printf "BUILD_DIR,%s\n" "${BUILD_DIR}"
+printf "HOST_DIR,%s\n" "${HOST_DIR}"
+printf "STAGING_DIR,%s\n" "${STAGING_DIR}"
+printf "BINARIES_DIR,%s\n" "${BINARIES_DIR}"
+printf "BR2_CONFIG,%s\n" "${BR2_CONFIG}"
+) > ${BUILD_DIR}/post-build.log
diff --git a/support/testing/tests/core/post-image.sh b/support/testing/tests/core/post-image.sh
new file mode 100755
index 0000000..1c2a0f2
--- /dev/null
+++ b/support/testing/tests/core/post-image.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+(
+printf "arg1,%s\n" "${1}"
+printf "arg2,%s\n" "${2}"
+printf "arg3,%s\n" "${3}"
+printf "TARGET_DIR,%s\n" "${TARGET_DIR}"
+printf "BUILD_DIR,%s\n" "${BUILD_DIR}"
+printf "HOST_DIR,%s\n" "${HOST_DIR}"
+printf "STAGING_DIR,%s\n" "${STAGING_DIR}"
+printf "BINARIES_DIR,%s\n" "${BINARIES_DIR}"
+printf "BR2_CONFIG,%s\n" "${BR2_CONFIG}"
+) > ${BUILD_DIR}/post-image.log
diff --git a/support/testing/tests/core/rootfs-overlay1/test-file1 b/support/testing/tests/core/rootfs-overlay1/test-file1
new file mode 100644
index 0000000..323fae0
--- /dev/null
+++ b/support/testing/tests/core/rootfs-overlay1/test-file1
@@ -0,0 +1 @@
+foobar
diff --git a/support/testing/tests/core/rootfs-overlay2/etc/test-file2 b/support/testing/tests/core/rootfs-overlay2/etc/test-file2
new file mode 100644
index 0000000..34a3ec2
--- /dev/null
+++ b/support/testing/tests/core/rootfs-overlay2/etc/test-file2
@@ -0,0 +1 @@
+barfoo
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
new file mode 100644
index 0000000..d2a0be1
--- /dev/null
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -0,0 +1,40 @@
+import os
+import csv
+
+import infra.basetest
+
+class TestPostScripts(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_INIT_NONE=y
+BR2_SYSTEM_BIN_SH_NONE=y
+# BR2_PACKAGE_BUSYBOX is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="{}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="foobar baz"
+""".format(infra.filepath("tests/core/post-build.sh"),
+           infra.filepath("tests/core/post-image.sh"))
+
+    def check_post_log_file(self, path, what):
+        lines = {}
+        with open(path, 'rb') as csvfile:
+            r = csv.reader(csvfile, delimiter=',')
+            for row in r:
+                lines[row[0]] = row[1]
+
+        self.assertEqual(lines["arg1"], os.path.join(self.builddir, what))
+        self.assertEqual(lines["arg2"], "foobar")
+        self.assertEqual(lines["arg3"], "baz")
+        self.assertEqual(lines["TARGET_DIR"], os.path.join(self.builddir, "target"))
+        self.assertEqual(lines["BUILD_DIR"], os.path.join(self.builddir, "build"))
+        self.assertEqual(lines["HOST_DIR"], os.path.join(self.builddir, "host"))
+        staging = os.readlink(os.path.join(self.builddir, "staging"))
+        self.assertEqual(lines["STAGING_DIR"], staging)
+        self.assertEqual(lines["BINARIES_DIR"], os.path.join(self.builddir, "images"))
+        self.assertEqual(lines["BR2_CONFIG"], os.path.join(self.builddir, ".config"))
+
+    def test_run(self):
+        f = os.path.join(self.builddir, "build", "post-build.log")
+        self.check_post_log_file(f, "target")
+        f = os.path.join(self.builddir, "build", "post-image.log")
+        self.check_post_log_file(f, "images")
diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
new file mode 100644
index 0000000..42d890b
--- /dev/null
+++ b/support/testing/tests/core/test_rootfs_overlay.py
@@ -0,0 +1,27 @@
+import os
+import subprocess
+
+import infra.basetest
+
+def compare_file(file1, file2):
+    return subprocess.call(["cmp", file1, file2])
+
+class TestRootfsOverlay(infra.basetest.BRTest):
+
+    rootfs_overlay_path = infra.filepath("tests/core/rootfs-overlay")
+    rootfs_overlay = "BR2_ROOTFS_OVERLAY=\"{0}1 {0}2\"".format(rootfs_overlay_path)
+
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+            infra.basetest.MINIMAL_CONFIG + \
+            rootfs_overlay
+
+    def test_run(self):
+        target_file = os.path.join(self.builddir, "target", "test-file1")
+        overlay_file = "{}1/test-file1".format(self.rootfs_overlay_path)
+        ret = compare_file(overlay_file, target_file)
+        self.assertEqual(ret, 0)
+
+        target_file = os.path.join(self.builddir, "target", "etc", "test-file2")
+        overlay_file = "{}2/etc/test-file2".format(self.rootfs_overlay_path)
+        ret = compare_file(overlay_file, target_file)
+        self.assertEqual(ret, 0)
diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
new file mode 100644
index 0000000..9776b4b
--- /dev/null
+++ b/support/testing/tests/core/test_timezone.py
@@ -0,0 +1,66 @@
+import os
+
+import infra.basetest
+
+def boot_armv5_cpio(emulator, builddir):
+        img = os.path.join(builddir, "images", "rootfs.cpio")
+        emulator.boot(arch="armv5", kernel="builtin",
+                      options=["-initrd", img])
+        emulator.login()
+
+class TestNoTimezone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+             """
+# BR2_TARGET_TZ_INFO is not set
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        boot_armv5_cpio(self.emulator, self.builddir)
+        tz, _ = self.emulator.run("TZ=UTC date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+
+class TestGlibcAllTimezone(infra.basetest.BRTest):
+    config = """
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_TZ_INFO=y
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        boot_armv5_cpio(self.emulator, self.builddir)
+        tz, _ = self.emulator.run("date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+        tz, _ = self.emulator.run("TZ=UTC date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
+        self.assertEqual(tz[0].strip(), "PST")
+        tz, _ = self.emulator.run("TZ=Europe/Paris date +%Z")
+        self.assertEqual(tz[0].strip(), "CET")
+
+class TestGlibcNonDefaultLimitedTimezone(infra.basetest.BRTest):
+    config = """
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_TZ_INFO=y
+BR2_TARGET_TZ_ZONELIST="northamerica"
+BR2_TARGET_LOCALTIME="America/New_York"
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        boot_armv5_cpio(self.emulator, self.builddir)
+        tz, _ = self.emulator.run("date +%Z")
+        self.assertEqual(tz[0].strip(), "EST")
+        tz, _ = self.emulator.run("TZ=UTC date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
+        self.assertEqual(tz[0].strip(), "PST")
+        tz, _ = self.emulator.run("TZ=Europe/Paris date +%Z")
+        self.assertEqual(tz[0].strip(), "Europe")
-- 
2.7.4

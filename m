From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Nov 2020 17:47:35 +0100
Subject: [Buildroot] [PATCH] support/testing/tests: fix flake8 warnings
Message-ID: <20201105164736.1388901-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following flake8 warnings:

support/testing/tests/core/test_selinux.py:21:1: E302 expected 2 blank lines, found 1
support/testing/tests/core/test_selinux.py:38:1: E302 expected 2 blank lines, found 1
support/testing/tests/core/test_selinux.py:51:1: E302 expected 2 blank lines, found 1
support/testing/tests/core/test_selinux.py:62:1: E302 expected 2 blank lines, found 1
support/testing/tests/core/test_selinux.py:65:14: E127 continuation line over-indented for visual indent
support/testing/tests/init/test_systemd_selinux.py:53:1: E302 expected 2 blank lines, found 1
support/testing/tests/init/test_systemd_selinux.py:64:1: E302 expected 2 blank lines, found 1

Interestingly, the "continuation line over-indented for visual indent"
shows up only once, while the same pattern is there at multiple places
in the file. We fix all places with that over-indentation pattern.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/core/test_selinux.py    | 44 ++++++++++---------
 .../tests/init/test_systemd_selinux.py        |  2 +
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index 28d99d3a69..683a424d6f 100644
--- a/support/testing/tests/core/test_selinux.py
+++ b/support/testing/tests/core/test_selinux.py
@@ -5,12 +5,12 @@ import infra.basetest
 
 class TestSELinuxInfra(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG +\
-             """
-             BR2_PACKAGE_REFPOLICY=y
-             BR2_PACKAGE_PYTHON3=y
-             BR2_PACKAGE_SETOOLS=y
-             BR2_TARGET_ROOTFS_CPIO=y
-             """
+        """
+        BR2_PACKAGE_REFPOLICY=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_SETOOLS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
 
     def base_test_run(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
@@ -18,11 +18,12 @@ class TestSELinuxInfra(infra.basetest.BRTest):
                            options=["-initrd", cpio_file])
         self.emulator.login()
 
+
 class TestSELinuxExtraModules(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
-             """
-             BR2_REFPOLICY_EXTRA_MODULES="ntp tor"
-             """
+        """
+        BR2_REFPOLICY_EXTRA_MODULES="ntp tor"
+        """
 
     def test_run(self):
         TestSELinuxInfra.base_test_run(self)
@@ -35,11 +36,12 @@ class TestSELinuxExtraModules(TestSELinuxInfra):
         self.assertEqual(ret, 0)
         self.assertEqual(out[2].strip(), "tor_t")
 
+
 class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
-             """
-             BR2_REFPOLICY_EXTRA_MODULES_DIRS="{}"
-             """.format(infra.filepath("tests/core/test_selinux/extra_modules"))
+        """
+        BR2_REFPOLICY_EXTRA_MODULES_DIRS="{}"
+        """.format(infra.filepath("tests/core/test_selinux/extra_modules"))
 
     def test_run(self):
         TestSELinuxInfra.base_test_run(self)
@@ -48,23 +50,25 @@ class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
         self.assertEqual(ret, 0)
         self.assertEqual(out[2].strip(), "buildroot_test_t")
 
+
 class TestSELinuxCustomGit(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
-             """
-             BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y
-             BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL="https://github.com/SELinuxProject/refpolicy.git"
-             BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION="RELEASE_2_20200818"
-             """
+        """
+        BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y
+        BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL="https://github.com/SELinuxProject/refpolicy.git"
+        BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION="RELEASE_2_20200818"
+        """
 
     def test_run(self):
         pass
 
+
 class TestSELinuxPackage(TestSELinuxInfra):
     br2_external = [infra.filepath("tests/core/test_selinux/br2_external")]
     config = TestSELinuxInfra.config + \
-             """
-             BR2_PACKAGE_SELINUX_TEST=y
-             """
+        """
+        BR2_PACKAGE_SELINUX_TEST=y
+        """
 
     def test_run(self):
         TestSELinuxInfra.base_test_run(self)
diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index 9a98a32821..73604cfc32 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -50,6 +50,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         self.assertEqual(ret, 0)
         self.assertEqual(out[0], "system_u:system_r:init_t\0")
 
+
 class TestSELinuxSystemdExt4(TestSELinuxSystemd):
     config = TestSELinuxSystemd.config + \
         """
@@ -61,6 +62,7 @@ class TestSELinuxSystemdExt4(TestSELinuxSystemd):
     def test_run(self):
         self.run_tests("ext4")
 
+
 class TestSELinuxSystemdSquashfs(TestSELinuxSystemd):
     config = TestSELinuxSystemd.config + \
         """
-- 
2.26.2

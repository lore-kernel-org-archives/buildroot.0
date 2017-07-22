From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:38:21 +0200
Subject: [Buildroot] [git commit] testing/tests/package/test_python:
	refactor TestPythonBase
Message-ID: <20170722203422.97EF07FD13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c85d3e4596ae1e9ff5fe25977abb8ef8f2294e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert TestPythonBase to a true base class that only provides code
implementing various tests without defining tests themselves in a
"discoverable" form.

To retain correct testing functionality, add TestPython2 derived class
that uses code from TestPythonBase to define actual runnable test.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Thomas: fix typo in commit log, update .gitlab-ci.yml, both pointed
by Ricardo.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                               |  2 +-
 support/testing/tests/package/test_python.py | 23 +++++++++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4e494ff..fe55763 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -226,7 +226,7 @@ tests.fs.test_squashfs.TestSquashfs: *runtime_test
 tests.fs.test_ubi.TestUbi: *runtime_test
 tests.fs.test_yaffs2.TestYaffs2: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
-tests.package.test_python.TestPythonBase: *runtime_test
+tests.package.test_python.TestPython2: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainCtngMusl: *runtime_test
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 5532fb5..250827e 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -5,31 +5,46 @@ import infra.basetest
 class TestPythonBase(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
 """
-BR2_PACKAGE_PYTHON=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 """
-
-    def test_run(self):
+    def login(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(arch="armv5",
                            kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
-        cmd = "python --version 2>&1 | grep '^Python 2'"
+
+    def version_test(self, version):
+        cmd = "python --version 2>&1 | grep '^{}'".format(version)
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
+    def math_floor_test(self):
         cmd = "python -c 'import math; math.floor(12.3)'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
+    def libc_time_test(self):
         cmd = "python -c 'import ctypes;"
         cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
         cmd += "print libc.time(None)'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
+    def zlib_test(self):
         cmd = "python -c 'import zlib'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
+
+class TestPython2(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON=y
+"""
+    def test_run(self):
+        self.login()
+        self.version_test("Python 2")
+        self.math_floor_test()
+        self.libc_time_test()
+        self.zlib_test()

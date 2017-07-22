From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:52:42 +0200
Subject: [Buildroot] [git commit] testing/tests/package/test_python: add
	TestPython3
Message-ID: <20170722205113.AFC5C80420@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97278ebddda2e757d71b092b063f04e9f748223c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Python3 version of TestPython2 to make sure both versions of
Python get unit-tested.

Modify the code of libc_time_test() to support that change (convert
the code to use Python3-style "print").

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
[Thomas: update .gitlab-ci.yml.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                               |  1 +
 support/testing/tests/package/test_python.py | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fe55763..9a1f027 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -227,6 +227,7 @@ tests.fs.test_ubi.TestUbi: *runtime_test
 tests.fs.test_yaffs2.TestYaffs2: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
+tests.package.test_python.TestPython3: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainCtngMusl: *runtime_test
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 250827e..218235b 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -26,9 +26,10 @@ BR2_TARGET_ROOTFS_CPIO=y
         self.assertEqual(exit_code, 0)
 
     def libc_time_test(self):
-        cmd = "python -c 'import ctypes;"
+        cmd = "python -c 'from __future__ import print_function;"
+        cmd += "import ctypes;"
         cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
-        cmd += "print libc.time(None)'"
+        cmd += "print(libc.time(None))'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
@@ -48,3 +49,15 @@ BR2_PACKAGE_PYTHON=y
         self.math_floor_test()
         self.libc_time_test()
         self.zlib_test()
+
+class TestPython3(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON3=y
+"""
+    def test_run(self):
+        self.login()
+        self.version_test("Python 3")
+        self.math_floor_test()
+        self.libc_time_test()
+        self.zlib_test()

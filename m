From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue,  4 Jul 2017 11:58:06 -0700
Subject: [Buildroot] [PATCH 2/3] testing/tests/package/test_python: refactor
	to support better code reuse
In-Reply-To: <20170704185807.27189-1-andrew.smirnov@gmail.com>
References: <20170704185807.27189-1-andrew.smirnov@gmail.com>
Message-ID: <20170704185807.27189-2-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refactor TestPythonBase class in the following ways:

	 - Split single test_run() function into multiple smaller once
           to allow derivative classes to mix and match what they want
           to test. Also avoid naming any of the functions starting
           with "test_" to prevent nose2 from picking up
           TestPythonBase class as a class that defines any unit
           tests.

	 - Allow derivative classes to specify QEMU/pexpect timeout in
           login() method

	 - Do not hardcode 'python' as a interpreter to use and
           specify that via class variable 'interpreter'. This way
           classes that inherit from TestPythonBase can override this
           particualr aspect of the test code

	 - Change code of libc related test to be both Python2 and
           Python3 compliant so as to be usable for testing both

	 - Create two derivative classes TestPython2 and TestPython3
           that perform all of the tests specified in TestPythonBase
           using Python2 and Python3 correspondingly

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/testing/tests/package/test_python.py | 51 ++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 5532fb5..b4f52ea 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -5,31 +5,62 @@ import infra.basetest
 class TestPythonBase(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
 """
-BR2_PACKAGE_PYTHON=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 """
+    interpreter = "python"
 
-    def test_run(self):
+    def login(self, timeout=5):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(arch="armv5",
                            kernel="builtin",
-                           options=["-initrd", cpio_file])
+                           options=["-initrd", cpio_file],
+                           timeout)
         self.emulator.login()
-        cmd = "python --version 2>&1 | grep '^Python 2'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
 
-        cmd = "python -c 'import math; math.floor(12.3)'"
+    def math_floor_test(self):
+        cmd = self.interpreter + " -c 'import math; math.floor(12.3)'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
-        cmd = "python -c 'import ctypes;"
+    def libc_time_test(self):
+        cmd = self.interpreter + " -c 'import ctypes;"
         cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
-        cmd += "print libc.time(None)'"
+        cmd += "print(libc.time(None))'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
-        cmd = "python -c 'import zlib'"
+    def zlib_test(self):
+        cmd = self.interpreter + " -c 'import zlib'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
+
+    def version_test(self, version):
+        cmd = "{} --version 2>&1 | grep '^{}'".format(self.interpreter, version)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
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
-- 
2.9.4

From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:40:05 -0700
Subject: [Buildroot] [PATCH v2 2/6] testing/tests/package/test_python:
	refactor TestPythonBase
In-Reply-To: <20170712024009.2366-1-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
Message-ID: <20170712024009.2366-3-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert TestPythonBase to a true base class that only provides code
implementing various tests without definig tests themselves in a
"discoverable" form.

To retain correct testing functionality, add TestPython2 derived class
that uses code from TestPythonBase to define actual runnable test.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/testing/tests/package/test_python.py | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

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
-- 
2.9.4

From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:40:07 -0700
Subject: [Buildroot] [PATCH v2 4/6] testing/tests/package/test_python: do
	not hardcode interpreter name
In-Reply-To: <20170712024009.2366-1-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
Message-ID: <20170712024009.2366-5-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be able to leverage the same test code for testing
different python interpreters (or wrappers around CPython) allow
classes derivate of TestPythonBase to override the name of the
executable used to run tests.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/testing/tests/package/test_python.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 218235b..a3ec31b 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -8,6 +8,8 @@ class TestPythonBase(infra.basetest.BRTest):
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 """
+    interpreter = "python"
+
     def login(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(arch="armv5",
@@ -16,17 +18,17 @@ BR2_TARGET_ROOTFS_CPIO=y
         self.emulator.login()
 
     def version_test(self, version):
-        cmd = "python --version 2>&1 | grep '^{}'".format(version)
+        cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
     def math_floor_test(self):
-        cmd = "python -c 'import math; math.floor(12.3)'"
+        cmd = self.interpreter + " -c 'import math; math.floor(12.3)'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
 
     def libc_time_test(self):
-        cmd = "python -c 'from __future__ import print_function;"
+        cmd = self.interpreter + " -c 'from __future__ import print_function;"
         cmd += "import ctypes;"
         cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
         cmd += "print(libc.time(None))'"
@@ -34,7 +36,7 @@ BR2_TARGET_ROOTFS_CPIO=y
         self.assertEqual(exit_code, 0)
 
     def zlib_test(self):
-        cmd = "python -c 'import zlib'"
+        cmd = self.interpreter + " -c 'import zlib'"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
 
-- 
2.9.4

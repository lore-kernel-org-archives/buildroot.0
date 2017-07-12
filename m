From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:40:08 -0700
Subject: [Buildroot] [PATCH v2 5/6] testing/tests/package/test_python: allow
	to change timeout
In-Reply-To: <20170712024009.2366-1-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
Message-ID: <20170712024009.2366-6-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depending on Python implementation used for testing, time it takes to
perform a given test can vary pretty significantly. To accout for that
allow individual test functions to specify different timeout value.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/testing/tests/package/test_python.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index a3ec31b..bddf09d 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -17,27 +17,27 @@ BR2_TARGET_ROOTFS_CPIO=y
                            options=["-initrd", cpio_file])
         self.emulator.login()
 
-    def version_test(self, version):
+    def version_test(self, version, timeout=-1):
         cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
-        _, exit_code = self.emulator.run(cmd)
+        _, exit_code = self.emulator.run(cmd, timeout)
         self.assertEqual(exit_code, 0)
 
-    def math_floor_test(self):
+    def math_floor_test(self, timeout=-1):
         cmd = self.interpreter + " -c 'import math; math.floor(12.3)'"
-        _, exit_code = self.emulator.run(cmd)
+        _, exit_code = self.emulator.run(cmd, timeout)
         self.assertEqual(exit_code, 0)
 
-    def libc_time_test(self):
+    def libc_time_test(self, timeout=-1):
         cmd = self.interpreter + " -c 'from __future__ import print_function;"
         cmd += "import ctypes;"
         cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
         cmd += "print(libc.time(None))'"
-        _, exit_code = self.emulator.run(cmd)
+        _, exit_code = self.emulator.run(cmd, timeout)
         self.assertEqual(exit_code, 0)
 
-    def zlib_test(self):
+    def zlib_test(self, timeout=-1):
         cmd = self.interpreter + " -c 'import zlib'"
-        _, exit_code = self.emulator.run(cmd)
+        _, exit_code = self.emulator.run(cmd, timeout)
         self.assertEqual(exit_code, 1)
 
 class TestPython2(TestPythonBase):
-- 
2.9.4

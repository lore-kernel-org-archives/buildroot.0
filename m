From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:54:37 +0200
Subject: [Buildroot] [git commit] testing/tests/package/test_python: allow
	to change timeout
Message-ID: <20170722205113.D9F9B7FBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8559c55ed315caf60f95291222f11529f396ced5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depending on Python implementation used for testing, time it takes to
perform a given test can vary pretty significantly. To accout for that
allow individual test functions to specify different timeout value.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

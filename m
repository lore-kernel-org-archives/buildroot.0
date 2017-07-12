From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:40:06 -0700
Subject: [Buildroot] [PATCH v2 3/6] testing/tests/package/test_python: add
	TestPython3
In-Reply-To: <20170712024009.2366-1-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
Message-ID: <20170712024009.2366-4-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Python3 version of TestPython2 to make sure both versions of
Python get unit-tested.

Modify the code of libc_time_test() to support that change (convert
the code to use Python3-style "print").

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/testing/tests/package/test_python.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

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
-- 
2.9.4

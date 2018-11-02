From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:31 -0300
Subject: [Buildroot] [PATCH v2 02/12] support/testing: use helper class in
 Python test
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test cases for Python 2 and Python 3 are very similar.

Create a helper class named TestPythonInterpreter to hold all
commonalities. This new class is not a subclass of unittest.TestCase and
therefore nose2 ignores it, avoiding to create a bogus test case.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - new patch to gradually prepare the current python test cases to
    receive the new class TestPythonPackageBase (see review of
    http://patchwork.ozlabs.org/patch/984425/);
---
 support/testing/tests/package/test_ipython.py |  4 +--
 support/testing/tests/package/test_python.py  | 31 +++++++++----------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
index 19aa33242d..da2b7f4682 100644
--- a/support/testing/tests/package/test_ipython.py
+++ b/support/testing/tests/package/test_ipython.py
@@ -1,4 +1,4 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonInterpreter, TestPythonBase
 #
 # The following pythong tests are not being used here:
 #
@@ -8,7 +8,7 @@ from tests.package.test_python import TestPythonBase
 #              does, so this test ends up being a false-negative
 
 
-class TestIPython():
+class TestIPython(TestPythonInterpreter):
     interpreter = "ipython"
 
     def test_run(self):
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 26cf49947b..f9237f719d 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -18,6 +18,10 @@ class TestPythonBase(infra.basetest.BRTest):
                            options=["-initrd", cpio_file])
         self.emulator.login()
 
+
+class TestPythonInterpreter():
+    version_string = None
+
     def version_test(self, version, timeout=-1):
         cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
         _, exit_code = self.emulator.run(cmd, timeout)
@@ -41,30 +45,25 @@ class TestPythonBase(infra.basetest.BRTest):
         _, exit_code = self.emulator.run(cmd, timeout)
         self.assertEqual(exit_code, 1)
 
-
-class TestPython2(TestPythonBase):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        """
-
     def test_run(self):
         self.login()
-        self.version_test("Python 2")
+        self.version_test(self.version_string)
         self.math_floor_test()
         self.libc_time_test()
         self.zlib_test()
 
 
-class TestPython3(TestPythonBase):
+class TestPython2(TestPythonInterpreter, TestPythonBase):
     config = TestPythonBase.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON=y
         """
+    version_string = "Python 2"
 
-    def test_run(self):
-        self.login()
-        self.version_test("Python 3")
-        self.math_floor_test()
-        self.libc_time_test()
-        self.zlib_test()
+
+class TestPython3(TestPythonInterpreter, TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        """
+    version_string = "Python 3"
-- 
2.17.1

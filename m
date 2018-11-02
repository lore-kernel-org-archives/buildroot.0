From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:30 -0300
Subject: [Buildroot] [PATCH v2 01/12] support/testing: use helper class in
 IPython test
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test cases for Python 2 and Python 3 are very similar.

Create a helper class named TestIPython to hold all commonalities. This
new class is not a subclass of unittest.TestCase and therefore nose2
ignores it, avoiding to create a bogus test case.

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
 support/testing/tests/package/test_ipython.py | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
index 3b291d9583..19aa33242d 100644
--- a/support/testing/tests/package/test_ipython.py
+++ b/support/testing/tests/package/test_ipython.py
@@ -8,12 +8,7 @@ from tests.package.test_python import TestPythonBase
 #              does, so this test ends up being a false-negative
 
 
-class TestIPythonPy2(TestPythonBase):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_IPYTHON=y
-        """
+class TestIPython():
     interpreter = "ipython"
 
     def test_run(self):
@@ -22,15 +17,17 @@ class TestIPythonPy2(TestPythonBase):
         self.libc_time_test(40)
 
 
-class TestIPythonPy3(TestPythonBase):
+class TestIPythonPy2(TestIPython, TestPythonBase):
     config = TestPythonBase.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_IPYTHON=y
         """
-    interpreter = "ipython"
 
-    def test_run(self):
-        self.login()
-        self.math_floor_test(40)
-        self.libc_time_test(40)
+
+class TestIPythonPy3(TestIPython, TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_IPYTHON=y
+        """
-- 
2.17.1

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Nov 2018 00:16:05 -0200
Subject: [Buildroot] [PATCH v3 4/8] support/testing: use
 TestPythonPackageBase for python-incremental
In-Reply-To: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
References: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
Message-ID: <20181110021609.14684-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the test script to be run on the target from inline in the test
case to a separate file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v2 -> v3:
  - refresh;

Changes v1 -> v2:
  - refresh after creating TestPythonPackageBase;
---
 .../package/sample_python_incremental.py      |  3 ++
 .../tests/package/test_python_incremental.py  | 33 +++++++------------
 2 files changed, 14 insertions(+), 22 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_incremental.py

diff --git a/support/testing/tests/package/sample_python_incremental.py b/support/testing/tests/package/sample_python_incremental.py
new file mode 100644
index 0000000000..b6e2aa803c
--- /dev/null
+++ b/support/testing/tests/package/sample_python_incremental.py
@@ -0,0 +1,3 @@
+import incremental
+v = incremental.Version("package", 1, 2, 3, release_candidate=4)
+assert(str(v) == "[package, version 1.2.3rc4]")
diff --git a/support/testing/tests/package/test_python_incremental.py b/support/testing/tests/package/test_python_incremental.py
index acf743cdd2..49800d8937 100644
--- a/support/testing/tests/package/test_python_incremental.py
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -1,34 +1,23 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonIncremental(TestPythonBase):
-    def str_test(self):
-        cmd = self.interpreter + " -c 'import incremental;"
-        cmd += "v = incremental.Version(\"package\", 1, 2, 3, release_candidate=4);"
-        cmd += "assert(str(v) == \"[package, version 1.2.3rc4]\")'"
-        _, exit_code = self.emulator.run(cmd, timeout=30)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Incremental(TestPythonIncremental):
-    config = TestPythonBase.config + \
+class TestPythonPy2Incremental(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_INCREMENTAL=y
         """
+    sample_scripts = ["tests/package/sample_python_incremental.py"]
+    timeout = 30
 
-    def test_run(self):
-        self.login()
-        self.str_test()
 
-
-class TestPythonPy3Incremental(TestPythonIncremental):
-    config = TestPythonBase.config + \
+class TestPythonPy3Incremental(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_INCREMENTAL=y
         """
-
-    def test_run(self):
-        self.login()
-        self.str_test()
+    sample_scripts = ["tests/package/sample_python_incremental.py"]
+    timeout = 30
-- 
2.17.1

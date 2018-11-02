From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:36 -0300
Subject: [Buildroot] [PATCH v2 07/12] support/testing: use
 TestPythonPackageBase for python-incremental
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-8-ricardo.martincoski@gmail.com>
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
Changes v1 -> v2:
  - refresh after creating TestPythonPackageBase;
---
 .../package/sample_python_incremental.py      |  3 ++
 .../tests/package/test_python_incremental.py  | 32 ++++++-------------
 2 files changed, 12 insertions(+), 23 deletions(-)
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
index 5a98efc666..22dde5e358 100644
--- a/support/testing/tests/package/test_python_incremental.py
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -1,32 +1,18 @@
-from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
+from tests.package.test_python import TestPythonPackageBase, TestPythonBase2, TestPythonBase3
 
 
-class TestPythonIncremental(TestPythonBase):
-    def str_test(self):
-        cmd = self.interpreter + " -c 'import incremental;"
-        cmd += "v = incremental.Version(\"package\", 1, 2, 3, release_candidate=4);"
-        cmd += "assert(str(v) == \"[package, version 1.2.3rc4]\")'"
-        _, exit_code = self.emulator.run(cmd, timeout=30)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Incremental(TestPythonIncremental, TestPythonBase2):
-    config = TestPythonBase2.config + \
+class TestPythonIncremental(TestPythonPackageBase):
+    config_package = \
         """
         BR2_PACKAGE_PYTHON_INCREMENTAL=y
         """
+    sample_scripts = ["tests/package/sample_python_incremental.py"]
+    timeout = 30
 
-    def test_run(self):
-        self.login()
-        self.str_test()
 
+class TestPythonPy2Incremental(TestPythonIncremental, TestPythonBase2):
+    pass
 
-class TestPythonPy3Incremental(TestPythonIncremental, TestPythonBase3):
-    config = TestPythonBase3.config + \
-        """
-        BR2_PACKAGE_PYTHON_INCREMENTAL=y
-        """
 
-    def test_run(self):
-        self.login()
-        self.str_test()
+class TestPythonPy3Incremental(TestPythonIncremental, TestPythonBase3):
+    pass
-- 
2.17.1

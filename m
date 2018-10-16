From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 15 Oct 2018 21:42:27 -0300
Subject: [Buildroot] [PATCH 4/7] support/testing: use default test_run for
 python-incremental
In-Reply-To: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
Message-ID: <20181016004230.10393-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../package/sample_python_incremental.py      |  3 ++
 .../tests/package/test_python_incremental.py  | 34 +++++--------------
 2 files changed, 12 insertions(+), 25 deletions(-)
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
index acf743cdd2..22eac217ce 100644
--- a/support/testing/tests/package/test_python_incremental.py
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -1,34 +1,18 @@
-from tests.package.test_python import TestPythonBase
+import tests.package.test_python
 
 
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
+class TestPythonIncremental():
+    config_package = \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_INCREMENTAL=y
         """
+    sample_scripts = ["tests/package/sample_python_incremental.py"]
+    timeout = 30
 
-    def test_run(self):
-        self.login()
-        self.str_test()
 
+class TestPythonPy2Incremental(TestPythonIncremental, tests.package.test_python.TestPython2):
+    pass
 
-class TestPythonPy3Incremental(TestPythonIncremental):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_INCREMENTAL=y
-        """
 
-    def test_run(self):
-        self.login()
-        self.str_test()
+class TestPythonPy3Incremental(TestPythonIncremental, tests.package.test_python.TestPython3):
+    pass
-- 
2.17.1

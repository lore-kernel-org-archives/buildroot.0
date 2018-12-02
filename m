From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] support/testing: use TestPythonPackageBase
 for python-incremental
Message-ID: <20181202071554.E3E3A8107F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee6b37cf87da13429ac222b5cb6c2a3429062593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the test script to be run on the target from inline in the test
case to a separate file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/package/sample_python_incremental.py     |  3 ++
 .../tests/package/test_python_incremental.py       | 33 ++++++++--------------
 2 files changed, 14 insertions(+), 22 deletions(-)

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

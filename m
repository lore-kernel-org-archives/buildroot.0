From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:39 -0300
Subject: [Buildroot] [PATCH v2 10/12] support/testing: use
 TestPythonPackageBase for python-txtorcon
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-11-ricardo.martincoski@gmail.com>
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
 .../tests/package/sample_python_txtorcon.py   |  1 +
 .../tests/package/test_python_txtorcon.py     | 30 ++++++-------------
 2 files changed, 10 insertions(+), 21 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_txtorcon.py

diff --git a/support/testing/tests/package/sample_python_txtorcon.py b/support/testing/tests/package/sample_python_txtorcon.py
new file mode 100644
index 0000000000..c4a2ae6f5b
--- /dev/null
+++ b/support/testing/tests/package/sample_python_txtorcon.py
@@ -0,0 +1 @@
+import txtorcon  # noqa
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 2e10b37c55..2ac8130231 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,30 +1,18 @@
-from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
+from tests.package.test_python import TestPythonPackageBase, TestPythonBase2, TestPythonBase3
 
 
-class TestPythonTxtorcon(TestPythonBase):
-    def import_test(self):
-        cmd = self.interpreter + " -c 'import txtorcon'"
-        _, exit_code = self.emulator.run(cmd, timeout=30)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Txtorcon(TestPythonTxtorcon, TestPythonBase2):
-    config = TestPythonBase2.config + \
+class TestPythonTxtorcon(TestPythonPackageBase):
+    config_package = \
         """
         BR2_PACKAGE_PYTHON_TXTORCON=y
         """
+    sample_scripts = ["tests/package/sample_python_txtorcon.py"]
+    timeout = 30
 
-    def test_run(self):
-        self.login()
-        self.import_test()
 
+class TestPythonPy2Txtorcon(TestPythonTxtorcon, TestPythonBase2):
+    pass
 
-class TestPythonPy3Txtorcon(TestPythonTxtorcon, TestPythonBase3):
-    config = TestPythonBase3.config + \
-        """
-        BR2_PACKAGE_PYTHON_TXTORCON=y
-        """
 
-    def test_run(self):
-        self.login()
-        self.import_test()
+class TestPythonPy3Txtorcon(TestPythonTxtorcon, TestPythonBase3):
+    pass
-- 
2.17.1

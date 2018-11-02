From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:34 -0300
Subject: [Buildroot] [PATCH v2 05/12] support/testing: use
 TestPythonPackageBase for python-autobahn
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-6-ricardo.martincoski@gmail.com>
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
 .../tests/package/sample_python_autobahn.py   |  1 +
 .../tests/package/test_python_autobahn.py     | 29 +++++--------------
 2 files changed, 9 insertions(+), 21 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_autobahn.py

diff --git a/support/testing/tests/package/sample_python_autobahn.py b/support/testing/tests/package/sample_python_autobahn.py
new file mode 100644
index 0000000000..8189b6a6b3
--- /dev/null
+++ b/support/testing/tests/package/sample_python_autobahn.py
@@ -0,0 +1 @@
+import autobahn.wamp  # noqa
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index 5e514c24c5..b32a428fd8 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -1,30 +1,17 @@
-from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
+from tests.package.test_python import TestPythonPackageBase, TestPythonBase2, TestPythonBase3
 
 
-class TestPythonAutobahn(TestPythonBase):
-    def import_test(self):
-        cmd = self.interpreter + " -c 'import autobahn.wamp'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Autobahn(TestPythonAutobahn, TestPythonBase2):
-    config = TestPythonBase2.config + \
+class TestPythonAutobahn(TestPythonPackageBase):
+    config_package = \
         """
         BR2_PACKAGE_PYTHON_AUTOBAHN=y
         """
+    sample_scripts = ["tests/package/sample_python_autobahn.py"]
 
-    def test_run(self):
-        self.login()
-        self.import_test()
 
+class TestPythonPy2Autobahn(TestPythonAutobahn, TestPythonBase2):
+    pass
 
-class TestPythonPy3Autobahn(TestPythonAutobahn, TestPythonBase3):
-    config = TestPythonBase3.config + \
-        """
-        BR2_PACKAGE_PYTHON_AUTOBAHN=y
-        """
 
-    def test_run(self):
-        self.login()
-        self.import_test()
+class TestPythonPy3Autobahn(TestPythonAutobahn, TestPythonBase3):
+    pass
-- 
2.17.1

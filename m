From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Nov 2018 00:16:03 -0200
Subject: [Buildroot] [PATCH v3 2/8] support/testing: use
 TestPythonPackageBase for python-autobahn
In-Reply-To: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
References: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
Message-ID: <20181110021609.14684-3-ricardo.martincoski@gmail.com>
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
 .../tests/package/sample_python_autobahn.py   |  1 +
 .../tests/package/test_python_autobahn.py     | 29 ++++++-------------
 2 files changed, 10 insertions(+), 20 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_autobahn.py

diff --git a/support/testing/tests/package/sample_python_autobahn.py b/support/testing/tests/package/sample_python_autobahn.py
new file mode 100644
index 0000000000..8189b6a6b3
--- /dev/null
+++ b/support/testing/tests/package/sample_python_autobahn.py
@@ -0,0 +1 @@
+import autobahn.wamp  # noqa
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index 2bc0f0cccf..af1f617d6d 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -1,32 +1,21 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonAutobahn(TestPythonBase):
-    def import_test(self):
-        cmd = self.interpreter + " -c 'import autobahn.wamp'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Autobahn(TestPythonAutobahn):
-    config = TestPythonBase.config + \
+class TestPythonPy2Autobahn(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_AUTOBAHN=y
         """
+    sample_scripts = ["tests/package/sample_python_autobahn.py"]
 
-    def test_run(self):
-        self.login()
-        self.import_test()
 
-
-class TestPythonPy3Autobahn(TestPythonAutobahn):
-    config = TestPythonBase.config + \
+class TestPythonPy3Autobahn(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_AUTOBAHN=y
         """
-
-    def test_run(self):
-        self.login()
-        self.import_test()
+    sample_scripts = ["tests/package/sample_python_autobahn.py"]
-- 
2.17.1

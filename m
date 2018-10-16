From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 15 Oct 2018 21:42:25 -0300
Subject: [Buildroot] [PATCH 2/7] support/testing: use default test_run for
 python-autobahn
In-Reply-To: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
Message-ID: <20181016004230.10393-3-ricardo.martincoski@gmail.com>
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
 .../tests/package/sample_python_autobahn.py   |  1 +
 .../tests/package/test_python_autobahn.py     | 31 +++++--------------
 2 files changed, 9 insertions(+), 23 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_autobahn.py

diff --git a/support/testing/tests/package/sample_python_autobahn.py b/support/testing/tests/package/sample_python_autobahn.py
new file mode 100644
index 0000000000..8189b6a6b3
--- /dev/null
+++ b/support/testing/tests/package/sample_python_autobahn.py
@@ -0,0 +1 @@
+import autobahn.wamp  # noqa
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index 2bc0f0cccf..660c43a477 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -1,32 +1,17 @@
-from tests.package.test_python import TestPythonBase
+import tests.package.test_python
 
 
-class TestPythonAutobahn(TestPythonBase):
-    def import_test(self):
-        cmd = self.interpreter + " -c 'import autobahn.wamp'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Autobahn(TestPythonAutobahn):
-    config = TestPythonBase.config + \
+class TestPythonAutobahn():
+    config_package = \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_AUTOBAHN=y
         """
+    sample_scripts = ["tests/package/sample_python_autobahn.py"]
 
-    def test_run(self):
-        self.login()
-        self.import_test()
 
+class TestPythonPy2Autobahn(TestPythonAutobahn, tests.package.test_python.TestPython2):
+    pass
 
-class TestPythonPy3Autobahn(TestPythonAutobahn):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_AUTOBAHN=y
-        """
 
-    def test_run(self):
-        self.login()
-        self.import_test()
+class TestPythonPy3Autobahn(TestPythonAutobahn, tests.package.test_python.TestPython3):
+    pass
-- 
2.17.1

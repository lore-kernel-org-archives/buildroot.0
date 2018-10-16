From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 15 Oct 2018 21:42:30 -0300
Subject: [Buildroot] [PATCH 7/7] support/testing: use default test_run for
 python-txtorcon
In-Reply-To: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
Message-ID: <20181016004230.10393-8-ricardo.martincoski@gmail.com>
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
 .../tests/package/sample_python_txtorcon.py   |  1 +
 .../tests/package/test_python_txtorcon.py     | 32 ++++++-------------
 2 files changed, 10 insertions(+), 23 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_txtorcon.py

diff --git a/support/testing/tests/package/sample_python_txtorcon.py b/support/testing/tests/package/sample_python_txtorcon.py
new file mode 100644
index 0000000000..c4a2ae6f5b
--- /dev/null
+++ b/support/testing/tests/package/sample_python_txtorcon.py
@@ -0,0 +1 @@
+import txtorcon  # noqa
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 352ff67825..1880b813a7 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,32 +1,18 @@
-from tests.package.test_python import TestPythonBase
+import tests.package.test_python
 
 
-class TestPythonTxtorcon(TestPythonBase):
-    def import_test(self):
-        cmd = self.interpreter + " -c 'import txtorcon'"
-        _, exit_code = self.emulator.run(cmd, timeout=30)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Txtorcon(TestPythonTxtorcon):
-    config = TestPythonBase.config + \
+class TestPythonTxtorcon():
+    config_package = \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_TXTORCON=y
         """
+    sample_scripts = ["tests/package/sample_python_txtorcon.py"]
+    timeout = 30
 
-    def test_run(self):
-        self.login()
-        self.import_test()
 
+class TestPythonPy2Txtorcon(TestPythonTxtorcon, tests.package.test_python.TestPython2):
+    pass
 
-class TestPythonPy3Txtorcon(TestPythonTxtorcon):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_TXTORCON=y
-        """
 
-    def test_run(self):
-        self.login()
-        self.import_test()
+class TestPythonPy3Txtorcon(TestPythonTxtorcon, tests.package.test_python.TestPython3):
+    pass
-- 
2.17.1

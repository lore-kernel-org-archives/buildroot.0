From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Jun 2020 21:20:34 +0200
Subject: [Buildroot] [PATCH v1 4/4] support/testing: add python-gpiozero test
In-Reply-To: <20200613192034.10286-1-ps.report@gmx.net>
References: <20200613192034.10286-1-ps.report@gmx.net>
Message-ID: <20200613192034.10286-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../tests/package/sample_python_gpiozero.py   |  5 +++
 .../tests/package/test_python_gpiozero.py     | 32 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_gpiozero.py
 create mode 100644 support/testing/tests/package/test_python_gpiozero.py

diff --git a/support/testing/tests/package/sample_python_gpiozero.py b/support/testing/tests/package/sample_python_gpiozero.py
new file mode 100644
index 0000000000..b95df07fe7
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gpiozero.py
@@ -0,0 +1,5 @@
+from gpiozero import pi_info
+
+piBoardInfo = pi_info('a020d3')  # 3B+
+
+assert(piBoardInfo.model == '3B+')
diff --git a/support/testing/tests/package/test_python_gpiozero.py b/support/testing/tests/package/test_python_gpiozero.py
new file mode 100644
index 0000000000..2498a55514
--- /dev/null
+++ b/support/testing/tests/package/test_python_gpiozero.py
@@ -0,0 +1,32 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonGpiozero(TestPythonPackageBase):
+    config = TestPythonPackageBase.config
+    sample_scripts = ["tests/package/sample_python_gpiozero.py"]
+
+    def run_sample_scripts(self):
+        cmd = self.interpreter + " sample_python_gpiozero.py"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "pinout -r a020d3 -m | cat"
+        self.assertRunOk(cmd)
+
+
+class TestPythonPy2Gpiozero(TestPythonGpiozero):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_GPIOZERO=y
+        """
+
+
+class TestPythonPy3Gpiozero(TestPythonGpiozero):
+    __test__ = True
+    config = TestPythonGpiozero.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GPIOZERO=y
+        """
-- 
2.27.0

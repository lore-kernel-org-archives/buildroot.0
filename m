From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 15 Oct 2018 21:42:29 -0300
Subject: [Buildroot] [PATCH 6/7] support/testing: use default test_run for
 python-txaio
In-Reply-To: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
Message-ID: <20181016004230.10393-7-ricardo.martincoski@gmail.com>
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
 .../package/sample_python_txaio_asyncio.py    |  3 ++
 .../package/sample_python_txaio_twisted.py    |  3 ++
 .../tests/package/test_python_txaio.py        | 30 +++++--------------
 3 files changed, 13 insertions(+), 23 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_txaio_asyncio.py
 create mode 100644 support/testing/tests/package/sample_python_txaio_twisted.py

diff --git a/support/testing/tests/package/sample_python_txaio_asyncio.py b/support/testing/tests/package/sample_python_txaio_asyncio.py
new file mode 100644
index 0000000000..77f11ed807
--- /dev/null
+++ b/support/testing/tests/package/sample_python_txaio_asyncio.py
@@ -0,0 +1,3 @@
+import txaio
+txaio.use_asyncio()
+f0 = txaio.create_future()
diff --git a/support/testing/tests/package/sample_python_txaio_twisted.py b/support/testing/tests/package/sample_python_txaio_twisted.py
new file mode 100644
index 0000000000..13ea82a961
--- /dev/null
+++ b/support/testing/tests/package/sample_python_txaio_twisted.py
@@ -0,0 +1,3 @@
+import txaio
+txaio.use_twisted()
+f0 = txaio.create_future()
diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
index af93e031b5..a4858a3f94 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -1,34 +1,18 @@
-from tests.package.test_python import TestPythonBase
+import tests.package.test_python
 
 
-class TestPythonPy2Txaio(TestPythonBase):
-    config = TestPythonBase.config + \
+class TestPythonPy2Txaio(tests.package.test_python.TestPython2):
+    config_package = \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_TXAIO=y
         BR2_PACKAGE_PYTHON_TWISTED=y
         """
+    sample_scripts = ["tests/package/sample_python_txaio_twisted.py"]
 
-    def test_run(self):
-        self.login()
-        cmd = self.interpreter + " -c 'import txaio;"
-        cmd += "txaio.use_twisted();"
-        cmd += "f0 = txaio.create_future()'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
 
-
-class TestPythonPy3Txaio(TestPythonBase):
-    config = TestPythonBase.config + \
+class TestPythonPy3Txaio(tests.package.test_python.TestPython3):
+    config_package = \
         """
-        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TXAIO=y
         """
-
-    def test_run(self):
-        self.login()
-        cmd = self.interpreter + " -c 'import txaio;"
-        cmd += "txaio.use_asyncio();"
-        cmd += "f0 = txaio.create_future()'"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertEqual(exit_code, 0)
+    sample_scripts = ["tests/package/sample_python_txaio_asyncio.py"]
-- 
2.17.1

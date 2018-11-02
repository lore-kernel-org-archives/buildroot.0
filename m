From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:38 -0300
Subject: [Buildroot] [PATCH v2 09/12] support/testing: use
 TestPythonPackageBase for python-txaio
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-10-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the test scripts to be run on the target from inline in the test
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
 .../package/sample_python_txaio_asyncio.py    |  3 ++
 .../package/sample_python_txaio_twisted.py    |  3 ++
 .../tests/package/test_python_txaio.py        | 28 +++++--------------
 3 files changed, 13 insertions(+), 21 deletions(-)
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
index 6b285fb083..76e5f5230f 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -1,32 +1,18 @@
-from tests.package.test_python import TestPythonBase2, TestPythonBase3
+from tests.package.test_python import TestPythonPackageBase, TestPythonBase2, TestPythonBase3
 
 
-class TestPythonPy2Txaio(TestPythonBase2):
-    config = TestPythonBase2.config + \
+class TestPythonPy2Txaio(TestPythonPackageBase, TestPythonBase2):
+    config_package = \
         """
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
-class TestPythonPy3Txaio(TestPythonBase3):
-    config = TestPythonBase3.config + \
+class TestPythonPy3Txaio(TestPythonPackageBase, TestPythonBase3):
+    config_package = \
         """
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

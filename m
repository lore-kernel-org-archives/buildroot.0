From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:28 -0000
Subject: [Buildroot] [git commit] support/testing: use TestPythonPackageBase
 for python-txaio
Message-ID: <20181202071554.F07D78107F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac4a0529681707a6c1ad19d7cc4b2e24d5d921ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the test scripts to be run on the target from inline in the test
case to a separate file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/package/sample_python_txaio_asyncio.py   |  3 +++
 .../tests/package/sample_python_txaio_twisted.py   |  3 +++
 support/testing/tests/package/test_python_txaio.py | 30 +++++++---------------
 3 files changed, 15 insertions(+), 21 deletions(-)

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
index af93e031b5..7bff1bc23c 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -1,34 +1,22 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Txaio(TestPythonBase):
-    config = TestPythonBase.config + \
+class TestPythonPy2Txaio(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON=y
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
+class TestPythonPy3Txaio(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
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

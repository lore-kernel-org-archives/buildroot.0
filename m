From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:28 -0000
Subject: [Buildroot] [git commit] support/testing: use TestPythonPackageBase
 for python-txtorcon
Message-ID: <20181202071555.04EFB8A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a24761c72e164e776056b891532e8d6a276e37f
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
 .../tests/package/sample_python_txtorcon.py        |  1 +
 .../testing/tests/package/test_python_txtorcon.py  | 31 ++++++++--------------
 2 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/support/testing/tests/package/sample_python_txtorcon.py b/support/testing/tests/package/sample_python_txtorcon.py
new file mode 100644
index 0000000000..c4a2ae6f5b
--- /dev/null
+++ b/support/testing/tests/package/sample_python_txtorcon.py
@@ -0,0 +1 @@
+import txtorcon  # noqa
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 352ff67825..1ac2f6919a 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,32 +1,23 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonTxtorcon(TestPythonBase):
-    def import_test(self):
-        cmd = self.interpreter + " -c 'import txtorcon'"
-        _, exit_code = self.emulator.run(cmd, timeout=30)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Txtorcon(TestPythonTxtorcon):
-    config = TestPythonBase.config + \
+class TestPythonPy2Txtorcon(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_TXTORCON=y
         """
+    sample_scripts = ["tests/package/sample_python_txtorcon.py"]
+    timeout = 30
 
-    def test_run(self):
-        self.login()
-        self.import_test()
 
-
-class TestPythonPy3Txtorcon(TestPythonTxtorcon):
-    config = TestPythonBase.config + \
+class TestPythonPy3Txtorcon(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TXTORCON=y
         """
-
-    def test_run(self):
-        self.login()
-        self.import_test()
+    sample_scripts = ["tests/package/sample_python_txtorcon.py"]
+    timeout = 30

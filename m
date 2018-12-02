From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] support/testing: use TestPythonPackageBase
 for python-autobahn
Message-ID: <20181202071554.D79FB8107F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5dd9364ee710ef036556dcda78f682ae27fefa0
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
 .../tests/package/sample_python_autobahn.py        |  1 +
 .../testing/tests/package/test_python_autobahn.py  | 29 +++++++---------------
 2 files changed, 10 insertions(+), 20 deletions(-)

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

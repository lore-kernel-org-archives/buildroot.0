From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] support/testing: use TestPythonPackageBase
 for python-cryptography
Message-ID: <20181202071554.DE1028107F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f07994f7d64e06c74d87c3eec89adfc248445187
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
 .../tests/package/sample_python_cryptography.py    |  3 ++
 .../tests/package/test_python_cryptography.py      | 33 ++++++++--------------
 2 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/support/testing/tests/package/sample_python_cryptography.py b/support/testing/tests/package/sample_python_cryptography.py
new file mode 100644
index 0000000000..ec9883dc64
--- /dev/null
+++ b/support/testing/tests/package/sample_python_cryptography.py
@@ -0,0 +1,3 @@
+from cryptography.fernet import Fernet
+key = Fernet.generate_key()
+f = Fernet(key)
diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index 78c3ef55b3..14515fcd2d 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,34 +1,23 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonCryptography(TestPythonBase):
-    def fernet_test(self, timeout=-1):
-        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
-        cmd += "key = Fernet.generate_key();"
-        cmd += "f = Fernet(key)'"
-        _, exit_code = self.emulator.run(cmd, timeout)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Cryptography(TestPythonCryptography):
-    config = TestPythonBase.config + \
+class TestPythonPy2Cryptography(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         """
+    sample_scripts = ["tests/package/sample_python_cryptography.py"]
+    timeout = 40
 
-    def test_run(self):
-        self.login()
-        self.fernet_test(40)
 
-
-class TestPythonPy3Cryptography(TestPythonCryptography):
-    config = TestPythonBase.config + \
+class TestPythonPy3Cryptography(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         """
-
-    def test_run(self):
-        self.login()
-        self.fernet_test(40)
+    sample_scripts = ["tests/package/sample_python_cryptography.py"]
+    timeout = 40

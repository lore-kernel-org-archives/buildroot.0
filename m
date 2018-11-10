From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Nov 2018 00:16:04 -0200
Subject: [Buildroot] [PATCH v3 3/8] support/testing: use
 TestPythonPackageBase for python-cryptography
In-Reply-To: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
References: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
Message-ID: <20181110021609.14684-4-ricardo.martincoski@gmail.com>
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
 .../package/sample_python_cryptography.py     |  3 ++
 .../tests/package/test_python_cryptography.py | 33 +++++++------------
 2 files changed, 14 insertions(+), 22 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_cryptography.py

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
-- 
2.17.1

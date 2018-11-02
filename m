From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:35 -0300
Subject: [Buildroot] [PATCH v2 06/12] support/testing: use
 TestPythonPackageBase for python-cryptography
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-7-ricardo.martincoski@gmail.com>
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
Changes v1 -> v2:
  - refresh after creating TestPythonPackageBase;
---
 .../package/sample_python_cryptography.py     |  3 ++
 .../tests/package/test_python_cryptography.py | 32 ++++++-------------
 2 files changed, 12 insertions(+), 23 deletions(-)
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
index 2a8ce1d8f7..5f380b2750 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,32 +1,18 @@
-from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
+from tests.package.test_python import TestPythonPackageBase, TestPythonBase2, TestPythonBase3
 
 
-class TestPythonCryptography(TestPythonBase):
-    def fernet_test(self, timeout=-1):
-        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
-        cmd += "key = Fernet.generate_key();"
-        cmd += "f = Fernet(key)'"
-        _, exit_code = self.emulator.run(cmd, timeout)
-        self.assertEqual(exit_code, 0)
-
-
-class TestPythonPy2Cryptography(TestPythonCryptography, TestPythonBase2):
-    config = TestPythonBase2.config + \
+class TestPythonCryptography(TestPythonPackageBase):
+    config_package = \
         """
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         """
+    sample_scripts = ["tests/package/sample_python_cryptography.py"]
+    timeout = 40
 
-    def test_run(self):
-        self.login()
-        self.fernet_test(40)
 
+class TestPythonPy2Cryptography(TestPythonCryptography, TestPythonBase2):
+    pass
 
-class TestPythonPy3Cryptography(TestPythonCryptography, TestPythonBase3):
-    config = TestPythonBase3.config + \
-        """
-        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
-        """
 
-    def test_run(self):
-        self.login()
-        self.fernet_test(40)
+class TestPythonPy3Cryptography(TestPythonCryptography, TestPythonBase3):
+    pass
-- 
2.17.1

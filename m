From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 15 Oct 2018 21:42:26 -0300
Subject: [Buildroot] [PATCH 3/7] support/testing: use default test_run for
 python-cryptography
In-Reply-To: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
Message-ID: <20181016004230.10393-4-ricardo.martincoski@gmail.com>
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
 .../package/sample_python_cryptography.py     |  3 ++
 .../tests/package/test_python_cryptography.py | 34 +++++--------------
 2 files changed, 12 insertions(+), 25 deletions(-)
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
index 78c3ef55b3..970466323b 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,34 +1,18 @@
-from tests.package.test_python import TestPythonBase
+import tests.package.test_python
 
 
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
+class TestPythonCryptography():
+    config_package = \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         """
+    sample_scripts = ["tests/package/sample_python_cryptography.py"]
+    timeout = 40
 
-    def test_run(self):
-        self.login()
-        self.fernet_test(40)
 
+class TestPythonPy2Cryptography(TestPythonCryptography, tests.package.test_python.TestPython2):
+    pass
 
-class TestPythonPy3Cryptography(TestPythonCryptography):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
-        """
 
-    def test_run(self):
-        self.login()
-        self.fernet_test(40)
+class TestPythonPy3Cryptography(TestPythonCryptography, tests.package.test_python.TestPython3):
+    pass
-- 
2.17.1

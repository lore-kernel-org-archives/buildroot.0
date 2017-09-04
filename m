From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  4 Sep 2017 09:15:00 +0200
Subject: [Buildroot] [RFC] testing: add python-cryptography tests
Message-ID: <20170904071500.3858-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../tests/package/test_python-cryptography.py      | 39 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/test_python-cryptography.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b44c935f2..eb65e11a0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -250,6 +250,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
+tests.package.test_python-cryptography.TestPythonPy2Cryptography: *runtime_test
+tests.package.test_python-cryptography.TestPythonPy3Cryptography: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
diff --git a/support/testing/tests/package/test_python-cryptography.py b/support/testing/tests/package/test_python-cryptography.py
new file mode 100644
index 000000000..0b1d1f366
--- /dev/null
+++ b/support/testing/tests/package/test_python-cryptography.py
@@ -0,0 +1,39 @@
+import os
+
+from tests.package.test_python import TestPythonBase
+
+class TestPythonPy2Cryptography(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON=y
+BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+"""
+    def fernet_test(self, timeout=-1):
+        """Test Fernet."""
+        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
+        cmd += "key = Fernet.generate_key();"
+        cmd += "f = Fernet(key)'"
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
+
+    def test_run(self):
+        self.login()
+        self.fernet_test(40)
+
+class TestPythonPy3Cryptography(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON3=y
+BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+"""
+    def fernet_test(self, timeout=-1):
+        """Test Fernet."""
+        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
+        cmd += "key = Fernet.generate_key();"
+        cmd += "f = Fernet(key)'"
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
+
+    def test_run(self):
+        self.login()
+        self.fernet_test(40)
-- 
2.11.0

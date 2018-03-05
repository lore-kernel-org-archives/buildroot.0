From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:15 -0000
Subject: [Buildroot] [git commit] support/testing: add python-cryptography
 tests
Message-ID: <20180305200711.D053B810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecfde09985c3f8c116f58176b871dedfac96fe4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../tests/package/test_python_cryptography.py      | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b7dfef0935..b4be44843c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -284,6 +284,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
+tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
+tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
new file mode 100644
index 0000000000..b60152de1c
--- /dev/null
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -0,0 +1,31 @@
+import os
+
+from tests.package.test_python import TestPythonBase
+
+class TestPythonCryptography(TestPythonBase):
+    def fernet_test(self, timeout=-1):
+        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
+        cmd += "key = Fernet.generate_key();"
+        cmd += "f = Fernet(key)'"
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
+
+class TestPythonPy2Cryptography(TestPythonCryptography):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON=y
+BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+"""
+    def test_run(self):
+        self.login()
+        self.fernet_test(40)
+
+class TestPythonPy3Cryptography(TestPythonCryptography):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON3=y
+BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+"""
+    def test_run(self):
+        self.login()
+        self.fernet_test(40)

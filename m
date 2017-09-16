From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Sep 2017 22:38:21 +0200
Subject: [Buildroot] [PATCH 2/2] testing: add python-cryptography tests
In-Reply-To: <cover.1505594291.git.yann.morin.1998@free.fr>
References: <cover.1505594291.git.yann.morin.1998@free.fr>
Message-ID: <5d8ea4ebb51023d3943fb4e5a1678f8cfba70527.1505594291.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[yann.morin.1998 at free.fr:
  - move to package directory,
  - indent the config fragment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Note:
This is exactly the same as https://patchwork.ozlabs.org/patch/811011/
but with the test moved to the python-cryptography package and the
config fragment indented.
---
 .gitlab-ci.yml                                     |  2 ++
 package/python-cryptography/python-cryptography.py | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 package/python-cryptography/python-cryptography.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b44c935f2a..091b016191 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -250,6 +250,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
+tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
+tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
diff --git a/package/python-cryptography/python-cryptography.py b/package/python-cryptography/python-cryptography.py
new file mode 100644
index 0000000000..907baaafa6
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.py
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
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        """
+    def test_run(self):
+        self.login()
+        self.fernet_test(40)
+
+class TestPythonPy3Cryptography(TestPythonCryptography):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        """
+    def test_run(self):
+        self.login()
+        self.fernet_test(40)
-- 
2.11.0

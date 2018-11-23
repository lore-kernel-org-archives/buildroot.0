From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add python-pynacl tests
Message-ID: <20181202071558.0ED8A82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e69ddc9e7182bdd11135612267604a2264a7229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that minimally uses the module.
Add haveged to the target to generate enough entropy so pynacl ->
libsodium don't hang waiting for /dev/random.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../testing/tests/package/sample_python_pynacl.py  |  3 +++
 .../testing/tests/package/test_python_pynacl.py    | 27 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 99df1f85e2..2a68e6485d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -341,6 +341,8 @@ tests.package.test_python_passlib.TestPythonPy2Passlib: *runtime_test
 tests.package.test_python_passlib.TestPythonPy3Passlib: *runtime_test
 tests.package.test_python_pexpect.TestPythonPy2Pexpect: *runtime_test
 tests.package.test_python_pexpect.TestPythonPy3Pexpect: *runtime_test
+tests.package.test_python_pynacl.TestPythonPy2Pynacl: *runtime_test
+tests.package.test_python_pynacl.TestPythonPy3Pynacl: *runtime_test
 tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
 tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
diff --git a/support/testing/tests/package/sample_python_pynacl.py b/support/testing/tests/package/sample_python_pynacl.py
new file mode 100644
index 0000000000..d17c50ebe5
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pynacl.py
@@ -0,0 +1,3 @@
+import nacl.utils
+
+nonce = nacl.utils.random(16)
diff --git a/support/testing/tests/package/test_python_pynacl.py b/support/testing/tests/package/test_python_pynacl.py
new file mode 100644
index 0000000000..729a887552
--- /dev/null
+++ b/support/testing/tests/package/test_python_pynacl.py
@@ -0,0 +1,27 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Pynacl(TestPythonPackageBase):
+    __test__ = True
+    # use haveged to generate enough entropy so pynacl -> libsodium don't hang waiting for /dev/random
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_PYNACL=y
+        BR2_PACKAGE_HAVEGED=y
+        """
+    sample_scripts = ["tests/package/sample_python_pynacl.py"]
+    timeout = 10
+
+
+class TestPythonPy3Pynacl(TestPythonPackageBase):
+    __test__ = True
+    # use haveged to generate enough entropy so pynacl -> libsodium don't hang waiting for /dev/random
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYNACL=y
+        BR2_PACKAGE_HAVEGED=y
+        """
+    sample_scripts = ["tests/package/sample_python_pynacl.py"]
+    timeout = 10

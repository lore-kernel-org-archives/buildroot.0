From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add python-passlib tests
Message-ID: <20181202071557.F280B815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=756dd5f132ffe75b727e32df8648b95672e5493a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that creates a hash for a password and verifies
it against an incorrect and a correct password.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../testing/tests/package/sample_python_passlib.py |  5 +++++
 .../testing/tests/package/test_python_passlib.py   | 23 ++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5133affa25..61c44412b3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -337,6 +337,8 @@ tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
 tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
 tests.package.test_python_incremental.TestPythonPy3Incremental: *runtime_test
+tests.package.test_python_passlib.TestPythonPy2Passlib: *runtime_test
+tests.package.test_python_passlib.TestPythonPy3Passlib: *runtime_test
 tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
 tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
diff --git a/support/testing/tests/package/sample_python_passlib.py b/support/testing/tests/package/sample_python_passlib.py
new file mode 100644
index 0000000000..3ab348b9e4
--- /dev/null
+++ b/support/testing/tests/package/sample_python_passlib.py
@@ -0,0 +1,5 @@
+from passlib.hash import pbkdf2_sha256
+
+hash = pbkdf2_sha256.hash("password")
+assert(pbkdf2_sha256.verify("passWord", hash) is False)
+assert(pbkdf2_sha256.verify("password", hash) is True)
diff --git a/support/testing/tests/package/test_python_passlib.py b/support/testing/tests/package/test_python_passlib.py
new file mode 100644
index 0000000000..7c85882bf8
--- /dev/null
+++ b/support/testing/tests/package/test_python_passlib.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Passlib(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_PASSLIB=y
+        """
+    sample_scripts = ["tests/package/sample_python_passlib.py"]
+    timeout = 30
+
+
+class TestPythonPy3Passlib(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PASSLIB=y
+        """
+    sample_scripts = ["tests/package/sample_python_passlib.py"]
+    timeout = 30

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:29 -0200
Subject: [Buildroot] [next 09/15] support/testing: add python-pexpect tests
In-Reply-To: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
References: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-10-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple test case to check the basic usage. Call 'login' and try
wrong user/password, expecting the 'Login incorrect' message.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/sample_python_pexpect.py    |  8 +++++++
 .../tests/package/test_python_pexpect.py      | 21 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pexpect.py
 create mode 100644 support/testing/tests/package/test_python_pexpect.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 61c44412b3..99df1f85e2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -339,6 +339,8 @@ tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
 tests.package.test_python_incremental.TestPythonPy3Incremental: *runtime_test
 tests.package.test_python_passlib.TestPythonPy2Passlib: *runtime_test
 tests.package.test_python_passlib.TestPythonPy3Passlib: *runtime_test
+tests.package.test_python_pexpect.TestPythonPy2Pexpect: *runtime_test
+tests.package.test_python_pexpect.TestPythonPy3Pexpect: *runtime_test
 tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
 tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
diff --git a/support/testing/tests/package/sample_python_pexpect.py b/support/testing/tests/package/sample_python_pexpect.py
new file mode 100644
index 0000000000..cfe395fc29
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pexpect.py
@@ -0,0 +1,8 @@
+import pexpect
+
+p = pexpect.spawn(["login"])
+p.expect("login:")
+p.sendline("wrong")
+p.expect("Password:")
+p.sendline("wrong")
+p.expect("Login incorrect")
diff --git a/support/testing/tests/package/test_python_pexpect.py b/support/testing/tests/package/test_python_pexpect.py
new file mode 100644
index 0000000000..ba31cdbdbe
--- /dev/null
+++ b/support/testing/tests/package/test_python_pexpect.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Pexpect(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_PEXPECT=y
+        """
+    sample_scripts = ["tests/package/sample_python_pexpect.py"]
+
+
+class TestPythonPy3Pexpect(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PEXPECT=y
+        """
+    sample_scripts = ["tests/package/sample_python_pexpect.py"]
-- 
2.17.1

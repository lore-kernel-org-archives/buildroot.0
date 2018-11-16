From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:33 -0200
Subject: [Buildroot] [next 13/15] support/testing: add python-subprocess32
 test
In-Reply-To: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
References: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-14-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple test case to check the basic usage by calling 'ls' and
checking the output.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                                        |  1 +
 .../tests/package/sample_python_subprocess32.py       |  6 ++++++
 .../testing/tests/package/test_python_subprocess32.py | 11 +++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_subprocess32.py
 create mode 100644 support/testing/tests/package/test_python_subprocess32.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4166412df3..743f4edc06 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -347,6 +347,7 @@ tests.package.test_python_pyyaml.TestPythonPy2Pyyaml: *runtime_test
 tests.package.test_python_pyyaml.TestPythonPy3Pyyaml: *runtime_test
 tests.package.test_python_service_identity.TestPythonPy2ServiceIdentity: *runtime_test
 tests.package.test_python_service_identity.TestPythonPy3ServiceIdentity: *runtime_test
+tests.package.test_python_subprocess32.TestPythonPy2Subprocess32: *runtime_test
 tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
 tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
diff --git a/support/testing/tests/package/sample_python_subprocess32.py b/support/testing/tests/package/sample_python_subprocess32.py
new file mode 100644
index 0000000000..8579745cc8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_subprocess32.py
@@ -0,0 +1,6 @@
+import subprocess32
+
+output = subprocess32.check_output(["ls", "-l", "/dev/null"])
+print(output)
+assert("/dev/null" in output)
+assert("No such" not in output)
diff --git a/support/testing/tests/package/test_python_subprocess32.py b/support/testing/tests/package/test_python_subprocess32.py
new file mode 100644
index 0000000000..d2878046d1
--- /dev/null
+++ b/support/testing/tests/package/test_python_subprocess32.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Subprocess32(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_SUBPROCESS32=y
+        """
+    sample_scripts = ["tests/package/sample_python_subprocess32.py"]
-- 
2.17.1

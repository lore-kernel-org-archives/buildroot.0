From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:32 -0200
Subject: [Buildroot] [next 12/15] support/testing: add
 python-service-identity tests
In-Reply-To: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
References: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-13-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a simple test case that imports the module.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml                                |  2 ++
 .../package/sample_python_service_identity.py |  2 ++
 .../package/test_python_service_identity.py   | 23 +++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_service_identity.py
 create mode 100644 support/testing/tests/package/test_python_service_identity.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a0659d6bfb..4166412df3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -345,6 +345,8 @@ tests.package.test_python_pynacl.TestPythonPy2Pynacl: *runtime_test
 tests.package.test_python_pynacl.TestPythonPy3Pynacl: *runtime_test
 tests.package.test_python_pyyaml.TestPythonPy2Pyyaml: *runtime_test
 tests.package.test_python_pyyaml.TestPythonPy3Pyyaml: *runtime_test
+tests.package.test_python_service_identity.TestPythonPy2ServiceIdentity: *runtime_test
+tests.package.test_python_service_identity.TestPythonPy3ServiceIdentity: *runtime_test
 tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
 tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
 tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
diff --git a/support/testing/tests/package/sample_python_service_identity.py b/support/testing/tests/package/sample_python_service_identity.py
new file mode 100644
index 0000000000..3184b6c580
--- /dev/null
+++ b/support/testing/tests/package/sample_python_service_identity.py
@@ -0,0 +1,2 @@
+from service_identity import VerificationError  # noqa
+from service_identity.pyopenssl import verify_hostname  # noqa
diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
new file mode 100644
index 0000000000..6aeb77de8c
--- /dev/null
+++ b/support/testing/tests/package/test_python_service_identity.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2ServiceIdentity(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_SERVICE_IDENTITY=y
+        """
+    sample_scripts = ["tests/package/sample_python_service_identity.py"]
+    timeout = 30
+
+
+class TestPythonPy3ServiceIdentity(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SERVICE_IDENTITY=y
+        """
+    sample_scripts = ["tests/package/sample_python_service_identity.py"]
+    timeout = 30
-- 
2.17.1

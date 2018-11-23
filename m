From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add
 python-service-identity tests
Message-ID: <20181202071558.1F04C82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d144edb21d4b1c1f7fe2ed1e42e55cb2f081d826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that imports the module.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../package/sample_python_service_identity.py      |  2 ++
 .../tests/package/test_python_service_identity.py  | 23 ++++++++++++++++++++++
 3 files changed, 27 insertions(+)

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

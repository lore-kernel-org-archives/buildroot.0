From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add python-constantly
 tests
Message-ID: <20181202071557.EB0FE815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ee9566640ddb38f835d2424d140780172bc8cf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case to check the basic usage by creating a class with
two constants.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                      |  2 ++
 .../tests/package/sample_python_constantly.py       | 19 +++++++++++++++++++
 .../testing/tests/package/test_python_constantly.py | 21 +++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index eb6a187615..5133affa25 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -330,6 +330,8 @@ tests.package.test_python_cbor.TestPythonPy2Cbor: *runtime_test
 tests.package.test_python_cbor.TestPythonPy3Cbor: *runtime_test
 tests.package.test_python_click.TestPythonPy2Click: *runtime_test
 tests.package.test_python_click.TestPythonPy3Click: *runtime_test
+tests.package.test_python_constantly.TestPythonPy2Constantly: *runtime_test
+tests.package.test_python_constantly.TestPythonPy3Constantly: *runtime_test
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
diff --git a/support/testing/tests/package/sample_python_constantly.py b/support/testing/tests/package/sample_python_constantly.py
new file mode 100644
index 0000000000..570cf85b23
--- /dev/null
+++ b/support/testing/tests/package/sample_python_constantly.py
@@ -0,0 +1,19 @@
+from constantly import ValueConstant, Values
+
+
+class RESULT(Values):
+    OK = ValueConstant(0)
+    FAIL = ValueConstant(-1)
+
+    @classmethod
+    def get(cls, rc):
+        if rc == 0:
+            return cls.OK
+        else:
+            return cls.FAIL
+
+
+print(list(RESULT.iterconstants()))
+assert(RESULT.OK < RESULT.FAIL)
+assert(RESULT.OK.value > RESULT.FAIL.value)
+assert(RESULT.get(-5) == RESULT.FAIL)
diff --git a/support/testing/tests/package/test_python_constantly.py b/support/testing/tests/package/test_python_constantly.py
new file mode 100644
index 0000000000..5be01c4f8c
--- /dev/null
+++ b/support/testing/tests/package/test_python_constantly.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Constantly(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_CONSTANTLY=y
+        """
+    sample_scripts = ["tests/package/sample_python_constantly.py"]
+
+
+class TestPythonPy3Constantly(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CONSTANTLY=y
+        """
+    sample_scripts = ["tests/package/sample_python_constantly.py"]

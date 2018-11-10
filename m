From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Nov 2018 00:16:09 -0200
Subject: [Buildroot] [PATCH v3 8/8] testing: add python-crossbar tests
In-Reply-To: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
References: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
Message-ID: <20181110021609.14684-9-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This test invokes "crossbar version" command, that checks all
dependencies found in setup.py files and prints some system related
information.
Add haveged to the target to generate enough entropy so crossbar ->
pynacl -> libsodium don't hang waiting for /dev/random.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Ricardo: move test script to a separate file, remove Python 2 variant,
 add haveged to target to add entropy and avoid hanging]
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v2 -> v3:
  - refresh;
  - move test script to a separate file;

Changes v1 -> v2:
  - new patch to the series, resending a patch from Yegor;
  - call 'crossbar version' instead of 'python -m "crossbar version"'
    because it is not supported anymore, giving this message:
    /usr/bin/python3: No module named crossbar.__main__; 'crossbar' is a package and cannot be directly executed
  - add haveged to the target to provide enough entropy, avoiding
    hanging forever (on our current kernel 3.11.0 default image) or for
    a long time (when the default kernel image is upgraded to a newer
    kernel);
  - remove test for python 2 because upstream dropped support;
  - do not pass timeout parameter since version_test is now called once;
  - use new naming convention and classes for tests of python packages;
  - rewrap commit message to 72;
  - update code-style (we adopted flake8 after v1 submission);
  - update .gitlab-ci.yml;

NOTE: please mark below patch as Superseded.
v1: http://patchwork.ozlabs.org/patch/873813/
---
 .gitlab-ci.yml                                     |  1 +
 .../tests/package/sample_python_crossbar.py        |  3 +++
 .../testing/tests/package/test_python_crossbar.py  | 14 ++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_crossbar.py
 create mode 100644 support/testing/tests/package/test_python_crossbar.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c78f2ea581..0dfb3537c1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -316,6 +316,7 @@ tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
+tests.package.test_python_crossbar.TestPythonPy3Crossbar: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
 tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
diff --git a/support/testing/tests/package/sample_python_crossbar.py b/support/testing/tests/package/sample_python_crossbar.py
new file mode 100644
index 0000000000..3695fe92c0
--- /dev/null
+++ b/support/testing/tests/package/sample_python_crossbar.py
@@ -0,0 +1,3 @@
+import crossbar
+
+crossbar.run(["version"])
diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
new file mode 100644
index 0000000000..2d7b739b5c
--- /dev/null
+++ b/support/testing/tests/package/test_python_crossbar.py
@@ -0,0 +1,14 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Crossbar(TestPythonPackageBase):
+    __test__ = True
+    # use haveged to generate enough entropy so crossbar -> pynacl -> libsodium don't hang waiting for /dev/random
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CROSSBAR=y
+        BR2_PACKAGE_HAVEGED=y
+        """
+    sample_scripts = ["tests/package/sample_python_crossbar.py"]
+    timeout = 60
-- 
2.17.1

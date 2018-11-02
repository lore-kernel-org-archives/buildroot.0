From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:41 -0300
Subject: [Buildroot] [PATCH v2 12/12] testing: add python-crossbar tests
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-13-ricardo.martincoski@gmail.com>
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
[Ricardo: update code-style and .gitlab-ci.yml, call the command without
 'python -m' as it is not supported anymore, remove Python 2 variant,
 add haveged to target to add entropy and avoid hanging]
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
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

NOTE: please mark below patch as Superseeded.
v1: http://patchwork.ozlabs.org/patch/873813/
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/test_python_crossbar.py     | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_crossbar.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7addd64df8..6a30c9603d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -315,6 +315,7 @@ tests.package.test_python.TestPythonInterpreter2: *runtime_test
 tests.package.test_python.TestPythonInterpreter3: *runtime_test
 tests.package.test_python_autobahn.TestPython2Autobahn: *runtime_test
 tests.package.test_python_autobahn.TestPython3Autobahn: *runtime_test
+tests.package.test_python_crossbar.TestPython3Crossbar: *runtime_test
 tests.package.test_python_cryptography.TestPython2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPython3Cryptography: *runtime_test
 tests.package.test_python_incremental.TestPython2Incremental: *runtime_test
diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
new file mode 100644
index 0000000000..2ead24cd16
--- /dev/null
+++ b/support/testing/tests/package/test_python_crossbar.py
@@ -0,0 +1,20 @@
+from tests.package.test_python import TestPythonPackageBase, TestPythonBase3
+
+
+class TestPython3Crossbar(TestPythonPackageBase, TestPythonBase3):
+    # use haveged to generate enough entropy so crossbar -> pynacl -> libsodium don't hang waiting for /dev/random
+    config_package = \
+        """
+        BR2_PACKAGE_PYTHON_CROSSBAR=y
+        BR2_PACKAGE_HAVEGED=y
+        """
+
+    def version_test(self):
+        # "python -m crossbar version" can't be used
+        cmd = "crossbar version"
+        _, exit_code = self.emulator.run(cmd, 60)
+        self.assertEqual(exit_code, 0)
+
+    def test_run(self):
+        self.login()
+        self.version_test()
-- 
2.17.1

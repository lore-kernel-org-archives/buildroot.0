From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 15 Oct 2018 21:42:24 -0300
Subject: [Buildroot] [PATCH 1/7] support/testing: create default test case
 for python packages
In-Reply-To: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
Message-ID: <20181016004230.10393-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test cases for python packages are very similar among each other: run a
simple script in the target that minimally tests the package.
So move some common logic to the TestPythonBase. Also move the test
script to be run on the target from inline in the test case to a
separate file.

After this change:
TestPythonBase adds in build time one or more sample scripts to be run
on the target. The test case for the python package must explicitly list
them in the "sample_scripts" property. The test case then logins to the
target, checks the scripts are really in the rootfs (it calls "md5sum"
instead of "ls" or "test" in an attempt to make the logfile more
friendly, since someone analysing a failure can easily check the
expected script was executed) and then calls the python interpreter
passing the sample script as parameter.
An optional property "timeout" exists for the case the sample script
needs more time to run than the default timeout from the test infra
(currently 5 seconds).
Instead of providing a defconfig fragment containing the python version,
the test case for a python package must provide only its own config set,
and inherit directly from TestPython2 or TestPython3 (that in turn
inherit from TestPythonBase).

A simple test case for a package that only supports Python 2 will look
like this:
|import tests.package.test_python
|
|
|class TestPythonPy2<Package>(tests.package.test_python.TestPython2):
|    config_package = \
|        """
|        BR2_PACKAGE_PYTHON_<PACKAGE>=y
|        """
|    sample_scripts = ["tests/package/sample_python_<package>.py"]
|    timeout = 15

When the python package supports both Python 2 and Python 3 a helper
class can be used to hold the common properties:
|class TestPython<Package>():
|    config_package = \
...
|class TestPythonPy2<Package>(TestPython<Package>, tests.package.test_python.TestPython2):
...
|class TestPythonPy3<Package>(TestPython<Package>, tests.package.test_python.TestPython3):

One catch when inheriting from another class that contains a method
test_run is that if "from tests.package.test_python import TestPython2"
is used, nose2 would list the test case TestPython2 twice because it
looks for symbols in the module namespace to discover test cases to run.
So any test cases that inherits from TestPython2 or TestPython3 should
instead import the module and use the full name
tests.package.test_python.TestPython2.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../package/copy-sample-script-to-target.sh   |  7 +++
 support/testing/tests/package/test_python.py  | 43 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100755 support/testing/tests/package/copy-sample-script-to-target.sh

diff --git a/support/testing/tests/package/copy-sample-script-to-target.sh b/support/testing/tests/package/copy-sample-script-to-target.sh
new file mode 100755
index 0000000000..6448a80d6d
--- /dev/null
+++ b/support/testing/tests/package/copy-sample-script-to-target.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+set -e
+
+shift
+for file in "$@"; do
+	cp -f "${file}" "${TARGET_DIR}/root/"
+done
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 26cf49947b..a33db26d00 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -10,6 +10,23 @@ class TestPythonBase(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     interpreter = "python"
+    config_package = None
+    config_sample_scripts = \
+        """
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        """.format(infra.filepath("tests/package/copy-sample-script-to-target.sh"),
+                   "{sample_scripts}")
+    sample_scripts = None
+    timeout = -1
+
+    def __init__(self, names):
+        super(TestPythonBase, self).__init__(names)
+        if self.config_package:
+            self.config += self.config_package
+        if self.sample_scripts:
+            scripts = [infra.filepath(s) for s in self.sample_scripts]
+            self.config += self.config_sample_scripts.format(sample_scripts=" ".join(scripts))
 
     def login(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
@@ -41,6 +58,18 @@ class TestPythonBase(infra.basetest.BRTest):
         _, exit_code = self.emulator.run(cmd, timeout)
         self.assertEqual(exit_code, 1)
 
+    def check_sample_scripts_exist(self):
+        scripts = [os.path.basename(s) for s in self.sample_scripts]
+        cmd = "md5sum " + " ".join(scripts)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+    def run_sample_scripts(self):
+        for script in self.sample_scripts:
+            cmd = self.interpreter + " " + os.path.basename(script)
+            _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            self.assertEqual(exit_code, 0)
+
 
 class TestPython2(TestPythonBase):
     config = TestPythonBase.config + \
@@ -50,6 +79,13 @@ class TestPython2(TestPythonBase):
 
     def test_run(self):
         self.login()
+
+        if self.__class__.__name__ != "TestPython2":
+            # default test_run for TestPythonPy2<Package> that inherits from this one
+            self.check_sample_scripts_exist()
+            self.run_sample_scripts()
+            return
+
         self.version_test("Python 2")
         self.math_floor_test()
         self.libc_time_test()
@@ -64,6 +100,13 @@ class TestPython3(TestPythonBase):
 
     def test_run(self):
         self.login()
+
+        if self.__class__.__name__ != "TestPython3":
+            # default test_run for TestPythonPy3<Package> that inherits from this one
+            self.check_sample_scripts_exist()
+            self.run_sample_scripts()
+            return
+
         self.version_test("Python 3")
         self.math_floor_test()
         self.libc_time_test()
-- 
2.17.1

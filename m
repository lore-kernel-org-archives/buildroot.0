From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:33 -0300
Subject: [Buildroot] [PATCH v2 04/12] support/testing: create default test
 case for python packages
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test cases for python packages are very similar among each other: run a
simple script in the target that minimally tests the package.
So create a new helper class named TestPythonPackageBase that holds all
the logic to run a script on the target. This new class is not a
subclass of unittest.TestCase and therefore nose2 ignores it, avoiding
to create a bogus test case.

TestPythonPackageBase adds in build time one or more sample scripts to
be run on the target. The test case for the python package must
explicitly list them in the "sample_scripts" property. The test case
then automatically logins to the target, checks the scripts are really
in the rootfs (it calls "md5sum" instead of "ls" or "test" in an attempt
to make the logfile more friendly, since someone analysing a failure can
easily check the expected script was executed) and then calls the python
interpreter passing the sample script as parameter.
An optional property "timeout" exists for the case the sample script
needs more time to run than the default timeout from the test infra
(currently 5 seconds).

A simple test case for a package that only supports Python 2 will look
like this:

|from tests.package.test_python import TestPythonPackageBase, TestPythonBase2
|
|
|class TestPython2<Package>(TestPythonPackageBase, TestPythonBase2):
|    config_package = \
|        """
|        BR2_PACKAGE_PYTHON_<PACKAGE>=y
|        """
|    sample_scripts = ["tests/package/sample_python_<package>.py"]
|    timeout = 15

When the python package supports both Python 2 and Python 3 a helper
class can be used to hold the common properties:
|class TestPython<Package>(TestPythonPackageBase):
|    config_package = \
...
|class TestPythonPy2<Package>(TestPython<Package>, TestPythonBase2):
...
|class TestPythonPy3<Package>(TestPython<Package>, TestPythonBase3):

A trick is used in order to allow this new class to change the defconfig
used in the build of the image for the testcase: this class' __init__
method calls the __init__ method from a parent class that in turn
inherits from unittest.TestCase. This would be a normal usage ... if
this class actually inherited from another class!
This is done to make nose2 to ignore this class when looking for test
cases. And it works because all classes that inherit from it also are
subclasses of unittest.TestCase.
An alternative solution to this would be to create yet another help
class in test_python.py that doesn't inherit from unittest.TestCase to
hold only the test_run method and make every test case for python
package (not the helper class, i.e. TestPythonArgh) to inherit from
this class too.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
NOTE: example of the alternative solution without the mentioned trick:
https://gitlab.com/RicardoMartincoski/buildroot/commit/ea7177c7a233a32129230189f609ecd36853d7e2

Changes v1 -> v2:
  - do not reuse TestPython2 and TestPython3 to for two entirely
    separate things: (Thomas)
    - As a base class for testing individual Python packages;
    - As test cases for the Python interpreter itself;
  - use a better class hierarchy (Thomas). I did this in various patches
    (before and after this one) trying to make the review easier.
  - with the new class hierarchy the trick that allows the defconfig to
    be changed by each test case without explicitly naming the class
    that contains the base defconfig is moved from every test case to
    the new base class.

v1: http://patchwork.ozlabs.org/patch/984425/
---
 .../package/copy-sample-script-to-target.sh   |  7 ++++
 support/testing/tests/package/test_python.py  | 38 +++++++++++++++++++
 2 files changed, 45 insertions(+)
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
index e4679233df..bc2e14a1ed 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -73,3 +73,41 @@ class TestPython2(TestPythonInterpreter, TestPythonBase2):
 
 class TestPython3(TestPythonInterpreter, TestPythonBase3):
     version_string = "Python 3"
+
+
+class TestPythonPackageBase():
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
+        # every class that inherits from this one will inherit from TestPythonBase too
+        super(TestPythonBase, self).__init__(names)
+        if self.config_package:
+            self.config += self.config_package
+        if self.sample_scripts:
+            scripts = [infra.filepath(s) for s in self.sample_scripts]
+            self.config += self.config_sample_scripts.format(sample_scripts=" ".join(scripts))
+
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
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        self.run_sample_scripts()
-- 
2.17.1

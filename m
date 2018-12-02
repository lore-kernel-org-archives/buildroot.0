From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:26 -0000
Subject: [Buildroot] [git commit] support/testing: create default test case
 for python packages
Message-ID: <20181202071554.D13FE8107F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13e3c14ed277e7f53ed9cdc7d161a4435c2ddbe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test cases for python packages are very similar among each other: run a
simple script in the target that minimally tests the package.
So create a new helper class named TestPythonPackageBase that holds all
the logic to run a script on the target.

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

|from tests.package.test_python import TestPythonPackageBase
|
|
|class TestPythonPy2<Package>(TestPythonPackageBase):
|    __test__ = True
|    config = TestPythonPackageBase.config + \
|        """
|        BR2_PACKAGE_PYTHON=y
|        BR2_PACKAGE_PYTHON_<PACKAGE>=y
|        """
|    sample_scripts = ["tests/package/sample_python_<package>.py"]
|    timeout = 15

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/package/copy-sample-script-to-target.sh  |  7 +++
 support/testing/tests/package/test_python.py       | 56 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

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
index 26cf49947b..c422bdbf50 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -68,3 +68,59 @@ class TestPython3(TestPythonBase):
         self.math_floor_test()
         self.libc_time_test()
         self.zlib_test()
+
+
+class TestPythonPackageBase(TestPythonBase):
+    """Common class to test a python package.
+
+    Build an image containing the scripts listed in sample_scripts, start the
+    emulator, login to it and for each sample script in the image run the python
+    interpreter passing the name of the script and check the status code is 0.
+
+    Each test case that inherits from this class must have:
+    __test__ = True  - to let nose2 know that it is a test case
+    config           - defconfig fragment with the packages to run the test
+    It also can have:
+    sample_scripts   - list of scripts to add to the image and run on the target
+    timeout          - timeout to the script to run when the default from the
+                       test infra is not enough
+    When custom commands need be issued on the target the method
+    run_sample_scripts can be overridden.
+    """
+
+    __test__ = False
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
+        """Add the scripts to the target in build time."""
+        super(TestPythonPackageBase, self).__init__(names)
+        if self.sample_scripts:
+            scripts = [infra.filepath(s) for s in self.sample_scripts]
+            self.config += self.config_sample_scripts.format(sample_scripts=" ".join(scripts))
+
+    def check_sample_scripts_exist(self):
+        """Check the scripts were really added to the image."""
+        scripts = [os.path.basename(s) for s in self.sample_scripts]
+        cmd = "md5sum " + " ".join(scripts)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+    def run_sample_scripts(self):
+        """Run each script previously added to the image."""
+        for script in self.sample_scripts:
+            cmd = self.interpreter + " " + os.path.basename(script)
+            _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            self.assertEqual(exit_code, 0)
+
+    def test_run(self):
+        """Test a python package."""
+        self.login()
+        self.check_sample_scripts_exist()
+        self.run_sample_scripts()

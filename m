From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] support/testing: add python-crossbar tests
Message-ID: <20181202071555.0C4148A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad361c69f6003bc1e5df5bf6a6b64fe8d9b54645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test invokes "crossbar version" command, that checks all
dependencies found in setup.py files and prints some system related
information.
Add haveged to the target to generate enough entropy so crossbar ->
pynacl -> libsodium don't hang waiting for /dev/random.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Ricardo: move test script to a separate file, remove Python 2 variant,
 add haveged to target to add entropy and avoid hanging]
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                          |  1 +
 support/testing/tests/package/sample_python_crossbar.py |  3 +++
 support/testing/tests/package/test_python_crossbar.py   | 14 ++++++++++++++
 3 files changed, 18 insertions(+)

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

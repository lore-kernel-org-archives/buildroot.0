From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:55:05 +0200
Subject: [Buildroot] [git commit] testing/tests/package: add basic unit test
	for IPython
Message-ID: <20170722205114.0B1DF80420@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2fe2686d7eea40e8e46304abf0914982ede6c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
[Thomas: update .gitlab-ci.yml.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                                |  2 ++
 support/testing/tests/package/test_ipython.py | 38 +++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9a1f027..f360b6c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -226,6 +226,8 @@ tests.fs.test_squashfs.TestSquashfs: *runtime_test
 tests.fs.test_ubi.TestUbi: *runtime_test
 tests.fs.test_yaffs2.TestYaffs2: *runtime_test
 tests.package.test_dropbear.TestDropbear: *runtime_test
+tests.package.test_ipython.TestIPythonPy2: *runtime_test
+tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
new file mode 100644
index 0000000..dd8bf50
--- /dev/null
+++ b/support/testing/tests/package/test_ipython.py
@@ -0,0 +1,38 @@
+import os
+
+from tests.package.test_python import TestPythonBase
+#
+# The following pythong tests are not being used here:
+#
+# - version_test: IPython does not support --version option
+#
+# - zlib_test: IPython does not return a non-zero code the way CPython
+#              does, so this test ends up being a false-negative
+#
+class TestIPythonPy2(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON=y
+BR2_PACKAGE_PYTHON_IPYTHON=y
+"""
+    interpreter = "ipython"
+
+    def test_run(self):
+        self.login()
+        self.math_floor_test(40)
+        self.libc_time_test(40)
+
+class TestIPythonPy3(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON3=y
+BR2_PACKAGE_PYTHON_IPYTHON=y
+"""
+    interpreter = "ipython"
+
+    def test_run(self):
+        self.login()
+        self.math_floor_test(40)
+        self.libc_time_test(40)
+
+

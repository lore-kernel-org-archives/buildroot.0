From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 11:12:09 +0100
Subject: [Buildroot] [git commit] support/testing: add libftdi1 test case
Message-ID: <20200223100254.34E418E7CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=593bba41abf01d0267f6c8082faa9a1d7094108a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml                                   |  2 ++
 DEVELOPERS                                       |  1 +
 support/testing/tests/package/sample_libftdi1.py |  1 +
 support/testing/tests/package/test_libftdi1.py   | 25 ++++++++++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a6436a8417..b4dad3173e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -381,6 +381,8 @@ tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
 tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
+tests.package.test_libftdi1.TestPythonPy2Libftdi1: { extends: .runtime_test }
+tests.package.test_libftdi1.TestPythonPy3Libftdi1: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuaLPeg: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuajitLPeg: { extends: .runtime_test }
 tests.package.test_lsqlite3.TestLuaLsqlite3: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 91716ed27e..7d3d1ca11a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2630,6 +2630,7 @@ F:	package/ti-utils/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
+F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
 F:	utils/scanpypi
 
diff --git a/support/testing/tests/package/sample_libftdi1.py b/support/testing/tests/package/sample_libftdi1.py
new file mode 100644
index 0000000000..2da6124b40
--- /dev/null
+++ b/support/testing/tests/package/sample_libftdi1.py
@@ -0,0 +1 @@
+import ftdi1 # noqa
diff --git a/support/testing/tests/package/test_libftdi1.py b/support/testing/tests/package/test_libftdi1.py
new file mode 100644
index 0000000000..78c928484c
--- /dev/null
+++ b/support/testing/tests/package/test_libftdi1.py
@@ -0,0 +1,25 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Libftdi1(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_LIBFTDI1=y
+        BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS=y
+        """
+    sample_scripts = ["tests/package/sample_libftdi1.py"]
+    timeout = 40
+
+
+class TestPythonPy3Libftdi1(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_LIBFTDI1=y
+        BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS=y
+        """
+    sample_scripts = ["tests/package/sample_libftdi1.py"]
+    timeout = 40

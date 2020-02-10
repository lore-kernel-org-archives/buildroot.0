From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 10 Feb 2020 10:11:49 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: add libftdi1 test case
In-Reply-To: <20200210091149.8584-1-yegorslists@googlemail.com>
References: <20200210091149.8584-1-yegorslists@googlemail.com>
Message-ID: <20200210091149.8584-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .gitlab-ci.yml                                |  2 ++
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/sample_libftdi1.py  |  1 +
 .../testing/tests/package/test_libftdi1.py    | 25 +++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 support/testing/tests/package/sample_libftdi1.py
 create mode 100644 support/testing/tests/package/test_libftdi1.py

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
index cb13035bc4..6623b7c5c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2627,6 +2627,7 @@ F:	package/ti-utils/
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
-- 
2.17.0

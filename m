From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 20:47:10 +0200
Subject: [Buildroot] [PATCH] support/testing/tests: drop Python 2.x test in
 test_ipython
Message-ID: <20190513184710.19747-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 6ebaef3818d6e3dc821616a33391eb6d594a053e
("package/python-ipython: bump to version 7.4.0"), ipython is no
longer available for Python 2.x, as it requires Python 3.x.

However, the corresponding test case that was testing iPython under
Python 2.x was not removed at the same time, causing a failure of
TestIPythonPy2 test. Let's drop the test that is no longer relevant.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/210208754

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                |  1 -
 support/testing/tests/package/test_ipython.py | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 374dbfe837..836944faf5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -361,7 +361,6 @@ tests.package.test_atop.TestAtop: { extends: .runtime_test }
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
 tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
-tests.package.test_ipython.TestIPythonPy2: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuaLPeg: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuajitLPeg: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
index 3b291d9583..50b00da7c2 100644
--- a/support/testing/tests/package/test_ipython.py
+++ b/support/testing/tests/package/test_ipython.py
@@ -8,20 +8,6 @@ from tests.package.test_python import TestPythonBase
 #              does, so this test ends up being a false-negative
 
 
-class TestIPythonPy2(TestPythonBase):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_IPYTHON=y
-        """
-    interpreter = "ipython"
-
-    def test_run(self):
-        self.login()
-        self.math_floor_test(40)
-        self.libc_time_test(40)
-
-
 class TestIPythonPy3(TestPythonBase):
     config = TestPythonBase.config + \
         """
-- 
2.21.0

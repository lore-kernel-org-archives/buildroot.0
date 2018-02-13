From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:12:00 +0100
Subject: [Buildroot] [git commit] support/testing: fix job
 check-gitlab-ci.yml
Message-ID: <20180213221205.0B3D18873D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b0ca5749cde19ab456c80de133a0bd5f7dc5069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently 'run-tests -l' is broken. It breaks 'make .gitlab-ci.yml' that
in turn breaks the job in GitLab.

TestRustBase is not a test case by itself, so it can't have a method
with the name starting with "test_" otherwise nose2 assumes it is a test
case.
Move the test_run method from the base class to the derived classes.

While at it, update .gitlab-ci.yml with the new test cases.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/52000035

Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                             |  2 ++
 support/testing/tests/package/test_rust.py | 18 ++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 30a4399553..f76e53b565 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -282,6 +282,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
+tests.package.test_rust.TestRust: *runtime_test
+tests.package.test_rust.TestRustBin: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 8035f8b83a..e6c0de2214 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -53,12 +53,6 @@ class TestRustBase(infra.basetest.BRTest):
         self.b.build()
         shutil.rmtree(workdir)
 
-    def test_run(self):
-        self.build_test_prog()
-        self.login()
-        _, exit_code = self.emulator.run(self.crate)
-        self.assertEqual(exit_code, 0)
-
 
 class TestRustBin(TestRustBase):
     config = \
@@ -82,6 +76,12 @@ class TestRustBin(TestRustBase):
              BR2_PACKAGE_HOST_RUSTC=y
              """
 
+    def test_run(self):
+        self.build_test_prog()
+        self.login()
+        _, exit_code = self.emulator.run(self.crate)
+        self.assertEqual(exit_code, 0)
+
 
 class TestRust(TestRustBase):
     config = \
@@ -105,3 +105,9 @@ class TestRust(TestRustBase):
              BR2_PACKAGE_HOST_RUSTC=y
              BR2_PACKAGE_HOST_RUST=y
              """
+
+    def test_run(self):
+        self.build_test_prog()
+        self.login()
+        _, exit_code = self.emulator.run(self.crate)
+        self.assertEqual(exit_code, 0)

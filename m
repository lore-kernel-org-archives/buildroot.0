From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 12 Feb 2018 19:02:08 -0200
Subject: [Buildroot] [PATCH] support/testing: fix job check-gitlab-ci.yml
In-Reply-To: <20180212090725.323e5a6c@windsurf.lan>
References: <20180212090725.323e5a6c@windsurf.lan>
Message-ID: <1518469328-5895-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
check-gitlab-ci.yml after the fix:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/52092002
which is part of a full run:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/17391318
---
 .gitlab-ci.yml                             |  2 ++
 support/testing/tests/package/test_rust.py | 18 ++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 30a4399..f76e53b 100644
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
index 8035f8b..e6c0de2 100644
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
-- 
2.7.4

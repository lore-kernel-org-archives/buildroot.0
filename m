From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:45:00 +0200
Subject: [Buildroot] [git commit] support/testing: add python-gpiozero test
Message-ID: <20200618194318.BF32682B7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d0af210f71a952fde3a715565cd94d20d678485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../tests/package/sample_python_gpiozero.py        |  5 ++++
 .../testing/tests/package/test_python_gpiozero.py  | 32 ++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3bad5d5ae9..ac4c826fb7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -492,6 +492,8 @@ tests.package.test_python_django.TestPythonPy3Django: { extends: .runtime_test }
 tests.package.test_python_gitdb2.TestPythonPy2Gitdb2: { extends: .runtime_test }
 tests.package.test_python_gitdb2.TestPythonPy3Gitdb2: { extends: .runtime_test }
 tests.package.test_python_gobject.TestPythonPy3Gobject: { extends: .runtime_test }
+tests.package.test_python_gpiozero.TestPythonPy2Gpiozero: { extends: .runtime_test }
+tests.package.test_python_gpiozero.TestPythonPy3Gpiozero: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
 tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_gpiozero.py b/support/testing/tests/package/sample_python_gpiozero.py
new file mode 100644
index 0000000000..b95df07fe7
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gpiozero.py
@@ -0,0 +1,5 @@
+from gpiozero import pi_info
+
+piBoardInfo = pi_info('a020d3')  # 3B+
+
+assert(piBoardInfo.model == '3B+')
diff --git a/support/testing/tests/package/test_python_gpiozero.py b/support/testing/tests/package/test_python_gpiozero.py
new file mode 100644
index 0000000000..2498a55514
--- /dev/null
+++ b/support/testing/tests/package/test_python_gpiozero.py
@@ -0,0 +1,32 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonGpiozero(TestPythonPackageBase):
+    config = TestPythonPackageBase.config
+    sample_scripts = ["tests/package/sample_python_gpiozero.py"]
+
+    def run_sample_scripts(self):
+        cmd = self.interpreter + " sample_python_gpiozero.py"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "pinout -r a020d3 -m | cat"
+        self.assertRunOk(cmd)
+
+
+class TestPythonPy2Gpiozero(TestPythonGpiozero):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_GPIOZERO=y
+        """
+
+
+class TestPythonPy3Gpiozero(TestPythonGpiozero):
+    __test__ = True
+    config = TestPythonGpiozero.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GPIOZERO=y
+        """

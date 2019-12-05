From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:02:14 +0100
Subject: [Buildroot] [git commit] support/testing: add python-django test
Message-ID: <20191205220559.B426888221@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8583b2c6d878ea890081d354170f90c564d7d846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test comprises of four simple steps:
  1: Start a new simple project called testsite.
  2: Run ./manage.py migrate on the new testsite.
  3: Run ./manage.py runserver 0.0.0.0:1234 & sleep 30
    - The sleep 30 is necessary as it may take several seconds for
      the django server to fully start.
  4: Run netstat to ensure the server opened port 1234.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
[Thomas: use self.assertRunOk() when appropriate]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 .../testing/tests/package/sample_python_django.py  |  1 +
 .../testing/tests/package/test_python_django.py    | 32 ++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 22befa0427..75b2fcb37c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -448,6 +448,7 @@ tests.package.test_python_constantly.TestPythonPy3Constantly: { extends: .runtim
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: { extends: .runtime_test }
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: { extends: .runtime_test }
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: { extends: .runtime_test }
+tests.package.test_python_django.TestPythonPy3Django: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
 tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_django.py b/support/testing/tests/package/sample_python_django.py
new file mode 100644
index 0000000000..c2bad566a7
--- /dev/null
+++ b/support/testing/tests/package/sample_python_django.py
@@ -0,0 +1 @@
+import django  # noqa: F401
diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
new file mode 100644
index 0000000000..eb93d4fca9
--- /dev/null
+++ b/support/testing/tests/package/test_python_django.py
@@ -0,0 +1,32 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonDjango(TestPythonPackageBase):
+    config = TestPythonPackageBase.config
+    sample_scripts = ["tests/package/sample_python_django.py"]
+
+    def run_sample_scripts(self):
+        cmd = "cd /opt && /usr/bin/django-admin startproject testsite"
+        self.assertRunOk(cmd, timeout=30)
+
+        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py migrate"
+        output, exit_code = self.emulator.run(cmd, timeout=30)
+        self.assertIn("Operations to perform:", output[0])
+        self.assertEqual(exit_code, 0)
+
+        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 & "
+        # give some time to setup the server
+        cmd += "sleep 30"
+        self.assertRunOk(cmd, timeout=35)
+
+        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
+        self.assertRunOk(cmd)
+
+class TestPythonPy3Django(TestPythonDjango):
+    __test__ = True
+    config = TestPythonDjango.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DJANGO=y
+        BR2_PACKAGE_PYTHON3_SQLITE=y
+        """

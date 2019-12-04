From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed,  4 Dec 2019 12:06:29 -0800
Subject: [Buildroot] [PATCH 2/2] support/testing: add python-django test
In-Reply-To: <20191204200629.686191-1-aduskett@gmail.com>
References: <20191204200629.686191-1-aduskett@gmail.com>
Message-ID: <20191204200629.686191-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

This test comprises of four simple steps:
  1: Start a new simple project called testsite.
  2: Run ./manage.py migrate on the new testsite.
  3: Run ./manage.py runserver 0.0.0.0:1234 & sleep 30
    - The sleep 30 is necessary as it may take several seconds for
      the django server to fully start.
  4: Run netstat to ensure the server opened port 1234.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/sample_python_django.py     |  1 +
 .../tests/package/test_python_django.py       | 35 +++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_django.py
 create mode 100644 support/testing/tests/package/test_python_django.py

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
index 0000000000..3db9b96123
--- /dev/null
+++ b/support/testing/tests/package/test_python_django.py
@@ -0,0 +1,35 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonDjango(TestPythonPackageBase):
+    config = TestPythonPackageBase.config
+    sample_scripts = ["tests/package/sample_python_django.py"]
+
+    def run_sample_scripts(self):
+        cmd = "cd /opt && /usr/bin/django-admin startproject testsite"
+        _, exit_code = self.emulator.run(cmd, timeout=30)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py migrate"
+        output, exit_code = self.emulator.run(cmd, timeout=30)
+        self.assertIn("Operations to perform:", output[0])
+        self.assertEqual(exit_code, 0)
+
+        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 & "
+        # give some time to setup the server
+        cmd += "sleep 30"
+        _, exit_code = self.emulator.run(cmd, timeout=35)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+class TestPythonPy3Django(TestPythonDjango):
+    __test__ = True
+    config = TestPythonDjango.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DJANGO=y
+        BR2_PACKAGE_PYTHON3_SQLITE=y
+        """
-- 
2.23.0

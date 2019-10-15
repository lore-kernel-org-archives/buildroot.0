From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 15 Oct 2019 11:13:56 -0700
Subject: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_python_django.py: New test
In-Reply-To: <20191015181356.5459-1-aduskett@gmail.com>
References: <20191015181356.5459-1-aduskett@gmail.com>
Message-ID: <20191015181356.5459-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This test comprises of two simple steps:
  1: Start a new simple project called testsite.
  2: Run ./manage.py migrate on the new testsite.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .gitlab-ci.yml                                |  1 +
 .../tests/package/sample_python_django.py     |  1 +
 .../tests/package/test_python_django.py       | 26 +++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_django.py
 create mode 100644 support/testing/tests/package/test_python_django.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 59efd51340..a840bcba0e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -438,6 +438,7 @@ tests.package.test_python_constantly.TestPythonPy3Constantly: { extends: .runtim
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: { extends: .runtime_test }
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: { extends: .runtime_test }
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: { extends: .runtime_test }
+tests.package.test_python_django.TestPythonPy3Django: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
 tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_django.py b/support/testing/tests/package/sample_python_django.py
new file mode 100644
index 0000000000..e7753d48fb
--- /dev/null
+++ b/support/testing/tests/package/sample_python_django.py
@@ -0,0 +1 @@
+import django
diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
new file mode 100644
index 0000000000..595134f50e
--- /dev/null
+++ b/support/testing/tests/package/test_python_django.py
@@ -0,0 +1,26 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonDjango(TestPythonPackageBase):
+    config = TestPythonPackageBase.config
+    sample_scripts = ["tests/package/sample_python_django.py"]
+
+    def run_sample_scripts(self):
+        cmd = "cd /opt; /usr/bin/django-admin startproject testsite"
+        _, exit_code = self.emulator.run(cmd, timeout=30)
+        self.assertEqual(exit_code, 0)
+        cmd = "cd /opt/testsite; " + self.interpreter + " ./manage.py migrate"
+        output, exit_code = self.emulator.run(cmd, timeout=30)
+        self.assertIn("Operations to perform:", output[0])
+        self.assertEqual(exit_code, 0)
+
+class TestPythonPy3Django(TestPythonDjango):
+    __test__ = True
+    config = TestPythonDjango.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DJANGO=y
+        BR2_PACKAGE_PYTHON_SQLPARSE=y
+        BR2_PACKAGE_PYTHON3_SQLITE=y
+        """
+
-- 
2.21.0

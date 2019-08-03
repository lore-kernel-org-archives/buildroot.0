From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat,  3 Aug 2019 02:22:15 -0300
Subject: [Buildroot] [PATCH 3/4] support/testing: test python-* with builtin
 kernel
In-Reply-To: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
References: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
Message-ID: <20190803052216.22292-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the new builtin kernel 4.19 with VirtIORNG to provide entropy to
test all python packages by default.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/264508536
https://gitlab.com/buildroot.org/buildroot/-/jobs/264508537
https://gitlab.com/buildroot.org/buildroot/-/jobs/264508542
https://gitlab.com/buildroot.org/buildroot/-/jobs/264508543

The workaround of adding haveged to the image is not needed anymore, so
remove it from the python-crossbar and python-nacl test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python.py          | 2 +-
 support/testing/tests/package/test_python_crossbar.py | 2 --
 support/testing/tests/package/test_python_pynacl.py   | 4 ----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index bcd363ad1e..8c0edcf6b9 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -14,7 +14,7 @@ class TestPythonBase(infra.basetest.BRTest):
     def login(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(arch="armv5",
-                           kernel="builtin",
+                           kernel="builtin-4.19",
                            options=["-initrd", cpio_file])
         self.emulator.login()
 
diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
index 2d7b739b5c..d7843ddd8b 100644
--- a/support/testing/tests/package/test_python_crossbar.py
+++ b/support/testing/tests/package/test_python_crossbar.py
@@ -3,12 +3,10 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Crossbar(TestPythonPackageBase):
     __test__ = True
-    # use haveged to generate enough entropy so crossbar -> pynacl -> libsodium don't hang waiting for /dev/random
     config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CROSSBAR=y
-        BR2_PACKAGE_HAVEGED=y
         """
     sample_scripts = ["tests/package/sample_python_crossbar.py"]
     timeout = 60
diff --git a/support/testing/tests/package/test_python_pynacl.py b/support/testing/tests/package/test_python_pynacl.py
index 729a887552..f4dd54940a 100644
--- a/support/testing/tests/package/test_python_pynacl.py
+++ b/support/testing/tests/package/test_python_pynacl.py
@@ -3,12 +3,10 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy2Pynacl(TestPythonPackageBase):
     __test__ = True
-    # use haveged to generate enough entropy so pynacl -> libsodium don't hang waiting for /dev/random
     config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_PYNACL=y
-        BR2_PACKAGE_HAVEGED=y
         """
     sample_scripts = ["tests/package/sample_python_pynacl.py"]
     timeout = 10
@@ -16,12 +14,10 @@ class TestPythonPy2Pynacl(TestPythonPackageBase):
 
 class TestPythonPy3Pynacl(TestPythonPackageBase):
     __test__ = True
-    # use haveged to generate enough entropy so pynacl -> libsodium don't hang waiting for /dev/random
     config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_PYNACL=y
-        BR2_PACKAGE_HAVEGED=y
         """
     sample_scripts = ["tests/package/sample_python_pynacl.py"]
     timeout = 10
-- 
2.17.1

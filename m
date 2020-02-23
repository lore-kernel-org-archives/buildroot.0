From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 23 Feb 2020 09:56:26 -0800
Subject: [Buildroot] [PATCH/next v2 2/2] support/testing: update
 python-gobject test
In-Reply-To: <20200223175626.16900-1-aduskett@gmail.com>
References: <20200223175626.16900-1-aduskett@gmail.com>
Message-ID: <20200223175626.16900-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Because gobject-introspection is now a dependency of python-gobject, the test
must be updated.

 - Change TestPythonPy2Gobject to TestPythonPy3Gobject as
   gobject-introspection requires python3.

 - Refactor test_python_gobject.py to no longer inherit the
   TestPythonPackageBase class, as this class uses a base config that does not
   support gobject-introspection.

 - Update sample_python_gobject to use Glib to find the path of sh.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .gitlab-ci.yml                                |  2 +-
 .../tests/package/sample_python_gobject.py    | 13 +++++++-
 .../tests/package/test_python_gobject.py      | 30 ++++++++++++++++---
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a6436a8417..c18c6a5fa7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -458,7 +458,7 @@ tests.package.test_python_cryptography.TestPythonPy3Cryptography: { extends: .ru
 tests.package.test_python_django.TestPythonPy3Django: { extends: .runtime_test }
 tests.package.test_python_gitdb2.TestPythonPy2Gitdb2: { extends: .runtime_test }
 tests.package.test_python_gitdb2.TestPythonPy3Gitdb2: { extends: .runtime_test }
-tests.package.test_python_gobject.TestPythonPy2Gobject: { extends: .runtime_test }
+tests.package.test_python_gobject.TestPythonPy3Gobject: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
 tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
index 84ebee7362..ecce0b0575 100644
--- a/support/testing/tests/package/sample_python_gobject.py
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -1 +1,12 @@
-import gobject  # noqa
+#!/usr/bin/env python
+"""A simple test that uses python-gobject to find the path of sh."""
+from gi.repository import GLib
+
+def main():
+    sh_path = GLib.find_program_in_path('sh')
+    if sh_path == "/bin/sh":
+      return True
+    return False
+
+if __name__ == '__main__':
+    main()
diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
index 0a59447adb..a673d554a4 100644
--- a/support/testing/tests/package/test_python_gobject.py
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -1,11 +1,33 @@
+import os
 from tests.package.test_python import TestPythonPackageBase
 
-
-class TestPythonPy2Gobject(TestPythonPackageBase):
+class TestPythonPy3Gobject(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    config = \
         """
-        BR2_PACKAGE_PYTHON=y
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_PACKAGE_GOBJECT_INTROSPECTION=y
+        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_GOBJECT=y
         """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
     sample_scripts = ["tests/package/sample_python_gobject.py"]
-- 
2.24.1

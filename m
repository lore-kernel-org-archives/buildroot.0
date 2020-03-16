From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 16 Mar 2020 08:34:59 -0700
Subject: [Buildroot] [PATCH 1/1] support/testing/: change python-gobject to
 use prebuilt kernel
Message-ID: <20200316153459.2291931-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This change significantly reduces the ammount of time needed to run the
test.

Select a cortext_a9 and a external linaro toolchain due to the need for a
glibc based toolchain, as the default TestPythonPackageBase.config toolchain
is a uClibc toolchain.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../tests/package/test_python_gobject.py      | 25 +++++++------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
index a673d554a4..cf10e9ff67 100644
--- a/support/testing/tests/package/test_python_gobject.py
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -3,31 +3,24 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Gobject(TestPythonPackageBase):
     __test__ = True
-    config = \
+    config = TestPythonPackageBase.config + \
         """
-        BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_TARGET_ROOTFS_CPIO=y
-        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_ARM_EABIHF=y
+        BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
         BR2_PACKAGE_GOBJECT_INTROSPECTION=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_GOBJECT=y
         """
 
     def login(self):
-        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
-        kern = os.path.join(self.builddir, "images", "Image")
-        self.emulator.boot(arch="aarch64",
-                           kernel=kern,
-                           kernel_cmdline=["console=ttyAMA0"],
-                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
         self.emulator.login()
 
     sample_scripts = ["tests/package/sample_python_gobject.py"]
-- 
2.24.1

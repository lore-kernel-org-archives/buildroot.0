From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 15:25:34 +0100
Subject: [Buildroot] [git commit] support/testing/: change python-gobject to
 use prebuilt kernel
Message-ID: <20200322141311.CAE988407E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1101d7cb09050792b9e457682de214d901a2beef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we build a complete AArch64 system, including a kernel. This
can take quite some time.

Switch to an armv7 system, which allows us to use one a prebuilt kernel,
thus significantly reducing the test time.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - use a standalone config; don't inherit from TestPythonPackageBase
  - use the default external toolchain (ARM, not Linaro)
  - rewrite commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../testing/tests/package/test_python_gobject.py   | 25 ++++++++--------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
index a673d554a4..be33882455 100644
--- a/support/testing/tests/package/test_python_gobject.py
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -5,29 +5,22 @@ class TestPythonPy3Gobject(TestPythonPackageBase):
     __test__ = True
     config = \
         """
-        BR2_aarch64=y
+        BR2_arm=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_cortex_a9=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        BR2_TARGET_ROOTFS_CPIO_GZIP=y
         BR2_PACKAGE_GOBJECT_INTROSPECTION=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_GOBJECT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
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

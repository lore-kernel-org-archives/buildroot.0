From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  8 Jan 2019 00:50:24 +0100
Subject: [Buildroot] [WIP] support/testing: add xserver + Mesa OpenGL (GLX)
 + glxinfo
Message-ID: <20190107235024.6819-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This test allow to check if the xserver with GLX is working properly.
This is a basic test but it allow to trigger the current bug reported
by [1].

[1] https://bugs.buildroot.org/show_bug.cgi?id=11591

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_glxinfo.py | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 support/testing/tests/package/test_glxinfo.py

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
new file mode 100644
index 0000000000..d5d08f7a47
--- /dev/null
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+GLXINFO_TIMEOUT = 120
+
+class TestGlxinfo(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_core2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2018.11-1.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
+        # BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
+        BR2_PACKAGE_MESA3D_DEMOS=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+        BR2_PACKAGE_XORG7=y
+        BR2_PACKAGE_XSERVER_XORG_SERVER=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        # glxinfo overallocate memory and the minimum that seemed to work was 512MB
+        self.emulator.boot(arch="i386",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyS0"],
+                           options=["-M", "pc", "-m", "512", "-drive", "file={},if=virtio,format=raw".format(img)])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        # The test case verifies that the xserver with GLX is working
+        cmd = "glxinfo -display :0 2>&1 >/dev/null | grep Error"
+        # Error case: "Error: couldn't find RGB GLX visual or fbconfig"
+        _, exit_code = self.emulator.run(cmd, GLXINFO_TIMEOUT)
+        self.assertEqual(exit_code, 1)
-- 
2.14.5

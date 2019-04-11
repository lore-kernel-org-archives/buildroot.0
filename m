From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 18:23:40 +0200
Subject: [Buildroot] [git commit] support/testing: add test for xserver/Mesa
 OpenGL/glxinfo
Message-ID: <20190411162002.A9A8781974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec68531774eeec36725bc4022df4b7cb9cfe8338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test allow to check if the xserver with GLX is working properly.
This is a basic test but it allow to trigger the current bug reported
by [1].

To test if the glxinfo test is working, you can change "-display :0" by
"-display :1" in the glxinfo command line.

[1] https://bugs.buildroot.org/show_bug.cgi?id=11591

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Youssef Harmouch <youssef.harmouch@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                |  1 +
 support/testing/tests/package/test_glxinfo.py | 66 +++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e62e1c3e38..87e4e13057 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -325,6 +325,7 @@ tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: { extends: .runtime_tes
 tests.package.test_atop.TestAtop: { extends: .runtime_test }
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
+tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy2: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuaLPeg: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
new file mode 100644
index 0000000000..5a28411f49
--- /dev/null
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -0,0 +1,66 @@
+import os
+
+import infra.basetest
+
+GLXINFO_TIMEOUT = 120
+
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
+    def wait_for_xserver(self):
+        # xserver takes some time to start up
+        # The test case fail here if for some reason xserver is not properly installed
+        _, _ = self.emulator.run('while [ ! -e /var/run/xorg.pid ]; do sleep 1; done', 120)
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
+        self.wait_for_xserver()
+
+        # The test case verifies that the xserver with GLX is working
+        cmd = "glxinfo -B -display :0"
+        output, exit_code = self.emulator.run(cmd, GLXINFO_TIMEOUT)
+        self.assertEqual(exit_code, 0)
+        for line in output:
+            self.assertNotIn("Error", line)
+        # Error case: "Error: couldn't find RGB GLX visual or fbconfig"

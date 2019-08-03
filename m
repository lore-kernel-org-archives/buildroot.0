From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 14:53:05 +0200
Subject: [Buildroot] [git commit] support/testing: test atop with builtin
 kernel
Message-ID: <20190803125127.83008812B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9609a7c2c22160523bda5cb5b4417c9278ac27d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new builtin armv5 4.19 kernel to test atop.
The atop package cannot be tested using BASIC_TOOLCHAIN_CONFIG because
it needs kernel headers >= 3.14. So use an updated version of it,
copying the config fragment from
support/config-fragments/autobuild/br-arm-full.config

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_atop.py | 35 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/support/testing/tests/package/test_atop.py b/support/testing/tests/package/test_atop.py
index 32c5a07c3c..1da1ac7cc4 100644
--- a/support/testing/tests/package/test_atop.py
+++ b/support/testing/tests/package/test_atop.py
@@ -2,33 +2,34 @@ import os
 
 import infra.basetest
 
+BASIC_TOOLCHAIN_CONFIG_HEADERS_AT_LEAST_3_14 = \
+    """
+    BR2_arm=y
+    BR2_TOOLCHAIN_EXTERNAL=y
+    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
+    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
+    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
+    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+    BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    """
+
 
 class TestAtop(infra.basetest.BRTest):
-    config = \
+    config = BASIC_TOOLCHAIN_CONFIG_HEADERS_AT_LEAST_3_14 + \
         """
-        BR2_arm=y
-        BR2_cortex_a9=y
-        BR2_ARM_ENABLE_NEON=y
-        BR2_ARM_ENABLE_VFP=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_SYSTEM_DHCP="eth0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         BR2_PACKAGE_ATOP=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
     def test_run(self):
-        kernel = os.path.join(self.builddir, "images", "zImage")
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        dtb = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
-        self.emulator.boot(arch="armv7", kernel=kernel, options=["-initrd", cpio_file, "-M", "vexpress-a9", "-dtb", dtb])
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
         self.emulator.login()
 
         cmd = "atop -V | grep '^Version'"

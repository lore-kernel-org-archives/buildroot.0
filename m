From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 22:16:36 +0200
Subject: [Buildroot] [git commit] support/testing: don't use
 TestPythonPackageBase.config and linaro toolchain
Message-ID: <20200406200249.706657FE6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e217262a868cf994e6a10ca782dfac9057ff89c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TestPythonPackageBase.config provide already the basic uClibc toolchain.
So by adding the symbols for the linaro toolchain some warning are printed
at while loading the configuration:

.config:16:warning: override: reassigning to symbol BR2_TOOLCHAIN_EXTERNAL
.config:16:warning: override: BR2_TOOLCHAIN_EXTERNAL changes choice state
.config:17:warning: override: reassigning to symbol BR2_TARGET_ROOTFS_CPIO
.config:21:warning: override: BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM changes choice state

So, some symbol disapear from the generated dot config (.config) leading
to an error due to a new check in the testsuite infra.

Since this test should use the Linaro toolchain, remove
TestPythonPackageBase.config add BR2_arm=y and disable the rootfs tar option.

While at it, re-order the options so that they appear in the same
order as they appear in a defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <Aduskett@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_gst1_python.py | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
index c6b337dd04..caae3e6b2d 100644
--- a/support/testing/tests/package/test_gst1_python.py
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -4,23 +4,21 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestGst1Python(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    config = \
         """
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_arm=y
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
-        BR2_ARM_EABIHF=y
+        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
-        BR2_PACKAGE_GOBJECT_INTROSPECTION=y
         BR2_PACKAGE_GSTREAMER1=y
-        BR2_PACKAGE_GST1_PLUGINS_BASE=y
-        BR2_PACKAGE_GST1_PLUGINS_BAD=y
         BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
+        BR2_PACKAGE_GST1_PLUGINS_BAD=y
         BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS=y
         BR2_PACKAGE_GST1_PYTHON=y
         BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_GOBJECT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
         """
 
     def login(self):

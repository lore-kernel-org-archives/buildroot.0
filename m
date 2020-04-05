From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Apr 2020 01:04:13 +0200
Subject: [Buildroot] [PATCH 6/7] support/testing: don't use
 TestPythonPackageBase.config and linaro toolchain
In-Reply-To: <20200405230414.416403-1-romain.naour@gmail.com>
References: <20200405230414.416403-1-romain.naour@gmail.com>
Message-ID: <20200405230414.416403-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <Aduskett@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_gst1_python.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
index c6b337dd04..10d7907f8d 100644
--- a/support/testing/tests/package/test_gst1_python.py
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -4,10 +4,12 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestGst1Python(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    config = \
         """
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_arm=y
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_ARM_EABIHF=y
-- 
2.25.1

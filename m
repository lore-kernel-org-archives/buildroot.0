From: Romain Naour <romain.naour@smile.fr>
Date: Thu,  1 Aug 2019 23:09:20 +0200
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-numpy tests
In-Reply-To: <20190801210920.31338-1-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
Message-ID: <20190801210920.31338-5-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit add 3 runtime tests for python-numpy.

The current state of python-numpy is not good since several
runtime issue has been discovered while working on new python
packages that are based on it.

First, we have a runtime issue while testing python-numpy with clapack option enabled:
(glibc toolchain)

python code:
import numpy as np
list = [1,2,3,4]
arr = np.array(list)
print arr

python Error:
ImportError: /usr/lib/python3.7/site-packages/numpy/core/_multiarray_umath.cpython-37m-arm-linux-gnueabi.so: undefined symbol: cblas_sgemm

Since python-numpy is not covered by the Buildroot testing infrastructure, so we add 3
runtime tests for the following cases:
 - Without Lapack support
 - With Clapack
 - With Lapack

We have to use an external toolchain based on glibc since the uClibc-ng support
of python-numpy has been removed due to the following runtime issue:

python Error:
code object from '/usr/lib/python3.7/site-packages/numpy/core/overrides.pyc'
/usr/bin/python3.7: symbol 'npy_clear_floatstatus_barrier': can't resolve symbol
/usr/bin/python3.7: symbol 'npy_get_floatstatus_barrier': can't resolve symbol

This issue is only present on uClibc-ng system (tested on arm and aarch64).

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../tests/package/sample_python_numpy.py      |  5 +
 .../tests/package/test_python_numpy.py        | 91 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_numpy.py
 create mode 100644 support/testing/tests/package/test_python_numpy.py

diff --git a/support/testing/tests/package/sample_python_numpy.py b/support/testing/tests/package/sample_python_numpy.py
new file mode 100644
index 0000000000..8e8d36ea4c
--- /dev/null
+++ b/support/testing/tests/package/sample_python_numpy.py
@@ -0,0 +1,5 @@
+# From https://www.tutorialspoint.com/scipy/scipy_basic_functionality.htm
+import numpy as np
+list = [1,2,3,4]
+arr = np.array(list)
+print (arr)
diff --git a/support/testing/tests/package/test_python_numpy.py b/support/testing/tests/package/test_python_numpy.py
new file mode 100644
index 0000000000..2b6999cd1a
--- /dev/null
+++ b/support/testing/tests/package/test_python_numpy.py
@@ -0,0 +1,91 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+class TestPythonNumpyArmCortexA9(TestPythonPackageBase):
+    sample_scripts = ["tests/package/sample_python_numpy.py"]
+    timeout = 30
+
+    def login(self):
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "zImage")
+        dtb = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+
+        self.emulator.boot(arch="armv7",
+                        kernel=kern,
+                        kernel_cmdline=["console=ttyAMA0,115200 rootwait root=/dev/mmcblk0"],
+                        options=["-dtb" , dtb, "-M", "vexpress-a9", "-drive", "file={},if=sd,format=raw".format(ext2_file)])
+        self.emulator.login()
+
+# Test with Glibc and Numpy
+class TestPythonPy3GlibcNumpy(TestPythonNumpyArmCortexA9):
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_ARM_FPU_VFPV3D16=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_NUMPY=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+# Test with Glibc and Numpy + clapack
+class TestPythonPy3GlibcNumpyWithClapack(TestPythonNumpyArmCortexA9):
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_ARM_FPU_VFPV3D16=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_NUMPY=y
+        BR2_PACKAGE_LIBLAPACK=y
+        BR2_PACKAGE_CLAPACK=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+# Test with Glibc and Numpy + lapack
+class TestPythonPy3GlibcNumpyWithLapack(TestPythonNumpyArmCortexA9):
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_ARM_FPU_VFPV3D16=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_NUMPY=y
+        BR2_PACKAGE_LIBLAPACK=y
+        BR2_PACKAGE_LAPACK=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
-- 
2.20.1

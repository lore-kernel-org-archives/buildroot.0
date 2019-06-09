From: Romain Naour <romain.naour@smile.fr>
Date: Sun,  9 Jun 2019 23:33:17 +0200
Subject: [Buildroot] [PATCH] support/testing: add python-numpy tests
Message-ID: <20190609213317.16444-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit add 4 runtime tests for python-numpy.

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

Since python-numpy is not covered by the Buildroot testing infrastructure, two
runtime test are initially added for python-numpy for python2 and python3.
But the default system use a uClibc-ng toolchain and there is a new runtime issue:

python Error:
code object from '/usr/lib/python3.7/site-packages/numpy/core/overrides.pyc'
/usr/bin/python3.7: symbol 'npy_clear_floatstatus_barrier': can't resolve symbol
/usr/bin/python3.7: symbol 'npy_get_floatstatus_barrier': can't resolve symbol

This issue seems to be only present on uClibc-ng system (tested on arm and aarch64 with glibc or musl).
This may due to some feature depending on __GLIBC__ and glibc >= 2.18.

So, two additional test based on Glibc are added.

The two first test based on uClibc-ng fail with the same error above.
The third test is working since it's based on Glibc toolchain with python-numpy without clapack support.
The last test fail since the python-numpy's clapack support is enabled.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../tests/package/sample_python_numpy.py      |   5 +
 .../tests/package/test_python_numpy.py        | 112 ++++++++++++++++++
 2 files changed, 117 insertions(+)
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
index 0000000000..64d59cc702
--- /dev/null
+++ b/support/testing/tests/package/test_python_numpy.py
@@ -0,0 +1,112 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+# Test with uClibc-ng
+class TestPythonPy2uClibcNumpy(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_INCREMENTAL=y
+        """
+    sample_scripts = ["tests/package/sample_python_numpy.py"]
+    timeout = 30
+
+# Test with uClibc-ng
+class TestPythonPy3uClibcNumpy(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_NUMPY=y
+        """
+    sample_scripts = ["tests/package/sample_python_numpy.py"]
+    timeout = 30
+
+class TestPythonNumpy(TestPythonPackageBase):
+    sample_scripts = ["tests/package/sample_python_numpy.py"]
+    timeout = 30
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "zImage")
+        dtb = os.path.join(self.builddir, "images", "versatile-pb.dtb")
+
+        self.emulator.boot(arch="armv5",
+                        kernel=kern,
+                        options=["-append","console=ttyAMA0","-dtb" , dtb, "-initrd", cpio_file, "-M", "versatilepb"])
+        self.emulator.login()
+
+# Test with Glibc and Numpy
+class TestPythonPy3GlibcNumpy(TestPythonNumpy):
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_arm926t=y
+        BR2_ARM_CPU_ARMV5=y
+        BR2_ARM_EABI=y
+        BR2_ARM_SOFT_FLOAT=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2018.11-1.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
+        # BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
+        BR2_TOOLCHAIN_EXTERNAL_HAS_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_NUMPY=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+# Test with Glibc and Numpy + Clapack
+class TestPythonPy3GlibcNumpyWithClapack(TestPythonNumpy):
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_arm926t=y
+        BR2_ARM_CPU_ARMV5=y
+        BR2_ARM_EABI=y
+        BR2_ARM_SOFT_FLOAT=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2018.11-1.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
+        # BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
+        BR2_TOOLCHAIN_EXTERNAL_HAS_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_NUMPY=y
+        BR2_PACKAGE_CLAPACK=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
-- 
2.20.1

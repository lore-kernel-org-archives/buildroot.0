From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 15 Sep 2017 13:58:16 +0300
Subject: [Buildroot] [PATCH] python-numpy: Add support of ARC architecture
Message-ID: <20170915105816.30856-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables support for ARC cores in numpy.
Patch for Numpy is awaiting review in upstream here:
https://github.com/numpy/numpy/pull/9692.

Note this patch has a prerequisite http://patchwork.ozlabs.org/patch/814209/
which upgrades python-numpy to the latest release 1.13.1.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/python-numpy/0002-Add-support-of-ARC.patch | 66 ++++++++++++++++++++++
 package/python-numpy/Config.in                     |  2 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 package/python-numpy/0002-Add-support-of-ARC.patch

diff --git a/package/python-numpy/0002-Add-support-of-ARC.patch b/package/python-numpy/0002-Add-support-of-ARC.patch
new file mode 100644
index 0000000000..36e6ff2511
--- /dev/null
+++ b/package/python-numpy/0002-Add-support-of-ARC.patch
@@ -0,0 +1,66 @@
+From 9a225e7d4fb1de5c99c6b5b17cae2fc4c2d1c59a Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Fri, 15 Sep 2017 11:59:14 +0300
+Subject: [PATCH 2/2] Add support of ARC
+
+Synopsys DesignWare ARC Processors are a family of 32-bit CPUs
+which in some configurations may run Linux kernel and full stack
+of applications on top of it. Among other things is Python.
+
+With that change we allow building and usage of Numpy on ARC.
+---
+ numpy/core/include/numpy/npy_cpu.h    | 6 ++++++
+ numpy/core/include/numpy/npy_endian.h | 6 ++++--
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
+index 60abae4e0b0e..84653ea183ce 100644
+--- a/numpy/core/include/numpy/npy_cpu.h
++++ b/numpy/core/include/numpy/npy_cpu.h
+@@ -15,6 +15,8 @@
+  *              NPY_CPU_ARMEB
+  *              NPY_CPU_SH_LE
+  *              NPY_CPU_SH_BE
++ *              NPY_CPU_ARCEL
++ *              NPY_CPU_ARCEB
+  */
+ #ifndef _NPY_CPUARCH_H_
+ #define _NPY_CPUARCH_H_
+@@ -76,6 +78,10 @@
+     #define NPY_CPU_AARCH64
+ #elif defined(__mc68000__)
+     #define NPY_CPU_M68K
++#elif defined(__arc__) && defined(__LITTLE_ENDIAN__)
++    #define NPY_CPU_ARCEL
++#elif defined(__arc__) && defined(__BIG_ENDIAN__)
++    #define NPY_CPU_ARCEB
+ #else
+     #error Unknown CPU, please report this to numpy maintainers with \
+     information about your platform (OS, CPU and compiler)
+diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
+index e34b1d97e655..1a42121db92e 100644
+--- a/numpy/core/include/numpy/npy_endian.h
++++ b/numpy/core/include/numpy/npy_endian.h
+@@ -45,7 +45,8 @@
+             || defined(NPY_CPU_AARCH64) \
+             || defined(NPY_CPU_SH_LE)   \
+             || defined(NPY_CPU_MIPSEL)  \
+-            || defined(NPY_CPU_PPC64LE)
++            || defined(NPY_CPU_PPC64LE) \
++            || defined(NPY_CPU_ARCEL)
+         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
+     #elif defined(NPY_CPU_PPC)          \
+             || defined(NPY_CPU_SPARC)   \
+@@ -56,7 +57,8 @@
+             || defined(NPY_CPU_SH_BE)   \
+             || defined(NPY_CPU_MIPSEB)  \
+             || defined(NPY_CPU_OR1K)    \
+-            || defined(NPY_CPU_M68K)
++            || defined(NPY_CPU_M68K)    \
++            || defined(NPY_CPU_ARCEB)
+         #define NPY_BYTE_ORDER NPY_BIG_ENDIAN
+     #else
+         #error Unknown CPU: can not set endianness
+-- 
+2.7.5
+
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index f7822efc79..a10e73388c 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	# Numpy has some CPU specific code
 	default y if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
-		|| BR2_sh || BR2_x86_64
+		|| BR2_sh || BR2_x86_64 || BR2_arc
 
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
-- 
2.11.0

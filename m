From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu,  3 Sep 2015 15:13:15 +0200
Subject: [Buildroot] [PATCH v2 1/2] python-numpy: introduce ARCH_SUPPORTS
	hidden variable
Message-ID: <1441285996-29463-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Python-numpy has specific constraints about uClibc and arch. This patch add an
BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS hidden variable to avoid duplicate
dependencies test for others packages which uses numpy.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-numpy/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 1f9938a..4c02ea6 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,12 +1,16 @@
+config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	bool
+	# numpy needs fenv.h. Available for all architectures in
+	# glibc, but only for x86 and x86-64 in uClibc.
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
 	# Numpy has some CPU specific code
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
 		|| BR2_sh || BR2_x86_64
-	# numpy needs fenv.h. Available for all architectures in
-	# glibc, but only for x86 and x86-64 in uClibc.
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
-- 
2.4.6

From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 23:00:00 +0100
Subject: [Buildroot] [PATCH 07/11] python-numpy: new package
In-Reply-To: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392588004-13317-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add NumPy package for python.

Since Fortran support has been deprecated in Buildroot since the 2013.11
release, and because most of the external toolchains do not provide a
Fortran compiler, it is necessary to explicity disable Fortran compiler
to avoid catching the one from the host system if any.

We also need to fill a site.cfg file to tell NumPy build-system where
it should looking for BLAS and LAPACK libraries.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-numpy/Config.in       | 14 ++++++++++++++
 package/python-numpy/python-numpy.mk | 31 +++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 package/python-numpy/Config.in
 create mode 100644 package/python-numpy/python-numpy.mk

diff --git a/package/Config.in b/package/Config.in
index 5c3226e..15460a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -427,6 +427,7 @@ source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
+source "package/python-numpy/Config.in"
 source "package/python-posix-ipc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pyasn/Config.in"
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
new file mode 100644
index 0000000..52d8da9
--- /dev/null
+++ b/package/python-numpy/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_NUMPY
+	bool "python-numpy"
+	help
+	  NumPy is the fundamental package for scientific computing with Python.
+
+	  Note that NumPy needs fenv.h fully supported by the C-library.
+
+	  http://www.numpy.org/
+
+if BR2_PACKAGE_PYTHON_NUMPY
+config BR2_PACKAGE_PYTHON_NUMPY_BLAS_LAPACK_SUPPORT
+	bool "blas/lapack support"
+	select BR2_PACKAGE_CLAPACK
+endif
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
new file mode 100644
index 0000000..c082045
--- /dev/null
+++ b/package/python-numpy/python-numpy.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# python-numpy
+#
+################################################################################
+
+PYTHON_NUMPY_VERSION = 1.8.0
+PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
+PYTHON_NUMPY_SITE = http://downloads.sourceforge.net/numpy
+PYTHON_NUMPY_LICENSE = BSD-3c
+PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
+PYTHON_NUMPY_SETUP_TYPE = distutils
+PYTHON_NUMPY_DEPENDENCIES = \
+	$(if BR2_PACKAGE_PYTHON_NUMPY_BLAS_LAPACK_SUPPORT,clapack)
+
+PYTHON_NUMPY_SITE_CFG_LIBS = \
+	$(if $(BR2_PACKAGE_PYTHON_NUMPY_BLAS_LAPACK_SUPPORT),blas lapack)
+
+PYTHON_NUMPY_BUILD_OPT = --fcompiler=None
+
+define PYTHON_NUMPY_CONFIGURE_CMDS
+	-rm -f $(@D)/site.cfg
+	echo "[DEFAULT]" >> $(@D)/site.cfg
+	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
+	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
+	echo "libraries =" >> $(@D)/site.cfg
+	$(foreach lib,$(PYTHON_NUMPY_SITE_CFG_LIBS),\
+		echo "    $(lib)" >> $(@D)/site.cfg ;)
+endef
+
+$(eval $(python-package))
-- 
1.8.5.4

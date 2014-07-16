From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:27:34 +0200
Subject: [Buildroot] [git commit] python-numpy: new package
Message-ID: <20140716202917.85C8E9D25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6777348f340b5340f6499534e568653f4b68c1c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add NumPy package for python.

Since Fortran support has been deprecated in Buildroot since the 2013.11
release, and because most of the external toolchains do not provide a
Fortran compiler, it is necessary to explicity disable Fortran compiler
to avoid catching the one from the host system if any.

We also need to fill a site.cfg file to tell NumPy build-system where
it should looking for BLAS and LAPACK libraries.

Some packages may include headers provided by python-numpy package, so
python-numpy is installed to the staging directory.

[Thomas:
 - add dependency in Config.in to take into account fenv.h
   requirement, suggested by Yann E. Morin.
 - modified to use the staging installation logic in the python
   package infrastructure.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/python-numpy/Config.in       |   13 +++++++++++++
 package/python-numpy/python-numpy.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2196783..4b7ccd9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -472,6 +472,7 @@ menu "external python modules"
 	source "package/python-msgpack/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-nfc/Config.in"
+	source "package/python-numpy/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-pyasn/Config.in"
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
new file mode 100644
index 0000000..169b91f
--- /dev/null
+++ b/package/python-numpy/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_NUMPY
+	bool "python-numpy"
+	# numpy needs fenv.h. Available for all architectures in
+	# glibc, but only for x86 and x86-64 in uClibc.
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64
+	help
+	  NumPy is the fundamental package for scientific computing
+	  with Python.
+
+	  Note that NumPy needs fenv.h fully supported by the
+	  C library.
+
+	  http://www.numpy.org/
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
new file mode 100644
index 0000000..e309ef6
--- /dev/null
+++ b/package/python-numpy/python-numpy.mk
@@ -0,0 +1,28 @@
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
+
+PYTHON_NUMPY_BUILD_OPT = --fcompiler=None
+
+define PYTHON_NUMPY_CONFIGURE_CMDS
+	-rm -f $(@D)/site.cfg
+	echo "[DEFAULT]" >> $(@D)/site.cfg
+	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
+	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
+	echo "libraries =" >> $(@D)/site.cfg
+endef
+
+# Some package may include few headers from NumPy, so let's install it
+# in the staging area.
+PYTHON_NUMPY_INSTALL_STAGING = YES
+
+$(eval $(python-package))

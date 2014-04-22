From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:37 +0200
Subject: [Buildroot] [PATCH v2 05/24] python-numpy: new package
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-6-git-send-email-s.martin49@gmail.com>
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

Some packages may include headers provided by python-numpy package.
Thus, python-numpy needs to be installed in the sysroot; so add and
enable its install-staging command.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
- automatic support of blas/lapack when clapack is enabled (ThomasP)
- split blas/lapack support in its own cset (ThomasP)
- merge python-numpy staging install cset within the python-numpy
  package integration (ThomasP)
---
 package/Config.in                    |  1 +
 package/python-numpy/Config.in       |  8 +++++++
 package/python-numpy/python-numpy.mk | 41 ++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 package/python-numpy/Config.in
 create mode 100644 package/python-numpy/python-numpy.mk

diff --git a/package/Config.in b/package/Config.in
index 9c91844..7d8ca95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -455,6 +455,7 @@ source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
+source "package/python-numpy/Config.in"
 source "package/python-posix-ipc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pyasn/Config.in"
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
new file mode 100644
index 0000000..c80e5c4
--- /dev/null
+++ b/package/python-numpy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_NUMPY
+	bool "python-numpy"
+	help
+	  NumPy is the fundamental package for scientific computing with Python.
+
+	  Note that NumPy needs fenv.h fully supported by the C-library.
+
+	  http://www.numpy.org/
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
new file mode 100644
index 0000000..e7c91c4
--- /dev/null
+++ b/package/python-numpy/python-numpy.mk
@@ -0,0 +1,41 @@
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
+# Some package may include few headers from NumPy, so let's install it in the
+# staging area.
+PYTHON_NUMPY_INSTALL_STAGING = YES
+
+# This install staging commands is an adjusted and simplified version of the
+# install target commands vampirized from the python-package infrastructure.
+#
+# Note that the append '--prefix=...' parameter overrides the one set by the
+# python-package infrastructure in the PYTHON_NUMPY_INSTALL_OPT variable.
+define PYTHON_NUMPY_INSTALL_STAGING_CMDS
+	(cd $(PYTHON_NUMPY_BUILDDIR)/; \
+		$(PYTHON_NUMPY_BASE_ENV) $(PYTHON_NUMPY_ENV) \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		$(PYTHON_NUMPY_BASE_INSTALL_OPT) \
+		$(PYTHON_NUMPY_INSTALL_OPT) --prefix=$(STAGING_DIR)/usr)
+endef
+
+$(eval $(python-package))
-- 
1.9.2

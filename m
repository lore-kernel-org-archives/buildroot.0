From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Fri, 19 Jun 2020 08:45:00 +0200
Subject: [Buildroot] [PATCH 3/3] python-scipy: new package
In-Reply-To: <20200619064501.11113-1-guillaume.bressaix@gmail.com>
References: <20200619064501.11113-1-guillaume.bressaix@gmail.com>
Message-ID: <20200619064501.11113-3-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch serie to add python-scipy

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---

Things to note about this package:

	+ python-numpy is the main dependency and is required
	at build time. I followed what is done in matplotlib
	for dependencies & selection methods

	+ the two previous commits are mandatory

	+ unlike python-numpy, gfortran is not an option,
	hence the dependency

	+ there is no need to modify current python-numpy.mk
	for this package to build & run fine

	+ like in python-numpy.mk, I use the "site.cfg"
	trick, to locate dependencies (it does not build without it)

	+ unlike python-numpy, openblas & claplack libs
	are not optionnal, they are a requirement

	+ more useful info here
	https://docs.scipy.org/doc/scipy/reference/building/linux.html

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-scipy/Config.in         | 24 +++++++++++++++++++
 package/python-scipy/python-scipy.hash |  4 ++++
 package/python-scipy/python-scipy.mk   | 33 ++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a94307082..2f44bbd117 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1053,6 +1053,7 @@ N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
+F:	package/python-scipy/
 F:	package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
diff --git a/package/Config.in b/package/Config.in
index b0a7da2f5c..394f32a647 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1131,6 +1131,7 @@ menu "External python modules"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
+	source "package/python-scipy/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
new file mode 100644
index 0000000000..a9d9fa181e
--- /dev/null
+++ b/package/python-scipy/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_PYTHON_SCIPY
+	bool "python-scipy"
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # build
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	select BR2_PACKAGE_OPENBLAS # build
+	select BR2_PACKAGE_CLAPACK # build
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	help
+	  Scipy is a Python package that includes modules for
+	  statistics, optimization, linear algebra and much
+	  more.
+
+	  http://www.scipy.org/
+
+comment "python-scipy needs toolchain with fortran"
+	  depends on !BR2_TOOLCHAIN_HAS_FORTRAN
+
+comment "python-scipy needs lib openblas"
+	  depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+
+comment "python-scipy needs python-numpy"
+	depends on !BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
new file mode 100644
index 0000000000..0ae10a28f3
--- /dev/null
+++ b/package/python-scipy/python-scipy.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  fd8c7b907c3fc4df1830cdce1608057248deb30afa34ac4f8f31c3784b3e4e53   v1.4.1.tar.gz
+# License files, locally calculated
+sha256  0615c3b553439d39155885fedd7078a923974e84330f8d5d7660074e7c8826a3	LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
new file mode 100644
index 0000000000..ab94cab07b
--- /dev/null
+++ b/package/python-scipy/python-scipy.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# python-scipy
+#
+################################################################################
+
+PYTHON_SCIPY_VERSION = 1.4.1
+PYTHON_SCIPY_SOURCE = v$(PYTHON_SCIPY_VERSION).tar.gz
+PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/archive
+PYTHON_SCIPY_LICENSE = BSD-3-Clause
+PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
+			doc/scipy-sphinx-theme/LICENSE.txt
+PYTHON_SCIPY_SETUP_TYPE = setuptools
+PYTHON_SCIPY_DEPENDENCIES = host-python-cython host-python-pip \
+			host-python-numpy host-python-pybind
+
+PYTHON_SCIPY_ENV = ATLAS=none
+PYTHON_SCIPY_ENV += LDSHARED="$(TARGET_CROSS)gcc"
+PYTHON_SCIPY_ENV += LDFLAGS="$(TARGET_LDFLAGS) -shared \
+			-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/lib"
+
+# must be used to locate 'gfortran'
+PYTHON_SCIPY_ENV += F90="$(TARGET_FC)"
+
+# trick to locate 'lapack' and 'blas'
+define PYTHON_SCIPY_CONFIGURE_CMDS
+	rm -f $(@D)/site.cfg
+	echo "[DEFAULT]" >> $(@D)/site.cfg
+	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
+	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
+endef
+
+$(eval $(python-package))
-- 
2.20.1

From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue,  7 Apr 2020 16:45:15 +0530
Subject: [Buildroot] [PATCH v8 5/5] package/python-scipy: new package
In-Reply-To: <20200407111515.21131-1-jagan@amarulasolutions.com>
References: <20200407111515.21131-1-jagan@amarulasolutions.com>
Message-ID: <20200407111515.21131-6-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add python-scipy with 1.4.1 release version.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v8:
- none
Changes for v7:
- update the commit message
- fix sha256 value of pybind11 LICENCE

 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-scipy/Config.in         | 22 ++++++++++++
 package/python-scipy/python-scipy.hash |  9 +++++
 package/python-scipy/python-scipy.mk   | 46 ++++++++++++++++++++++++++
 5 files changed, 79 insertions(+)
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f06d54a662..3203b0bc47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1154,6 +1154,7 @@ F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 F:	package/python-pybind11
+F:	package/python-scipy
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/gensio/
diff --git a/package/Config.in b/package/Config.in
index afe32f52b4..f5af9b07ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1120,6 +1120,7 @@ menu "External python modules"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
+	source "package/python-scipy/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
new file mode 100644
index 0000000000..4d8227c31a
--- /dev/null
+++ b/package/python-scipy/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PYTHON_SCIPY
+	bool "python-scipy"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_NUMPY
+	select BR2_PACKAGE_LAPACK
+	select BR2_PACKAGE_OPENBLAS
+	help
+	  The SciPy library is one of the core packages that make up the SciPy
+	  stack. It provides many user-friendly and efficient numerical
+	  routines such as routines for numerical integration, interpolation,
+	  optimization, linear algebra and statistics.
+
+	  https://www.scipy.org/scipylib/
+
+comment "python-scipy needs toolchain w/ fortran and c++ and glibc or musl"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
+		!BR2_TOOLCHAIN_BUILDROOT_CXX || \
+		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
new file mode 100644
index 0000000000..c9d295ef6b
--- /dev/null
+++ b/package/python-scipy/python-scipy.hash
@@ -0,0 +1,9 @@
+# Locally generated
+sha256 dee1bbf3a6c8f73b6b218cb28eed8dd13347ea2f87d572ce19b289d6fd3fbc59  scipy-1.4.1.tar.gz
+sha256 5cbdbe33385779958be8b9310497e32d2eec144d82ef425780d3e19f8af6de76  LICENSE.txt
+sha256 37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
+sha256 606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
+sha256 3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
+sha256 f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/dsolve/SuperLU/License.txt
+sha256 0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING
+sha256 34db0c0c4f931861d720555c9cd7a2e228d1290ba29af0f2ee80c41bb2038afb  scipy/spatial/qhull_src/COPYING.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
new file mode 100644
index 0000000000..1d66b146ec
--- /dev/null
+++ b/package/python-scipy/python-scipy.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# python-scipy
+#
+################################################################################
+
+PYTHON_SCIPY_VERSION = 1.4.1
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
+PYTHON_SCIPY_SITE = https://pypi.python.org/packages/04/ab/e2eb3e3f90b9363040a3d885ccc5c79fe20c5b8a3caa8fe3bf47ff653260
+PYTHON_SCIPY_LICENSE = BSD-3-Clause, BSD-2-Clause, BSD, BSD-Style, \
+	Apache-2.0, MIT
+PYTHON_SCIPY_LICENSE_FILES = \
+	LICENSE.txt \
+	scipy/linalg/src/lapack_deprecations/LICENSE \
+	scipy/ndimage/LICENSE.txt \
+	scipy/optimize/tnc/LICENSE \
+	scipy/sparse/linalg/dsolve/SuperLU/License.txt \
+	scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING \
+	scipy/spatial/qhull_src/COPYING.txt
+PYTHON_SCIPY_SETUP_TYPE = setuptools
+PYTHON_SCIPY_DEPENDENCIES += \
+	host-python-numpy \
+	host-python-pybind11 \
+	lapack \
+	openblas \
+	python-numpy
+
+PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
+PYTHON_SCIPY_ENV += F90=$(TARGET_CROSS)gfortran F77=$(TARGET_CROSS)gfortran
+
+# Provide system configuration options to numpy distutils extenions, telling
+# to find all include files and libraries in staging directory.
+define PYTHON_SCIPY_CONFIGURE_CMDS
+	-rm -f $(@D)/site.cfg
+	echo "[DEFAULT]" >> $(@D)/site.cfg
+	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
+	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
+endef
+
+# Use the target numpy pkg-config configuration files modified for target
+# cross-compilation.  Without this, numpy distutils will cause the linker to
+# link with host libnpymath.a.
+PYTHON_SCIPY_ENV += NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)
+PYTHON_SCIPY_INSTALL_STAGING = YES
+
+$(eval $(python-package))
-- 
2.17.1

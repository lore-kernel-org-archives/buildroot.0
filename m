From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 27 Jun 2020 13:44:03 +0200
Subject: [Buildroot] [PATCH 3/3] package/python-scipy: new package
In-Reply-To: <20200627114403.25017-1-guillaume.bressaix@gmail.com>
References: <20200627114403.25017-1-guillaume.bressaix@gmail.com>
Message-ID: <20200627114403.25017-3-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Scipy is a powerful python library built on top
of Numpy, for statictics, equations solving &
system optimization.

depends on BR2_TOOLCHAIN_HAS_FORTRAN:
unlike python-numpy, this is not an option.
Unfortunately we also must pass
'F90=$(TARGET_FC)' to configure step, for gfortran
to be known (see down below for precise error messages).
python-numpy disregards BR2_TOOLCHAIN_HAS_FORTRAN,
I can confirm scipy does not require numpy
to be compiled using gfortran to work properly.

depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS:
I followed what is done in python-matplolib
for this topic, I should be close what you expect.

select BR2_PACKAGE_CLAPACK + OPENBLAS
Unlike python-numpy, these libraries
are not an option.

PYTHON_SCIPY_DEPENDENCIES: current ordering
will have numpy use clapack & openblas,
but I can confirm it does not matter to have
numpy use these libraries for scipy to work fine.

PYTHON_SCIPY_DEPENDENCIES += clapack & openblas
is not enough. In this setup, 'configure'
fails when searching for those packages.
See down below for exact error message.
The only way I found to pass this step
is to customize the 'site.cfg' file, like it
is done in python-numpy.mk for instance.

Technicallly, host-python-cython is also a requirement
(see setup.py). But it is in host-python-numpy
list of requirement. Therefore
!! I did not put it in PYTHON_SCIPY_DEPENDECIES !!
please correct me on this

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---

All my tests were made using the current
raspberrypi3 & raspberrypi0w defconfig environments.

I am not able to use the ./util-test-pkg against
a python-numpy requirement, maybe I'm missing something here,
i would have liked to test this against several glibc/musl toolchains.

This is what we get if F90=$(TARGET_FC) is not passed
to configure: build fails half way through, even though
gfortran does exists, it's not able to find it:

building 'mach' library
error: library mach has Fortran sources but no Fortran compiler found

This is what we get if we remove the 'site.cfg' customization,
that is, even though clapack & blas have already been installed,
setup.py is not able to locate them.

numpy.distutils.system_info.NotFoundError: No lapack/blas resources found.

This is the linker error message we get if we remove
the extra linker flag pointing to numpy staging dir:

[..]/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.4.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
[..]/buildroot/output/host/lib/python3.8/site-packages/numpy/core/lib/libnpymath.a: error
adding symbols: file format not recognized
collect2: error: ld returned 1 exit status
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-scipy/Config.in         | 24 ++++++++++++++++++++
 package/python-scipy/python-scipy.hash |  4 ++++
 package/python-scipy/python-scipy.mk   | 31 ++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4b6a346a05..c26cb813e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1058,6 +1058,7 @@ F:	package/libnids/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
+F:	package/python-scipy/
 F:	package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
diff --git a/package/Config.in b/package/Config.in
index 6a34a895af..1bb2876867 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1134,6 +1134,7 @@ menu "External python modules"
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
index 0000000000..22075fb85e
--- /dev/null
+++ b/package/python-scipy/python-scipy.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256 fd8c7b907c3fc4df1830cdce1608057248deb30afa34ac4f8f31c3784b3e4e53  v1.4.1.tar.gz
+# License files, locally calculated
+sha256 0615c3b553439d39155885fedd7078a923974e84330f8d5d7660074e7c8826a3  LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
new file mode 100644
index 0000000000..46de1993a8
--- /dev/null
+++ b/package/python-scipy/python-scipy.mk
@@ -0,0 +1,31 @@
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
+PYTHON_SCIPY_DEPENDENCIES = clapack openblas host-python-numpy \
+			host-python-pip host-python-pybind
+
+PYTHON_SCIPY_ENV += LDFLAGS="$(TARGET_LDFLAGS) -shared \
+			-L$(PYTHON3_PATH)/site-packages/numpy/core/lib"
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

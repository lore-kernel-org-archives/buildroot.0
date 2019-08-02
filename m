From: Aalx <alexandre.payen@smile.fr>
Date: Fri,  2 Aug 2019 14:14:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-scipy: new package
Message-ID: <20190802121458.17305-1-alexandre.payen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

Python building set -shared in LDSHARED option but python-numpy distutils
use this as a file and then generate an error (file not found).
The path is not exact too. It should link to target site-packages and not host.
An other error occur when building, the build mechanism will search for a binary
named gfortran, it is badly prefixed so the build configuration need to be
modify in order to get the proper binary name.
Since Version 1.3.0 python-numpy does not support python2 anymore
Source : https://github.com/scipy/scipy/releases/tag/v1.3.0

python-scipy doesn't build when using clapack as lapack provider.
In the configure step python-scipy is looking for cblas.h which is
not provided by clapack.

So :
- Moving -shared in LDFLAG option to avoid `file not found`
- Editing the path to get the target site-packages
- Editing python-scipy.mk to add the correct binary name.
- Allow only lapack as liblapack provider.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
---
 package/Config.in                      |  1 +
 package/python-scipy/Config.in         | 22 ++++++++++++++++++
 package/python-scipy/python-scipy.hash |  4 ++++
 package/python-scipy/python-scipy.mk   | 32 ++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk

diff --git a/package/Config.in b/package/Config.in
index 5f408f4de9..68905849dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1047,6 +1047,7 @@ menu "External python modules"
 	source "package/python-scapy/Config.in"
 	source "package/python-scapy3k/Config.in"
 	source "package/python-schedule/Config.in"
+	source "package/python-scipy/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
new file mode 100644
index 0000000000..ef35cd138d
--- /dev/null
+++ b/package/python-scipy/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PYTHON_SCIPY
+	bool "python-scipy"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
+	select BR2_PACKAGE_LIBLAPACK
+	select BR2_PACKAGE_LIBLAPACK_FORCE_LAPACK
+	select BR2_PACKAGE_LAPACK_COMPLEX
+	select BR2_PACKAGE_PYTHON_NUMPY
+	help
+	  SciPy (pronounced "Sigh Pie") is open-source software for
+	  mathematics, science, and engineering. It includes modules
+	  for statistics, optimization, integration, linear algebra,
+	  Fourier transforms, signal and image processing, ODE solvers,
+	  and more.
+
+	  http://www.scipy.org/
+
+comment "python-scipy needs lapack, gfortran"
+	depends on !BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_PACKAGE_LAPACK_COMPLEX
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
new file mode 100644
index 0000000000..3db1ac2346
--- /dev/null
+++ b/package/python-scipy/python-scipy.hash
@@ -0,0 +1,4 @@
+# sha256 locally calculated
+sha256  c3bb4bd2aca82fb498247deeac12265921fe231502a6bc6edea3ee7fe6c40a7a  scipy-1.3.0.tar.gz
+# License files, locally calculated
+sha256  904942f7df1dc0f4a48af8d72405854fd96497bd1fe9ddb2c69d1797c22dfcd7  LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
new file mode 100644
index 0000000000..793545ded0
--- /dev/null
+++ b/package/python-scipy/python-scipy.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# python-scipy
+#
+################################################################################
+
+PYTHON_SCIPY_VERSION = 1.3.0
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/cb/97/361c8c6ceb3eb765371a702ea873ff2fe112fa40073e7d2b8199db8eb56e
+PYTHON_SCIPY_SETUP_TYPE = setuptools
+PYTHON_SCIPY_LICENSE = BSD-3c
+PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt
+PYTHON_SCIPY_INSTALL_STAGING = YES
+
+PYTHON_SCIPY_DEPENDENCIES = host-python-numpy python-numpy liblapack
+
+# python-scipy needs lapack sources to build.
+PYTHON_SCIPY_ENV = \
+	LDSHARED="$(TARGET_CROSS)gcc" \
+	F70="$(TARGET_FC)" \
+	F90="$(TARGET_FC)" \
+	FC="$(TARGET_FC)" \
+	LAPACK_SRC=$(LAPACK_DIR) \
+	BLAS_SRC=$(LAPACK_DIR) \
+	LAPACK=$(STAGING_DIR)/usr/lib \
+	BLAS=$(STAGING_DIR)/usr/lib \
+	ATLAS=none \
+	LDFLAGS="$(TARGET_LDFLAGS) -shared -L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/lib"
+
+PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
+
+$(eval $(python-package))
-- 
2.21.0

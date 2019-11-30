From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 16:12:05 -0800
Subject: [Buildroot] [PATCH/next 1/2] package/python-pybind11: new package
Message-ID: <20191130001206.2962387-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

pybind11 is a lightweight header-only library that exposes C++ types in Python
and vice versa, mainly to create Python bindings of existing C++ code. Its goals
and syntax are similar to the excellent Boost.Python library by David
Abrahams:
To minimize boilerplate code in traditional extension modules by inferring type
information using compile-time introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-pybind11/Config.in            | 23 ++++++++++++++++++++
 package/python-pybind11/python-pybind11.hash |  5 +++++
 package/python-pybind11/python-pybind11.mk   | 15 +++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/python-pybind11/Config.in
 create mode 100644 package/python-pybind11/python-pybind11.hash
 create mode 100644 package/python-pybind11/python-pybind11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16e8510b0a..d2da7fd5fa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -64,6 +64,7 @@ F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
 F:	package/python-pip/
 F:	package/python-psycopg2/
+F:	package/python-pybind11/
 F:	package/python-sqlalchemy/
 F:	package/python-sqlparse/
 F:	package/python-visitor/
diff --git a/package/Config.in b/package/Config.in
index 37861387e8..8b89ba034b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1021,6 +1021,7 @@ menu "External python modules"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pybind11/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
diff --git a/package/python-pybind11/Config.in b/package/python-pybind11/Config.in
new file mode 100644
index 0000000000..e79c0075a6
--- /dev/null
+++ b/package/python-pybind11/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_PYTHON_PYBIND11
+	bool "python-pybind11"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	help
+	  pybind11 is a lightweight header-only library that exposes C++
+	  types in Python and vice versa, mainly to create Python
+	  bindings of existing C++ code. Its goals and syntax are
+	  similar to the excellent Boost.Python library by David
+	  Abrahams:
+	  To minimize boilerplate code in traditional extension modules
+	  by inferring type information using compile-time
+	  introspection.
+
+	  https://github.com/pybind/pybind11
+
+comment "python-pybind11 needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "python-pybind11 needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/python-pybind11/python-pybind11.hash b/package/python-pybind11/python-pybind11.hash
new file mode 100644
index 0000000000..614ea183ec
--- /dev/null
+++ b/package/python-pybind11/python-pybind11.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pybind11/json
+md5	23fdca8191b16ce3e7f38fb9e4252b2d  pybind11-2.4.3.tar.gz
+sha256	72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758  pybind11-2.4.3.tar.gz
+# Locally computed sha256 checksums
+sha256	9a37ea54aa3cf12c7f3292799f20822ffd4b9b7142b36a7a9997b28c39264dc9  LICENSE
diff --git a/package/python-pybind11/python-pybind11.mk b/package/python-pybind11/python-pybind11.mk
new file mode 100644
index 0000000000..2b0f64c9bb
--- /dev/null
+++ b/package/python-pybind11/python-pybind11.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pybind11
+#
+################################################################################
+
+PYTHON_PYBIND11_VERSION = 2.4.3
+PYTHON_PYBIND11_SOURCE = pybind11-$(PYTHON_PYBIND11_VERSION).tar.gz
+PYTHON_PYBIND11_SITE = https://files.pythonhosted.org/packages/aa/91/deb6743e79e22ab01502296570b39b8404f10cc507a6692d612a7fee8d51
+PYTHON_PYBIND11_SETUP_TYPE = setuptools
+PYTHON_PYBIND11_LICENSE = BSD-3-Clause
+PYTHON_PYBIND11_LICENSE_FILES = LICENSE
+PYTHON_PYBIND11_INSTALL_STAGING = YES
+
+$(eval $(python-package))
-- 
2.23.0

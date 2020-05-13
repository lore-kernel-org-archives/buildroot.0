From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 13 May 2020 21:39:03 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pybind11: new package
Message-ID: <20200513183903.8656-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pybind11 is a lightweight header-only library that exposes C++
types in Python and vice versa, mainly to create Python bindings
of existing C++ code.

The package is installed both as 'cmake-package' (for staging) and
as 'python-package' (for the host). The reason for that is the fact
that pybind11 can be used in two different ways:
* When compiling C++ extentions from setup.py. On this case one should
be able to import the pythonic pybind11 module before the compilation
itself, hence the use of host-python-package.
* When a C++ project builds Python wrappings. On this case one should
be able to find the pybind11 headers from the staging dir.
In addition, one shuold be able to locate pybind11 with CMake's
'find_package' command, hence the use of cmake-package.

Because the package installs only headers, it's not installed for the
target, but only for host and staging dirs.

Moreover, there's a cross-compilation issue when building pybind11, and
recently a PR has been sent to them in order to fix that. The patch is
added in this commit.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                             |  1 +
 ...ovided-PythonLibs-on-newer-CMake-ver.patch | 31 +++++++++++++++++++
 package/python-pybind11/Config.in             | 23 ++++++++++++++
 package/python-pybind11/python-pybind11.hash  |  3 ++
 package/python-pybind11/python-pybind11.mk    | 19 ++++++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 package/python-pybind11/0001-Use-the-CMake-provided-PythonLibs-on-newer-CMake-ver.patch
 create mode 100644 package/python-pybind11/Config.in
 create mode 100644 package/python-pybind11/python-pybind11.hash
 create mode 100644 package/python-pybind11/python-pybind11.mk

diff --git a/package/Config.in b/package/Config.in
index c12676d859..6b64546186 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1070,6 +1070,7 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pybind11/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
diff --git a/package/python-pybind11/0001-Use-the-CMake-provided-PythonLibs-on-newer-CMake-ver.patch b/package/python-pybind11/0001-Use-the-CMake-provided-PythonLibs-on-newer-CMake-ver.patch
new file mode 100644
index 0000000000..3db5b4b259
--- /dev/null
+++ b/package/python-pybind11/0001-Use-the-CMake-provided-PythonLibs-on-newer-CMake-ver.patch
@@ -0,0 +1,31 @@
+From dc0d4e3d7b6ed7ea356bd8bfc2ce09bf27db2537 Mon Sep 17 00:00:00 2001
+From: Cody Piersall <cody@ou.edu>
+Date: Thu, 30 Apr 2020 13:08:53 -0500
+Subject: [PATCH 1/1] Use the CMake-provided PythonLibs on newer CMake
+ versions.
+
+---
+ tools/pybind11Tools.cmake | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
+index 8d85dd4..70eb089 100644
+--- a/tools/pybind11Tools.cmake
++++ b/tools/pybind11Tools.cmake
+@@ -13,7 +13,12 @@ if(NOT PYBIND11_PYTHON_VERSION)
+ endif()
+ 
+ set(Python_ADDITIONAL_VERSIONS 3.9 3.8 3.7 3.6 3.5 3.4)
+-find_package(PythonLibsNew ${PYBIND11_PYTHON_VERSION} REQUIRED)
++# this minimum was determined by testing, and could potentially be made lower
++if(CMAKE_VERSION VERSION_LESS 3.10.2)
++    find_package(PythonLibsNew ${PYBIND11_PYTHON_VERSION} REQUIRED)
++else()
++    find_package(PythonLibs ${PYBIND11_PYTHON_VERSION} REQUIRED)
++endif()
+ 
+ include(CheckCXXCompilerFlag)
+ include(CMakeParseArguments)
+-- 
+2.26.2
+
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
index 0000000000..75101ac847
--- /dev/null
+++ b/package/python-pybind11/python-pybind11.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256
+sha256	97504db65640570f32d3fdf701c25a340c8643037c3b69aec469c10c93dc8504  pybind11-2.5.0.tar.gz
+sha256	9a37ea54aa3cf12c7f3292799f20822ffd4b9b7142b36a7a9997b28c39264dc9  LICENSE
diff --git a/package/python-pybind11/python-pybind11.mk b/package/python-pybind11/python-pybind11.mk
new file mode 100644
index 0000000000..f77c6c664e
--- /dev/null
+++ b/package/python-pybind11/python-pybind11.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-pybind11
+#
+################################################################################
+
+PYTHON_PYBIND11_VERSION = 2.5.0
+PYTHON_PYBIND11_SOURCE = pybind11-$(PYTHON_PYBIND11_VERSION).tar.gz
+PYTHON_PYBIND11_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND11_VERSION))
+PYTHON_PYBIND11_LICENSE = BSD-3-Clause
+PYTHON_PYBIND11_LICENSE_FILES = LICENSE
+PYTHON_PYBIND11_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),python3,python)
+PYTHON_PYBIND11_INSTALL_STAGING = YES
+PYTHON_PYBIND11_INSTALL_TARGET = NO
+PYTHON_PYBIND11_CONF_OPTS = -DPYBIND11_TEST=OFF
+HOST_PYTHON_PYBIND11_SETUP_TYPE = setuptools
+
+$(eval $(cmake-package))
+$(eval $(host-python-package))
-- 
2.26.2

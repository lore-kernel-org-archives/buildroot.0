From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:55 +0100
Subject: [Buildroot] [PATCH 49/51] python-libconfig: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-49-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch will be sent to upstream, it is needed to avoid searching
headers and library in the host machine.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../0001-setup.py-Rework-setup.py.patch            | 93 ++++++++++++++++++++++
 package/python-libconfig/python-libconfig.mk       | 12 ++-
 2 files changed, 101 insertions(+), 4 deletions(-)
 create mode 100644 package/python-libconfig/0001-setup.py-Rework-setup.py.patch

diff --git a/package/python-libconfig/0001-setup.py-Rework-setup.py.patch b/package/python-libconfig/0001-setup.py-Rework-setup.py.patch
new file mode 100644
index 0000000..246afcd
--- /dev/null
+++ b/package/python-libconfig/0001-setup.py-Rework-setup.py.patch
@@ -0,0 +1,93 @@
+From 12bdf19986f4639352b0800df79490362d55dc13 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Sun, 26 Oct 2014 13:03:30 +0100
+Subject: [PATCH] setup.py: Rework setup.py
+
+This was done to be able to pass a prefix to setup.py to find
+boost_python library.
+This way, you can compile and cross compile it easily.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ setup.py | 57 +++++++++++++++++++++++++--------------------------------
+ 1 file changed, 25 insertions(+), 32 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index cf538d9..59c2ffb 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,32 +1,32 @@
+ # -*- coding: utf-8 -*-
+ 
+ from setuptools import setup, Extension
++from setuptools.command import build_ext
+ from os.path import join, basename, splitext
+ from glob import glob
++import os
+ 
+-include_dirs = ["/usr/local/include", "/opt/local/include"]
+-library_dirs = ["/usr/lib", "/usr/lib64", "/usr/local/lib", "/usr/local/lib64", "/opt/local/lib"]
+-libraries = ["config++"]
+-
+-# Attempt to find libboost_python.so or some variant by searching through the
+-# library directories.
+-# TODO: is there some API for this?
+-for d in library_dirs:
+-    libs = glob(join(d, "libboost_python.so"))
+-    if not(libs):
+-        libs = glob(join(d, "libboost_python*.so"))
+-    if libs:
+-        libname = basename(libs[0])         # basename
+-        libname = splitext(libname)[0]      # truncate postfix
+-        libname = libname[3:]               # truncate "lib"
+-        libraries.append(libname)
+-        break
+-
+-# If we were unable to find the shared library go ahead in a default. It might
+-# be in an unofficial directory and an environment variable has been set that
+-# will point the compiler to it.
+-if len(libraries) <= 1:
+-    libraries.append('boost_python')
++class _PyLibConfigBuildExt(build_ext.build_ext):
++    user_options = build_ext.build_ext.user_options + \
++            [('boostpython=', 'o', 'Prefix for Boost python installation location')]
++
++    def initialize_options(self):
++        build_ext.build_ext.initialize_options(self)
++
++        self.libraries = ['config++', 'boost_python']
++        self.boostpython = '/usr'
++
++    def finalize_options(self):
++        build_ext.build_ext.finalize_options(self)
++
++        boostpython_include_dir = os.path.join(self.boostpython, 'include')
++        boostpython_library_dir = os.path.join(self.boostpython, 'lib')
++
++        self.include_dirs += [os.path.join(self.boostpython, boostpython_include_dir)]
++        self.library_dirs += [os.path.join(self.boostpython, boostpython_library_dir)]
++
++pylibconfig = Extension(name = 'pylibconfig',
++                        sources = ["src/pylibconfig.cc"])
+ 
+ setup(
+     name='pylibconfig',
+@@ -40,13 +40,6 @@ setup(
+     test_suite="tests",
+     license="bsd",
+     url="https://github.com/cnangel/python-libconfig",
+-    ext_modules=[
+-        Extension(
+-            "pylibconfig",
+-            ["src/pylibconfig.cc"],
+-            include_dirs=include_dirs,
+-            library_dirs=library_dirs,
+-            libraries=libraries
+-        )
+-    ]
++    ext_modules=[pylibconfig],
++    cmdclass = {'build_ext': _PyLibConfigBuildExt}
+ )
+-- 
+2.1.1
+
diff --git a/package/python-libconfig/python-libconfig.mk b/package/python-libconfig/python-libconfig.mk
index 3f5984b..8bc5de4 100644
--- a/package/python-libconfig/python-libconfig.mk
+++ b/package/python-libconfig/python-libconfig.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-PYTHON_LIBCONFIG_VERSION = b271c3d9dac938ad5cd29b67bd08cc5536a5a391
+PYTHON_LIBCONFIG_VERSION = 2f0c9803c98871ff28144f6001442ddcb2762933
 PYTHON_LIBCONFIG_SITE = $(call github,cnangel,python-libconfig,$(PYTHON_LIBCONFIG_VERSION))
-
 PYTHON_LIBCONFIG_LICENSE = BSD
 PYTHON_LIBCONFIG_LICENSE_FILES = README
-
 PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
-
 PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
 
+define PYTHON_LIBCONFIG_BUILD_CMDS
+    (cd $(@D); \
+        $(PKG_PYTHON_SETUPTOOLS_ENV) \
+        $(HOST_DIR)/usr/bin/python setup.py build_ext \
+            --boostpython=$(STAGING_DIR)/usr)
+endef
+
 $(eval $(python-package))
-- 
2.1.1

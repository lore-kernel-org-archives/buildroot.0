From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Mar 2020 22:21:55 +0100
Subject: [Buildroot] [git commit] package/python-gobject: bump version to
 3.36.0
Message-ID: <20200313171231.7E2B790B96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=179e6766a6db96840d4b7692cd2edfd92e6036f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Convert the package to a meson package.
  - Remove 0001-add-PYTHON_INCLUDES-override.patch as it no longer applies.
  - Add gobject-introspection as a dependency.
  - Add the package under myself in the DEVELOPERS file.

Because gobject-introspection is now a dependency of python-gobject, the test
must be updated at the same time.

 - Change TestPythonPy2Gobject to TestPythonPy3Gobject as
   gobject-introspection requires python3.

 - Refactor test_python_gobject.py to no longer inherit the
   TestPythonPackageBase class, as this class uses a base config that does not
   support gobject-introspection.

 - Update sample_python_gobject to use Glib to find the path of sh.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml                                     |  2 +-
 DEVELOPERS                                         |  1 +
 .../0001-add-PYTHON_INCLUDES-override.patch        | 32 ---------------
 package/python-gobject/Config.in                   | 17 ++++----
 package/python-gobject/python-gobject.hash         |  5 +--
 package/python-gobject/python-gobject.mk           | 47 +++++++++-------------
 .../testing/tests/package/sample_python_gobject.py | 13 +++++-
 .../testing/tests/package/test_python_gobject.py   | 30 ++++++++++++--
 8 files changed, 72 insertions(+), 75 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index abd9dab250..4b84a5b709 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -463,7 +463,7 @@ tests.package.test_python_cryptography.TestPythonPy3Cryptography: { extends: .ru
 tests.package.test_python_django.TestPythonPy3Django: { extends: .runtime_test }
 tests.package.test_python_gitdb2.TestPythonPy2Gitdb2: { extends: .runtime_test }
 tests.package.test_python_gitdb2.TestPythonPy3Gitdb2: { extends: .runtime_test }
-tests.package.test_python_gobject.TestPythonPy2Gobject: { extends: .runtime_test }
+tests.package.test_python_gobject.TestPythonPy3Gobject: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
 tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 10768a19ee..5394150e5a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -65,6 +65,7 @@ F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-gitdb2/
+F:	package/python-gobject/
 F:	package/python-lockfile/
 F:	package/python-mutagen/
 F:	package/python-nested-dict/
diff --git a/package/python-gobject/0001-add-PYTHON_INCLUDES-override.patch b/package/python-gobject/0001-add-PYTHON_INCLUDES-override.patch
deleted file mode 100644
index d883f60ddf..0000000000
--- a/package/python-gobject/0001-add-PYTHON_INCLUDES-override.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-[PATCH] m4/python.m4: add PYTHON_INCLUDES override for cross compilation
-
-As the configure script mixes up host/target python. Equivalent to the
-similar code in dbus-python.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- m4/python.m4 |    4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: python-gobject-2.28.6/m4/python.m4
-===================================================================
---- python-gobject-2.28.6.orig/m4/python.m4
-+++ python-gobject-2.28.6/m4/python.m4
-@@ -43,6 +43,9 @@
- [AC_REQUIRE([AM_PATH_PYTHON])
- AC_MSG_CHECKING(for headers required to compile python extensions)
- dnl deduce PYTHON_INCLUDES
-+if test "${PYTHON_INCLUDES+set}" = set; then
-+  AC_MSG_NOTICE([PYTHON_INCLUDES overridden to: $PYTHON_INCLUDES])
-+else
- py_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.prefix)"`
- py_exec_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.exec_prefix)"`
- PYTHON_CONFIG=`which $PYTHON`-config
-@@ -54,6 +57,7 @@
-   PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
- fi
- fi
-+fi
- AC_SUBST(PYTHON_INCLUDES)
- dnl check if the headers exist:
- save_CPPFLAGS="$CPPFLAGS"
diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 36ddffebb0..d7ed437e8b 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -1,16 +1,19 @@
 config BR2_PACKAGE_PYTHON_GOBJECT
 	bool "python-gobject"
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
-	depends on BR2_PACKAGE_PYTHON # Broken with python 3.8
+	depends on BR2_USE_MMU # libglib2, gobject-introspection
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Python bindings for the GLib/GObject library
 
 	  https://wiki.gnome.org/action/show/Projects/PyGObject
 
-comment "python-gobject needs a toolchain w/ wchar, threads"
-	depends on BR2_PACKAGE_PYTHON
+comment "python-gobject needs a glibc toolchain, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 0c093f3306..5ae7553abb 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,4 +1,3 @@
-# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/2.28/pygobject-2.28.6.sha256sum
-sha256	fb8a1d4f665130a125011659bd347c7339c944232163dbb9a34fd0686577adb8  pygobject-2.28.6.tar.xz
-# Locally computed
+# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.36/pygobject-3.36.0.sha256sum
+sha256  8683d2dfb5baa9e501a9a64eeba5c2c1117eadb781ab1cd7a9d255834af6daef  pygobject-3.36.0.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index cf5c874151..c93140fc66 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,36 +4,29 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 2.28
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).6
+PYTHON_GOBJECT_VERSION_MAJOR = 3.36
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
-PYTHON_GOBJECT_SITE = http://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
+PYTHON_GOBJECT_SITE = https://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
 PYTHON_GOBJECT_LICENSE_FILES = COPYING
-PYTHON_GOBJECT_DEPENDENCIES = host-pkgconf libglib2
-PYTHON_GOBJECT_CONF_OPTS = --disable-introspection
-# for 0001-add-PYTHON_INCLUDES-override.patch
-PYTHON_GOBJECT_AUTORECONF = YES
+PYTHON_GOBJECT_INSTALL_STAGING = YES
+PYTHON_GOBJECT_DEPENDENCIES = \
+	gobject-introspection \
+	host-pkgconf \
+	libglib2 \
+	python3
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-PYTHON_GOBJECT_DEPENDENCIES += python host-python
+PYTHON_GOBJECT_CONF_OPTS += \
+	-Dpycairo=false \
+	-Dtests=false
 
-PYTHON_GOBJECT_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/bin/python2 \
-	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`"
-else
-PYTHON_GOBJECT_DEPENDENCIES += python3 host-python3
+# A sysconfigdata_name must be manually specified or the resulting .so
+# will have a x86_64 prefix, which causes "import gi" to fail.
+# A pythonpath must be specified or the host python path will be used resulting
+# in a "not a valid python" error.
+PYTHON_GOBJECT_CONF_ENV += \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
 
-PYTHON_GOBJECT_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/bin/python3 \
-	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`"
-endif
-
-ifeq ($(BR2_PACKAGE_LIBFFI),y)
-PYTHON_GOBJECT_CONF_OPTS += --with-ffi
-PYTHON_GOBJECT_DEPENDENCIES += libffi
-else
-PYTHON_GOBJECT_CONF_OPTS += --without-ffi
-endif
-
-$(eval $(autotools-package))
+$(eval $(meson-package))
diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
index 84ebee7362..ecce0b0575 100644
--- a/support/testing/tests/package/sample_python_gobject.py
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -1 +1,12 @@
-import gobject  # noqa
+#!/usr/bin/env python
+"""A simple test that uses python-gobject to find the path of sh."""
+from gi.repository import GLib
+
+def main():
+    sh_path = GLib.find_program_in_path('sh')
+    if sh_path == "/bin/sh":
+      return True
+    return False
+
+if __name__ == '__main__':
+    main()
diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
index 0a59447adb..a673d554a4 100644
--- a/support/testing/tests/package/test_python_gobject.py
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -1,11 +1,33 @@
+import os
 from tests.package.test_python import TestPythonPackageBase
 
-
-class TestPythonPy2Gobject(TestPythonPackageBase):
+class TestPythonPy3Gobject(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    config = \
         """
-        BR2_PACKAGE_PYTHON=y
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_PACKAGE_GOBJECT_INTROSPECTION=y
+        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_GOBJECT=y
         """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
     sample_scripts = ["tests/package/sample_python_gobject.py"]

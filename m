From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 23 Feb 2020 09:56:25 -0800
Subject: [Buildroot] [PATCH/next v2 1/2] package/python-gobject: bump
 version to 3.34.0
Message-ID: <20200223175626.16900-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Convert the package to a meson package.
  - Remove 0001-add-PYTHON_INCLUDES-override.patch as it no longer applies.
  - Add gobject-introspection as a dependency.
  - Add the package under myself in the DEVELOPERS file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Reorder dependencies (Yann)
  - Re-add BR2_USE_MMU as a dependency (Yann)
  - Add "select BR2_PACKAGE_LIBGLIB2" (Yann)

 DEVELOPERS                                    |  1 +
 .../0001-add-PYTHON_INCLUDES-override.patch   | 32 -------------
 package/python-gobject/Config.in              | 17 ++++---
 package/python-gobject/python-gobject.hash    |  5 +-
 package/python-gobject/python-gobject.mk      | 47 ++++++++-----------
 5 files changed, 33 insertions(+), 69 deletions(-)
 delete mode 100644 package/python-gobject/0001-add-PYTHON_INCLUDES-override.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 24b68ebe11..4c2d0556fd 100644
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
index 0c093f3306..958c022a18 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,4 +1,3 @@
-# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/2.28/pygobject-2.28.6.sha256sum
-sha256	fb8a1d4f665130a125011659bd347c7339c944232163dbb9a34fd0686577adb8  pygobject-2.28.6.tar.xz
-# Locally computed
+# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.34/pygobject-3.34.0.sha256sum
+sha256  87e2c9aa785f352ef111dcc5f63df9b85cf6e05e52ff04f803ffbebdacf5271a  pygobject-3.34.0.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index cf5c874151..427e7b60ac 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,36 +4,29 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 2.28
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).6
+PYTHON_GOBJECT_VERSION_MAJOR = 3.34
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
-- 
2.24.1

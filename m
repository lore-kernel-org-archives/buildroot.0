From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 13 Jun 2016 22:38:09 +0200
Subject: [Buildroot] [PATCH v5] package/python-pillow: new package
Message-ID: <1465850289-11760-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds python pillow, the friendly python image library fork, it
includes a backported patch to disable configuration platfom guessing.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes

v4 -> v5:

* Better build and install opts handling (Peter Korsgaard)
* Strong sha256 hash
* Simplified INSTALL_TARGET_CMDS
* Better commit message

 package/Config.in                                  |  1 +
 ...y-add-option-to-disable-platform-guessing.patch | 63 ++++++++++++++++++++++
 package/python-pillow/Config.in                    | 12 +++++
 package/python-pillow/python-pillow.hash           |  4 ++
 package/python-pillow/python-pillow.mk             | 33 ++++++++++++
 5 files changed, 113 insertions(+)
 create mode 100644 package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
 create mode 100644 package/python-pillow/Config.in
 create mode 100644 package/python-pillow/python-pillow.hash
 create mode 100644 package/python-pillow/python-pillow.mk

diff --git a/package/Config.in b/package/Config.in
index 3d99d72..a26043d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -704,6 +704,7 @@ menu "External python modules"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-pexpect/Config.in"
+	source "package/python-pillow/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch b/package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
new file mode 100644
index 0000000..a1a4cbe
--- /dev/null
+++ b/package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
@@ -0,0 +1,63 @@
+From 3344eff32427f1d10f3ca82ca4344c501a1a2055 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Sun, 12 Jun 2016 12:06:59 +0200
+Subject: [PATCH] setup.py: add option to disable platform guessing
+
+When cross-compiling (ex on Buildroot) platform guessing is not needed
+cause the environment is correctly built externally.
+This patch adds an option to disable platform guessing on Linux.
+---
+ setup.py | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 0f74a40..f1eac1e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -121,9 +121,13 @@ class pil_build_ext(build_ext):
+         ('disable-%s' % x, None, 'Disable support for %s' % x) for x in feature
+     ] + [
+         ('enable-%s' % x, None, 'Enable support for %s' % x) for x in feature
++    ] + [
++        ('disable-platform-guessing', None, 'Disable platform guessing on Linux'),
++        ('debug', None, 'Debug logging')
+     ]
+ 
+     def initialize_options(self):
++        self.disable_platform_guessing = None
+         build_ext.initialize_options(self)
+         for x in self.feature:
+             setattr(self, 'disable_%s' % x, None)
+@@ -190,7 +194,10 @@ class pil_build_ext(build_ext):
+         #
+         # add platform directories
+ 
+-        if sys.platform == "cygwin":
++        if self.disable_platform_guessing:
++            pass
++        
++        elif sys.platform == "cygwin":
+             # pythonX.Y.dll.a is in the /usr/lib/pythonX.Y/config directory
+             _add_directory(library_dirs,
+                            os.path.join("/usr/lib", "python%s" %
+@@ -352,11 +359,13 @@ class pil_build_ext(build_ext):
+                 _add_directory(include_dirs, tcl_dir)
+ 
+         # standard locations
+-        _add_directory(library_dirs, "/usr/local/lib")
+-        _add_directory(include_dirs, "/usr/local/include")
++        if not self.disable_platform_guessing:
++            _add_directory(library_dirs, "/usr/local/lib")
++            _add_directory(include_dirs, "/usr/local/include")
++
++            _add_directory(library_dirs, "/usr/lib")
++            _add_directory(include_dirs, "/usr/include")
+ 
+-        _add_directory(library_dirs, "/usr/lib")
+-        _add_directory(include_dirs, "/usr/include")
+ 
+         # on Windows, look for the OpenJPEG libraries in the location that
+         # the official installer puts them
+-- 
+1.9.1
+
diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
new file mode 100644
index 0000000..d5c3809
--- /dev/null
+++ b/package/python-pillow/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_PILLOW
+	bool "python-pillow"
+	help
+	  Pillow is the "friendly" PIL fork by Alex Clark and Contributors. PIL is
+	  the Python Imaging Library by Fredrik Lundh and Contributors.
+
+	  Pillow relies on external libraries to provide support various
+	  image formats. Select the corresponding package(s) to get this
+	  support. Pillow can use jpeg, zlib (for PNG), tiff, freetype, webp,
+	  and openjpeg (JPEG-2000).
+
+	  https://pypi.python.org/pypi/Pillow/
diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
new file mode 100644
index 0000000..6de9606
--- /dev/null
+++ b/package/python-pillow/python-pillow.hash
@@ -0,0 +1,4 @@
+# https://pypi.python.org/pypi?:action=show_md5&digest=7cfd093c11205d9e2ebe3c51dfcad510
+md5 7cfd093c11205d9e2ebe3c51dfcad510  Pillow-3.2.0.tar.gz
+# sha256 locally computed
+sha256 64b0a057210c480aea99406c9391180cd866fc0fd8f0b53367e3af21b195784a  Pillow-3.2.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
new file mode 100644
index 0000000..2926886
--- /dev/null
+++ b/package/python-pillow/python-pillow.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# python-pillow
+#
+################################################################################
+
+PYTHON_PILLOW_VERSION = 3.2.0
+PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
+PYTHON_PILLOW_SITE = https://pypi.python.org/packages/source/P/Pillow
+PYTHON_PILLOW_SETUP_TYPE = setuptools
+PYTHON_PILLOW_DEPENDENCIES = $(if $(BR2_PACKAGE_JPEG),jpeg) \
+      $(if $(BR2_PACKAGE_ZLIB),zlib) \
+      $(if $(BR2_PACKAGE_TIFF),tiff) \
+      $(if $(BR2_PACKAGE_FREETYPE),freetype) \
+      $(if $(BR2_PACKAGE_WEBP),webp) \
+      $(if $(BR2_PACKAGE_OPENJPEG),openjpeg)
+
+PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_JPEG),--enable-jpeg,--disable-jpeg)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_ZLIB),--enable-zlib,--disable-zlib)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_TIFF),--enable-tiff,--disable-tiff)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_FREETYPE),--enable-freetype,--disable-freetype)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_WEBP),--enable-webp,--disable-webp)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_OPENJPEG),--enable-jpeg2000,--disable-jpeg2000)
+
+PYTHON_PILLOW_BUILD_CMDS = cd $(PYTHON_PILLOW_BUILDDIR); \
+		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
+		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
+		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
+
+PYTHON_PILLOW_INSTALL_TARGET_CMDS = $(PYTHON_PILLOW_BUILD_CMDS) install
+
+$(eval $(python-package))
-- 
1.9.1

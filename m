From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Apr 2016 17:20:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-pillow: new package
In-Reply-To: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1461597623-14629-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds python pillow, the friendly python fork.
The accompaining patch to disable platform guessing was submitted
upstream for inclusion.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...y-add-option-to-disable-platform-guessing.patch | 169 +++++++++++++++++++++
 package/python-pillow/Config.in                    |  12 ++
 package/python-pillow/python-pillow.hash           |   2 +
 package/python-pillow/python-pillow.mk             |  39 +++++
 4 files changed, 222 insertions(+)
 create mode 100644 package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
 create mode 100644 package/python-pillow/Config.in
 create mode 100644 package/python-pillow/python-pillow.hash
 create mode 100644 package/python-pillow/python-pillow.mk

diff --git a/package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch b/package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
new file mode 100644
index 0000000..e8e6d7c
--- /dev/null
+++ b/package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
@@ -0,0 +1,169 @@
+From fa2a0e73502426c5add9e4a0e13971fe195a82a0 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Mon, 25 Apr 2016 16:50:20 +0200
+Subject: [PATCH] setup.py: add option to disable platform guessing
+
+When cross-compiling (ex on Buildroot) platform guessing is not needed
+cause the environment is correctly built externally.
+This patch adds an option to disable platform guessing on Linux.
+---
+ setup.py | 123 +++++++++++++++++++++++++++++++++------------------------------
+ 1 file changed, 65 insertions(+), 58 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 0f74a40..d25390f 100644
+--- a/setup.py
++++ b/setup.py
+@@ -121,9 +121,12 @@ class pil_build_ext(build_ext):
+         ('disable-%s' % x, None, 'Disable support for %s' % x) for x in feature
+     ] + [
+         ('enable-%s' % x, None, 'Enable support for %s' % x) for x in feature
++    ] + [
++        ('disable-platform-guessing', None, 'Disable platform guessing on Linux'),
+     ]
+ 
+     def initialize_options(self):
++        self.disable_platform_guessing = None
+         build_ext.initialize_options(self)
+         for x in self.feature:
+             setattr(self, 'disable_%s' % x, None)
+@@ -236,62 +239,65 @@ class pil_build_ext(build_ext):
+                 _add_directory(include_dirs, "/usr/X11/include")
+ 
+         elif sys.platform.startswith("linux"):
+-            arch_tp = (plat.processor(), plat.architecture()[0])
+-            if arch_tp == ("x86_64", "32bit"):
+-                # 32-bit build on 64-bit machine.
+-                _add_directory(library_dirs, "/usr/lib/i386-linux-gnu")
++            if self.disable_platform_guessing:
++                pass
+             else:
+-                for platform_ in arch_tp:
+-
+-                    if not platform_:
+-                        continue
+-
+-                    if platform_ in ["x86_64", "64bit"]:
+-                        _add_directory(library_dirs, "/lib64")
+-                        _add_directory(library_dirs, "/usr/lib64")
+-                        _add_directory(library_dirs,
+-                                       "/usr/lib/x86_64-linux-gnu")
+-                        break
+-                    elif platform_ in ["i386", "i686", "32bit"]:
+-                        _add_directory(library_dirs, "/usr/lib/i386-linux-gnu")
+-                        break
+-                    elif platform_ in ["aarch64"]:
+-                        _add_directory(library_dirs, "/usr/lib64")
+-                        _add_directory(library_dirs,
+-                                       "/usr/lib/aarch64-linux-gnu")
+-                        break
+-                    elif platform_ in ["arm", "armv7l"]:
+-                        _add_directory(library_dirs,
+-                                       "/usr/lib/arm-linux-gnueabi")
+-                        break
+-                    elif platform_ in ["ppc64"]:
+-                        _add_directory(library_dirs, "/usr/lib64")
+-                        _add_directory(library_dirs,
+-                                       "/usr/lib/ppc64-linux-gnu")
+-                        _add_directory(library_dirs,
+-                                       "/usr/lib/powerpc64-linux-gnu")
+-                        break
+-                    elif platform_ in ["ppc"]:
+-                        _add_directory(library_dirs, "/usr/lib/ppc-linux-gnu")
+-                        _add_directory(library_dirs,
+-                                       "/usr/lib/powerpc-linux-gnu")
+-                        break
+-                    elif platform_ in ["s390x"]:
+-                        _add_directory(library_dirs, "/usr/lib64")
+-                        _add_directory(library_dirs,
+-                                       "/usr/lib/s390x-linux-gnu")
+-                        break
+-                    elif platform_ in ["s390"]:
+-                        _add_directory(library_dirs, "/usr/lib/s390-linux-gnu")
+-                        break
++                arch_tp = (plat.processor(), plat.architecture()[0])
++                if arch_tp == ("x86_64", "32bit"):
++                    # 32-bit build on 64-bit machine.
++                    _add_directory(library_dirs, "/usr/lib/i386-linux-gnu")
+                 else:
+-                    raise ValueError(
+-                        "Unable to identify Linux platform: `%s`" % platform_)
+-
+-            # XXX Kludge. Above /\ we brute force support multiarch. Here we
+-            # try Barry's more general approach. Afterward, something should
+-            # work ;-)
+-            self.add_multiarch_paths()
++                    for platform_ in arch_tp:
++
++                        if not platform_:
++                            continue
++
++                        if platform_ in ["x86_64", "64bit"]:
++                            _add_directory(library_dirs, "/lib64")
++                            _add_directory(library_dirs, "/usr/lib64")
++                            _add_directory(library_dirs,
++                                           "/usr/lib/x86_64-linux-gnu")
++                            break
++                        elif platform_ in ["i386", "i686", "32bit"]:
++                            _add_directory(library_dirs, "/usr/lib/i386-linux-gnu")
++                            break
++                        elif platform_ in ["aarch64"]:
++                            _add_directory(library_dirs, "/usr/lib64")
++                            _add_directory(library_dirs,
++                                           "/usr/lib/aarch64-linux-gnu")
++                            break
++                        elif platform_ in ["arm", "armv7l"]:
++                            _add_directory(library_dirs,
++                                           "/usr/lib/arm-linux-gnueabi")
++                            break
++                        elif platform_ in ["ppc64"]:
++                            _add_directory(library_dirs, "/usr/lib64")
++                            _add_directory(library_dirs,
++                                           "/usr/lib/ppc64-linux-gnu")
++                            _add_directory(library_dirs,
++                                           "/usr/lib/powerpc64-linux-gnu")
++                            break
++                        elif platform_ in ["ppc"]:
++                            _add_directory(library_dirs, "/usr/lib/ppc-linux-gnu")
++                            _add_directory(library_dirs,
++                                           "/usr/lib/powerpc-linux-gnu")
++                            break
++                        elif platform_ in ["s390x"]:
++                            _add_directory(library_dirs, "/usr/lib64")
++                            _add_directory(library_dirs,
++                                           "/usr/lib/s390x-linux-gnu")
++                            break
++                        elif platform_ in ["s390"]:
++                            _add_directory(library_dirs, "/usr/lib/s390-linux-gnu")
++                            break
++                    else:
++                        raise ValueError(
++                            "Unable to identify Linux platform: `%s`" % platform_)
++
++                # XXX Kludge. Above /\ we brute force support multiarch. Here we
++                # try Barry's more general approach. Afterward, something should
++                # work ;-)
++                self.add_multiarch_paths()
+ 
+         elif sys.platform.startswith("gnu"):
+             self.add_multiarch_paths()
+@@ -352,11 +358,12 @@ class pil_build_ext(build_ext):
+                 _add_directory(include_dirs, tcl_dir)
+ 
+         # standard locations
+-        _add_directory(library_dirs, "/usr/local/lib")
+-        _add_directory(include_dirs, "/usr/local/include")
++        if not self.disable_platform_guessing:
++            _add_directory(library_dirs, "/usr/local/lib")
++            _add_directory(include_dirs, "/usr/local/include")
+ 
+-        _add_directory(library_dirs, "/usr/lib")
+-        _add_directory(include_dirs, "/usr/include")
++            _add_directory(library_dirs, "/usr/lib")
++            _add_directory(include_dirs, "/usr/include")
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
index 0000000..0fc349c
--- /dev/null
+++ b/package/python-pillow/python-pillow.hash
@@ -0,0 +1,2 @@
+https://pypi.python.org/pypi?:action=show_md5&digest=7cfd093c11205d9e2ebe3c51dfcad510
+md5 7cfd093c11205d9e2ebe3c51dfcad510  Pillow-3.2.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
new file mode 100644
index 0000000..f186ab6
--- /dev/null
+++ b/package/python-pillow/python-pillow.mk
@@ -0,0 +1,39 @@
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
+PYTHON_PILLOW_BUILD_OPTS += --disable-platform-guessing
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_JPEG),--enable-jpeg,--disable-jpeg)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_ZLIB),--enable-zlib,--disable-zlib)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_TIFF),--enable-tiff,--disable-tiff)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_FREETYPE),--enable-freetype,--disable-freetype)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_WEBP),--enable-webp,--disable-webp)
+PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_OPENJPEG),--enable-jpeg2000,--disable-jpeg2000)
+
+PYTHON_PILLOW_INSTALL_TARGET_OPTS += $(PYTHON_PILLOW_BUILD_OPTS)
+
+PYTHON_PILLOW_BUILD_CMDS = (cd $(PYTHON_PILLOW_BUILDDIR); \
+		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
+		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
+		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS))
+
+PYTHON_PILLOW_INSTALL_TARGET_CMDS = (cd $(PYTHON_PILLOW_BUILDDIR); \
+		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
+		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
+		$(PYTHON_PILLOW_INSTALL_TARGET_OPTS) install \
+		$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS))
+
+$(eval $(python-package))
-- 
1.9.1

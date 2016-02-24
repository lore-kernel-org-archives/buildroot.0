From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 24 Feb 2016 08:00:40 +0100
Subject: [Buildroot] [PATCH v5] package/python-pillow: new package
Message-ID: <1456297240-32112-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds python-pillow, the friendly python image library fork.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes:
v4 -> v5:

* Fixed build options (suggested by Thomas Petazzoni)
* Usign custom BUILD_CMDS and INSTALL_TARGET_CMDS to overcome
  package strangeness (suggested by Thomas Petazzoni)
* Bump to version 3.1.0

v3 -> v4:

* Fixing a couple of typos

v2 -> v3:

* Simplified package
* Better handling of setup type
* Adding hash file

v1 -> v2:

* Added patch to remove platform guessing, now headers should be searched in buildroot folders
* Fixed optional configure options

 package/Config.in                                  |  1 +
 ...setup.py-removing-unneeded-platform-guess.patch | 85 ++++++++++++++++++++++
 package/python-pillow/Config.in                    | 12 +++
 package/python-pillow/python-pillow.hash           |  2 +
 package/python-pillow/python-pillow.mk             | 37 ++++++++++
 5 files changed, 137 insertions(+)
 create mode 100644 package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch
 create mode 100644 package/python-pillow/Config.in
 create mode 100644 package/python-pillow/python-pillow.hash
 create mode 100644 package/python-pillow/python-pillow.mk

diff --git a/package/Config.in b/package/Config.in
index 3eb3618..55f16cc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-pillow/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch b/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch
new file mode 100644
index 0000000..b772223
--- /dev/null
+++ b/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch
@@ -0,0 +1,85 @@
+From d21bfb7f9d8df1910f07a0834624413d36c264f5 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Wed, 24 Feb 2016 07:51:48 +0100
+Subject: [PATCH] setup.py: removing unneeded platform guess
+
+Platform guess is not needed when cross compiling on buildroot
+so removing it.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ setup.py | 58 +---------------------------------------------------------
+ 1 file changed, 1 insertion(+), 57 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index f31a146..fa21c33 100644
+--- a/setup.py
++++ b/setup.py
+@@ -241,63 +241,7 @@ class pil_build_ext(build_ext):
+                 _add_directory(include_dirs, "/usr/X11/include")
+ 
+         elif sys.platform.startswith("linux"):
+-            arch_tp = (plat.processor(), plat.architecture()[0])
+-            if arch_tp == ("x86_64", "32bit"):
+-                # 32-bit build on 64-bit machine.
+-                _add_directory(library_dirs, "/usr/lib/i386-linux-gnu")
+-            else:
+-                for platform_ in arch_tp:
+-
+-                    if not platform_:
+-                        continue
+-
+-                    if platform_ in ["x86_64", "64bit"]:
+-                        _add_directory(library_dirs, "/lib64")
+-                        _add_directory(library_dirs, "/usr/lib64")
+-                        _add_directory(
+-                            library_dirs, "/usr/lib/x86_64-linux-gnu")
+-                        break
+-                    elif platform_ in ["i386", "i686", "32bit"]:
+-                        _add_directory(
+-                            library_dirs, "/usr/lib/i386-linux-gnu")
+-                        break
+-                    elif platform_ in ["aarch64"]:
+-                        _add_directory(library_dirs, "/usr/lib64")
+-                        _add_directory(
+-                            library_dirs, "/usr/lib/aarch64-linux-gnu")
+-                        break
+-                    elif platform_ in ["arm", "armv7l"]:
+-                        _add_directory(
+-                            library_dirs, "/usr/lib/arm-linux-gnueabi")
+-                        break
+-                    elif platform_ in ["ppc64"]:
+-                        _add_directory(library_dirs, "/usr/lib64")
+-                        _add_directory(
+-                            library_dirs, "/usr/lib/ppc64-linux-gnu")
+-                        _add_directory(
+-                            library_dirs, "/usr/lib/powerpc64-linux-gnu")
+-                        break
+-                    elif platform_ in ["ppc"]:
+-                        _add_directory(library_dirs, "/usr/lib/ppc-linux-gnu")
+-                        _add_directory(
+-                            library_dirs, "/usr/lib/powerpc-linux-gnu")
+-                        break
+-                    elif platform_ in ["s390x"]:
+-                        _add_directory(library_dirs, "/usr/lib64")
+-                        _add_directory(
+-                            library_dirs, "/usr/lib/s390x-linux-gnu")
+-                        break
+-                    elif platform_ in ["s390"]:
+-                        _add_directory(library_dirs, "/usr/lib/s390-linux-gnu")
+-                        break
+-                else:
+-                    raise ValueError(
+-                        "Unable to identify Linux platform: `%s`" % platform_)
+-
+-            # XXX Kludge. Above /\ we brute force support multiarch. Here we
+-            # try Barry's more general approach. Afterward, something should
+-            # work ;-)
+-            self.add_multiarch_paths()
++            pass
+ 
+         elif sys.platform.startswith("gnu"):
+             self.add_multiarch_paths()
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
index 0000000..b2e200b
--- /dev/null
+++ b/package/python-pillow/python-pillow.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 1c186d9fe393eabb311a4c2e2dfff99f206372b2fa04f37cb10c8022cc8d5f95  python-pillow-3.1.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
new file mode 100644
index 0000000..7f4f299
--- /dev/null
+++ b/package/python-pillow/python-pillow.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# python-pillow
+#
+################################################################################
+
+PYTHON_PILLOW_VERSION = 3.1.0
+PYTHON_PILLOW_SITE = $(call github,python-pillow,Pillow,$(PYTHON_PILLOW_VERSION))
+PYTHON_PILLOW_SETUP_TYPE = setuptools
+PYTHON_PILLOW_DEPENDENCIES = $(if $(BR2_PACKAGE_JPEG),jpeg) \
+      $(if $(BR2_PACKAGE_ZLIB),zlib) \
+      $(if $(BR2_PACKAGE_TIFF),tiff) \
+      $(if $(BR2_PACKAGE_FREETYPE),freetype) \
+      $(if $(BR2_PACKAGE_WEBP),webp) \
+      $(if $(BR2_PACKAGE_OPENJPEG),openjpeg)
+
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

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 22 Oct 2015 23:25:43 +0200
Subject: [Buildroot] [PATCH v2] package/python-pillow: new package
Message-ID: <1445549143-10983-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds python-pillow, the friendly python image library fork.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes:

v1 -> v2:

* Added patch to remove platform guessing, now headers should be searched in buildroot folders
* Fixed optional configure options


 package/Config.in                                  |  1 +
 ...setup.py-removing-unneeded-platform-guess.patch | 85 ++++++++++++++++++++++
 package/python-pillow/Config.in                    | 47 ++++++++++++
 package/python-pillow/python-pillow.mk             | 18 +++++
 4 files changed, 151 insertions(+)
 create mode 100644 package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch
 create mode 100644 package/python-pillow/Config.in
 create mode 100644 package/python-pillow/python-pillow.mk

diff --git a/package/Config.in b/package/Config.in
index 7392363..7acfc6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -634,6 +634,7 @@ menu "External python modules"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-pam/Config.in"
+	source "package/python-pillow/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch b/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch
new file mode 100644
index 0000000..1886888
--- /dev/null
+++ b/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch
@@ -0,0 +1,85 @@
+From cb8c67c0b7ee805100c381300ea29262e8b5838a Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Thu, 22 Oct 2015 22:45:31 +0200
+Subject: [PATCH] setup.py: removing unneeded platform guess
+
+Platformm guess is not needed when cross compiling on buildroot
+so removing it.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ setup.py | 58 +---------------------------------------------------------
+ 1 file changed, 1 insertion(+), 57 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 4cb7257..038b7dc 100644
+--- a/setup.py
++++ b/setup.py
+@@ -241,63 +241,7 @@ class pil_build_ext(build_ext):
+                 _add_directory(include_dirs, "/usr/X11/include")
+ 
+         elif sys.platform.startswith("linux"):
+-            arch_tp = (plat.processor(), plat.architecture()[0])
+-            if arch_tp == ("x86_64", "32bit"):
+-                # 32 bit build on 64 bit machine.
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
index 0000000..575b50d
--- /dev/null
+++ b/package/python-pillow/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_PYTHON_PILLOW
+	bool "python-pillow"
+	help
+	  Pillow is the "friendly" PIL fork by Alex Clark and Contributors. PIL is
+	  the Python Imaging Library by Fredrik Lundh and Contributors.
+
+	  https://pypi.python.org/pypi/Pillow/
+
+if BR2_PACKAGE_PYTHON_PILLOW
+
+config BR2_PACKAGE_PYTHON_PILLOW_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+	help
+	  This option provides JPEG functionality.
+
+config BR2_PACKAGE_PYTHON_PILLOW_ZLIB
+	bool "compressed PNGs support"
+	select BR2_PACKAGE_ZLIB
+	help
+	  This option provides access to compressed PNGs.
+
+config BR2_PACKAGE_PYTHON_PILLOW_TIFF
+	bool "compressed TIFF support"
+	select BR2_PACKAGE_TIFF
+	help
+	  This option provides compressed TIFF functionality.
+
+config BR2_PACKAGE_PYTHON_PILLOW_FREETYPE
+	bool "freetype support"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  This option provides type related services.
+
+config BR2_PACKAGE_PYTHON_PILLOW_WEBP
+	bool "WebP format support"
+	select BR2_PACKAGE_WEBP
+	help
+	  This option provides the WebP format.
+
+config BR2_PACKAGE_PYTHON_PILLOW_JPEG2000
+	bool "JPEG 2000 support"
+	select BR2_PACKAGE_OPENJPEG
+	help
+	  This option provides JPEG 2000 functionality.
+
+endif
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
new file mode 100644
index 0000000..ccf8440
--- /dev/null
+++ b/package/python-pillow/python-pillow.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-pillow
+#
+################################################################################
+
+PYTHON_PILLOW_VERSION = 3.0.0
+PYTHON_PILLOW_SITE = $(call github,python-pillow,Pillow,$(PYTHON_PILLOW_VERSION))
+PYTHON_PILLOW_SETUP_TYPE = distutils
+PYTHON_PILLOW_DEPENDENCIES = python-setuptools \
+      $(if $(BR2_PACKAGE_JPEG),jpeg) \
+      $(if $(BR2_PACKAGE_ZLIB),zlib) \
+      $(if $(BR2_PACKAGE_TIFF),tiff) \
+      $(if $(BR2_PACKAGE_FREETYPE),freetype) \
+      $(if $(BR2_PACKAGE_WEBP),webp) \
+      $(if $(BR2_PACKAGE_OPENJPEG),openjpeg)
+
+$(eval $(python-package))
-- 
1.9.1

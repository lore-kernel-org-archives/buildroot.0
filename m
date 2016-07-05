From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 23:23:34 +0200
Subject: [Buildroot] [git commit] package/python-pillow: new package
Message-ID: <20160705212346.E463F82116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=509ac32be6f61d9c3283a1845c715db816000198
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds python pillow, the friendly python image library fork,
it includes a backported patch to disable configuration platfom
guessing.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Thomas:
 - Rewrap Config.in help text.
 - As suggested by Bernd Kuhls, bump the version to 3.3.0 and drop the
   patch that has been applied upstream.
 - Rework the optional dependency handling to follow what we do in most
   Buildroot packages.
 - Add licensing information.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-pillow/Config.in          | 13 +++++++
 package/python-pillow/python-pillow.hash |  4 ++
 package/python-pillow/python-pillow.mk   | 64 ++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 145828e..15271a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -697,6 +697,7 @@ menu "External python modules"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-pexpect/Config.in"
+	source "package/python-pillow/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
new file mode 100644
index 0000000..3820ba8
--- /dev/null
+++ b/package/python-pillow/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PILLOW
+	bool "python-pillow"
+	help
+	  Pillow is the "friendly" PIL fork by Alex Clark and
+	  Contributors. PIL is the Python Imaging Library by Fredrik
+	  Lundh and Contributors.
+
+	  Pillow relies on external libraries to provide support
+	  various image formats. Select the corresponding package(s)
+	  to get this support. Pillow can use jpeg, zlib (for PNG),
+	  tiff, freetype, webp, and openjpeg (JPEG-2000).
+
+	  https://pypi.python.org/pypi/Pillow/
diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
new file mode 100644
index 0000000..033692d
--- /dev/null
+++ b/package/python-pillow/python-pillow.hash
@@ -0,0 +1,4 @@
+# https://pypi.python.org/pypi?:action=show_md5&digest=b5a15b03bf402fe254636c015fcf04da
+md5 b5a15b03bf402fe254636c015fcf04da  Pillow-3.3.0.tar.gz
+# sha256 locally computed
+sha256 031e7c9c885a4f343d1ad366c7fd2340449dc70318acb4a28d6411994f0accd1  Pillow-3.2.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
new file mode 100644
index 0000000..878fdad
--- /dev/null
+++ b/package/python-pillow/python-pillow.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# python-pillow
+#
+################################################################################
+
+PYTHON_PILLOW_VERSION = 3.3.0
+PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
+PYTHON_PILLOW_SITE = https://pypi.python.org/packages/e0/27/f61098a12f14690689924de93ffdd101463083a80bf8ff3e0c218addf05b
+PYTHON_PILLOW_LICENSE = PIL Software License
+PYTHON_PILLOW_LICENSE_FILES = LICENSE
+PYTHON_PILLOW_SETUP_TYPE = setuptools
+PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+PYTHON_PILLOW_DEPENDENCIES += freetype
+PYTHON_PILLOW_BUILD_OPTS += --enable-freetype
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-freetype
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+PYTHON_PILLOW_DEPENDENCIES += jpeg
+PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+PYTHON_PILLOW_DEPENDENCIES += openjpeg
+PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg2000
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg2000
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+PYTHON_PILLOW_DEPENDENCIES += tiff
+PYTHON_PILLOW_BUILD_OPTS += --enable-tiff
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP),y)
+PYTHON_PILLOW_DEPENDENCIES += webp
+PYTHON_PILLOW_BUILD_OPTS += --enable-webp
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-webp
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+PYTHON_PILLOW_DEPENDENCIES += zlib
+PYTHON_PILLOW_BUILD_OPTS += --enable-zlib
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-zlib
+endif
+
+PYTHON_PILLOW_BUILD_CMDS = cd $(PYTHON_PILLOW_BUILDDIR); \
+		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
+		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
+		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
+
+PYTHON_PILLOW_INSTALL_TARGET_CMDS = $(PYTHON_PILLOW_BUILD_CMDS) install
+
+$(eval $(python-package))

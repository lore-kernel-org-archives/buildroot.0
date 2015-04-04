From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 11:10:22 +0200
Subject: [Buildroot] [git commit] package/openjpeg: New package openjpeg
	1.5.2
Message-ID: <20150404091049.53F14818FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a779097412c4969920e4539d9403c06b1d0898cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is needed by Poppler.

[Thomas:
 - fix download location, which was incorrect.
 - add dependency on host-pkgconf, since the configure.ac script uses
   PKG_CHECK_MODULES and we're doing an autoreconf.
 - add optional dependencies on libpng, tiff and lcms2, so that they
   are explicit instead of automatically detected.]

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/openjpeg/Config.in     |    7 +++++++
 package/openjpeg/openjpeg.hash |    2 ++
 package/openjpeg/openjpeg.mk   |   38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ee4d476..3f670f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -757,6 +757,7 @@ menu "Graphics"
 	source "package/libvips/Config.in"
 	source "package/opencv/Config.in"
 	source "package/opengl/Config.in"
+	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
diff --git a/package/openjpeg/Config.in b/package/openjpeg/Config.in
new file mode 100644
index 0000000..005d298
--- /dev/null
+++ b/package/openjpeg/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_OPENJPEG
+	bool "openjpeg"
+	help
+	  The OpenJPEG library is an open-source JPEG 2000 codec
+	  written in C.
+
+          http://www.openjpeg.org
diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
new file mode 100644
index 0000000..a8695c1
--- /dev/null
+++ b/package/openjpeg/openjpeg.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	15df7b194a5d8dba0052cd21c17a4dc761149a770a907d73fffb972078c28a87  openjpeg-1.5.2.tar.gz
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
new file mode 100644
index 0000000..c613ba8
--- /dev/null
+++ b/package/openjpeg/openjpeg.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# openjpeg
+#
+################################################################################
+
+OPENJPEG_VERSION = 1.5.2
+OPENJPEG_SITE = http://downloads.sourceforge.net/project/openjpeg.mirror/$(OPENJPEG_VERSION)
+OPENJPEG_LICENSE = BSD-2c
+OPENJPEG_LICENSE_FILES = LICENSE
+# tarball does not contain the generated files
+OPENJPEG_AUTORECONF = YES
+OPENJPEG_INSTALL_STAGING = YES
+OPENJPEG_DEPENDENCIES = host-pkgconf
+OPENJPEG_CONF_OPTS = --disable-lcms1
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+OPENJPEG_DEPENDENCIES += libpng
+OPENJPEG_CONF_OPTS += --enable-png
+else
+OPENJPEG_CONF_OPTS += --disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+OPENJPEG_DEPENDENCIES += tiff
+OPENJPEG_CONF_OPTS += --enable-tiff
+else
+OPENJPEG_CONF_OPTS += --disable-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+OPENJPEG_DEPENDENCIES += lcms2
+OPENJPEG_CONF_OPTS += --enable-lcms2
+else
+OPENJPEG_CONF_OPTS += --disable-lcms2
+endif
+
+$(eval $(autotools-package))

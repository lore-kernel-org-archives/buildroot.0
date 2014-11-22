From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 18:12:22 +0100
Subject: [Buildroot] [git commit] exiv2: new package
Message-ID: <20141201104837.2E9877FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98c6ad3a8a30b4ace69ff3e5b6eac35c0cc71b72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for Exiv2 library and utility to manage image metadata

Exiv2 can be built in GPLv2+ or commercial version. But in commercial
version the Nikon lens name database and the NLS support has to be
disabled for copyright reason.

[Thomas:
 - switch to using the CMake build system, which works better than the
   clunky autoconf + manual Makefile based build system.
 - add missing toolchains dependencies: does not build in static
   library configuration, needs C++, etc.]

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/exiv2/Config.in  |   57 ++++++++++++++++++++++++++++++++++++++++++++++
 package/exiv2/exiv2.hash |    4 +++
 package/exiv2/exiv2.mk   |   47 +++++++++++++++++++++++++++++++++++++
 4 files changed, 109 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a6977ce..e91e95b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -632,6 +632,7 @@ menu "Graphics"
 	source "package/adwaita-icon-theme/Config.in"
 	source "package/atk/Config.in"
 	source "package/cairo/Config.in"
+	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
 	source "package/freetype/Config.in"
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
new file mode 100644
index 0000000..3dc7445
--- /dev/null
+++ b/package/exiv2/Config.in
@@ -0,0 +1,57 @@
+comment "exiv2 needs a toolchain w/ C++, dynamic library"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_EXIV2
+	bool "exiv2"
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Exiv2 is a C++ library and a command line utility to manage
+	  image metadata. It provides fast and easy read and write
+	  access to the Exif, IPTC and XMP metadata of images in
+	  various formats.
+
+	  Exiv2 is available under the GPLv2+ or under a commercial
+	  license.
+
+	  http://www.exiv2.org/
+
+if BR2_PACKAGE_EXIV2
+
+config BR2_PACKAGE_EXIV2_COMMERCIAL
+	bool "Enable commercial"
+	help
+	  Build the commercial version for closed source project.
+
+	  The Nikon lens name database and the NLS support is disabled
+	  for copyright reasons.
+
+	  A commercial license request is needed.
+	  http://www.exiv2.org/download.html#license
+
+config BR2_PACKAGE_EXIV2_PNG
+	bool "PNG image support"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Build with PNG image support
+
+config BR2_PACKAGE_EXIV2_XMP
+	bool "XMP support"
+	select BR2_PACKAGE_EXPAT
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Build with XMP support
+
+comment "xmp support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_EXIV2_LENSDATA
+	bool "Nikon lens name database"
+	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
+	help
+	  Integrate Nikon lens name database.
+
+	  This database is integrated but comes from a thirdparty:
+	  http://www.rottmerhusen.com/objektives/lensid/thirdparty.html.
+
+endif
diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
new file mode 100644
index 0000000..d4f8c60
--- /dev/null
+++ b/package/exiv2/exiv2.hash
@@ -0,0 +1,4 @@
+# From http://www.exiv2.org/download.html
+md5 b8a23dc56a98ede85c00718a97a8d6fc exiv2-0.24.tar.gz
+# Locally calculated
+sha256 f4a443e6c7fb9d9f5e787732f76969a64c72c4c04af69b10ed57f949c2dfef8e exiv2-0.24.tar.gz
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
new file mode 100644
index 0000000..93e36f7
--- /dev/null
+++ b/package/exiv2/exiv2.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# exiv2
+#
+################################################################################
+
+EXIV2_VERSION = 0.24
+EXIV2_SITE = http://www.exiv2.org
+EXIV2_INSTALL_STAGING = YES
+
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
+
+ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2_COMMERCIAL),y)
+EXIV2_LICENSE = commercial
+# NLS support is disabled in commercial version due to the copyright
+# of the translated texts.
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_COMMERCIAL=ON -DEXIV2_ENABLE_NLS=OFF
+else
+EXIV2_LICENSE = GPLv2+
+EXIV2_LICENSE_FILES = COPYING
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2_PNG),y)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_PNG=ON
+EXIV2_DEPENDENCIES += zlib
+else
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_PNG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2_XMP),y)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_XMP=ON -DEXIV2_ENABLE_LIBXMP=ON
+EXIV2_DEPENDENCIES += expat
+else
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_XMP=OFF -DEXIV2_ENABLE_LIBXMP=OFF
+endif
+
+ifeq ($(BR2_ENABLE_LOCALE),y)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_NLS=ON
+else
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_NLS=OFF
+endif
+
+$(eval $(cmake-package))

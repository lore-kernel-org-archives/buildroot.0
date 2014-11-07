From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Fri, 7 Nov 2014 11:48:14 +0100
Subject: [Buildroot] [PATCH v3] exiv2: new package
Message-ID: <1415357294-22601-1-git-send-email-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Exiv2 library and utility to manage image metadata

Exiv2 can be built in GPLv2+ or commercial version. But in commercial
version the Nikon lens name database and the NLS support has to be
disabled for copyright reason.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

---
Changes v2 -> v3:
  - New Config.in option for Nikon lens name database
  - Update/Add comments on copyright in commercial version
  - Commercial licence removed when not selected (copy/paste bug)

Changes v1 -> v2:
  - Make conditional GPLv2+/commercial license
  - Wrap Config.in to 72 columns
  - Leave default value for package source

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/Config.in        |  1 +
 package/exiv2/Config.in  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 package/exiv2/exiv2.hash |  4 ++++
 package/exiv2/exiv2.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 package/exiv2/Config.in
 create mode 100644 package/exiv2/exiv2.hash
 create mode 100644 package/exiv2/exiv2.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..6abf344 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -625,6 +625,7 @@ menu "Graphics"
 	source "package/adwaita-icon-theme/Config.in"
 	source "package/atk/Config.in"
 	source "package/cairo/Config.in"
+	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
 	source "package/freetype/Config.in"
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
new file mode 100644
index 0000000..35f54a0
--- /dev/null
+++ b/package/exiv2/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_EXIV2
+	bool "exiv2"
+	help
+	  Exiv2 is a C++ library and a command line utility to manage
+	  image metadata.
+	  It provides fast and easy read and write access to the Exif,
+	  IPTC and XMP metadata of images in various formats.
+
+	  Exiv2 is available with GPLv2+ or commercial license.
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
+	  for copyright reason.
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
+	help
+	  Build with XMP support
+
+config BR2_PACKAGE_EXIV2_LENSDATA
+	bool "Nikon lens name database"
+	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
+	help
+	  Integrate Nikon lens name database.
+
+	  This database is integrated but comes from thirdparty:
+	  http://www.rottmerhusen.com/objektives/lensid/thirdparty.html 
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
index 0000000..39f713a
--- /dev/null
+++ b/package/exiv2/exiv2.mk
@@ -0,0 +1,39 @@
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
+ifneq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
+EXIV2_CONF_OPTS += --disable-lensdata
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2_COMMERCIAL),y)
+EXIV2_LICENSE = commercial
+# NLS support is disabled in commercial version due to the copyright
+# of the translated texts.
+EXIV2_CONF_OPTS += --enable-commercial --disable-nls
+else
+EXIV2_LICENSE = GPLv2+
+EXIV2_LICENSE_FILES = COPYING
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2_PNG),y)
+EXIV2_CONF_OPTS += --with-zlib=$(STAGING_DIR)
+EXIV2_DEPENDENCIES += zlib
+else
+EXIV2_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2_XMP),y)
+EXIV2_CONF_OPTS += --enable-xmp --with-expat=$(STAGING_DIR)/usr/lib
+EXIV2_DEPENDENCIES += expat
+else
+EXIV2_CONF_OPTS += --disable-xmp
+endif
+
+$(eval $(autotools-package))
-- 
2.1.3

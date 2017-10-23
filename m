From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Mon, 23 Oct 2017 15:26:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] cups-filters: add new package
	cups-filters 1.17.9
Message-ID: <20171023132611.32525-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
v1 -> v2  -  Updated/Fixed indentation in .mk and Config.in
	- Added fontconfig and freetype as dependencies
	- Added entry in DEVELOPERS file
	- Tested with libjpeg and libjpeg-turbo 
	  (Build with libjpeg requires .pc patch for libjpeg)

 Config.in.legacy                       |  1 +
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/cups-filters/Config.in         | 33 ++++++++++++++++
 package/cups-filters/cups-filters.hash |  2 +
 package/cups-filters/cups-filters.mk   | 71 ++++++++++++++++++++++++++++++++++
 6 files changed, 109 insertions(+)
 create mode 100644 package/cups-filters/Config.in
 create mode 100644 package/cups-filters/cups-filters.hash
 create mode 100644 package/cups-filters/cups-filters.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ea69f5a924..94ae490133 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1303,6 +1303,7 @@ config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 
 config BR2_PACKAGE_CUPS_PDFTOPS
 	bool "Pdftops support has been removed from Cups"
+	select BR2_PACKAGE_CUPS_FILTERS
 	select BR2_LEGACY
 	help
 	  Pdftops support has been removed from the cups package
diff --git a/DEVELOPERS b/DEVELOPERS
index f0f83b0f42..354824011f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1161,6 +1161,7 @@ N:	Olivier Matz <olivier.matz@6wind.com>
 F:	package/python-pyelftools/
 
 N:	Olivier Schonken <olivier.schonken@gmail.com>
+F:	package/cups-filters/
 F:	package/ijs/
 F:	package/poppler/
 F:	package/qpdf/
diff --git a/package/Config.in b/package/Config.in
index 55fe80139e..d560023a37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1621,6 +1621,7 @@ menu "Networking applications"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
+	source "package/cups-filters/Config.in"
 	source "package/dante/Config.in"
 	source "package/darkhttpd/Config.in"
 	source "package/dhcp/Config.in"
diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
new file mode 100644
index 0000000000..b3a12b52f4
--- /dev/null
+++ b/package/cups-filters/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_CUPS_FILTERS
+	bool "cups-filters"
+	# needs fork()
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP #qpdf
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS #libglib2
+	depends on BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_QPDF
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	  This project provides backends, filters, and other software
+	  that was once part of the core CUPS distribution but is no
+	  longer maintained by Apple Inc. In addition it contains
+	  additional filters and software developed independently of
+	  Apple, especially filters for the PDF-centric printing
+	  workflow introduced by OpenPrinting and a daemon to browse
+	  Bonjour broadcasts of remote CUPS printers to make these
+	  printers available locally and to provide backward
+	  compatibility to the old CUPS broadcasting and browsing of
+	  CUPS 1.5.x and older.  From CUPS 1.6.0 on, this package is
+	  required for using printer drivers with CUPS under Linux.
+	  With CUPS 1.5.x and earlier this package can be used
+	  optionally to switch over to PDF-based printing.
+
+	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
+
+comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library  support"
+	depends on BR2_USE_MMU && (!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS)
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
new file mode 100644
index 0000000000..da9d31c998
--- /dev/null
+++ b/package/cups-filters/cups-filters.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 95254d7950df4c74d293ed7dfa0b714f51cff329a82da74a4ac976d342bb35ab  cups-filters-1.17.9.tar.gz
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
new file mode 100644
index 0000000000..abcd616cd9
--- /dev/null
+++ b/package/cups-filters/cups-filters.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# cups-filters
+#
+################################################################################
+
+CUPS_FILTERS_VERSION = 1.17.9
+CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
+CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
+CUPS_FILTERS_LICENSE_FILES = COPYING
+
+CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype libjpeg
+
+CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
+	--disable-mutool \
+	--disable-foomatic \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+	--with-sysroot=$(STAGING_DIR) \
+	--with-pdftops=pdftops \
+	--with-jpeg
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+CUPS_FILTERS_CONF_OPTS += --with-png
+CUPS_FILTERS_DEPENDENCIES += libpng
+else
+CUPS_FILTERS_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+CUPS_FILTERS_CONF_OPTS += --with-tiff
+CUPS_FILTERS_DEPENDENCIES += tiff
+else
+CUPS_FILTERS_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+CUPS_FILTERS_CONF_OPTS += --enable-dbus
+CUPS_FILTERS_DEPENDENCIES += dbus
+else
+CUPS_FILTERS_CONF_OPTS += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+CUPS_FILTERS_DEPENDENCIES += avahi
+CUPS_FILTERS_CONF_OPTS += --enable-avahi
+else
+CUPS_FILTERS_CONF_OPTS += --disable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
+CUPS_FILTERS_DEPENDENCIES += ghostscript
+CUPS_FILTERS_CONF_OPTS += --enable-ghostscript
+else
+CUPS_FILTERS_CONF_OPTS += --disable-ghostscript
+endif
+
+ifeq ($(BR2_PACKAGE_IJS),y)
+CUPS_FILTERS_DEPENDENCIES += ijs
+CUPS_FILTERS_CONF_OPTS += --enable-ijs
+else
+CUPS_FILTERS_CONF_OPTS += --disable-ijs
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER),y)
+CUPS_FILTERS_DEPENDENCIES += poppler
+CUPS_FILTERS_CONF_OPTS += --enable-poppler
+else
+CUPS_FILTERS_CONF_OPTS += --disable-poppler
+endif
+
+$(eval $(autotools-package))
-- 
2.11.0

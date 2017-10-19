From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 19 Oct 2017 13:15:02 +0200
Subject: [Buildroot] [PATCH 1/1] cups-filters: add new package cups-filters
	1.17.9
Message-ID: <20171019111502.23419-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 Config.in.legacy                       |  1 +
 package/Config.in                      |  1 +
 package/cups-filters/Config.in         | 31 ++++++++++++++
 package/cups-filters/cups-filters.hash |  2 +
 package/cups-filters/cups-filters.mk   | 78 ++++++++++++++++++++++++++++++++++
 5 files changed, 113 insertions(+)
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
diff --git a/package/Config.in b/package/Config.in
index a27f55aec1..fb6ebeb442 100644
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
index 0000000000..2fd859a6b1
--- /dev/null
+++ b/package/cups-filters/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_CUPS_FILTERS
+       bool "cups-filters"
+       # needs fork()
+       depends on BR2_USE_MMU
+       depends on BR2_INSTALL_LIBSTDCPP #qpdf
+       depends on !BR2_STATIC_LIBS
+       depends on BR2_USE_WCHAR # libglib2
+       depends on BR2_TOOLCHAIN_HAS_THREADS #libglib2
+       depends on BR2_PACKAGE_CUPS
+       select BR2_PACKAGE_LIBGLIB2
+       select BR2_PACKAGE_LCMS2
+       select BR2_PACKAGE_QPDF
+       help
+         This project provides backends, filters, and other software that was
+         once part of the core CUPS distribution but is no longer maintained
+         by Apple Inc. In addition it contains additional filters and software
+         developed independently of Apple, especially filters for the PDF-
+         centric printing workflow introduced by OpenPrinting and a daemon
+         to browse Bonjour broadcasts of remote CUPS printers to make these
+         printers available locally and to provide backward compatibility to
+         the old CUPS broadcasting and browsing of CUPS 1.5.x and older.
+         From CUPS 1.6.0 on, this package is required for using printer drivers
+         with CUPS under Linux. With CUPS 1.5.x and earlier this package can be
+         used optionally to switch over to PDF-based printing.
+
+         http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
+
+comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library  support"
+       depends on BR2_USE_MMU
+       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_STATIC_LIBS
+
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
index 0000000000..52b61e2431
--- /dev/null
+++ b/package/cups-filters/cups-filters.mk
@@ -0,0 +1,78 @@
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
+CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf
+
+CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
+       --disable-mutool \
+       --disable-foomatic \
+       --with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+       --with-sysroot=$(STAGING_DIR) \
+       --with-pdftops=pdftops
+
+
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
+CUPS_FILTERS_CONF_OPTS += --with-jpeg
+CUPS_FILTERS_DEPENDENCIES += libjpeg
+else
+CUPS_FILTERS_CONF_OPTS += --without-jpeg
+endif
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

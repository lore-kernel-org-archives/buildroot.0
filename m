From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 24 Jan 2016 22:47:45 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/cups-filters: Add new package
	cups-filters 1.8.1
Message-ID: <1453668465-30869-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
V4 -> V5
Move comment in Config.in for better indentation
Update cups-filters version to 1.8.1
 Config.in.legacy                       |  1 +
 package/Config.in                      |  1 +
 package/cups-filters/Config.in         | 41 ++++++++++++++++++++++++
 package/cups-filters/cups-filters.hash |  2 ++
 package/cups-filters/cups-filters.mk   | 57 ++++++++++++++++++++++++++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 package/cups-filters/Config.in
 create mode 100644 package/cups-filters/cups-filters.hash
 create mode 100644 package/cups-filters/cups-filters.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 793b116..cf509af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -147,6 +147,7 @@ comment "Legacy options removed in 2016.02"
 
 config BR2_PACKAGE_CUPS_PDFTOPS
 	bool "Pdftops support has been removed from Cups"
+	select BR2_PACKAGE_CUPS_FILTERS_PDFTOPS
 	select BR2_LEGACY
 	help
 	  Pdftops support has been removed from the cups package
diff --git a/package/Config.in b/package/Config.in
index 09c2b40..999145c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1310,6 +1310,7 @@ menu "Networking applications"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
+	source "package/cups-filters/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dhcp/Config.in"
 endif
diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
new file mode 100644
index 0000000..23bfae5
--- /dev/null
+++ b/package/cups-filters/Config.in
@@ -0,0 +1,41 @@
+comment "cups-filters needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_CUPS_FILTERS
+	bool "cups-filters"
+	# needs fork()
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_IJS
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_POPPLER
+	select BR2_PACKAGE_QPDF
+	help
+	  This project provides backends, filters, and other software that was
+	  once part of the core CUPS distribution but is no longer maintained
+	  by Apple Inc. In addition it contains additional filters and software
+	  developed independently of Apple, especially filters for the PDF-
+	  centric printing workflow introduced by OpenPrinting and a daemon
+	  to browse Bonjour broadcasts of remote CUPS printers to make these
+	  printers available locally and to provide backward compatibility to
+	  the old CUPS broadcasting and browsing of CUPS 1.5.x and older.
+	  From CUPS 1.6.0 on, this package is required for using printer drivers
+	  with CUPS under Linux. With CUPS 1.5.x and earlier this package can be
+	  used optionally to switch over to PDF-based printing.
+
+	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
+
+if BR2_PACKAGE_CUPS_FILTERS
+
+config BR2_PACKAGE_CUPS_FILTERS_PDFTOPS
+	bool "pdftops support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Enable pdftops support
+
+comment "pdftops support needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+endif
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
new file mode 100644
index 0000000..fd45780
--- /dev/null
+++ b/package/cups-filters/cups-filters.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	556a7dcc644fdc9d31b73672046cd4afcf323d0d9f52cf9793c624c0083143bf  cups-filters-1.8.1.tar.gz
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
new file mode 100644
index 0000000..c14f1b4
--- /dev/null
+++ b/package/cups-filters/cups-filters.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# cups-filters
+#
+################################################################################
+
+CUPS_FILTERS_VERSION = 1.8.1
+CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
+CUPS_FILTERS_LICENSE = GPLv2+
+CUPS_FILTERS_LICENSE_FILES = COPYING
+
+CUPS_FILTERS_DEPENDENCIES = cups libglib2 ijs lcms2 poppler qpdf
+
+CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+	--with-sysroot=$(STAGING_DIR)
+
+ifeq ($(BR2_PACKAGE_CUPS_FILTERS_PDFTOPS),y)
+CUPS_FILTERS_CONF_OPTS += --with-pdftops=pdftops
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+CUPS_FILTERS_CONF_OPTS += --with-jpeg
+CUPS_FILTERS_DEPENDENCIES += jpeg
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
+$(eval $(autotools-package))
-- 
1.9.1

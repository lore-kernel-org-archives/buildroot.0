From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 22 Mar 2015 16:10:49 +0200
Subject: [Buildroot] [PATCH 8/8] package/cups-filters: Add new package
	cups-filters 1.0.67
In-Reply-To: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
References: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1427033449-20179-8-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in                      |  1 +
 package/cups-filters/Config.in         | 44 ++++++++++++++++++++++
 package/cups-filters/cups-filters.hash |  2 +
 package/cups-filters/cups-filters.mk   | 67 ++++++++++++++++++++++++++++++++++
 4 files changed, 114 insertions(+)
 create mode 100644 package/cups-filters/Config.in
 create mode 100644 package/cups-filters/cups-filters.hash
 create mode 100644 package/cups-filters/cups-filters.mk

diff --git a/package/Config.in b/package/Config.in
index 64a7655..7ec6c9b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1096,6 +1096,7 @@ menu "Networking applications"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
+	source "package/cups-filters/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dhcp/Config.in"
 endif
diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
new file mode 100644
index 0000000..730abe7
--- /dev/null
+++ b/package/cups-filters/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_CUPS_FILTERS
+	bool "cups-filters"
+	depends on BR2_PACKAGE_CUPS
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
+	  http://hplipopensource.com/
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
+config BR2_PACKAGE_CUPS_FILTERS_AVAHI
+	bool "avahi support"
+	depends on !BR2_STATIC_LIBS # avahi
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	help
+	  Enable Avahi support.
+	  Select this if you want cups to support Bonjour protocol.
+
+endif
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
new file mode 100644
index 0000000..be80cf0
--- /dev/null
+++ b/package/cups-filters/cups-filters.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+md5	d3b0522e176b99889778162c26c7e476	cups-filters-1.0.67.tar.gz
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
new file mode 100644
index 0000000..3fa94e3
--- /dev/null
+++ b/package/cups-filters/cups-filters.mk
@@ -0,0 +1,67 @@
+#############################################################
+#
+# cups-filters
+#
+#############################################################
+CUPS_FILTERS_VERSION = 1.0.67
+CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters/
+CUPS_FILTERS_SOURCE = cups-filters-$(CUPS_FILTERS_VERSION).tar.gz
+CUPS_FILTERS_INSTALL_STAGING = NO
+CUPS_FILTERS_LIBTOOL_PATCH = YES
+CUPS_FILTERS_AUTORECONF = NO
+
+CUPS_FILTERS_CONF_OPTS = --disable-avahi \
+                        --disable-imagefilters \
+                        --with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+                        --without-png \
+                        --with-sysroot=$(STAGING_DIR)
+
+CUPS_FILTERS_DEPENDENCIES = cups libglib2 ijs lcms2 poppler qpdf
+
+ifeq ($(BR2_PACKAGE_CUPS_FILTERS_PDFTOPS),y)
+	CUPS_FILTERS_CONF_OPTS += --with-pdftops=pdftops
+endif
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	CUPS_FILTERS_CONF_OPTS += --disable-shared \
+				  --enable-static
+else
+	CUPS_FILTERS_CONF_OPTS += --enable-shared
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+	CUPS_FILTERS_CONF_OPTS += --with-jpeg
+	CUPS_FILTERS_DEPENDENCIES += jpeg
+else
+	CUPS_FILTERS_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+	CUPS_FILTERS_CONF_OPTS += --with-png
+	CUPS_FILTERS_DEPENDENCIES += libpng
+else
+	CUPS_FILTERS_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+	CUPS_FILTERS_CONF_OPTS += --with-tiff
+	CUPS_FILTERS_DEPENDENCIES += tiff
+else
+	CUPS_FILTERS_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	CUPS_FILTERS_CONF_OPTS += --enable-dbus
+	CUPS_FILTERS_DEPENDENCIES += dbus
+else
+	CUPS_FILTERS_CONF_OPTS += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS_FILTERS_AVAHI),y)
+	CUPS_FILTERS_DEPENDENCIES += avahi
+	CUPS_FILTERS_CONF_OPTS += --enable-avahi
+else
+	CUPS_FILTERS_CONF_OPTS += --disable-avahi
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1

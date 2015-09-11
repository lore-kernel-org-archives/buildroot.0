From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri, 11 Sep 2015 12:05:11 +0200
Subject: [Buildroot] [PATCH 4/4] package/cups-filters: Add new package
	cups-filters 1.0.74
In-Reply-To: <1441965911-22138-1-git-send-email-olivier.schonken@gmail.com>
References: <1441965911-22138-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1441965911-22138-5-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --enable-xpdf-headers to poppler.mk. Required for succesfull
build of cups-filters.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in                      |  1 +
 package/cups-filters/Config.in         | 47 ++++++++++++++++++++++++
 package/cups-filters/cups-filters.hash |  2 ++
 package/cups-filters/cups-filters.mk   | 65 ++++++++++++++++++++++++++++++++++
 package/poppler/poppler.mk             |  4 ++-
 5 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 package/cups-filters/Config.in
 create mode 100644 package/cups-filters/cups-filters.hash
 create mode 100644 package/cups-filters/cups-filters.mk

diff --git a/package/Config.in b/package/Config.in
index 030477a..3b15ab0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1218,6 +1218,7 @@ menu "Networking applications"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
+	source "package/cups-filters/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dhcp/Config.in"
 endif
diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
new file mode 100644
index 0000000..cb70192
--- /dev/null
+++ b/package/cups-filters/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_CUPS_FILTERS
+	bool "cups-filters"
+	depends on BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_IJS
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_POPPLER
+	select BR2_PACKAGE_QPDF
+	# needs fork()
+	depends on BR2_USE_MMU
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
+	depends on !BR2_TOOLCHAIN_HAS_THREADS # avahi
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	help
+	  Enable Avahi support.
+	  Select this if you want cups to support Bonjour protocol.
+
+endif
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
new file mode 100644
index 0000000..cb300d4
--- /dev/null
+++ b/package/cups-filters/cups-filters.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	c091938a7c25a600138c501075b222611ef333157e2554376bb60189032591c5  cups-filters-1.0.74.tar.gz
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
new file mode 100644
index 0000000..aba3861
--- /dev/null
+++ b/package/cups-filters/cups-filters.mk
@@ -0,0 +1,65 @@
+#############################################################
+#
+# cups-filters
+#
+#############################################################
+CUPS_FILTERS_VERSION = 1.0.74
+CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters/
+CUPS_FILTERS_LICENSE = GPLv2+
+CUPS_FILTERS_LICENSE_FILES = COPYING
+
+CUPS_FILTERS_DEPENDENCIES = cups libglib2 ijs lcms2 poppler qpdf
+
+CUPS_FILTERS_CONF_OPTS = --disable-avahi \
+                        --disable-imagefilters \
+                        --with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+                        --without-png \
+                        --with-sysroot=$(STAGING_DIR)
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
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 6142cba..b457048 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -11,7 +11,9 @@ POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
-POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
+POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
+	--enable-xpdf-headers
+
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 POPPLER_CONF_OPTS += --enable-cms=lcms2
-- 
1.9.1

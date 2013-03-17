From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 17 Mar 2013 17:59:32 +0200
Subject: [Buildroot] [PATCH 2/2] Added package foomatic-filters
In-Reply-To: <1363535972-29959-1-git-send-email-olivier.schonken@gmail.com>
References: <1363535972-29959-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1363535972-29959-2-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Foomatic is a database-driven system for integrating free software
printer drivers with common spoolers under Unix. It supports CUPS,
LPRng, LPD, GNUlpr, Solaris LP, PPR, PDQ, CPS, and direct printing
with every free software printer driver known to us and every
printer known to work with these drivers.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in                            |    1 +
 package/foomatic-filters/Config.in           |   14 ++++++++++++++
 package/foomatic-filters/foomatic-filters.mk |   22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/foomatic-filters/Config.in
 create mode 100644 package/foomatic-filters/foomatic-filters.mk

diff --git a/package/Config.in b/package/Config.in
index 78bd745..f8866a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -635,6 +635,7 @@ source "package/ctorrent/Config.in"
 source "package/conntrack-tools/Config.in"
 menu "cups (common unix printing system)"
 source "package/cups/Config.in"
+source "package/foomatic-filters/Config.in"
 source "package/hplip/Config.in"
 endmenu #cups
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/foomatic-filters/Config.in b/package/foomatic-filters/Config.in
new file mode 100644
index 0000000..ab9eb48
--- /dev/null
+++ b/package/foomatic-filters/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FOOMATIC_FILTERS
+	bool "foomatic_filters"
+	depends on BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_ENSCRIPT
+	help
+	  Foomatic Filters
+	  Foomatic is a database-driven system for integrating free software 
+	  printer drivers with common spoolers under Unix. It supports CUPS, 
+	  LPRng, LPD, GNUlpr, Solaris LP, PPR, PDQ, CPS, and direct printing 
+	  with every free software printer driver known to us and every 
+	  printer known to work with these drivers.
+	  
+	  http://www.linuxfoundation.org/tags/openprinting
diff --git a/package/foomatic-filters/foomatic-filters.mk b/package/foomatic-filters/foomatic-filters.mk
new file mode 100644
index 0000000..5003a17
--- /dev/null
+++ b/package/foomatic-filters/foomatic-filters.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# foomatic_filters
+#
+#############################################################
+FOOMATIC_FILTERS_VERSION = 4.0.17
+FOOMATIC_FILTERS_SITE = http://www.openprinting.org/download/foomatic/
+FOOMATIC_FILTERS_AUTORECONF = YES
+FOOMATIC_FILTERS_SOURCE = foomatic-filters-$(FOOMATIC_FILTERS_VERSION).tar.gz
+FOOMATIC_FILTERS_DEPENDENCIES = cups libusb enscript
+FOOMATIC_FILTERS_LICENSE = GPLv2
+FOOMATIC_FILTERS_LICENSE_FILES = COPYING
+FOOMATIC_FILTERS_CONF_OPT = --with-file-converter=enscript
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+	FOOMATIC_FILTERS_CONF_OPT += --enable-dbus 
+	FOOMATIC_FILTERS_DEPENDENCIES += dbus
+else
+	FOOMATIC_FILTERS_CONF_OPT += --disable-dbus  
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Mar 2013 00:37:11 +0100
Subject: [Buildroot] [PATCH] Added package foomatic-filters
In-Reply-To: <20130325000420.005eaf04@skate>
References: <20130325000420.005eaf04@skate>
Message-ID: <1364168231-4752-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Olivier Schonken <olivier.schonken@gmail.com>

Foomatic is a database-driven system for integrating free software
printer drivers with common spoolers under Unix. It supports CUPS,
LPRng, LPD, GNUlpr, Solaris LP, PPR, PDQ, CPS, and direct printing
with every free software printer driver known to us and every
printer known to work with these drivers.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
[yann.morin.1998 at free.fr: space-damage, licensing terms, unneeded vars]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - propagate libusb dependency  (Thomas)
---
 package/Config.in                            |    1 +
 package/foomatic-filters/Config.in           |   18 ++++++++++++++++++
 package/foomatic-filters/foomatic-filters.mk |   20 ++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/foomatic-filters/Config.in
 create mode 100644 package/foomatic-filters/foomatic-filters.mk

diff --git a/package/Config.in b/package/Config.in
index 82e6c5c..74537e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -645,6 +645,7 @@ source "package/connman/Config.in"
 source "package/ctorrent/Config.in"
 source "package/conntrack-tools/Config.in"
 source "package/cups/Config.in"
+source "package/foomatic-filters/Config.in"
 source "package/hplip/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
diff --git a/package/foomatic-filters/Config.in b/package/foomatic-filters/Config.in
new file mode 100644
index 0000000..aa056b9
--- /dev/null
+++ b/package/foomatic-filters/Config.in
@@ -0,0 +1,18 @@
+comment "foomatic-filters requires a toolchain with support for THREADS"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_FOOMATIC_FILTERS
+	bool "foomatic_filters"
+	depends on BR2_PACKAGE_CUPS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
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
+	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/database/foomatic
diff --git a/package/foomatic-filters/foomatic-filters.mk b/package/foomatic-filters/foomatic-filters.mk
new file mode 100644
index 0000000..b62951b
--- /dev/null
+++ b/package/foomatic-filters/foomatic-filters.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# foomatic_filters
+#
+#############################################################
+FOOMATIC_FILTERS_VERSION = 4.0.17
+FOOMATIC_FILTERS_SITE = http://www.openprinting.org/download/foomatic
+FOOMATIC_FILTERS_LICENSE = GPLv2+
+FOOMATIC_FILTERS_LICENSE_FILES = COPYING
+FOOMATIC_FILTERS_DEPENDENCIES = cups libusb enscript
+
+FOOMATIC_FILTERS_CONF_OPT = --with-file-converter=enscript
+ifeq ($(BR2_PACKAGE_DBUS),y)
+FOOMATIC_FILTERS_CONF_OPT += --enable-dbus
+FOOMATIC_FILTERS_DEPENDENCIES += dbus
+else
+FOOMATIC_FILTERS_CONF_OPT += --disable-dbus
+endif
+
+$(eval $(autotools-package))
-- 
1.7.2.5

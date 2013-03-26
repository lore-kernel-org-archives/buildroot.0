From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Mar 2013 22:53:10 +0100
Subject: [Buildroot] [git commit] package: add foomatic-filters
Message-ID: <20130326221004.B6BB09B314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2320f6a309c405124aa3958948c3577378d07968
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Foomatic is a database-driven system for integrating free software
printer drivers with common spoolers under Unix. It supports CUPS,
LPRng, LPD, GNUlpr, Solaris LP, PPR, PDQ, CPS, and direct printing
with every free software printer driver known to us and every
printer known to work with these drivers.

[Peter: minor whitespace fixes]
Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
[yann.morin.1998 at free.fr: space-damage, licensing terms, unneeded vars]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                            |    1 +
 package/foomatic-filters/Config.in           |   18 ++++++++++++++++++
 package/foomatic-filters/foomatic-filters.mk |   22 ++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

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
index 0000000..ad7ab7a
--- /dev/null
+++ b/package/foomatic-filters/foomatic-filters.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# foomatic_filters
+#
+#############################################################
+
+FOOMATIC_FILTERS_VERSION = 4.0.17
+FOOMATIC_FILTERS_SITE = http://www.openprinting.org/download/foomatic
+FOOMATIC_FILTERS_LICENSE = GPLv2+
+FOOMATIC_FILTERS_LICENSE_FILES = COPYING
+FOOMATIC_FILTERS_DEPENDENCIES = cups libusb enscript
+
+FOOMATIC_FILTERS_CONF_OPT = --with-file-converter=enscript
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+FOOMATIC_FILTERS_CONF_OPT += --enable-dbus
+FOOMATIC_FILTERS_DEPENDENCIES += dbus
+else
+FOOMATIC_FILTERS_CONF_OPT += --disable-dbus
+endif
+
+$(eval $(autotools-package))

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:45:31 +0100
Subject: [Buildroot] [git commit] foomatic-filters: remove deprecated
Message-ID: <20160315214849.12276817C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75945ddc54b425953b1322bd5fce1762f14f2ea3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been deprecated for a year now so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                             |  6 ++++++
 package/Config.in                            |  1 -
 package/foomatic-filters/Config.in           | 23 -----------------------
 package/foomatic-filters/foomatic-filters.mk | 22 ----------------------
 4 files changed, 6 insertions(+), 46 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 828d0ac..e03e30f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_FOOMATIC_FILTERS
+	bool "foomatic-filters"
+	select BR2_LEGACY
+	help
+	  The foomatic-filters package was removed.
+
 config BR2_PACKAGE_SAMBA
 	bool "samba"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 16e4957..2401867 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1365,7 +1365,6 @@ endif
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
 	source "package/fmc/Config.in"
-	source "package/foomatic-filters/Config.in"
 	source "package/fping/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gutenprint/Config.in"
diff --git a/package/foomatic-filters/Config.in b/package/foomatic-filters/Config.in
deleted file mode 100644
index 0571eb9..0000000
--- a/package/foomatic-filters/Config.in
+++ /dev/null
@@ -1,23 +0,0 @@
-comment "foomatic-filters needs a toolchain w/ threads"
-	# because of cups security issues
-	depends on BR2_DEPRECATED_SINCE_2015_05
-	depends on BR2_PACKAGE_CUPS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_FOOMATIC_FILTERS
-	bool "foomatic_filters"
-	depends on BR2_PACKAGE_CUPS
-	# because of cups security issues
-	depends on BR2_DEPRECATED_SINCE_2015_05
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_ENSCRIPT
-	help
-	  Foomatic Filters
-	  Foomatic is a database-driven system for integrating free software
-	  printer drivers with common spoolers under Unix. It supports CUPS,
-	  LPRng, LPD, GNUlpr, Solaris LP, PPR, PDQ, CPS, and direct printing
-	  with every free software printer driver known to us and every
-	  printer known to work with these drivers.
-
-	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/database/foomatic
diff --git a/package/foomatic-filters/foomatic-filters.mk b/package/foomatic-filters/foomatic-filters.mk
deleted file mode 100644
index c7d6298..0000000
--- a/package/foomatic-filters/foomatic-filters.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# foomatic-filters
-#
-################################################################################
-
-FOOMATIC_FILTERS_VERSION = 4.0.17
-FOOMATIC_FILTERS_SITE = http://www.openprinting.org/download/foomatic
-FOOMATIC_FILTERS_LICENSE = GPLv2+
-FOOMATIC_FILTERS_LICENSE_FILES = COPYING
-FOOMATIC_FILTERS_DEPENDENCIES = cups libusb enscript
-FOOMATIC_FILTERS_CONF_OPTS = --with-file-converter=enscript
-FOOMATIC_FILTERS_CONF_ENV = ac_cv_path_ENSCRIPT="/usr/bin/enscript"
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-FOOMATIC_FILTERS_CONF_OPTS += --enable-dbus
-FOOMATIC_FILTERS_DEPENDENCIES += dbus
-else
-FOOMATIC_FILTERS_CONF_OPTS += --disable-dbus
-endif
-
-$(eval $(autotools-package))

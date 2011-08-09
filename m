From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue,  9 Aug 2011 19:39:20 +0200
Subject: [Buildroot] [PATCH 1/2] package: add libftdi support
Message-ID: <1312911561-23942-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

needed by openocd

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Patrice Vilchez <patrice.vilchez@atmel.com>
---
 package/Config.in                                  |    1 +
 package/libftdi/Config.in                          |   18 ++++++++
 .../libftdi/libftdi-0.19-01_pkgconfig_libusb.patch |   47 ++++++++++++++++++++
 package/libftdi/libftdi.mk                         |   23 ++++++++++
 4 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 package/libftdi/Config.in
 create mode 100644 package/libftdi/libftdi-0.19-01_pkgconfig_libusb.patch
 create mode 100644 package/libftdi/libftdi.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..1747620 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -301,6 +301,7 @@ menu "Hardware handling"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
+source "package/libftdi/Config.in"
 source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libusb/Config.in"
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
new file mode 100644
index 0000000..6cedc34
--- /dev/null
+++ b/package/libftdi/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBFTDI
+	bool "libftdi"
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Userspace access to FTDI USB interface chips
+
+	  http://www.intra2net.com/en/developer/libftdi/index.php
+
+if BR2_PACKAGE_LIBFTDI
+
+config BR2_PACKAGE_LIBTFDI_CPP
+	depends on BR2_INSTALL_LIBSTDCPP
+	bool "C++ Binding"
+	help
+	  C++ Binding
+
+endif # BR2_PACKAGE_LIBFTDI
diff --git a/package/libftdi/libftdi-0.19-01_pkgconfig_libusb.patch b/package/libftdi/libftdi-0.19-01_pkgconfig_libusb.patch
new file mode 100644
index 0000000..389291d
--- /dev/null
+++ b/package/libftdi/libftdi-0.19-01_pkgconfig_libusb.patch
@@ -0,0 +1,47 @@
+---
+ configure.in |   35 +++++++++++------------------------
+ 1 file changed, 11 insertions(+), 24 deletions(-)
+
+--- a/configure.in
++++ b/configure.in
+@@ -8,30 +8,17 @@
+ AM_PROG_LIBTOOL
+ AC_PROG_CXX
+ 
+-dnl check for libusb-config
+-AC_CHECK_TOOL(HAVELIBUSB, libusb-config)
+-
+-if test ! -z "$HAVELIBUSB"; then
+-   LIBUSB_CFLAGS=`$HAVELIBUSB --cflags`
+-   LIBUSB_LIBS=`$HAVELIBUSB --libs`
+-
+-   CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
+-   LIBS="$LIBS $LIBUSB_LIBS"
+-else
+-   AC_MSG_ERROR([*** libusb-config not found. You need a working libusb installation.])
+-fi
+-
+-dnl check for version of libusb
+-AC_MSG_CHECKING([if libusb version is >= 0.1.7])
+-libusb_version_needed="1007"
+-libusb_version=`$HAVELIBUSB --version | sed -e "s/libusb //" | awk 'BEGIN { FS = "."; } { printf "%d", ($''1 * 1000 + $''2) * 1000 + $''3;}'`
++dnl check for libusb
++PKG_CHECK_MODULES(LIBUSB, libusb >= 0.1.11)
++CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
++LIBS="$LIBS $LIBUSB_LIBS"
+ 
+-if test $libusb_version -lt $libusb_version_needed; then
+-   AC_MSG_RESULT(no)
+-   AC_MSG_ERROR([*** libusb is too old ($libusb_version). You need a libusb installation newer or equal to 0.1.7.])
+-else
+-   AC_MSG_RESULT(yes)
+-fi
++dnl Check for recent pkg-config which supports Requires.private
++case `$PKG_CONFIG --version` in
++0.?|0.1[0-7]) PKGCONFIG_REQUIRES="Requires"; ;;
++*) PKGCONFIG_REQUIRES="Requires.private"; ;;
++esac
++AC_SUBST(PKGCONFIG_REQUIRES)
+ 
+ ENABLE_ASYNC_MODE=0
+ AC_ARG_WITH(async-mode,
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
new file mode 100644
index 0000000..315fe16
--- /dev/null
+++ b/package/libftdi/libftdi.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# libftdi
+#
+#############################################################
+LIBFTDI_VERSION = 0.19
+LIBFTDI_SOURCE = libftdi-$(LIBFTDI_VERSION).tar.gz
+LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download/
+LIBFTDI_DEPENDENCIES = libusb-compat libusb
+LIBFTDI_INSTALL_STAGING = YES
+
+LIBFTDI_AUTORECONF = YES
+
+LIBFDTI_CONF_OPT = --without-examples
+
+# configure detect it automaticaly so we need to force it
+ifeq ($(BR2_PACKAGE_LIBTFDI_CPP),y)
+LIBFDTI_CONF_OPT += --enable-libftdipp
+else
+LIBFDTI_CONF_OPT += --disable-libftdipp
+endif
+
+$(eval $(call AUTOTARGETS,package,libftdi))
-- 
1.7.5.4

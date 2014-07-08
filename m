From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue,  8 Jul 2014 15:57:07 +0200
Subject: [Buildroot] [RFC 4/9] at-spi2-core: new package
In-Reply-To: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1404827832-1101-5-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ati-spi2-core package provides Assistive Technology Service
Provider Interface (dbus core). This package is a requirement for Gtk+
3.0.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 package/at-spi2-core/Config.in                     | 17 +++++
 ...se-AC_CHECK_ALIGNOF-instead-of-custom-DBI.patch | 79 ++++++++++++++++++++++
 package/at-spi2-core/at-spi2-core.mk               | 24 +++++++
 4 files changed, 121 insertions(+)
 create mode 100644 package/at-spi2-core/Config.in
 create mode 100644 package/at-spi2-core/at-spi2-core-0001-configure-use-AC_CHECK_ALIGNOF-instead-of-custom-DBI.patch
 create mode 100644 package/at-spi2-core/at-spi2-core.mk

diff --git a/package/Config.in b/package/Config.in
index 8e1c391..1ec108a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -587,6 +587,7 @@ endmenu
 
 menu "Graphics"
 	source "package/atk/Config.in"
+	source "package/at-spi2-core/Config.in"
 	source "package/cairo/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
new file mode 100644
index 0000000..8aa40c8
--- /dev/null
+++ b/package/at-spi2-core/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_AT_SPI2_CORE
+	bool "at-spi2-core"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXTST
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  Assistive Technology Service Provider Interface (dbus core)
+
+comment "at-spi2-core needs a toolchain w/wchar, threads"
+	depends on !BR2_USE_MMU
+	depends on !BR2_PACKAGE_XORG7
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/at-spi2-core/at-spi2-core-0001-configure-use-AC_CHECK_ALIGNOF-instead-of-custom-DBI.patch b/package/at-spi2-core/at-spi2-core-0001-configure-use-AC_CHECK_ALIGNOF-instead-of-custom-DBI.patch
new file mode 100644
index 0000000..fd264a4
--- /dev/null
+++ b/package/at-spi2-core/at-spi2-core-0001-configure-use-AC_CHECK_ALIGNOF-instead-of-custom-DBI.patch
@@ -0,0 +1,79 @@
+From 03ffeeb29389b547d555a8d1d4a2b16eabfc3385 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 25 Jun 2014 19:45:28 +0200
+Subject: [PATCH] configure: use AC_CHECK_ALIGNOF() instead of custom
+ DBIND_CHECK_ALIGNOF()
+
+DBIND_CHECK_ALIGNOF() is a custom autoconf macro from at-spi2-core
+that tests the alignment required on the current platform for a given
+C type. Unfortunately, this macro uses AC_TRY_RUN(), which requires
+running a test program on the target platform, which is fundamentally
+incompatible with cross-compilation.
+
+Therefore, this patch switches the configure.ac code to use
+AC_CHECK_ALIGNOF() instead, which is available in the standard set of
+autoconf macros, and is able to test the required alignment for C
+types without using AC_TRY_RUN(). Consequently, it adjusts the
+dbind/dbind-config.h.in definitions to use the definitions created by
+the AC_CHECK_ALIGNOF() macros, which are not substituted by autoconf,
+but directly available from config.h.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac            | 18 ++++++++++--------
+ dbind/dbind-config.h.in | 16 ++++++++--------
+ 2 files changed, 18 insertions(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a330453..b997301 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -196,14 +196,16 @@ AC_SUBST(LIBTOOL_EXPORT_OPTIONS)
+ dnl find sizes & alignments
+ orig_CPPFLAGS=$CPPFLAGS
+ CPPFLAGS="$CPPFLAGS $DBUS_CFLAGS"
+-DBIND_CHECK_ALIGNOF(char)
+-DBIND_CHECK_ALIGNOF(dbus_bool_t)
+-DBIND_CHECK_ALIGNOF(dbus_int16_t)
+-DBIND_CHECK_ALIGNOF(dbus_int32_t)
+-DBIND_CHECK_ALIGNOF(dbus_int64_t)
+-DBIND_CHECK_ALIGNOF(double)
+-DBIND_CHECK_ALIGNOF(dbind_pointer)
+-DBIND_CHECK_ALIGNOF(dbind_struct)
++AC_CHECK_ALIGNOF(char)
++AC_CHECK_ALIGNOF(dbus_bool_t, [#include <dbus/dbus.h>])
++AC_CHECK_ALIGNOF(dbus_int16_t, [#include <dbus/dbus.h>])
++AC_CHECK_ALIGNOF(dbus_int32_t, [#include <dbus/dbus.h>])
++AC_CHECK_ALIGNOF(dbus_int64_t, [#include <dbus/dbus.h>])
++AC_CHECK_ALIGNOF(double, [#include <dbus/dbus.h>])
++AC_CHECK_ALIGNOF(dbind_pointer, [AC_INCLUDES_DEFAULT
++typedef void *dbind_pointer;])
++AC_CHECK_ALIGNOF(dbind_struct, [AC_INCLUDES_DEFAULT
++typedef struct {char s1;} dbind_struct;])
+ 
+ GTK_DOC_CHECK([1.09])
+ 
+diff --git a/dbind/dbind-config.h.in b/dbind/dbind-config.h.in
+index 3da421e..779c4c6 100644
+--- a/dbind/dbind-config.h.in
++++ b/dbind/dbind-config.h.in
+@@ -1,8 +1,8 @@
+-#define DBIND_ALIGNOF_CHAR          @DBIND_ALIGNOF_CHAR@
+-#define DBIND_ALIGNOF_DBIND_POINTER @DBIND_ALIGNOF_DBIND_POINTER@
+-#define DBIND_ALIGNOF_DBIND_STRUCT  @DBIND_ALIGNOF_DBIND_STRUCT@
+-#define DBIND_ALIGNOF_DBUS_BOOL_T   @DBIND_ALIGNOF_DBUS_BOOL_T@
+-#define DBIND_ALIGNOF_DBUS_INT16_T  @DBIND_ALIGNOF_DBUS_INT16_T@
+-#define DBIND_ALIGNOF_DBUS_INT32_T  @DBIND_ALIGNOF_DBUS_INT32_T@
+-#define DBIND_ALIGNOF_DBUS_INT64_T  @DBIND_ALIGNOF_DBUS_INT64_T@
+-#define DBIND_ALIGNOF_DOUBLE        @DBIND_ALIGNOF_DOUBLE@
++#define DBIND_ALIGNOF_CHAR          ALIGNOF_CHAR
++#define DBIND_ALIGNOF_DBIND_POINTER ALIGNOF_DBIND_POINTER
++#define DBIND_ALIGNOF_DBIND_STRUCT  ALIGNOF_DBIND_STRUCT
++#define DBIND_ALIGNOF_DBUS_BOOL_T   ALIGNOF_DBUS_BOOL_T
++#define DBIND_ALIGNOF_DBUS_INT16_T  ALIGNOF_DBUS_INT16_T
++#define DBIND_ALIGNOF_DBUS_INT32_T  ALIGNOF_DBUS_INT32_T
++#define DBIND_ALIGNOF_DBUS_INT64_T  ALIGNOF_DBUS_INT64_T
++#define DBIND_ALIGNOF_DOUBLE        ALIGNOF_DOUBLE
+-- 
+2.0.0
+
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
new file mode 100644
index 0000000..73a0ad3
--- /dev/null
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# at-spi2-core
+#
+################################################################################
+
+AT_SPI2_CORE_VERSION_MAJOR = 2.10
+AT_SPI2_CORE_VERSION_MINOR = 2
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).$(AT_SPI2_CORE_VERSION_MINOR)
+AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
+AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
+AT_SPI2_CORE_LICENSE = LGPLv2+
+AT_SPI2_CORE_LICENSE_FILES = COPYING
+AT_SPI2_CORE_INSTALL_STAGING = YES
+AT_SPI2_CORE_INSTALL_TARGET = YES
+AT_SPI2_CORE_AUTORECONF = YES
+
+AT_SPI2_CORE_CONF_OPT = --disable-introspection \
+			--disable-xevie
+
+AT_SPI2_CORE_DEPENDENCIES = host-pkgconf libglib2 dbus xlib_libXi xlib_libXtst \
+		host-intltool
+
+$(eval $(autotools-package))
-- 
2.0.1

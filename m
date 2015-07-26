From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:42 +0200
Subject: [Buildroot] [RFC 32/37] package/libedbus: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-33-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libedbus is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/libedbus/Config.in   | 44 --------------------------------------------
 package/libedbus/libedbus.mk | 37 -------------------------------------
 4 files changed, 7 insertions(+), 82 deletions(-)
 delete mode 100644 package/libedbus/Config.in
 delete mode 100644 package/libedbus/libedbus.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 28e5e20..785db24 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBEDBUS
+	bool "libedbus package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libedbus package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBEFREET
 	bool "libefreet package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 622eae0..bd940bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,7 +245,6 @@ endif
 	source "package/libecore/Config.in"
 	source "package/libeet/Config.in"
 	source "package/libeina/Config.in"
-	source "package/libedbus/Config.in"
 	source "package/libelementary/Config.in"
 	source "package/libevas/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
diff --git a/package/libedbus/Config.in b/package/libedbus/Config.in
deleted file mode 100644
index d3752ee..0000000
--- a/package/libedbus/Config.in
+++ /dev/null
@@ -1,44 +0,0 @@
-config BR2_PACKAGE_LIBEDBUS
-	bool "libedbus"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_DBUS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_USE_MMU # dbus, efl
-	depends on BR2_USE_WCHAR # efl
-	help
-	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
-	  easily used by EFL applications, automatically providing
-	  Ecore/main loop integration, as well as Eina data types.
-
-	  http://trac.enlightenment.org/e/wiki/E_Dbus
-
-if BR2_PACKAGE_LIBEDBUS
-
-config BR2_PACKAGE_LIBEDBUS_BLUEZ
-	bool "bluez support"
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
-	select BR2_PACKAGE_BLUEZ_UTILS
-	help
-	  Bluetooth support.
-
-comment "bluez support needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_LIBEDBUS_CONNMAN
-	bool "connman support"
-	depends on BR2_PACKAGE_CONNMAN
-	help
-	  Connection manager support.
-
-config BR2_PACKAGE_LIBEDBUS_NOTIFY
-	bool "notify support"
-	help
-	  Notify support.
-
-endif
-
-comment "libedbus needs a toolchain w/ threads, wchar"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/libedbus/libedbus.mk b/package/libedbus/libedbus.mk
deleted file mode 100644
index 634ceaf..0000000
--- a/package/libedbus/libedbus.mk
+++ /dev/null
@@ -1,37 +0,0 @@
-################################################################################
-#
-# libedbus
-#
-################################################################################
-
-LIBEDBUS_VERSION = 1.7.10
-LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
-LIBEDBUS_SITE = http://download.enlightenment.org/releases
-LIBEDBUS_LICENSE = BSD-2c
-LIBEDBUS_LICENSE_FILES = COPYING
-
-LIBEDBUS_INSTALL_STAGING = YES
-
-LIBEDBUS_DEPENDENCIES = host-pkgconf dbus libeina libecore
-
-ifeq ($(BR2_PACKAGE_LIBEDBUS_BLUEZ),y)
-LIBEDBUS_CONF_OPTS += --enable-ebluez
-LIBEDBUS_DEPENDENCIES += bluez_utils
-else
-LIBEDBUS_CONF_OPTS += --disable-ebluez
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEDBUS_CONNMAN),y)
-LIBEDBUS_CONF_OPTS += --enable-econnman0_7x
-LIBEDBUS_DEPENDENCIES += connman
-else
-LIBEDBUS_CONF_OPTS += --disable-econnman0_7x
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEDBUS_NOTIFY),y)
-LIBEDBUS_CONF_OPTS += --enable-enotify --disable-edbus-notify-test
-else
-LIBEDBUS_CONF_OPTS += --disable-enotify
-endif
-
-$(eval $(autotools-package))
-- 
2.4.3

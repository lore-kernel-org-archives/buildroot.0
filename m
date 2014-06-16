From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Jun 2014 18:11:10 +0300
Subject: [Buildroot] [PATCH] dbus: bump to version 1.8.4
Message-ID: <e24aaf292d128202d29697218e443af417b6e053.1402931470.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed support for libxml2 as xml backend, select expat
unconditionally.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dbus/Config.in | 23 +----------------------
 package/dbus/dbus.mk   | 13 +++----------
 2 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 97c9ee9acce6..653f7482f693 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -3,33 +3,12 @@ config BR2_PACKAGE_DBUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uses fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_EXPAT
 	help
 	  The D-Bus message bus system.
 
 	  http://www.freedesktop.org/wiki/Software/dbus
 
-if BR2_PACKAGE_DBUS
-
-choice
-	prompt "XML library to use"
-	default BR2_DBUS_EXPAT
-	help
-	  Select the XML library to use with D-Bus. Select Expat
-	  unless you have specific reasons for using libxml2 as
-	  Expat is significant smaller.
-
-	config BR2_DBUS_EXPAT
-		bool "Expat"
-		select BR2_PACKAGE_EXPAT
-
-	config BR2_DBUS_LIBXML2
-		bool "libxml2"
-		select BR2_PACKAGE_LIBXML2
-
-endchoice
-
-endif
-
 comment "dbus needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 4bcc9538a9db..f8824eee55c2 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.6.18
+DBUS_VERSION = 1.8.4
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
@@ -14,7 +14,7 @@ define DBUS_PERMISSIONS
 /usr/libexec/dbus-daemon-launch-helper f 4755 0 0 - - - - -
 endef
 
-DBUS_DEPENDENCIES = host-pkgconf
+DBUS_DEPENDENCIES = host-pkgconf expat
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
 DBUS_CONF_OPT = --with-dbus-user=dbus \
@@ -27,6 +27,7 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--disable-static \
 		--disable-dnotify \
 		--localstatedir=/var \
+		--with-xml=expat \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
@@ -43,14 +44,6 @@ ifeq ($(BR2_microblaze),y)
 DBUS_CONF_OPT += --disable-inotify
 endif
 
-ifeq ($(BR2_DBUS_EXPAT),y)
-DBUS_CONF_OPT += --with-xml=expat
-DBUS_DEPENDENCIES += expat
-else
-DBUS_CONF_OPT += --with-xml=libxml
-DBUS_DEPENDENCIES += libxml2
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 DBUS_CONF_OPT += --with-x
 DBUS_DEPENDENCIES += xlib_libX11
-- 
2.0.0

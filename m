From: Aleksander Morgado <aleksander@aleksander.es>
Date: Fri, 25 Aug 2017 16:21:20 +0200
Subject: [Buildroot] [PATCH v2] modem-manager: update dependencies
In-Reply-To: <20170825123015.10667-1-aleksander@aleksander.es>
References: <20170825123015.10667-1-aleksander@aleksander.es>
Message-ID: <20170825142120.26160-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dbus-glib package isn't a dependency since ModemManager 1.0, which
is based on libglib2's GDBus implementation.

Also, explicitly set libglib2 as dependency, which currently was being
implicitly included by libgudev. The next major ModemManager release
will have udev/libgudev as optional packages, while libglib2 is
definitely not going to be ever optional.

Finally, also set dbus as a dependency, as ModemManager won't work
without a system DBus available.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/modem-manager/Config.in        | 2 +-
 package/modem-manager/modem-manager.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index aa7ed1e2f..3b32acba3 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 6459f8785..ce6d5dfc1 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -9,7 +9,7 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool libgudev
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool dbus udev libglib2 libgudev
 MODEM_MANAGER_INSTALL_STAGING = YES

 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
--
2.14.1

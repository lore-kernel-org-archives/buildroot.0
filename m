From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:30:00 +0200
Subject: [Buildroot] [git commit] modem-manager: update dependencies
Message-ID: <20170902130621.4B76D81DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cd9f785c160dcbab1887cc49177d41862f44781
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are the changes implemented:

  * Remove dbus-glib as a dependency, as it isn't required since
    ModemManager 1.0, which is based on libglib2's GDBus
    implementation.

  * Remove udev as a dependency, as the ModemManager build only needs
    the libgudev package.

  * Explicitly set libglib2 as dependency, which currently was being
    implicitly included by libgudev. The next major ModemManager
    release will have udev/libgudev as optional packages, while
    libglib2 is definitely not going to be ever optional.

  * Add a comment explaining that dbus is only a runtime dependency.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/modem-manager/Config.in        | 4 ++--
 package/modem-manager/modem-manager.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index aa7ed1e..8e995b4 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_DBUS # runtime dependency
+	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 6459f87..fe08033 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -9,7 +9,7 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool libgudev
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2 libgudev
 MODEM_MANAGER_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)

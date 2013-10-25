From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 25 Oct 2013 09:56:56 +0200
Subject: [Buildroot] [PATCH 2/2] ModemManager: add new package
In-Reply-To: <1382687816-14336-1-git-send-email-yegorslists@googlemail.com>
References: <1382687816-14336-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1382687816-14336-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                      |    1 +
 package/modem-manager/Config.in        |   32 ++++++++++++++++++++++++++++++++
 package/modem-manager/modem-manager.mk |   23 +++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 package/modem-manager/Config.in
 create mode 100644 package/modem-manager/modem-manager.mk

diff --git a/package/Config.in b/package/Config.in
index 41d828a..35923dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -818,6 +818,7 @@ source "package/lrzsz/Config.in"
 source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
 source "package/minidlna/Config.in"
+source "package/modem-manager/Config.in"
 source "package/mongoose/Config.in"
 source "package/mongrel2/Config.in"
 source "package/mrouted/Config.in"
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
new file mode 100644
index 0000000..cd49b54
--- /dev/null
+++ b/package/modem-manager/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_MODEM_MANAGER
+	bool "ModemManager"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	select BR2_PACKAGE_DBUS
+	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE # acl
+	depends on BR2_USE_WCHAR # libglib2 and gnutls
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_UDEV
+	select BR2_PACKAGE_UDEV_ALL_EXTRAS
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UTF
+	help
+	  ModemManager is a DBus-activated daemon which controls mobile
+	  broadband (2G/3G/4G) devices and connections.
+
+	  http://www.freedesktop.org/wiki/Software/ModemManager/
+
+if BR2_PACKAGE_MODEM_MANAGER
+
+config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
+	bool "QMI support"
+	help
+		This option enable support for QMI protocol
+endif
+
+comment "ModemkManager requires a toolchain with IPV6, LARGEFILE, WCHAR and thread support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
new file mode 100644
index 0000000..a34cf7a
--- /dev/null
+++ b/package/modem-manager/modem-manager.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# modem-manager
+#
+################################################################################
+
+MODEM_MANAGER_VERSION = 1.0.0
+MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
+MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager/
+MODEM_MANAGER_INSTALL_STAGING = YES
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
+
+MODEM_MANAGER_CONF_OPT = \
+		--without-mbim
+
+
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
+	MODEM_MANAGER_DEPENDENCIES += libqmi
+else
+	MODEM_MANAGER_CONF_OPT += --without-qmi
+endif
+
+$(eval $(autotools-package))
-- 
1.7.7

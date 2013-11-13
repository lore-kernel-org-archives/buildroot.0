From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 13 Nov 2013 21:57:41 +0100
Subject: [Buildroot] [PATCH v5 4/4] ModemManager: add new package
In-Reply-To: <1384376261-29291-1-git-send-email-yegorslists@googlemail.com>
References: <1384376261-29291-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1384376261-29291-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
        v4: change dependency comment to the standard one (Arnout Vandecappelle)
        v3: depend on pcre, fix comments and indentation etc. (comments from Thomas Petazzoni)
        v2: typos, add select QMI to the config option, don't install to staging

 package/Config.in                      |  1 +
 package/modem-manager/Config.in        | 39 ++++++++++++++++++++++++++++++++++
 package/modem-manager/modem-manager.mk | 28 ++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 package/modem-manager/Config.in
 create mode 100644 package/modem-manager/modem-manager.mk

diff --git a/package/Config.in b/package/Config.in
index 86498bd..468e819 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -823,6 +823,7 @@ source "package/lrzsz/Config.in"
 source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
 source "package/minidlna/Config.in"
+source "package/modem-manager/Config.in"
 source "package/mongoose/Config.in"
 source "package/mongrel2/Config.in"
 source "package/mrouted/Config.in"
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
new file mode 100644
index 0000000..00a7a79
--- /dev/null
+++ b/package/modem-manager/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_MODEM_MANAGER
+	bool "modemmanager"
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
+config BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
+	bool "MBIM support"
+	select BR2_PACKAGE_LIBMBIM
+	help
+	  This option enables support for MBIM protocol
+
+config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
+	bool "QMI support"
+	select BR2_PACKAGE_LIBQMI
+	help
+	  This option enables support for QMI protocol
+endif
+
+comment "modemmanager needs udev and a toolchain w/ largefile, wchar, threads, IPv6"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
new file mode 100644
index 0000000..b75d2cb
--- /dev/null
+++ b/package/modem-manager/modem-manager.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# modem-manager
+#
+################################################################################
+
+MODEM_MANAGER_VERSION = 1.0.0
+MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
+MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager/
+MODEM_MANAGER_LICENSE = GPLv2
+MODEM_MANAGER_LICENSE_FILES = COPYING
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool pcre
+
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
+	MODEM_MANAGER_DEPENDENCIES += libqmi
+	MODEM_MANAGER_CONF_OPT += --with-qmi
+else
+	MODEM_MANAGER_CONF_OPT += --without-qmi
+endif
+
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
+	MODEM_MANAGER_DEPENDENCIES += libmbim
+	MODEM_MANAGER_CONF_OPT += --with-mbim
+else
+	MODEM_MANAGER_CONF_OPT += --without-mbim
+endif
+
+$(eval $(autotools-package))
--
1.8.1.2

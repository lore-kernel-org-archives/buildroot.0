From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 10:32:09 +0100
Subject: [Buildroot] [git commit] ModemManager: add new package
Message-ID: <20131206093441.3A65B9BF47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b341b6c1a7330066e243e8288af0966a576dc46a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fixup license info as pointed out by Thomas]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |    1 +
 package/modem-manager/Config.in        |   36 ++++++++++++++++++++++++++++++++
 package/modem-manager/modem-manager.mk |   28 ++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5128b34..a7ab4ea 100644
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
index 0000000..4e2cfc7
--- /dev/null
+++ b/package/modem-manager/Config.in
@@ -0,0 +1,36 @@
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
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
new file mode 100644
index 0000000..248b770
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
+MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
+MODEM_MANAGER_LICENSE_FILES = COPYING
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
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

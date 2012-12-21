From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 21 Dec 2012 22:45:05 +0100
Subject: [Buildroot] [PATCH 6/6] udisks: new package
In-Reply-To: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
References: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1356126305-16133-8-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@streamunlimited.com>
---
 package/Config.in        |    1 +
 package/udisks/Config.in |   32 ++++++++++++++++++++++++++++++++
 package/udisks/udisks.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 package/udisks/Config.in
 create mode 100644 package/udisks/udisks.mk

diff --git a/package/Config.in b/package/Config.in
index 7a0a852..95fad85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,7 @@ source "package/sysstat/Config.in"
 source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
+source "package/udisks/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
new file mode 100644
index 0000000..bdc99b3
--- /dev/null
+++ b/package/udisks/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_UDISKS
+	bool "udisks"
+	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_SG3_UTILS
+	select BR2_PACKAGE_UDEV_ALL_EXTRAS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_POLKIT
+	select BR2_PACKAGE_PARTED #select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_DMSETUP_ONLY #devmapper library
+	select BR2_PACKAGE_LIBATASMART
+	help
+	  The udisks project provides
+
+	   o A storage daemon that implements well-defined D-Bus
+	     interfaces that can be used to query and manipulate
+	     storage devices.
+
+	   o a command-line tool, udisks(1), that can be used to query
+	     and use the daemon
+
+	  http://www.freedesktop.org/wiki/Software/udisks
+
+config BR2_PACKAGE_UDISKS_LVM2
+	bool "lvm2 support"
+	depends on BR2_PACKAGE_UDISKS
+	depends on BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_APP_LIBRARY
+	default n
+
+comment "udisks requires udev and dbus to be enabled"
+	depends on !BR2_PACKAGE_UDEV || !BR2_PACKAGE_DBUS
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
new file mode 100644
index 0000000..f85fc40
--- /dev/null
+++ b/package/udisks/udisks.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# udisks
+#
+#############################################################
+UDISKS_VERSION = 1.0.4
+UDISKS_SITE    = http://hal.freedesktop.org/releases/
+
+UDISKS_DEPENDENCIES = 	\
+	sg3_utils	\
+	host-pkgconf	\
+	udev		\
+	dbus		\
+	dbus-glib	\
+	polkit		\
+	parted		\
+	lvm2		\
+	libatasmart
+
+UDISKS_CONF_OPT = --disable-remote-access --disable-gtk-doc
+
+ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
+UDISKS_CONF_OPT += --enable-lvm2
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4

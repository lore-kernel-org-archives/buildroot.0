From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 21 Dec 2012 22:45:02 +0100
Subject: [Buildroot] [PATCH 3/3] udisks: new package
In-Reply-To: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
References: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1356126305-16133-5-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@streamunlimited.com>
---
 package/Config.in        |    1 +
 package/udisks/Config.in |   25 +++++++++++++++++++++++++
 package/udisks/udisks.mk |   16 ++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 package/udisks/Config.in
 create mode 100644 package/udisks/udisks.mk

diff --git a/package/Config.in b/package/Config.in
index cccfd77..0986f12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -262,6 +262,7 @@ source "package/sysstat/Config.in"
 source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
+source "package/udisks/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
new file mode 100644
index 0000000..c46fa7f
--- /dev/null
+++ b/package/udisks/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_UDISKS
+	bool "udisks"
+	select BR2_PACKAGE_SGUTILS
+	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_UDEV_ALL_EXTRAS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_POLKIT
+	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_LVM2_DMSETUP_ONLY
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
+
+comment "udisks requires udev and dbus to be enabled"
+	depends on !BR2_PACKAGE_UDEV || !BR2_PACKAGE_DBUS
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
new file mode 100644
index 0000000..6946928
--- /dev/null
+++ b/package/udisks/udisks.mk
@@ -0,0 +1,16 @@
+UDISKS_VERSION = 1.0.4
+UDISKS_SITE    = http://hal.freedesktop.org/releases/
+
+UDISKS_DEPENDENCIES = 	\
+	sgutils		\
+	host-pkgconf	\
+	udev		\
+	dbus		\
+	dbus-glib	\
+	polkit		\
+	parted		\
+	lvm2
+
+UDISKS_CONF_OPT = --disable-lvm2 --disable-remote-access --disable-gtk-doc
+
+$(eval $(autotools-package))
-- 
1.7.5.4

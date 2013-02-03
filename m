From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Feb 2013 14:23:31 +0100
Subject: [Buildroot] [git commit] udisks: new package
Message-ID: <20130203142452.66BD29A8FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00c1f03ee72659800221f00b657941050f2d880f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix dependencies, comment]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/udisks/Config.in |   34 ++++++++++++++++++++++++++++++++++
 package/udisks/udisks.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e6682fc..2f219b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -280,6 +280,7 @@ source "package/sysstat/Config.in"
 source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
+source "package/udisks/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
new file mode 100644
index 0000000..77cbcb8
--- /dev/null
+++ b/package/udisks/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_UDISKS
+	bool "udisks"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_UDEV
+	select BR2_PACKAGE_UDEV_ALL_EXTRAS
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_SG3_UTILS
+	select BR2_PACKAGE_POLKIT
+	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_LVM2
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
+	select BR2_PACKAGE_LVM2_APP_LIBRARY
+	help
+	  Enable LVM2 support
+
+comment "udisks requires /dev mgmnt set to udev under System configuration"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
new file mode 100644
index 0000000..844dfcd
--- /dev/null
+++ b/package/udisks/udisks.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# udisks
+#
+#############################################################
+
+UDISKS_VERSION = 1.0.4
+UDISKS_SITE    = http://hal.freedesktop.org/releases/
+UDISKS_LICENCE = GPLv2+
+UDISKS_LICENCE_FILES = COPYING
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
+UDISKS_CONF_OPT = --disable-remote-access
+
+ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
+UDISKS_CONF_OPT += --enable-lvm2
+endif
+
+$(eval $(autotools-package))

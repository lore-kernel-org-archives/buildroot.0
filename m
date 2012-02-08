From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 21:56:47 +0100
Subject: [Buildroot] [git commit] udev: bump to 181 and other fixes
Message-ID: <20120208210842.E4CC790A38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f94818b0fa77644b989bab5aa0866de7fe4ffbb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
- Linux kernel requirement: 2.6.34 and above (devtmpfs is mandatory)
(this also applies to the chosen toolchain, because of Kernel headers)
- optional dependency on libusb and usbutils removed
- added dependency on kmod
- added dependency on util-linux for libblkid
- install in /lib/udev instead of /usr/libexec/udev
- udevd moved to /lib/udev
- fixed path to pci.ids and usb.ids
- persistent rules generator is disabled by default, so option
is introduced to enable this option if desired

[Peter: fix build on uClibc, Config.in tweaks]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udev/Config.in   |   22 +++++++++++++---------
 package/udev/S10udev     |    4 ++--
 package/udev/udev.mk     |   23 +++++++++++++++--------
 target/generic/Config.in |    5 +++++
 4 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 391c718..d3244d1 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,29 +1,33 @@
 config BR2_PACKAGE_UDEV
 	bool "udev"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
 	help
 	  Userspace device daemon.
 
+	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
+
 	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 
 if BR2_PACKAGE_UDEV
 
+config BR2_PACKAGE_UDEV_RULES_GEN
+	bool "enable rules generator"
+	help
+	  Enable persistant rules generator
+
 config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	bool "enable all extras"
-	depends on BR2_LARGEFILE # acl
-	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_ACL
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
-	select BR2_PACKAGE_USBUTILS
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enable all extras with external dependencies like
-	  libacl, libusb, libusb-compat, usbutils, hwdata
-
-comment "udev extras requires a toolchain with LARGEFILE + WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+	  libacl, hwdata and libglib2
 
 endif
 
diff --git a/package/udev/S10udev b/package/udev/S10udev
index 29eb107..70a7c34 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -2,7 +2,7 @@
 #
 # udev	This is a minimal non-LSB version of a UDEV startup script.  It
 #	was derived by stripping down the udev-058 LSB version for use
-#	with buildroot on embedded hardware using Linux 2.6.12+ kernels.
+#	with buildroot on embedded hardware using Linux 2.6.34+ kernels.
 #
 #	You may need to customize this for your system's resource limits
 #	(including startup time!) and administration.  For example, if
@@ -17,7 +17,7 @@
 #
 
 # Check for missing binaries
-UDEV_BIN=/sbin/udevd
+UDEV_BIN=/lib/udev/udevd
 test -x $UDEV_BIN || exit 5
 
 # Check for config file and read it
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 1825396..d445a2f 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,28 +3,35 @@
 # udev
 #
 #############################################################
-UDEV_VERSION = 173
+UDEV_VERSION = 181
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 UDEV_INSTALL_STAGING = YES
 
+# mq_getattr is in librt
+UDEV_CONF_ENV += LIBS=-lrt
+
 UDEV_CONF_OPT =			\
 	--sbindir=/sbin		\
 	--with-rootlibdir=/lib	\
-	--libexecdir=/lib/udev	\
+	--libexecdir=/lib	\
+	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
+	--with-pci-ids-path=/usr/share/hwdata/pci.ids	\
+	--with-firmware-path=/lib/firmware		\
 	--disable-introspection
 
-UDEV_DEPENDENCIES = host-gperf host-pkg-config
+UDEV_DEPENDENCIES = host-gperf host-pkg-config util-linux kmod
+
+ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
+UDEV_CONF_OPT += --enable-rule_generator
+endif
 
 ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
-UDEV_DEPENDENCIES += libusb libusb-compat acl usbutils hwdata libglib2
-UDEV_CONF_OPT +=							\
-	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\
-	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\
+UDEV_DEPENDENCIES += acl hwdata libglib2
+UDEV_CONF_OPT +=		\
 	--enable-udev_acl
 else
 UDEV_CONF_OPT +=		\
-	--disable-hwdb		\
 	--disable-gudev
 endif
 
diff --git a/target/generic/Config.in b/target/generic/Config.in
index a91de32..88f0718 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -28,8 +28,13 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	bool "Dynamic using udev"
+	depends on BR2_LARGEFILE # udev
+	depends on BR2_USE_WCHAR # udev
 	select BR2_PACKAGE_UDEV
 
+comment "udev requires a toolchain with LARGEFILE + WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+
 endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE

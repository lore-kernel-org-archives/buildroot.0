From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  7 Feb 2014 14:21:33 +0100
Subject: [Buildroot] [PATCH v7 2/4] udev: convert to virtual package.
In-Reply-To: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1391779295-19140-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts udev to a virtual package. For the moment, there is only
one provider for the udev features: eudev.

Packages meant to provide udev-like features must select the symbol
BR2_PACKAGE_HAS_UDEV.

Packages depending on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV or
BR2_PACKAGE_UDEV have been converted to use the new symbol.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 Config.in.legacy                                   |   55 ++++++++++++++++++++
 docs/manual/adding-packages-directory.txt          |    3 +-
 linux/linux.mk                                     |    2 -
 package/ccid/ccid.mk                               |    2 +-
 package/eudev/Config.in                            |    1 +
 package/gpsd/gpsd.mk                               |    2 +-
 package/libatasmart/Config.in                      |    4 +-
 package/libcec/libcec.mk                           |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 package/libmbim/Config.in                          |    5 +-
 package/libusb/libusb.mk                           |    2 +-
 package/modem-manager/Config.in                    |    6 +--
 package/network-manager/Config.in                  |    8 ++-
 package/ofono/ofono.mk                             |    2 +-
 package/pcsc-lite/Config.in                        |    2 +-
 package/pcsc-lite/pcsc-lite.mk                     |    2 +-
 package/pulseaudio/pulseaudio.mk                   |    2 +-
 package/systemd/Config.in                          |    6 +--
 package/udev/Config.in                             |   51 ++----------------
 package/udev/udev.mk                               |   49 ++++-------------
 package/udisks/Config.in                           |   14 ++---
 package/usbmount/Config.in                         |    4 +-
 package/vlc/vlc.mk                                 |    2 +-
 package/weston/Config.in                           |    4 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    4 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 package/xenomai/xenomai.mk                         |    2 +-
 system/Config.in                                   |   22 ++------
 28 files changed, 112 insertions(+), 150 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2fe9cf9..6d594c6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,61 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	bool "/dev management by udev removed"
+	select BR2_LEGACY
+	help
+	  The 'udev' package has been converted to a virtual package.
+	  There is currently one provider for this feature: 'eudev'.
+
+	  Therefore, you must choose 'Dynamic using eudev' in the
+	  '/dev management' menu to get the same behaviour as in your
+	   old configuration.
+
+	  You must also check the packages depending on 'udev' are still
+	  selected.
+
+config BR2_PACKAGE_UDEV
+	bool "udev is now a virtual package"
+	select BR2_LEGACY
+	select BR2_PACKAGE_HAS_UDEV
+	help
+	  The 'udev' package has been converted to a virtual package.
+	  There is currently one provider for this feature: 'eudev'.
+
+	  Your old configuration refers to packages depending on 'udev',
+	  either for build or at runtime.
+
+	  Check that a 'udev' provider is selected, i.e. that 'eudev' is
+	  selected, which is the case if '/dev management' is set to
+	  'Dynamic using eudev'.
+
+config BR2_PACKAGE_UDEV_RULES_GEN
+	bool "udev rules generation handled by eudev"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EUDEV
+	select BR2_PACKAGE_EUDEV_RULES_GEN
+	help
+	  The 'udev' package has been converted to a virtual package.
+	  There is currently one provider for this feature: 'eudev'.
+
+	  udev rules generation will now be handled by 'eudev'.
+
+	  Check that '/dev management' is set to 'Dynamic using eudev'
+	  to get the same behaviour as in your old configuration.
+
+config BR2_PACKAGE_UDEV_ALL_EXTRAS
+	bool "udev extras removed"
+	select BR2_LEGACY
+	help
+	  The 'udev' package has been converted to a virtual package.
+	  There is currently one provider for this feature: 'eudev'.
+
+	  The option to enable the extra features of 'udev' (gudev, ...)
+	  has been removed. These features are automatically enabled in
+	  the 'udev' providers if the dependencies are selected. For
+	  example, selecting 'libglib2' will trigger the build of gudev.
+
 config BR2_sh2
 	bool "sh2 support removed"
 	help
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 754a145..40af809 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -273,8 +273,7 @@ foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
 Dependencies on udev /dev management
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 If a package needs udev /dev management, it should depend on symbol
-+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV+, and the following comment
-should be added:
++BR2_PACKAGE_HAS_UDEV+, and the following comment should be added:
 
 --------------------------
 foo needs udev /dev management
diff --git a/linux/linux.mk b/linux/linux.mk
index 206dab8..1bfa279 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -188,8 +188,6 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
-	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index f39edce..b635aa1 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -12,7 +12,7 @@ CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
 
-ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define CCID_INSTALL_UDEV_RULES
 	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
 		cp $(@D)/src/92_pcscd_ccid.rules $(TARGET_DIR)/etc/udev/rules.d/ ; \
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 94d94e0..90124f2 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on !BR2_PREFER_STATIC_LIB # kmod
+	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index efc8d37..0f655ba 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -222,7 +222,7 @@ define GPSD_INSTALL_STAGING_CMDS
 		install)
 endef
 
-ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define GPSD_INSTALL_UDEV_RULES
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
index a3e44f8..534e7c1 100644
--- a/package/libatasmart/Config.in
+++ b/package/libatasmart/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBATASMART
 	bool "libatasmart"
-	depends on BR2_PACKAGE_UDEV # libudev is configure dependency
+	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
 	help
 	  The libatasmart package is a disk reporting library.
 	  It only supports a subset of the ATA S.M.A.R.T. functionality.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBATASMART
 	  http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
 
 comment "libatasmart requires udev to be enabled"
-	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 910f319..99cc767 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -18,7 +18,7 @@ ifeq ($(BR2_PACKAGE_LOCKDEV),y)
 LIBCEC_DEPENDENCIES += lockdev
 endif
 
-ifeq ($(BR2_PACKAGE_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCEC_DEPENDENCIES += udev
 endif
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f5efaf1..a1b0580 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -65,7 +65,7 @@ else
 LIBDRM_CONF_OPT += --disable-freedreno-experimental-api
 endif
 
-ifeq ($(BR2_PACKAGE_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBDRM_CONF_OPT += --enable-udev
 LIBDRM_DEPENDENCIES += udev
 else
diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index d034e84..bd34dd4 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -2,9 +2,8 @@ config BR2_PACKAGE_LIBMBIM
 	bool "libmbim"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	help
 	  libmbim is a glib-based library for talking to WWAN modems and
 	  devices which speak the Mobile Interface Broadband Model (MBIM)
@@ -14,4 +13,4 @@ config BR2_PACKAGE_LIBMBIM
 
 comment "libmbim needs udev /dev management and a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index a8ff74c..417b2ce 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -21,7 +21,7 @@ ifeq ($(BR2_avr32),y)
 LIBUSB_CONF_OPT += --disable-timerfd
 endif
 
-ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBUSB_DEPENDENCIES += udev
 else
 LIBUSB_CONF_OPT += --disable-udev
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index e157ca8..fe60850 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MODEM_MANAGER
 	bool "modemmanager"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
@@ -8,8 +8,6 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_UDEV
-	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
@@ -33,4 +31,4 @@ endif
 
 comment "modemmanager needs udev /dev management and a toolchain w/ largefile, wchar, threads, IPv6"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index a194433..a4eeeaf 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,16 +1,14 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "NetworkManager"
 	depends on !BR2_avr32 # udev
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_UDEV
-	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
@@ -33,4 +31,4 @@ comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, larg
 	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index aaaa8fa..9e30c63 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -22,7 +22,7 @@ OFONO_CONF_OPT = --disable-test
 # make sure that it is defined.
 OFONO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-ifeq ($(BR2_PACKAGE_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 	OFONO_CONF_OPT += --enable-udev
 	OFONO_DEPENDENCIES += udev
 else
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 4cd89e9..aab42e8 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -11,7 +11,7 @@ if BR2_PACKAGE_PCSC_LITE
 
 config BR2_PACKAGE_PCSC_LITE_FORCE_LIBUSB
 	bool "use libusb"
-	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Select Y if you want to support usb smart card readers.
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index afbe822..18859cd 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -16,7 +16,7 @@ PCSC_LITE_LICENSE_FILES = COPYING
 # - libudev and libusb can't be used together
 # - libudev has a priority over libusb
 
-ifeq ($(BR2_PACKAGE_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PCSC_LITE_CONF_OPT += --enable-libudev --disable-libusb
 PCSC_LITE_DEPENDENCIES += udev
 else
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index cdeabc5..3fd3cd9 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -26,7 +26,7 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
 	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
-	$(if $(BR2_PACKAGE_UDEV),udev) \
+	$(if $(BR2_PACKAGE_HAS_UDEV),udev) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
 	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index fe81900..500e623 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
@@ -18,7 +18,7 @@ config BR2_PACKAGE_SYSTEMD
 
 	  http://freedesktop.org/wiki/Software/systemd
 
-comment "systemd needs udev /dev management and a toolchain w/ IPv6, threads"
+comment "systemd needs eudev /dev management and a toolchain w/ IPv6, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV || !BR2_INET_IPV6 || \\
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 7aa79c4..5cd4051 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,47 +1,6 @@
-config BR2_PACKAGE_UDEV
-	bool "udev"
-	depends on !BR2_avr32 # no epoll_create1
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
-	depends on !BR2_PREFER_STATIC_LIB # kmod
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
+config BR2_PACKAGE_HAS_UDEV
+	bool
 	help
-	  Userspace device daemon.
-
-	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
-	  and inotify.
-
-	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
-
-if BR2_PACKAGE_UDEV
-
-config BR2_PACKAGE_UDEV_RULES_GEN
-	bool "enable rules generator"
-	help
-	  Enable persistant rules generator
-
-config BR2_PACKAGE_UDEV_ALL_EXTRAS
-	bool "enable all extras"
-	select BR2_PACKAGE_ACL
-	select BR2_PACKAGE_HWDATA
-	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
-	help
-	  Enable all extras with external dependencies like
-	  libacl, hwdata and libglib2
-
-comment "enabling all extras needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-endif
-
-comment "udev needs udev /dev management and a toolchain w/ largefile, wchar, dynamic library"
-	depends on !BR2_avr32
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
-		!BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	  udev is now a virtual package.
+	  Packages requiring udevd at run time or libudev/gudev at build time
+	  should select it.
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index db86850..d274246 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,48 +4,17 @@
 #
 ################################################################################
 
-UDEV_VERSION = 182
-UDEV_SOURCE = udev-$(UDEV_VERSION).tar.xz
-UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-UDEV_LICENSE = GPLv2+
-UDEV_LICENSE_FILES = COPYING
-UDEV_INSTALL_STAGING = YES
+UDEV_SOURCE =
 
-# mq_getattr is in librt
-UDEV_CONF_ENV += LIBS=-lrt
-
-UDEV_CONF_OPT =			\
-	--sbindir=/sbin		\
-	--with-rootlibdir=/lib	\
-	--libexecdir=/lib	\
-	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
-	--with-pci-ids-path=/usr/share/hwdata/pci.ids	\
-	--with-firmware-path=/lib/firmware		\
-	--disable-introspection
-
-UDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
-
-ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
-UDEV_CONF_OPT += --enable-rule_generator
-endif
-
-ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
-UDEV_DEPENDENCIES += acl hwdata libglib2
-UDEV_CONF_OPT +=		\
-	--enable-udev_acl
-else
-UDEV_CONF_OPT +=		\
-	--disable-gudev
+ifeq ($(BR2_PACKAGE_EUDEV),y)
+UDEV_DEPENDENCIES += eudev
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-	UDEV_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system/
-endif
-
-define UDEV_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+ifeq ($(UDEV_DEPENDENCIES),)
+define UDEV_CONFIGURE_CMDS
+	echo "No Udev implementation selected. Configuration error."
+	exit 1
 endef
+endif
 
-UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
-
-$(eval $(autotools-package))
+$(eval $(generic-package))
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index e9539a3..d560b6c 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,11 +1,9 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
 	depends on !BR2_avr32 # udev
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
-	select BR2_PACKAGE_UDEV
-	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
@@ -36,8 +34,12 @@ config BR2_PACKAGE_UDISKS_LVM2
 
 endif
 
-comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
+comment "udisks needs udev /dev management"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+comment "udisks needs a toolchain w/ wchar, threads"
+	depends on !BR2_avr32
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 2583e7c..0bb8883 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_USBMOUNT
 	bool "usbmount"
-	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
 	help
 	  The usbmount package automatically mounts USB mass storage devices
@@ -9,4 +9,4 @@ config BR2_PACKAGE_USBMOUNT
 	  http://usbmount.alioth.debian.org/
 
 comment "usbmount requires udev to be enabled"
-	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b39c6c7..c45e018 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -239,7 +239,7 @@ else
 VLC_CONF_OPT += --disable-tremor
 endif
 
-ifeq ($(BR2_PACKAGE_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 VLC_CONF_OPT += --enable-udev
 VLC_DEPENDENCIES += udev
 else
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 247efc8..36bbb01 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,6 +1,6 @@
 comment "weston needs udev and a toolchain w/ threads"
 	depends on !BR2_avr32
-	depends on !BR2_PACKAGE_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
@@ -11,7 +11,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
-	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_avr32 # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	# Runtime dependency
diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index 88d3e6e..6ec14bf 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
-	depends on BR2_PACKAGE_UDEV # libudev is configure dependency
+	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
@@ -8,4 +8,4 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	  Generic Linux input driver
 
 comment "xf86-input-evdev requires udev to be enabled"
-	depends on !BR2_PACKAGE_UDEV
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4089aab..a7ac9a0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -123,7 +123,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES += tslib
 XSERVER_XORG_SERVER_CONF_OPT += --enable-tslib LDFLAGS="-lts"
 endif
 
-ifeq ($(BR2_PACKAGE_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
 else
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 2dd1bf6..4e9025d 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -93,7 +93,7 @@ define XENOMAI_DEVICES
 /dev/rtp     c  666  0  0  150 0    0  1  32
 endef
 
-ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XENOMAI_DEPENDENCIES += udev
 
 define XENOMAI_INSTALL_UDEV_RULES
diff --git a/system/Config.in b/system/Config.in
index d1b0cbb..34726b0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -90,17 +90,17 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs udev /dev management and a toolchain w/ largefile, wchar, IPv6, threads'
+comment 'systemd needs eudev /dev management and a toolchain w/ largefile, wchar, IPv6, threads'
 	depends on BR2_USE_MMU
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
 		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
-		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
+		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV)
 
 config BR2_INIT_NONE
 	bool "None"
@@ -121,22 +121,6 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 	bool "Dynamic using mdev"
 	select BR2_PACKAGE_BUSYBOX
 
-config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	bool "Dynamic using udev"
-	depends on !BR2_avr32 # udev
-	depends on BR2_LARGEFILE # udev
-	depends on BR2_USE_WCHAR # udev
-	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
-	select BR2_PACKAGE_UDEV
-
-comment "udev needs a toolchain w/ largefile, wchar"
-	depends on !BR2_avr32 # udev
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
-
-comment "udev doesn't work with 'prefer static libraries'"
-	depends on !BR2_avr32 # udev
-	depends on BR2_PREFER_STATIC_LIB
-
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
 	depends on !BR2_avr32 # eudev
-- 
1.7.9.5

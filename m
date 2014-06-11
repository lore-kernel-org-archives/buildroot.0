From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Jun 2014 01:40:12 +0200
Subject: [Buildroot] [PATCH 5/5 RFC] package/eudev: split udev/libudev
In-Reply-To: <cover.1402529398.git.yann.morin.1998@free.fr>
References: <cover.1402529398.git.yann.morin.1998@free.fr>
Message-ID: <972a759982e4bdbd069e2f1fb6a213aa9f829c29.1402529398.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Quite a few packages are happy with just libudev, and not a full udev
daemon running.

Split the eudev package so that we can install just libudev if
/dev management is not handled by eudev.

When only the library is intalled, behave as a provider for the libudev
virtual package. If /dev management is handled by eudev, then only be a
provider for the udev virtual package, which is itself a provider for
the virtual package libudev.

Of course, libudev conflicts with systemd, but we tell the user that it
is "provided" by systemd when it is selected.

Adjust comments of dependencies accordingly.

Note:
    Most of the .mk splitting of the dependencies and the build/install
    rules are from Bernd. Thanks! :-)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: although the prompt is changed to 'libusb', we still call the
package 'eudev', to avoid a mess of renaming the variables. If needed,
that can be done in a separate patch.

Yeah! A virtual package can be a provider for another virtual package!
Am I not sneaky? :-]
---
 package/Config.in       |  2 +-
 package/eudev/Config.in | 40 ++++++++++++++++++++++++++++++++++++++--
 package/eudev/eudev.mk  | 46 ++++++++++++++++++++++++++++++++++++++++++----
 system/Config.in        |  7 ++++---
 4 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6555e08..534b848 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -288,7 +288,6 @@ endif
 	source "package/dvbsnoop/Config.in"
 	source "package/dtv-scan-tables/Config.in"
 	source "package/eeprog/Config.in"
-	source "package/eudev/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
 	source "package/fan-ctrl/Config.in"
@@ -636,6 +635,7 @@ menu "Hardware handling"
 	source "package/libraw1394/Config.in"
 	source "package/libserial/Config.in"
 	source "package/libsoc/Config.in"
+	source "package/eudev/Config.in" # prompt is 'libudev'
 	source "package/libudev/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index b204a90..6d7a6d2 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -4,8 +4,29 @@
 # However, it seems more logical to have the dependencies listed here,
 # so it is easier to uderstand why we have those, and duplicate them in
 # the choice entry.
+#
+# Note, although named 'eudev', this package primarily provides libudev,
+# unless the /dev management is selected to be eudev, in which case this
+# package will provide a full udev. That's hy the prompt is 'libudev'.
 
 config BR2_PACKAGE_EUDEV
+	bool "libudev"
+	depends on !BR2_avr32 # no __NR_name_to_handle_at
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_HAS_LIBUDEV if !BR2_PACKAGE_EUDEV_DAEMON
+	help
+	  eudev is a fork of system-udev with the goal of obtaining better
+	  compatibility with existing software.
+
+	  This installs only the libudev library.
+
+	  http://www.gentoo.org/proj/en/eudev/
+
+if BR2_PACKAGE_EUDEV
+
+config BR2_PACKAGE_EUDEV_DAEMON
 	bool
 	depends on !BR2_avr32 # no epoll_create1
 	depends on BR2_USE_MMU # uses fork()
@@ -17,7 +38,7 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
 
-if BR2_PACKAGE_EUDEV
+if BR2_PACKAGE_EUDEV_DAEMON
 
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
@@ -27,4 +48,19 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 	help
 	  Enable persistent rules generator
 
-endif
+endif # BR2_PACKAGE_EUDEV_DAEMON
+
+# If the daemon is selected, it means we have a full udev, which is
+# responsible for providing libudev. So only provide libudev if the
+# daemon is not selected.
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "eudev" if !BR2_PACKAGE_EUDEV_DAEMON
+
+endif # BR2_PACKAGE_EUDEV
+
+comment "libudev needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_PACKAGE_SYSTEMD
+
+comment "libudev provided by systemd"
+	depends on BR2_PACKAGE_SYSTEMD
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 5f1525c..aadc37c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -16,19 +16,27 @@ EUDEV_CONF_ENV += LIBS=-lrt
 
 EUDEV_CONF_OPT =		\
 	--disable-manpages	\
-	--sbindir=/sbin		\
 	--with-rootlibdir=/lib	\
 	--libexecdir=/lib	\
 	--with-firmware-path=/lib/firmware	\
 	--disable-introspection			\
-	--enable-split-usr			\
-	--enable-libkmod
+	--enable-split-usr
+
+EUDEV_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
 
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
+EUDEV_DEPENDENCIES += host-gperf util-linux kmod
 EUDEV_PROVIDES = udev
 
+EUDEV_CONF_OPT += \
+	--sbindir=/sbin \
+	--enable-libkmod
+
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPT += --enable-rule_generator
+else
+EUDEV_CONF_OPT += --disable-rule_generator
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
@@ -42,4 +50,34 @@ define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
+else # ! daemon
+
+EUDEV_PROVIDES = libudev
+
+EUDEV_CONF_OPT += \
+	--disable-keymap \
+	--disable-libkmod \
+	--disable-modules \
+	--disable-selinux \
+	--disable-rule-generator \
+	--disable-gtk-doc \
+	--disable-gudev
+
+# When not installing the daemon, we have to override the build and install
+# commands, to just install the library.
+
+define EUDEV_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev
+endef
+
+define EUDEV_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(STAGING_DIR) install
+endef
+
+define EUDEV_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(TARGET_DIR) install
+endef
+
+endif # ! daemon
+
 $(eval $(autotools-package))
diff --git a/system/Config.in b/system/Config.in
index 6f71598..37f596a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -160,12 +160,13 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
-	depends on !BR2_avr32 # eudev (no epoll_create1)
+	depends on !BR2_avr32 # eudev
 	depends on BR2_USE_MMU # eudev (fork)
-	depends on BR2_LARGEFILE # eudev (util-linux)
+	depends on BR2_LARGEFILE # eudev-daemon (util-linux)
 	depends on BR2_USE_WCHAR # eudev (util-linux)
 	depends on !BR2_PREFER_STATIC_LIB # eudev
 	select BR2_PACKAGE_EUDEV
+	select BR2_PACKAGE_EUDEV_DAEMON
 	help
 	  Userspace device daemon. This is a standalone version,
 	  independent of systemd. It is a fork maintained by Gentoo.
@@ -174,7 +175,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	  and inotify.
 
 	  You can further configure systemd in:
-	    Target packages --> Hardware handling
+	    Target packages --> Libraries --> Hardware handling --> libudev
 
 	  http://github.com/gentoo/eudev/
 
-- 
1.8.3.2

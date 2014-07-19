From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:17 +0200
Subject: [Buildroot] [PATCH 10/20 v3] package/eudev: split udev/libudev
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <0c2043f172906c7eaaa63e8b7857331e76a46b35.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quite a few packages are happy with just libudev, and not a full udev
daemon running.

Split the eudev package so that we can install just libudev if
/dev management is not handled by eudev.

When only the library is intalled, behave as a provider for the libudev
virtual package. If /dev management is handled by eudev, then also be a
provider for the udev virtual package.

Of course, libudev conflicts with systemd, but we tell the user that it
is "provided" by systemd when it is selected.

Adjust comments of dependencies accordingly.

Note:
    Most of the .mk splitting of the dependencies and the build/install
    rules are from Bernd. Thanks! :-)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: although the prompt is changed to 'libusb', we still call the
package 'eudev', to avoid a mess of renaming the variables. If needed,
that can be done in a separate patch.

Changes RFCv2-> v3:
  - typo s/system/systemd/

Changes RFCv1 -> RFCv2:
  - be a provider for libudev always, since udev is not such a provider
    any more  (Thomas)
---
 package/Config.in       |  2 +-
 package/eudev/Config.in | 40 ++++++++++++++++++++++++++++++++++++--
 package/eudev/eudev.mk  | 51 ++++++++++++++++++++++++++++++++++++++++++++-----
 system/Config.in        |  7 ++++---
 4 files changed, 89 insertions(+), 11 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1996653..d014a1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -296,7 +296,6 @@ endif
 	source "package/dvbsnoop/Config.in"
 	source "package/dtv-scan-tables/Config.in"
 	source "package/eeprog/Config.in"
-	source "package/eudev/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
 	source "package/fan-ctrl/Config.in"
@@ -663,6 +662,7 @@ menu "Hardware handling"
 	source "package/librtlsdr/Config.in"
 	source "package/libserial/Config.in"
 	source "package/libsoc/Config.in"
+	source "package/eudev/Config.in" # prompt is 'libudev'
 	source "package/libudev/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index db72e95..fca3b30 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -4,8 +4,29 @@
 # However, it seems more logical to have the dependencies listed here,
 # so it is easier to uderstand why we have those, and duplicate them in
 # the choice entry.
+#
+# Note, although named 'eudev', this package primarily provides libudev,
+# unless the /dev management is selected to be eudev, in which case this
+# package will provide a full udev. That's why the prompt is 'libudev'.
 
 config BR2_PACKAGE_EUDEV
+	bool "libudev"
+	depends on !BR2_avr32 # no __NR_name_to_handle_at
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_HAS_LIBUDEV if !BR2_PACKAGE_EUDEV_DAEMON
+	help
+	  eudev is a fork of systemd-udev with the goal of obtaining better
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
@@ -18,7 +39,7 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
 
-if BR2_PACKAGE_EUDEV
+if BR2_PACKAGE_EUDEV_DAEMON
 
 config BR2_PACKAGE_PROVIDES_LIBUDEV
 	default "eudev"
@@ -31,4 +52,19 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
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
index 1cb6b26..7ab1a59 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -16,19 +16,28 @@ EUDEV_CONF_ENV += LIBS=-lrt
 
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
+EUDEV_PROVIDES = libudev
+
+ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
+
+EUDEV_DEPENDENCIES += host-gperf util-linux kmod
+EUDEV_PROVIDES += udev
 
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
-EUDEV_PROVIDES = libudev udev
+EUDEV_CONF_OPT += \
+	--sbindir=/sbin \
+	--enable-libkmod
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPT += --enable-rule_generator
+else
+EUDEV_CONF_OPT += --disable-rule_generator
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
@@ -42,4 +51,36 @@ define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
+else # ! daemon
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
+# Symlink udev.pc to libudev.pc for those packages that conflate the two
+# and 'Requires: udev' when they should just 'Requires: libudev'. Do the
+# symlink, to avoid patching each and all of those packages.
+define EUDEV_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(STAGING_DIR) install
+	ln -sf libudev.pc $(STAGING_DIR)/usr/lib/pkgconfig/udev.pc
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
index e711d38..856b854 100644
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
1.9.1

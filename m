From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 19:41:47 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/eudev: Split libudev and daemon
In-Reply-To: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402508508-437-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide new option BR2_PACKAGE_EUDEV_DAEMON, default y for backward-
compatability.

If BR2_PACKAGE_EUDEV_DAEMON is disabled only libudev is build which
does not depend on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/Config.in |   43 ++++++++++++++++++++++++++-----------------
 package/eudev/eudev.mk  |   39 +++++++++++++++++++++++++++++++++++----
 2 files changed, 61 insertions(+), 21 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 40ff721..582909e 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,15 +1,9 @@
 config BR2_PACKAGE_EUDEV
 	bool "eudev"
-	depends on !BR2_avr32 # no epoll_create1
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-	depends on BR2_USE_MMU # uses fork()
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
-	depends on !BR2_PREFER_STATIC_LIB # kmod
+	depends on !BR2_avr32 # no __NR_name_to_handle_at
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
 	help
 	  Userspace device daemon. This is a standalone version,
 	  independent of systemd. It is a fork maintained by Gentoo.
@@ -24,19 +18,34 @@ if BR2_PACKAGE_EUDEV
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
+config BR2_PACKAGE_EUDEV_DAEMON
+	bool "enable daemon"
+	default y
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_LARGEFILE # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	help
+	  Enable eudev daemon
+
+comment "eudev daemon needs eudev /dev management"
+	depends on BR2_USE_MMU
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+
+comment "eudev daemon needs a toolchain w/ largefile"
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_EUDEV_RULES_GEN
 	bool "enable rules generator"
+	depends on BR2_PACKAGE_EUDEV_DAEMON
 	help
 	  Enable persistent rules generator
 
 endif
 
-comment "eudev needs eudev /dev management"
-	depends on !BR2_avr32
-	depends on BR2_USE_MMU
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
+comment "eudev needs a toolchain w/ wchar, dynamic library"
 	depends on !BR2_avr32
-	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 5f1525c..974e2bc 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -16,17 +16,23 @@ EUDEV_CONF_ENV += LIBS=-lrt
 
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
 
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
+EUDEV_DEPENDENCIES = host-pkgconf
 EUDEV_PROVIDES = udev
 
+ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
+
+EUDEV_DEPENDENCIES += host-gperf util-linux kmod
+
+EUDEV_CONF_OPT += \
+	--sbindir=/sbin \
+	--enable-libkmod
+
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPT += --enable-rule_generator
 endif
@@ -42,4 +48,29 @@ define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
+else
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
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4

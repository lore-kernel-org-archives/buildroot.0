From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 May 2014 20:31:01 +0200
Subject: [Buildroot] [PATCH 1/1] WIP: libudev: New package
In-Reply-To: <1401129061-25216-1-git-send-email-bernd.kuhls@t-online.de>
References: <1401129061-25216-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1401129061-25216-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in          |    1 +
 package/libudev/Config.in  |    9 +++++++++
 package/libudev/libudev.mk |   43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..14d632e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -631,6 +631,7 @@ source "package/libqmi/Config.in"
 source "package/libraw1394/Config.in"
 source "package/libserial/Config.in"
 source "package/libsoc/Config.in"
+source "package/libudev/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libudev/Config.in b/package/libudev/Config.in
new file mode 100644
index 0000000..f3f1b59
--- /dev/null
+++ b/package/libudev/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBUDEV
+	bool "libudev"
+	depends on !BR2_INIT_SYSTEMD
+	depends on !BR2_PACKAGE_EUDEV
+	help
+	  libudev provides a set of functions for accessing the udev database
+	  and querying sysfs.
+
+	  http://github.com/gentoo/eudev/
diff --git a/package/libudev/libudev.mk b/package/libudev/libudev.mk
new file mode 100644
index 0000000..9dfd214
--- /dev/null
+++ b/package/libudev/libudev.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# libudev
+#
+################################################################################
+
+LIBUDEV_VERSION = v1.6
+LIBUDEV_SITE = $(call github,gentoo,eudev,$(LIBUDEV_VERSION))
+LIBUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
+LIBUDEV_LICENSE_FILES = COPYING
+LIBUDEV_INSTALL_STAGING = YES
+LIBUDEV_AUTORECONF = YES
+
+LIBUDEV_DEPENDENCIES = host-pkgconf
+
+LIBUDEV_CONF_OPT += \
+	--disable-manpages \
+	--with-rootlibdir=/lib \
+	--libexecdir=/lib \
+	--with-firmware-path=/lib/firmware \
+	--disable-introspection \
+	--disable-keymap \
+	--disable-libkmod \
+	--disable-modules \
+	--disable-selinux \
+	--disable-rule-generator \
+	--disable-gtk-doc \
+	--disable-gudev \
+	--enable-split-usr
+
+define LIBUDEV_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev
+endef
+
+define LIBUDEV_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBUDEV_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(autotools-package))
-- 
1.7.10.4

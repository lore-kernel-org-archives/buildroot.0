From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 19 Nov 2013 16:18:38 +0100
Subject: [Buildroot] [PATCH v4 2/5] eudev: new package.
In-Reply-To: <1384874321-12397-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1384874321-12397-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1384874321-12397-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

eudev is a userspace device management daemon. It is a standalone
version, independent from systemd. It is a fork maintained by Gentoo.

Features:

 - No extra configuration options are available: Gudev is build if
   libglib2 is selected.
 - No dependency on hwdata as the package uses its own hardware
   database (as does systemd).

eudev 1.3 is in sync with systemd v207.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in               |    1 +
 package/eudev/Config.in         |   34 +++++++++++++++++++++++++++
 package/{udev => eudev}/S10udev |    2 +-
 package/eudev/eudev.mk          |   48 +++++++++++++++++++++++++++++++++++++++
 system/Config.in                |   13 +++++++++++
 5 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 package/eudev/Config.in
 copy package/{udev => eudev}/S10udev (98%)
 create mode 100644 package/eudev/eudev.mk

diff --git a/package/Config.in b/package/Config.in
index 311cc6c..206771d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -274,6 +274,7 @@ source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
+source "package/eudev/Config.in"
 source "package/evtest/Config.in"
 source "package/fan-ctrl/Config.in"
 source "package/fconfig/Config.in"
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
new file mode 100644
index 0000000..0846d01
--- /dev/null
+++ b/package/eudev/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_EUDEV
+	bool "eudev"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_PREFER_STATIC_LIB # kmod
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	help
+	  Userspace device daemon. This is a standalone version,
+	  independent of systemd. It is a fork maintained by Gentoo.
+
+	  eudev requires a Linux kernel >= 2.6.32: it relies on devtmpfs.
+
+	  http://github.com/gentoo/eudev/
+
+if BR2_PACKAGE_EUDEV
+
+config BR2_PACKAGE_EUDEV_RULES_GEN
+	bool "enable rules generator"
+	help
+	  Enable persistant rules generator
+
+endif
+
+comment "eudev needs /dev management set to eudev"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+
+comment "eudev needs a toolchain w/ largefile, wchar"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+
+comment "eudev needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/udev/S10udev b/package/eudev/S10udev
similarity index 98%
copy from package/udev/S10udev
copy to package/eudev/S10udev
index 2c7b7e9..e4d28a2 100755
--- a/package/udev/S10udev
+++ b/package/eudev/S10udev
@@ -17,7 +17,7 @@
 #
 
 # Check for missing binaries
-UDEV_BIN=/lib/udev/udevd
+UDEV_BIN=/sbin/udevd
 test -x $UDEV_BIN || exit 5
 
 # Check for config file and read it
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
new file mode 100644
index 0000000..aac37e7
--- /dev/null
+++ b/package/eudev/eudev.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# eudev
+#
+################################################################################
+
+EUDEV_VERSION         = 1.3
+EUDEV_SITE            = https://github.com/gentoo/eudev/archive/
+EUDEV_SOURCE          = v$(EUDEV_VERSION).tar.gz
+EUDEV_LICENSE         = GPLv2+
+EUDEV_LICENSE_FILES   = COPYING
+EUDEV_INSTALL_STAGING = YES
+EUDEV_AUTORECONF      = YES
+
+# mq_getattr is in librt
+EUDEV_CONF_ENV += LIBS=-lrt
+
+EUDEV_CONF_OPT =		\
+	--sbindir=/sbin		\
+	--with-rootlibdir=/lib	\
+	--libexecdir=/lib	\
+	--with-firmware-path=/lib/firmware	\
+	--disable-introspection			\
+	--enable-split-usr			\
+	--enable-libkmod
+
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
+
+ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
+EUDEV_CONF_OPT += --enable-rule_generator
+endif
+
+ifeq ($(BR2_LARGEFILE),)
+EUDEV_CONF_OPT += --disable-largefile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+EUDEV_CONF_OPT += --enable-gudev
+EUDEV_DEPENDENCIES += libglib2
+else
+EUDEV_CONF_OPT += --disable-gudev
+endif
+
+define EUDEV_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+endef
+
+$(eval $(autotools-package))
diff --git a/system/Config.in b/system/Config.in
index c8f2758..f9b5b0a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -127,6 +127,19 @@ comment "udev needs a toolchain w/ largefile, wchar"
 comment "udev doesn't work with 'prefer static libraries'"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	bool "Dynamic using eudev"
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_EUDEV
+
+comment "eudev needs a toolchain w/ largefile, wchar"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+
+comment "eudev needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
-- 
1.7.9.5

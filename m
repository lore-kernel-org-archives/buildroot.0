From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:36 +0100
Subject: [Buildroot] [PATCH 06/13] libcec: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <af62c92a3e5c4bfce4ec2e5cb0bc587ff13cec0a.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libCEC allows you in combination with the right hardware to control your device
with your TV remote control. Utilising your existing HDMI cabling
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in        |    1 +
 package/libcec/Config.in |   30 ++++++++++++++++++++++++++++++
 package/libcec/libcec.mk |   22 ++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/libcec/Config.in
 create mode 100644 package/libcec/libcec.mk

diff --git a/package/Config.in b/package/Config.in
index 2106391..c6e1fd4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,6 +448,7 @@ source "package/imx-lib/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libatasmart/Config.in"
+source "package/libcec/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libfreefare/Config.in"
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
new file mode 100644
index 0000000..5051b94
--- /dev/null
+++ b/package/libcec/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_LIBCEC
+	bool "libcec"
+	select BR2_PACKAGE_LOCKDEV
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libCEC allows you in combination with the right hardware to
+	  control your device with your TV remote control. Utilising your
+	  existing HDMI cabling.
+	  
+	  https://github.com/Pulse-Eight/libcec
+
+if BR2_PACKAGE_LIBCEC && BR2_arm
+
+config BR2_PACKAGE_LIBCEC_RBP
+	bool "rpi support"
+	depends on BR2_LARGEFILE
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_RPI_USERLAND
+	help
+	  Enable RasberryPi support
+
+comment "rpi support requires a toolchain with LARGEFILE and C++ support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_LARGEFILE)
+
+endif
+
+comment "libcec requires a toolchain with WCHAR and C++ support"
+	depends on !(BR2_USE_WCHAR && BR2_INSTALL_LIBSTDCPP)
+
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
new file mode 100644
index 0000000..2974cbf
--- /dev/null
+++ b/package/libcec/libcec.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# libcec
+#
+#############################################################
+
+LIBCEC_VERSION = 89ea1724e7a4bde3f7a4f958b414889cefddb841
+LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/master
+LIBCEC_INSTALL_STAGING = YES
+LIBCEC_AUTORECONF = YES
+LIBCEC_LICENSE = GPLv2
+LIBCEC_LICENSE_FILES = COPYING
+LIBCEC_DEPENDENCIES = lockdev host-pkgconf
+
+ifeq ($(BR2_PACKAGE_LIBCEC_RBP),y)
+LIBCEC_DEPENDENCIES += rpi-userland
+LIBCEC_CONF_OPT += --enable-rpi \
+	--with-rpi-lib-path=$(STAGING_DIR)/usr/lib \
+	--with-rpi-include-path=$(STAGING_DIR)/usr/include
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4

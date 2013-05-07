From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue,  7 May 2013 15:46:59 -0500
Subject: [Buildroot] [PATCH v2 1/2] libcec: add libcec for HDMI device
	Control
In-Reply-To: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
References: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1367959620-17176-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds libcec for HDMI device control.  It enables Raspberry Pi
support if the rpi-userland package is installed.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in        |    1 +
 package/libcec/Config.in |    8 ++++++++
 package/libcec/libcec.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/libcec/Config.in
 create mode 100644 package/libcec/libcec.mk

diff --git a/package/Config.in b/package/Config.in
index 81a3f76..23af3f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -463,6 +463,7 @@ source "package/imx-lib/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libatasmart/Config.in"
+source "package/libcec/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libfreefare/Config.in"
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
new file mode 100644
index 0000000..1cacd4a
--- /dev/null
+++ b/package/libcec/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBCEC
+	bool "libcec"
+	help
+	  libcec allows you in combination with the right hardware to control your
+	  home theater devices with your TV remote control utilizing existing HDMI
+	  cabling.
+
+	  http://libcec.pulse-eight.com
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
new file mode 100644
index 0000000..cc2fbed
--- /dev/null
+++ b/package/libcec/libcec.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# libcec
+#
+#############################################################
+
+LIBCEC_VERSION = libcec-2.1.1
+LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/$(LIBCEC_VERSION)
+LIBCEC_LICENSE = GPLv2+
+LIBCEC_LICENSE_FILE = COPYING
+
+LIBCEC_AUTORECONF = YES
+LIBCEC_INSTALL_STAGING = YES
+LIBCEC_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_LOCKDEV),y)
+LIBCEC_DEPENDENCIES += lockdev
+endif
+
+ifeq ($(BR2_PACKAGE_UDEV),y)
+LIBCEC_DEPENDENCIES += udev
+endif
+
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+LIBCEC_CONF_OPT = --enable-rpi \
+   --with-rpi-include-path=$(STAGING_DIR)/usr/include
+LIBCEC_DEPENDENCIES += rpi-userland
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5

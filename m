From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 21:30:40 +0200
Subject: [Buildroot] [git commit] libcec: add libcec for HDMI device Control
Message-ID: <20130729193039.37DA89AE88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50695daad6bd76f43cacf9bbaa753bcebd84a38b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds libcec for HDMI device control.  It enables Raspberry Pi
support if the rpi-userland package is installed.

[Thomas: add C++ dependency, reformat .mk header.]
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/libcec/Config.in |   12 ++++++++++++
 package/libcec/libcec.mk |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5189b23..6dfab7b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -495,6 +495,7 @@ source "package/dtc/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libatasmart/Config.in"
+source "package/libcec/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libfreefare/Config.in"
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
new file mode 100644
index 0000000..b1fa03b
--- /dev/null
+++ b/package/libcec/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBCEC
+	bool "libcec"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libcec allows you in combination with the right hardware to
+	  control your home theater devices with your TV remote
+	  control utilizing existing HDMI cabling.
+
+	  http://libcec.pulse-eight.com
+
+comment "libcec requires C++ support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
new file mode 100644
index 0000000..49fa067
--- /dev/null
+++ b/package/libcec/libcec.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libcec
+#
+################################################################################
+
+LIBCEC_VERSION = libcec-2.1.1
+LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/$(LIBCEC_VERSION)
+LIBCEC_LICENSE = GPLv2+
+LIBCEC_LICENSE_FILE = COPYING
+
+# Autoreconf required due to being a dev tarball and not a release tarball.
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
+else
+LIBCEC_CONF_OPT = --disable-rpi
+endif
+
+$(eval $(autotools-package))

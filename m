From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Aug 2014 08:39:48 +0200
Subject: [Buildroot] [git commit] new package: libphidget
Message-ID: <20140901132446.765EC9D5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f7ea83e1363a48050cff9d7b0a2496237a1d96c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: order alphabetically]
Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |    1 +
 package/libphidget/Config.in     |   24 ++++++++++++++++++++++++
 package/libphidget/libphidget.mk |   16 ++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7bb8fc0..2a4d994 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -669,6 +669,7 @@ menu "Hardware handling"
 	source "package/libllcp/Config.in"
 	source "package/libmbim/Config.in"
 	source "package/libnfc/Config.in"
+	source "package/libphidget/Config.in"
 	source "package/libqmi/Config.in"
 	source "package/libraw1394/Config.in"
 	source "package/librtlsdr/Config.in"
diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
new file mode 100644
index 0000000..9f3e4bf
--- /dev/null
+++ b/package/libphidget/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_LIBPHIDGET
+	bool "libphidget"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  The libphidget library provides an API for controlling Phidgets
+	  USB devices. The library translates API function calls to libusb
+	  function calls to control attached Phidgets devices that provide
+	  GPIO's, DAC's, accelerometers, servo motors, and other capabilities
+	  either singly or on combo devices.
+
+	  To use libphidget for controlling locally attached devices you
+	  need to set up the userspace USB device tree /dev/bus/usb. See
+	  file udev/99-phidgets.rules.
+
+	  The libphidget library also contains an API for sending commands
+	  to a local or remote phidgetwebservice using HTTP. The
+	  phidgetwebservice then translates HTTP requests to libphidget API
+	  function calls to control locally attached Phidgets devices.
+
+	  http://phidgets.com/
+
+comment "libphidget needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
new file mode 100644
index 0000000..ee5796e
--- /dev/null
+++ b/package/libphidget/libphidget.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libphidget
+#
+################################################################################
+
+LIBPHIDGET_VERSION = 2.1.8.20140319
+LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
+LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries/
+LIBPHIDGET_DEPENDENCIES = libusb
+LIBPHIDGET_CONF_OPT = --disable-ldconfig
+LIBPHIDGET_INSTALL_STAGING = YES
+LIBPHIDGET_LICENSE = LGPLv3
+LIBPHIDGET_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Sep 2011 23:16:53 +0200
Subject: [Buildroot] [git commit] New package: bluez-utils
Message-ID: <20110926211832.3268A8D3C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06c3e2159686a886e52b2522a47e60c300cfb7f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bluetooth utils often used in embedded system, add it to package.

[Peter: fix dbus dependency]
Signed-off-by: Bob Liu <lliubbo@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/bluez_utils/Config.in      |   35 +++++++++++++++++++++++++++
 package/bluez_utils/bluez_utils.mk |   46 ++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5f9af59..3d04056 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -390,6 +390,7 @@ menu "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
+source "package/bluez_utils/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/boa/Config.in"
 endif
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
new file mode 100644
index 0000000..ea6b44c
--- /dev/null
+++ b/package/bluez_utils/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_BLUEZ_UTILS
+	bool "bluez-utils"
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_EXPAT if !BR2_PACKAGE_DBUS_LIBXML2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  bluez utils
+
+	  http://www.kernel.org/pub/linux/bluetooth
+
+if BR2_PACKAGE_BLUEZ_UTILS
+
+config BR2_PACKAGE_BLUEZ_UTILS_COMPAT
+	bool "BlueZ 3.x compatibility binaries"
+	help
+	  BlueZ 3.x compatibility binaries like pand, hidd, sdp
+
+config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
+	bool "audio support"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Audio support
+
+config BR2_PACKAGE_BLUEZ_UTILS_USB
+	bool "USB support"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  USB support
+
+endif
+
+comment "bluez-utils require a toolchain with WCHAR support"
+	depends on !(BR2_USE_WCHAR)
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
new file mode 100644
index 0000000..cbadf33
--- /dev/null
+++ b/package/bluez_utils/bluez_utils.mk
@@ -0,0 +1,46 @@
+#############################################################
+#
+# bluez_utils
+#
+#############################################################
+BLUEZ_UTILS_VERSION = 4.96
+BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.gz
+BLUEZ_UTILS_SITE = http://www.kernel.org/pub/linux/bluetooth/
+BLUEZ_UTILS_INSTALL_STAGING = YES
+BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
+BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools
+
+# BlueZ 3.x compatibility
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_COMPAT),y)
+BLUEZ_UTILS_CONF_OPT +=	\
+	--enable-hidd	\
+	--enable-pand	\
+	--enable-sdp	\
+	--enable-dund
+endif
+
+# audio support
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_AUDIO),y)
+BLUEZ_UTILS_DEPENDENCIES +=	\
+	alsa-lib		\
+	libsndfile
+BLUEZ_UTILS_CONF_OPT +=	\
+	--enable-alsa	\
+	--enable-audio
+else
+BLUEZ_UTILS_CONF_OPT +=	\
+	--disable-alsa	\
+	--disable-audio
+endif
+
+# USB support
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_USB),y)
+BLUEZ_UTILS_DEPENDENCIES += libusb
+BLUEZ_UTILS_CONF_OPT +=	\
+	--enable-usb
+else
+BLUEZ_UTILS_CONF_OPT +=	\
+	--disable-usb
+endif
+
+$(eval $(call AUTOTARGETS,package,bluez_utils))

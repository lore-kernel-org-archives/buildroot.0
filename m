From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 19 Dec 2013 20:28:26 +0100
Subject: [Buildroot] [PATCH] bluez-utils: Add GATT support
Message-ID: <1387481306-25377-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to compile gatttool which can help use Bluetooth Low Energy
devices.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/bluez_utils/Config.in      | 4 ++++
 package/bluez_utils/bluez_utils.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index e08e9be2db95..ebcd526522ba 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -36,6 +36,10 @@ config BR2_PACKAGE_BLUEZ_UTILS_USB
 	help
 	  USB support
 
+config BR2_PACKAGE_BLUEZ_UTILS_GATT
+	bool "GATT support"
+	help
+	  GATT support
 endif
 
 comment "bluez-utils needs a toolchain w/ wchar, threads"
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 7038638a0748..f6484ae723af 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -37,6 +37,13 @@ BLUEZ_UTILS_CONF_OPT +=	\
 	--disable-audio
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_GATT),y)
+BLUEZ_UTILS_DEPENDENCIES +=	readline
+BLUEZ_UTILS_CONF_OPT +=	--enable-gatt
+else
+BLUEZ_UTILS_CONF_OPT +=	--disable-gatt
+endif
+
 # USB support
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_USB),y)
 BLUEZ_UTILS_DEPENDENCIES += libusb
-- 
1.8.3.2

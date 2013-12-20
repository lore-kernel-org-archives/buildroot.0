From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri, 20 Dec 2013 15:20:23 +0100
Subject: [Buildroot] [PATCHv2] bluez-utils: Add GATT support
Message-ID: <1387549223-18285-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to compile gatttool which can help use Bluetooth Low Energy
devices.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/bluez_utils/Config.in      | 7 +++++++
 package/bluez_utils/bluez_utils.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index e08e9be2db95..1315b9ef4166 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -36,6 +36,13 @@ config BR2_PACKAGE_BLUEZ_UTILS_USB
 	help
 	  USB support
 
+config BR2_PACKAGE_BLUEZ_UTILS_GATT
+	bool "GATT support"
+	select BR2_PACKAGE_READLINE
+	help
+	  Generic Attribute Profile (GATT) support. This provides profile
+	  discovery and description services for Bluetooth Low Energy.
+	  This will install the gatttool utility.
 endif
 
 comment "bluez-utils needs a toolchain w/ wchar, threads"
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 7038638a0748..4da2e6435c40 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -37,6 +37,13 @@ BLUEZ_UTILS_CONF_OPT +=	\
 	--disable-audio
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_GATT),y)
+BLUEZ_UTILS_DEPENDENCIES += readline
+BLUEZ_UTILS_CONF_OPT += --enable-gatt
+else
+BLUEZ_UTILS_CONF_OPT += --disable-gatt
+endif
+
 # USB support
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_USB),y)
 BLUEZ_UTILS_DEPENDENCIES += libusb
-- 
1.8.3.2

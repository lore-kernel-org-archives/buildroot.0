From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Dec 2013 15:43:57 +0100
Subject: [Buildroot] [git commit] bluez-utils: Add GATT support
Message-ID: <20131220145309.672409C139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9dc1bbe5ea80f5a2f29f284f516bec7a7cab2952
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to compile gatttool which can help use Bluetooth Low Energy
devices.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez_utils/Config.in      |    7 +++++++
 package/bluez_utils/bluez_utils.mk |    7 +++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index e08e9be..1315b9e 100644
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
index 7038638..4da2e64 100644
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

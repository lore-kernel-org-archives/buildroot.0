From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 May 2017 15:59:41 +0300
Subject: [Buildroot] [PATCH 1/4] bluez5_utils: allow install of deprecated
	tools
In-Reply-To: <cover.1493643541.git.baruch@tkos.co.il>
References: <cover.1493643541.git.baruch@tkos.co.il>
Message-ID: <a98f6fda9cded4f8416b2a6f2249e85be944eca4.1493643541.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since BlueZ 5.44 many command line tools are deprecated, among them
gatttool. Add an option to install these tools.

Remove the gatttool specific option, since it is redundant now.

Fixes:
http://autobuild.buildroot.net/results/ddb/ddb975c9e1475fee1da63cb21240d8d59b161076/
http://autobuild.buildroot.net/results/19a/19adc0aa5a7e48119ef4ba25ba0403867f74f678/
http://autobuild.buildroot.net/results/9bd/9bd8e13ddffdd0631ddca30ec40cc4664729b0cb/

Cc: Marcin Bis <marcin@bis.org.pl>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Config.in.legacy                     |  9 +++++++++
 package/bluez5_utils/Config.in       | 13 +++++--------
 package/bluez5_utils/bluez5_utils.mk |  5 ++++-
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 98b9eeb84fc2..bc14bf2a61da 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
+	bool "bluez5_utils gatttool install option removed"
+	select BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
+	help
+	  The option to install gatttool specifically has been removed.
+	  Since version 5.44 gatttool is in the list of deprecated
+	  tools. The option to build and install deprecated tools has
+	  been automatically enabled.
+
 config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "openocd ft2232 support has been removed"
 	select BR2_PACKAGE_OPENOCD_FTDI
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 3611c6971a6d..285560aee9be 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -48,16 +48,13 @@ config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 comment "bluez5-utils client needs a glibc or musl toolchain"
 	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
-config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
-	bool "install GATT tool"
+config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
+	bool "install deprecated tool"
 	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	help
-	  Generic Attribute Profile (GATT) support. This provides
-	  profile discovery and description services for Bluetooth Low
-	  Energy. This will install the gatttool utility.
-
-	  It is always built with BlueZ 5.x, but upstream choose not
-	  to install it by default.
+	  Build BlueZ 5.x deprecated tools. These currently include:
+	  hciattach, hciconfig, hcitool, hcidump, rfcomm, sdptool,
+	  ciptool, gatttool.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	bool "build experimental plugins"
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index aaefcb6ace9b..fac79580024f 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -46,11 +46,14 @@ BLUEZ5_UTILS_CONF_OPTS += --disable-sixaxis
 endif
 
 # install gatttool (For some reason upstream choose not to do it by default)
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED),y)
 define BLUEZ5_UTILS_INSTALL_GATTTOOL
 	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin/gatttool
 endef
 BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
+BLUEZ5_UTILS_CONF_OPTS += --enable-deprecated
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-deprecated
 endif
 
 # enable test
-- 
2.11.0

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 May 2017 14:30:34 +0200
Subject: [Buildroot] [git commit] bluez5_utils: allow install of deprecated
	tools
Message-ID: <20170505123802.CFEB082890@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0364d44f1ab6d1427f801e545f837d696a4bba93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     |  9 +++++++++
 package/bluez5_utils/Config.in       | 13 +++++--------
 package/bluez5_utils/bluez5_utils.mk |  5 ++++-
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 98b9eeb..bc14bf2 100644
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
index 3611c69..285560a 100644
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
index aaefcb6..fac7958 100644
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

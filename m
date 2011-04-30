From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sat, 30 Apr 2011 15:42:49 +0200
Subject: [Buildroot] [PATCH 2/2] package: add openocd support
In-Reply-To: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
References: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <1304170969-30138-2-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with only usb option that depend only on libusb for now on

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Patrice Vilchez <patrice.vilchez@atmel.com>
---
 package/Config.in          |    1 +
 package/openocd/Config.in  |   85 ++++++++++++++++++++++++++++++++++++++++++++
 package/openocd/openocd.mk |   50 ++++++++++++++++++++++++++
 3 files changed, 136 insertions(+), 0 deletions(-)
 create mode 100644 package/openocd/Config.in
 create mode 100644 package/openocd/openocd.mk

diff --git a/package/Config.in b/package/Config.in
index cd89892..4f24595 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -362,6 +362,7 @@ endmenu
 
 menu "Miscellaneous"
 source "package/shared-mime-info/Config.in"
+source "package/openocd/Config.in"
 endmenu
 
 menu "Networking applications"
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
new file mode 100644
index 0000000..3efa3e7
--- /dev/null
+++ b/package/openocd/Config.in
@@ -0,0 +1,85 @@
+menuconfig BR2_PACKAGE_OPENOCD
+	bool "OpenOCD"
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_JIMTCL
+	help
+	  OpenOCD - Open On-Chip Debugger
+
+	  http://openocd.berlios.de/web/
+
+if BR2_PACKAGE_OPENOCD
+
+choice
+	prompt "OPENOCD Git"
+	default BR2_TARGET_OPENOCD_GIT
+	help
+	  Select the specific OpenOCD Git you want to use
+
+config BR2_TARGET_OPENOCD_GIT
+	bool "Official"
+
+config BR2_TARGET_OPENOCD_GIT_CUSTOM
+	bool "Custom"
+
+endchoice
+
+if BR2_TARGET_OPENOCD_GIT_CUSTOM
+
+config BR2_TARGET_OPENOCD_CUSTOM_GIT_LOCATION
+	string "URL of custom OpenOCD git"
+
+endif
+
+choice
+	prompt "OpenOCD Version"
+	default BR2_TARGET_OPENOCD_2011.01
+	help
+	  Select the specific OpenOCD version you want to use
+
+config BR2_TARGET_OPENOCD_HEAD
+	bool "HEAD"
+
+config BR2_TARGET_OPENOCD_0_4_0
+	bool "0.4.0"
+
+config BR2_TARGET_OPENOCD_0_3_1
+	bool "0.3.1"
+
+config BR2_TARGET_OPENOCD_CUSTOM
+	bool "Custom"
+
+endchoice
+
+config BR2_TARGET_OPENOCD_VERSION
+	string
+	default "HEAD"		if BR2_TARGET_OPENOCD_HEAD
+	default "v0.4.0"	if BR2_TARGET_OPENOCD_0_4_0
+	default "v0.3.1"	if BR2_TARGET_OPENOCD_0_3_1
+	default "custom"	if BR2_TARGET_OPENOCD_VERSION_CUSTOM
+
+if BR2_TARGET_OPENOCD_VERSION_CUSTOM
+
+config BR2_TARGET_OPENOCD_CUSTOM_COMMIT
+	string "URL of custom OpenOCD commit"
+
+endif
+
+comment "Options"
+
+config BR2_PACKAGE_OPENOCD_ETM
+	bool "OpenOCD+trace ETM capture hardware"
+	help
+	  OpenOCD+trace ETM capture hardware for some prototype
+
+comment "Adapters"
+
+config BR2_PACKAGE_OPENOCD_JLINK
+	bool "Segger J-Link JTAG Programmer"
+	help
+	  Segger J-Link JTAG Programmer and clone such as Atmel SAM-ICE
+
+config BR2_PACKAGE_OPENOCD_VSLLINK
+	bool "Versaloon-Link JTAG Programmr"
+
+endif # BR2_PACKAGE_OPENOCD
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
new file mode 100644
index 0000000..b69b515
--- /dev/null
+++ b/package/openocd/openocd.mk
@@ -0,0 +1,50 @@
+#############################################################
+#
+# openocd
+#
+#############################################################
+OPENOCD_VERSION:=$(call qstrip,$(BR2_TARGET_OPENOCD_VERSION))
+OPENOCD_SITE_METHOD:=git
+DL_TOOLS_DEPENDENCIES += git
+
+ifneq ($(BR2_TARGET_OPENOCD_CUSTOM_GIT_LOCATION),)
+OPENOCD_SITE:=$(call qstrip,$(BR2_TARGET_OPENOCD_CUSTOM_GIT_LOCATION))
+else
+OPENOCD_SITE:=http://repo.or.cz/r/jimtcl.git
+endif
+
+ifeq ($(OPENOCD_VERSION),custom)
+OPENOCD_VERSION=$(call qstrip,$(BR2_TARGET_OPENOCD_CUSTOM_COMMIT))
+endif
+
+# Force it as the version can be a name such as HEAD
+OPENOCD_DL_VERSION=$(OPENOCD_VERSION)
+
+OPENOCD_AUTORECONF = YES
+OPENOCD_CONF_OPT = \
+	--enable-maintainer-mode \
+	--oldincludedir=$(STAGING_DIR)/usr/include \
+	--includedir=$(STAGING_DIR)/usr/include \
+	--enable-static \
+	--disable-shared \
+	--disable-internal-jimtcl \
+	--disable-doxygen-html \
+	--enable-dummy
+
+OPENOCD_DEPENDENCIES = libusb-compat jimtcl
+
+# Options
+ifeq ($(BR2_PACKAGE_OPENOCD_ETM),y)
+OPENOCD_CONF_OPT += --enable-oocd_trace
+endif
+
+# Adapters
+ifeq ($(BR2_PACKAGE_OPENOCD_JLINK),y)
+OPENOCD_CONF_OPT += --enable-jlink
+endif
+
+ifeq ($(BR2_PACKAGE_OPENOCD_VSLLINK),y)
+OPENOCD_CONF_OPT += --enable-vsllink
+endif
+
+$(eval $(call AUTOTARGETS,package,openocd))
-- 
1.7.4.1

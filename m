From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Oct 2014 23:47:38 +0200
Subject: [Buildroot] [PATCH 1/1] [WIP] package/swupdate: new package
Message-ID: <1413841658-10259-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is mainly a draft based on Busybox package.
Just build tested with one x86 toolchain.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>
---
Note: The following patch was sent in order to build swupdate in Buildroot:
    http://patchwork.ozlabs.org/patch/386687/

 package/Config.in                                  |  1 +
 package/swupdate/Config.in                         | 41 ++++++++++
 ...wupdate-0001-Add-missing-header-for-off_t.patch | 25 ++++++
 package/swupdate/swupdate.config                   | 77 ++++++++++++++++++
 package/swupdate/swupdate.mk                       | 94 ++++++++++++++++++++++
 5 files changed, 238 insertions(+)
 create mode 100644 package/swupdate/Config.in
 create mode 100644 package/swupdate/swupdate-0001-Add-missing-header-for-off_t.patch
 create mode 100644 package/swupdate/swupdate.config
 create mode 100644 package/swupdate/swupdate.mk

diff --git a/package/Config.in b/package/Config.in
index 89b46dc..8fccb25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ endif
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali/Config.in"
 	source "package/sunxi-mali-prop/Config.in"
+	source "package/swupdate/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
new file mode 100644
index 0000000..7edc75b
--- /dev/null
+++ b/package/swupdate/Config.in
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_SWUPDATE
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_MTD
+	# Probably needs some dependency
+	bool "swupdate"
+	help
+	  swupdate provides a reliable way to update the software on an embedded
+	  system.
+
+	  https://github.com/sbabic/swupdate.git
+
+if BR2_PACKAGE_SWUPDATE
+
+config BR2_PACKAGE_SWUPDATE_CONFIG
+	string "swupdate configuration file to use?"
+	default "package/swupdate/swupdate.config"
+	help
+	  Some people may wish to use their own modified swupdate configuration
+	  file, and will specify their config file location with this option.
+
+	  Most people will just use the default swupdate configuration file.
+
+config BR2_PACKAGE_SWUPDATE_LUA
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_1
+	bool "Enable lua interpreter"
+	help
+	  Enable LUA interpreter.
+
+comment "swupdate needs a Lua 5.2 interpreter"
+	depends on BR2_PACKAGE_LUA_5_1 || !BR2_PACKAGE_HAS_LUAINTERPRETER
+
+config BR2_PACKAGE_SWUPDATE_LIBCONFIG
+	select BR2_PACKAGE_LIBCONFIG
+	bool "Enable libconfig parser"
+	default y
+	help
+	  Use libconfig to parse the configuration file.
+	  This is the default parser.
+
+endif
diff --git a/package/swupdate/swupdate-0001-Add-missing-header-for-off_t.patch b/package/swupdate/swupdate-0001-Add-missing-header-for-off_t.patch
new file mode 100644
index 0000000..4be0f7b
--- /dev/null
+++ b/package/swupdate/swupdate-0001-Add-missing-header-for-off_t.patch
@@ -0,0 +1,25 @@
+From 4e382373cad64ca7e183336e33b72c53cfeed340 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 7 Sep 2014 17:31:09 +0200
+Subject: [PATCH 1/1] Add missing header for off_t
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ include/swupdate.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/swupdate.h b/include/swupdate.h
+index 78b7f85..c193397 100644
+--- a/include/swupdate.h
++++ b/include/swupdate.h
+@@ -23,6 +23,7 @@
+ #ifndef _SWUPDATE_H
+ #define _SWUPDATE_H
+ 
++#include <sys/types.h>
+ #include <sys/queue.h>
+ #include "flash.h"
+ #include "globals.h"
+-- 
+1.9.3
+
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
new file mode 100644
index 0000000..1787824
--- /dev/null
+++ b/package/swupdate/swupdate.config
@@ -0,0 +1,77 @@
+#
+# Automatically generated make config: don't edit
+# swupdate version: 2014.07.0
+# Thu Sep  4 23:38:08 2014
+#
+CONFIG_HAVE_DOT_CONFIG=y
+
+#
+# Swupdate Settings
+#
+
+#
+# General Configuration
+#
+CONFIG_SCRIPTS=y
+# CONFIG_HW_COMPATIBILITY is not set
+CONFIG_HW_COMPATIBILITY_FILE=""
+CONFIG_LUA=y
+# CONFIG_FEATURE_SYSLOG is not set
+
+#
+# Build Options
+#
+# CONFIG_STATIC is not set
+CONFIG_CROSS_COMPILER_PREFIX=""
+CONFIG_SYSROOT=""
+CONFIG_EXTRA_CFLAGS=""
+CONFIG_EXTRA_LDFLAGS=""
+CONFIG_EXTRA_LDLIBS=""
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_WERROR is not set
+# CONFIG_NOCLEANUP is not set
+CONFIG_WEBSERVER=y
+
+#
+# Webserver Features
+#
+# CONFIG_MONGOOSE is not set
+# CONFIG_MONGOOSELUA is not set
+# CONFIG_MONGOOSESQL is not set
+# CONFIG_MONGOOSEIPV6 is not set
+# CONFIG_MONGOOSESSL is not set
+
+#
+# Archival Features
+#
+CONFIG_CPIO=y
+CONFIG_GUNZIP=y
+
+#
+# Parser Features
+#
+CONFIG_LIBCONFIG=y
+# CONFIG_LUAEXTERNAL is not set
+# CONFIG_SETEXTPARSERNAME is not set
+CONFIG_EXTPARSERNAME=""
+# CONFIG_SETSWDESCRIPTION is not set
+CONFIG_SWDESCRIPTION=""
+
+#
+# Image Handlers
+#
+CONFIG_UBIVOL=y
+CONFIG_UBIBLACKLIST=""
+CONFIG_UBIVIDOFFSET=0
+CONFIG_CFI=y
+CONFIG_RAW=y
+CONFIG_LUASCRIPTHANDLER=y
+CONFIG_SHELLSCRIPTHANDLER=y
+CONFIG_HANDLER_IN_LUA=y
+# CONFIG_UBOOT is not set
+CONFIG_UBOOT_FWENV=""
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
new file mode 100644
index 0000000..7e07245
--- /dev/null
+++ b/package/swupdate/swupdate.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# swupdate
+#
+################################################################################
+
+SWUPDATE_VERSION = a4c94e334c4bdb0b95b8ea324a413abade93ed03
+SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
+SWUPDATE_LICENSE = GPLv2
+SWUPDATE_LICENSE_FILES = COPYING
+SWUPDATE_DEPENDENCIES = zlib mtd
+
+SWUPDATE_CFLAGS = \
+	$(TARGET_CFLAGS)
+
+SWUPDATE_LDFLAGS = \
+	$(TARGET_LDFLAGS)
+
+SWUPDATE_BUILD_CONFIG = $(SWUPDATE_DIR)/.config
+# Allows the build system to tweak CFLAGS
+SWUPDATE_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	CFLAGS="$(SWUPDATE_CFLAGS)" \
+	LDFLAGS="$(SWUPDATE_LDFLAGS)"
+
+SWUPDATE_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	ARCH=$(KERNEL_ARCH) \
+	PREFIX="$(TARGET_DIR)" \
+	EXTRA_LDFLAGS="$(SWUPDATE_LDFLAGS)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CONFIG_PREFIX="$(TARGET_DIR)" \
+	SKIP_STRIP=y
+
+ifndef SWUPDATE_CONFIG_FILE
+	SWUPDATE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
+endif
+
+SWUPDATE_KCONFIG_FILE = $(SWUPDATE_CONFIG_FILE)
+SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig
+SWUPDATE_KCONFIG_OPTS = $(SWUPDATE_MAKE_OPTS)
+
+ifeq ($(BR2_PACKAGE_SWUPDATE_LUA),y)
+SWUPDATE_DEPENDENCIES += lua
+define SWUPDATE_LUA
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUA,$(SWUPDATE_BUILD_CONFIG))
+endef
+else
+define SWUPDATE_LUA
+	$(call KCONFIG_DISABLE_OPT,CONFIG_LUA,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+# If we're using static libs do the same for swupdate
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define SWUPDATE_PREFER_STATIC
+	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+# Disable swupdate's version of mongoose.
+# Use the Buildroot's mongoose package instead.
+define SWUPDATE_WEBSERVER_MONGOOSE
+	$(call KCONFIG_DISABLE_OPT,CONFIG_WEBSERVER,$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_DISABLE_OPT,CONFIG_MONGOOSE,$(SWUPDATE_BUILD_CONFIG))
+endef
+
+ifeq ($(BR2_PACKAGE_SWUPDATE_LIBCONFIG),y)
+SWUPDATE_DEPENDENCIES += libconfig
+define SWUPDATE_LIBCONFIG_PARSER
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LIBCONFIG,$(SWUPDATE_BUILD_CONFIG))
+endef
+else
+define SWUPDATE_LIBCONFIG_PARSER
+	$(call KCONFIG_DISABLE_OPT,CONFIG_LIBCONFIG,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+define SWUPDATE_KCONFIG_FIXUP_CMDS
+	$(SWUPDATE_LUA)
+	$(SWUPDATE_PREFER_STATIC)
+	$(SWUPDATE_WEBSERVER_MONGOOSE)
+	$(SWUPDATE_LIBCONFIG_PARSER)
+endef
+
+define SWUPDATE_BUILD_CMDS
+	$(SWUPDATE_MAKE_ENV) $(MAKE) $(SWUPDATE_MAKE_OPTS) -C $(@D)
+endef
+
+define SWUPDATE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
+endef
+
+$(eval $(kconfig-package))
-- 
1.9.3

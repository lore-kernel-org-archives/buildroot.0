From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 19 Mar 2015 08:33:37 +0100
Subject: [Buildroot] [[PATCH v2] 1/1] package/swupdate: new package
Message-ID: <1426750417-23107-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: J?rg Krause <jkrause@posteo.de>

This patch is based on an WIP version submitted by Romain Naour, commented by
Arnout Vandecappelle:
https://patchwork.ozlabs.org/patch/401270/

The package provides a default configuration which let the user initiate an
update by using an update URL by using libcurl. The embedded webserver (a
customized version of mongoose) and Lua support are both disabled by default.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Tested-by: Mike Williams <mike@mikebwilliams.com>
---
Changes v1 -> v2:
  - bump to latest commit d9f58b5a3263b1b00c6d011cd8cdd65e69890b46
  - update Sob email address
---
 package/Config.in                                  |   1 +
 package/swupdate/Config.in                         |  93 +++++++++++++++
 ...wupdate-0001-Add-missing-header-for-off_t.patch |  25 ++++
 package/swupdate/swupdate.config                   |  82 +++++++++++++
 package/swupdate/swupdate.mk                       | 127 +++++++++++++++++++++
 5 files changed, 328 insertions(+)
 create mode 100644 package/swupdate/Config.in
 create mode 100644 package/swupdate/swupdate-0001-Add-missing-header-for-off_t.patch
 create mode 100644 package/swupdate/swupdate.config
 create mode 100644 package/swupdate/swupdate.mk

diff --git a/package/Config.in b/package/Config.in
index 96e373a..f37fba4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1344,6 +1344,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/start-stop-daemon/Config.in"
 endif
 	source "package/supervisor/Config.in"
+	source "package/swupdate/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysklogd/Config.in"
 endif
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
new file mode 100644
index 0000000..f8489dc
--- /dev/null
+++ b/package/swupdate/Config.in
@@ -0,0 +1,93 @@
+config BR2_PACKAGE_SWUPDATE
+	bool "swupdate"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_MTD
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
+	  This will enable swupdate with an image downloader, as well as image
+	  handlers for UBI volumes, raw NAND or NOR flash, SD cards, shell
+	  scripts, and the U-Boot bootloader environment.
+
+config BR2_PACKAGE_SWUPDATE_LIBCURL
+	bool "Enable image downloading"
+	select BR2_PACKAGE_LIBCURL
+	default y
+	help
+	  Enable update from image URL using libcurl. Files are downloaded                                                                    ?
+	  completely before installation begins.
+
+config BR2_PACKAGE_SWUPDATE_WEBSERVER
+	bool "Enable embedded webserver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable firmware update from a remote device using an embedded
+	  webserver on the target.
+
+comment "Webserver support needs toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_SWUPDATE_WEBSERVER
+
+config BR2_PACKAGE_SWUPDATE_WEBSERVER_MONGOOSE_IPV6
+	depends on BR2_INET_IPV6
+	bool "Webserver with IPv6 support"
+	help
+	  Enable IPv6 support for the webserver.
+
+comment "IPv6 support for the webserver needs toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
+config BR2_PACKAGE_SWUPDATE_WEBSERVER_MONGOOSE_SQL
+	bool "Webserver with SQL support"
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_1
+	help
+	  Enable SQL support for the webserver.
+
+comment "Webservers Lua support needs a toolchain w/ largefile and a Lua 5.2 interpreter"
+	depends on !BR2_LARGEFILE || BR2_PACKAGE_LUA_5_1 || !BR2_PACKAGE_HAS_LUAINTERPRETER
+
+config BR2_PACKAGE_SWUPDATE_WEBSERVER_MONGOOSE_SSL
+	bool "Webserver with SSL support"
+	help
+	  Enable SSL support for the webserver.
+
+endif
+
+config BR2_PACKAGE_SWUPDATE_LIBCONFIG
+	bool "Enable libconfig parser"
+	select BR2_PACKAGE_LIBCONFIG
+	default y
+	help
+	  Use libconfig to parse the configuration file.
+	  This is the default parser. Unless you don't use your own
+	  external parser written in Lua you'll need to say Y here.
+
+config BR2_PACKAGE_SWUPDATE_LUA_SUPPORT
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_1
+	bool "Enable Lua support"
+	help
+	  Enable Lua support.
+	  Select this for using custom scripts written in Lua.
+
+comment "Lua support needs a Lua 5.2 interpreter"
+	depends on BR2_PACKAGE_LUA_5_1 || !BR2_PACKAGE_HAS_LUAINTERPRETER
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
index 0000000..788f949
--- /dev/null
+++ b/package/swupdate/swupdate.config
@@ -0,0 +1,82 @@
+#
+# Automatically generated make config: don't edit
+# swupdate version: 2014.07.0
+# Thu Dec 18 10:00:56 2014
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
+# CONFIG_LUA is not set
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
+CONFIG_DOWNLOAD=y
+# CONFIG_WEBSERVER is not set
+
+#
+# Webserver Features
+#
+# CONFIG_MONGOOSE is not set
+
+#
+# Mongoose Feature
+#
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
+# CONFIG_LUASCRIPTHANDLER is not set
+CONFIG_SHELLSCRIPTHANDLER=y
+# CONFIG_HANDLER_IN_LUA is not set
+CONFIG_UBOOT=y
+CONFIG_UBOOT_FWENV="/etc/fw_env.config"
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
new file mode 100644
index 0000000..83af6db
--- /dev/null
+++ b/package/swupdate/swupdate.mk
@@ -0,0 +1,127 @@
+################################################################################
+#
+# swupdate
+#
+################################################################################
+
+# Choose latest commit instead of release 2014.07 for getting bug fixes and
+# image downloading feature
+SWUPDATE_VERSION = d9f58b5a3263b1b00c6d011cd8cdd65e69890b46
+SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
+SWUPDATE_LICENSE = GPLv2+
+SWUPDATE_LICENSE_FILES = COPYING
+SWUPDATE_DEPENDENCIES = zlib mtd
+
+SWUPDATE_BUILD_CONFIG = $(SWUPDATE_DIR)/.config
+
+SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
+SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig
+
+SWUPDATE_CFLAGS = \
+	$(TARGET_CFLAGS)
+
+SWUPDATE_LDFLAGS = \
+	$(TARGET_LDFLAGS)
+
+SWUPDATE_LDLIBS =
+
+# If we're using static libs do the same for swupdate
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define SWUPDATE_PREFER_STATIC
+	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+define SWUPDATE_BUILD_OPTIONS
+	$(call KCONFIG_SET_OPT,CONFIG_CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_SYSROOT,"$(SYSROOT_DIR)",$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_CFLAGS,"$(SWUPDATE_CFLAGS)",$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_LDFLAGS,"$(SWUPDATE_LDFLAGS)",$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_LDLIBS,"$(SWUPDATE_LDLIBS)",$(SWUPDATE_BUILD_CONFIG))
+endef
+
+ifeq ($(BR2_PACKAGE_SWUPDATE_LIBCURL),y)
+SWUPDATE_DEPENDENCIES += libcurl
+else
+define SWUPDATE_DOWNLOAD
+	$(call KCONFIG_DISABLE_OPT,CONFIG_DOWNLOAD,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+# swupate bundles its own customized version of Mongoose with a Lua licence.
+ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER),y)
+SWUPDATE_DEPENDENCIES += openssl
+SWUPDATE_LDLIBS += pthread crypto
+define SWUPDATE_WEBSERVER_MONGOOSE
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WEBSERVER,$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MONGOOSE,$(SWUPDATE_BUILD_CONFIG))
+	$(SWUPDATE_WEBSERVER_MONGOOSE_IPV6)
+	$(SWUPDATE_WEBSERVER_MONGOOSE_LUA)
+	$(SWUPDATE_WEBSERVER_MONGOOSE_SQL)
+	$(SWUPDATE_WEBSERVER_MONGOOSE_SSL)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER_MONGOOSE_IPV6),y)
+SWUPDATE_CFLAGS += -DUSE_IPV6
+define SWUPDATE_WEBSERVER_MONGOOSE_IPV6
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MONGOOSEIPV6,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER_MONGOOSE_SQL),y)
+SWUPDATE_CFLAGS += -DUSE_LUA_SQLITE3
+define SWUPDATE_WEBSERVER_MONGOOSE_SQL
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MONGOOSESQL,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER_MONGOOSE_SSL),y)
+SWUPDATE_CFLAGS += -DNO_SSL_DL
+SWUPDATE_LDLIBS += ssl
+define SWUPDATE_WEBSERVER_MONGOOSE_SSL
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MONGOOSESSL,$(SWUPDATE_BUILD_CONFIG))
+endef
+else
+SWUPDATE_CFLAGS += -DNO_SSL
+endif
+
+ifeq ($(BR2_PACKAGE_SWUPDATE_LIBCONFIG),y)
+SWUPDATE_DEPENDENCIES += libconfig
+else
+define SWUPDATE_LIBCONFIG_PARSER
+	$(call KCONFIG_DISABLE_OPT,CONFIG_LIBCONFIG,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_SWUPDATE_LUA_SUPPORT),y)
+SWUPDATE_DEPENDENCIES += lua
+SWUPDATE_CFLAGS += -DUSE_LUA
+SWUPDATE_LDLIBS += dl
+define SWUPDATE_LUA
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUA,$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUASCRIPTHANDLER,$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HANDLER_IN_LUA,$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUAEXTERNAL,$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MONGOOSELUA,$(SWUPDATE_BUILD_CONFIG))
+endef
+endif
+
+define SWUPDATE_KCONFIG_FIXUP_CMDS
+	$(SWUPDATE_PREFER_STATIC)
+	$(SWUPDATE_BUILD_OPTIONS)
+	$(SWUPDATE_DOWNLOAD)
+	$(SWUPDATE_WEBSERVER_MONGOOSE)
+	$(SWUPDATE_LIBCONFIG_PARSER)
+	$(SWUPDATE_LUA)
+endef
+
+define SWUPDATE_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define SWUPDATE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
+endef
+
+$(eval $(kconfig-package))
-- 
2.3.3

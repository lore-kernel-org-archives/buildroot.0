From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 21 Apr 2015 02:30:51 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/swupdate: new package
Message-ID: <1429576251-28975-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on an WIP version submitted by Romain Naour, commented by
Arnout Vandecappelle:
https://patchwork.ozlabs.org/patch/401270/

This package provides a default configuration with all external dependencies
enabled. This is necessary because upstream does not detect which dependencies
are available. Furthermore, upstream does not implement a savedefconfig target.

Note that swupdate provides its own customized version of mongoose and
lsqlite3.

swupdate provides a default website which can be installed to the target to
enable firmware update with a browser. This patch adds the user option to
install this website.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Mike Williams <mike@mikebwilliams.com>
---
Changes v2 -> v3:
  - bump to latest commit d7753be4fd8bdf2ba4ba56ee869550663b2cca80
  - enable all dependencies (Arnout)
  - rewrite help text for configuration file
  - add option to install default website

Changes v1 -> v2:
  - bump to latest commit d9f58b5a3263b1b00c6d011cd8cdd65e69890b46
  - update Sob email address

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/Config.in                                  |  1 +
 package/swupdate/Config.in                         | 42 +++++++++++
 ...wupdate-0001-Add-missing-header-for-off_t.patch | 25 +++++++
 package/swupdate/swupdate.config                   | 82 ++++++++++++++++++++++
 package/swupdate/swupdate.mk                       | 62 ++++++++++++++++
 5 files changed, 212 insertions(+)
 create mode 100644 package/swupdate/Config.in
 create mode 100644 package/swupdate/swupdate-0001-Add-missing-header-for-off_t.patch
 create mode 100644 package/swupdate/swupdate.config
 create mode 100644 package/swupdate/swupdate.mk

diff --git a/package/Config.in b/package/Config.in
index 319f01a..9ffd9b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1402,6 +1402,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/start-stop-daemon/Config.in"
 endif
 	source "package/supervisor/Config.in"
+	source "package/swupdate/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysklogd/Config.in"
 endif
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
new file mode 100644
index 0000000..6e86ee9
--- /dev/null
+++ b/package/swupdate/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_SWUPDATE
+	bool "swupdate"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # OpenSSL
+	depends on BR2_PACKAGE_LUA_5_2
+	select BR2_PACKAGE_LIBCONFIG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_MTD
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  swupdate provides a reliable way to update the software on an
+	  embedded system.
+
+	  https://github.com/sbabic/swupdate.git
+
+if BR2_PACKAGE_SWUPDATE
+
+config BR2_PACKAGE_SWUPDATE_CONFIG
+	string "swupdate configuration file"
+	default "package/swupdate/swupdate.config"
+	help
+	  The default swupdate configuration file will enable swupdate with
+	  an image downloader, a webserver, and lua support, as well as
+	  handlers for UBI volumes, raw NAND or NOR flash, SD cards, shell
+	  scripts, and the U-Boot bootloader environment.
+
+	  Most people will just use the default swupdate configuration file.
+	  However, some people may wish to use their own modified swupdate
+	  configuration file, and will specify their config file location
+	  with this option.
+
+config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
+	bool "install default website"
+	help
+	  Install the provided website to /var/www/swupdate.
+endif
+
+comment "swupate support needs toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "swupate needs a Lua 5.2 interpreter"
+	depends on !BR2_PACKAGE_LUA_5_2
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
index 0000000..cb75998
--- /dev/null
+++ b/package/swupdate/swupdate.config
@@ -0,0 +1,82 @@
+#
+# Automatically generated make config: don't edit
+# swupdate version: 2014.07.0
+# Tue Apr 21 01:42:29 2015
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
+CONFIG_DOWNLOAD=y
+CONFIG_WEBSERVER=y
+
+#
+# Webserver Features
+#
+CONFIG_MONGOOSE=y
+
+#
+# Mongoose Feature
+#
+CONFIG_MONGOOSELUA=y
+# CONFIG_MONGOOSESQL is not set
+CONFIG_MONGOOSEIPV6=y
+CONFIG_MONGOOSESSL=y
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
+CONFIG_LUAEXTERNAL=y
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
+CONFIG_UBOOT=y
+CONFIG_UBOOT_FWENV="/etc/fw_env.config"
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
new file mode 100644
index 0000000..c78092a
--- /dev/null
+++ b/package/swupdate/swupdate.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# swupdate
+#
+################################################################################
+
+# Choose latest commit instead of release 2014.07 for getting bug fixes and
+# image downloading feature
+SWUPDATE_VERSION = 8f59c21a07a99b94b53ab9ae3579cd2014b3cedc
+SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
+SWUPDATE_LICENSE = GPLv2+
+SWUPDATE_LICENSE_FILES = COPYING
+
+# swupdate bundles its own mongoose and lsqlite3 versions
+SWUPDATE_DEPENDENCIES = libconfig libcurl lua mtd openssl zlib
+
+SWUPDATE_BUILD_CONFIG = $(SWUPDATE_DIR)/.config
+
+SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
+SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig
+
+SWUPDATE_CFLAGS = $(TARGET_CFLAGS)
+SWUPDATE_LDFLAGS = $(TARGET_LDFLAGS)
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
+	$(call KCONFIG_SET_OPT,CONFIG_CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)", \
+		$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_SYSROOT,"$(SYSROOT_DIR)", \
+		$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_CFLAGS,"$(SWUPDATE_CFLAGS)", \
+		$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_LDFLAGS,"$(SWUPDATE_LDFLAGS)", \
+		$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_LDLIBS,"$(SWUPDATE_LDLIBS)", \
+		$(SWUPDATE_BUILD_CONFIG))
+endef
+
+define SWUPDATE_KCONFIG_FIXUP_CMDS
+	$(SWUPDATE_PREFER_STATIC)
+	$(SWUPDATE_BUILD_OPTIONS)
+endef
+
+define SWUPDATE_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define SWUPDATE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
+	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
+		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
+		cp -dpf $(@D)/www/* $(TARGET_DIR)/var/www/swupdate)
+endef
+
+$(eval $(kconfig-package))
-- 
2.3.5

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 26 Mar 2020 23:56:41 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/libapparmor-utils: new package
In-Reply-To: <20200326225641.15536-1-angelo@amarulasolutions.com>
References: <20200326225641.15536-1-angelo@amarulasolutions.com>
Message-ID: <20200326225641.15536-2-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds libapparmor related tools.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/libapparmor-utils/Config.in           |  7 ++
 .../libapparmor-utils/libapparmor-utils.hash  |  3 +
 .../libapparmor-utils/libapparmor-utils.mk    | 65 +++++++++++++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 package/libapparmor-utils/Config.in
 create mode 100644 package/libapparmor-utils/libapparmor-utils.hash
 create mode 100644 package/libapparmor-utils/libapparmor-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3ab96b8707..d86c61b416 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -197,6 +197,7 @@ F:	package/corkscrew/
 F:	package/fail2ban/
 F:	package/i2c-tools/
 F:	package/libapparmor/
+F:	package/libapparmor-utils/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index 31445af0f3..6702ca4b6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1884,6 +1884,7 @@ endmenu
 
 menu "Security"
 	source "package/libapparmor/Config.in"
+	source "package/libapparmor-utils/Config.in"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
 	source "package/libsepol/Config.in"
diff --git a/package/libapparmor-utils/Config.in b/package/libapparmor-utils/Config.in
new file mode 100644
index 0000000000..4fe1074f5d
--- /dev/null
+++ b/package/libapparmor-utils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBAPPARMOR_UTILS
+	bool "libapparmor utilities"
+	depends on BR2_PACKAGE_LIBAPPARMOR
+	help
+	  Apparmor userspace utils, pam module and apache module
+
+	  http://wiki.apparmor.net
diff --git a/package/libapparmor-utils/libapparmor-utils.hash b/package/libapparmor-utils/libapparmor-utils.hash
new file mode 100644
index 0000000000..e5ae65d91c
--- /dev/null
+++ b/package/libapparmor-utils/libapparmor-utils.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  267053234c68cdb122c5294d7c276b6e2f5fa7e75c6c2d23e3ce69f95d9a7639  apparmor-2.13.3.tar.gz
+sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor-utils/libapparmor-utils.mk b/package/libapparmor-utils/libapparmor-utils.mk
new file mode 100644
index 0000000000..3b2b47be07
--- /dev/null
+++ b/package/libapparmor-utils/libapparmor-utils.mk
@@ -0,0 +1,65 @@
+################################################################################
+#
+# libapparmor-utils
+#
+################################################################################
+
+LIBAPPARMOR_UTILS_BASE_VERSION = 2.13
+LIBAPPARMOR_UTILS_VERSION = $(LIBAPPARMOR_UTILS_BASE_VERSION).3
+LIBAPPARMOR_UTILS_SOURCE = apparmor-$(LIBAPPARMOR_UTILS_VERSION).tar.gz
+LIBAPPARMOR_UTILS_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_UTILS_BASE_VERSION)/$(LIBAPPARMOR_UTILS_VERSION)/+download
+LIBAPPARMOR_UTILS_LICENSE = GPL-2.0
+LIBAPPARMOR_UTILS_LICENSE_FILES = LICENSE
+LIBAPPARMOR_UTILS_CONF_OPTS = --enable-static --enable-man-pages=no
+LIBAPPARMOR_UTILS_DEPENDENCIES = libapparmor
+
+ifeq ($(BR2_PACKAGE_APACHE),y)
+
+LIBAPPARMOR_UTILS_DEPENDENCIES += apache
+LIBAPPARMOR_UTILS_SUBDIRS += changehat/mod_apparmor
+LIBAPPARMOR_UTILS_SUBDIRS_BUILD_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
+
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+
+LIBAPPARMOR_UTILS_DEPENDENCIES += linux-pam
+LIBAPPARMOR_UTILS_SUBDIRS += changehat/pam_apparmor
+
+endif
+
+LIBAPPARMOR_UTILS_SUBDIRS_BUILD_CMD = $(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D)/$(d) USE_SYSTEM=1
+
+define LIBAPPARMOR_UTILS_BUILD_CMDS
+	$(foreach d,$(LIBAPPARMOR_UTILS_SUBDIRS), \
+		$(LIBAPPARMOR_UTILS_SUBDIRS_BUILD_CMD)
+	)
+endef
+
+define LIBAPPARMOR_UTILS_INSTALL_TARGET_CMDS
+	$(foreach d,$(LIBAPPARMOR_UTILS_SUBDIRS), \
+		$(LIBAPPARMOR_UTILS_SUBDIRS_BUILD_CMD) \
+		DESTDIR=$(TARGET_DIR) install
+	)
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+
+LIBAPPARMOR_UTILS_SUBDIRS += utils
+LIBAPPARMOR_UTILS_SUBDIRS_BUILD_CMD += PYTHON=$(HOST_DIR)/usr/bin/python3
+
+endif
+
+# Enabling rules caching if the system is mounted R/W
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+
+define LIBAPPARMOR_UTILS_ENABLE_PROFILE_CACHE
+	$(SED) '/^#write-cache/c\write-cache' $(TARGET_DIR)/etc/apparmor/parser.conf
+endef
+LIBAPPARMOR_UTILS_POST_INSTALL_TARGET_HOOKS += LIBAPPARMOR_UTILS_ENABLE_PROFILE_CACHE
+
+endif
+
+$(eval $(generic-package))
-- 
2.17.1

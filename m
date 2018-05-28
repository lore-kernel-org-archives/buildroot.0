From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 28 May 2018 17:35:11 +0200
Subject: [Buildroot] [PATCH] package/libapparmor: new package
Message-ID: <1527521711-17270-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds libapparmor and it's related tools.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/Config.in                    |  1 +
 package/libapparmor/Config.in        | 57 ++++++++++++++++++++++++++++++++++++
 package/libapparmor/libapparmor.hash |  2 ++
 package/libapparmor/libapparmor.mk   | 53 +++++++++++++++++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 package/libapparmor/Config.in
 create mode 100644 package/libapparmor/libapparmor.hash
 create mode 100644 package/libapparmor/libapparmor.mk

diff --git a/package/Config.in b/package/Config.in
index ecee493..834e898 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1590,6 +1590,7 @@ endif
 endmenu
 
 menu "Security"
+	source "package/libapparmor/Config.in"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
 	source "package/libsepol/Config.in"
diff --git a/package/libapparmor/Config.in b/package/libapparmor/Config.in
new file mode 100644
index 0000000..edc624b
--- /dev/null
+++ b/package/libapparmor/Config.in
@@ -0,0 +1,57 @@
+config BR2_PACKAGE_LIBAPPARMOR
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_WCHAR
+	bool "libapparmor"
+	help
+	  AppArmor is an effective and easy-to-use Linux application
+	  security system. AppArmor proactively protects the operating
+	  system and applications from external or internal threats,
+	  even zero-day attacks, by enforcing good behavior and
+	  preventing even unknown application flaws from being exploited.
+	  AppArmor security policies completely define what system
+	  resources individual applications can access, and with what
+	  privileges. A number of default policies are included with
+	  AppArmor, and using a combination of advanced static analysis
+	  and learning-based tools, AppArmor policies for even very
+	  complex applications can be deployed successfully in a
+	  matter of hours.
+
+	  http://wiki.apparmor.net
+
+comment "AppArmor needs a glibc w/ wchar"
+	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+if BR2_PACKAGE_LIBAPPARMOR
+
+config BR2_PACKAGE_LIBAPPARMOR_APACHE
+	depends on BR2_PACKAGE_APACHE
+	bool "Apache mod_apparmor"
+	help
+	  AppArmor module for Apache
+
+config BR2_PACKAGE_LIBAPPARMOR_BINUTILS
+	bool "AppArmor binutils"
+	default y
+	help
+	  AppArmor binary utilities
+
+config BR2_PACKAGE_LIBAPPARMOR_PAM
+	depends on BR2_PACKAGE_LINUX_PAM
+	bool "AppArmor PAM"
+	help
+	  AppArmor module for Linux PAM
+
+config BR2_PACKAGE_LIBAPPARMOR_PROFILES
+	bool "AppArmor profiles"
+	default y
+	help
+	  Apparmor profiles
+
+config BR2_PACKAGE_LIBAPPARMOR_UTILS
+	bool "AppArmor utils"
+	default y
+	help
+	  AppArmor utilities
+
+endif
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
new file mode 100644
index 0000000..f19a13c
--- /dev/null
+++ b/package/libapparmor/libapparmor.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  49f0b65a60c1eb5b7b4316023811bf1785875567e0e0c4c8a26cb1f1c3ac5858  apparmor-2.13.tar.gz
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
new file mode 100644
index 0000000..73a2adb
--- /dev/null
+++ b/package/libapparmor/libapparmor.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# libapparmor
+#
+################################################################################
+
+LIBAPPARMOR_BASE_VERSION = 2.13
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_BASE_VERSION).0
+LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_BASE_VERSION).tar.gz
+LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_BASE_VERSION)/$(LIBAPPARMOR_VERSION)/+download
+LIBAPPARMOR_LICENSE = GPL-2.0
+LIBAPPARMOR_LICENSE_FILES = LICENSE
+LIBAPPARMOR_SUBDIR = libraries/libapparmor
+LIBAPPARMOR_AUTORECONF = YES
+LIBAPPARMOR_INSTALL_STAGING = YES
+LIBAPPARMOR_CONF_OPTS = --enable-static --enable-man-pages=no
+
+LIBAPPARMOR_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_APPARMOR_APACHE),apache) \
+	$(if $(BR2_PACKAGE_APPARMOR_PAM),linux-pam) \
+
+APPARMOR_DIRS = parser \
+	$(if $(BR2_PACKAGE_APPARMOR_APACHE),changehat/mod_apparmor) \
+	$(if $(BR2_PACKAGE_APPARMOR_BINUTILS),binutils) \
+	$(if $(BR2_PACKAGE_APPARMOR_PAM),changehat/pam_apparmor) \
+	$(if $(BR2_PACKAGE_APPARMOR_PROFILES),profiles) \
+	$(if $(BR2_PACKAGE_APPARMOR_UTILS),utils)
+
+APPARMOR_BUILD_OPTS += \
+	$(if $(BR2_PACKAGE_APPARMOR_APACHE),APXS=$(STAGING_DIR)/usr/bin/apxs)
+
+define APPARMOR_BUILD_CMDS
+	$(foreach d,$(APPARMOR_DIRS),
+		### AppArmor building $d ###
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBAPPARMOR_MAKE) -C $(@D)/$(d) $(APPARMOR_BUILD_OPTS)
+	)
+endef
+
+LIBAPPARMOR_POST_INSTALL_STAGING_HOOKS += APPARMOR_BUILD_CMDS
+
+define APPARMOR_INSTALL_TARGET_CMDS
+	$(foreach d,$(APPARMOR_DIRS),
+		### AppArmor installing $d ###
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(LIBAPPARMOR_MAKE) -C $(@D)/$(d) DESTDIR=$(TARGET_DIR) \
+		$(APPARMOR_BUILD_OPTS) install
+	)
+endef
+
+LIBAPPARMOR_POST_INSTALL_TARGET_HOOKS += APPARMOR_INSTALL_TARGET_CMDS
+
+$(eval $(autotools-package))
-- 
2.7.4

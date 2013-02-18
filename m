From: Laurent Cans <laurent.cans@gmail.com>
Date: Mon, 18 Feb 2013 19:49:45 +0100
Subject: [Buildroot] [PATCH v2] aircrack-ng: new package
Message-ID: <1361213385-27005-1-git-send-email-laurent.cans@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aircrack-ng is a set of tools for auditing wireless security.

Signed-off-by: Laurent Cans <laurent.cans@gmail.com>
---
Changelog v1 -> v2:
 * Fix misspelling in package dependency
 * Add comment on largefile support needs
 * Use latest stable version instead of svn version
 * Correct license
 * Improve libsql dependency checking and support
 * Pass configure option by environment variable when it is possible
 * Wrap lines at 80 characters
 package/Config.in                  |    1 +
 package/aircrack-ng/Config.in      |   13 +++++++++++
 package/aircrack-ng/aircrack-ng.mk |   43 ++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 package/aircrack-ng/Config.in
 create mode 100644 package/aircrack-ng/aircrack-ng.mk

diff --git a/package/Config.in b/package/Config.in
index faee5c3..a055827 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -611,6 +611,7 @@ source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
 menu "Networking applications"
+source "package/aircrack-ng/Config.in"
 source "package/argus/Config.in"
 source "package/arptables/Config.in"
 source "package/avahi/Config.in"
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
new file mode 100644
index 0000000..8ff50a8
--- /dev/null
+++ b/package/aircrack-ng/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_AIRCRACK_NG
+	bool "aircrack-ng"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_IW
+	help
+	  A set of tools for auditing wireless networks
+
+	  http://www.aircrack-ng.org/
+
+comment "aircrack-ng needs a toolchain with largefile support"
+	depends on !BR2_LARGEFILE
+
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
new file mode 100644
index 0000000..f78dfcd
--- /dev/null
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# Aircrack-ng
+#
+#############################################################
+
+AIRCRACK_NG_VERSION = 1.1
+AIRCRACK_NG_SOURCE = aircrack-ng-$(AIRCRACK_NG_VERSION).tar.gz
+AIRCRACK_NG_SITE = http://download.aircrack-ng.org
+AIRCRACK_NG_LICENSE = GPLv2+
+AIRCRACK_NG_LICENSE_FILES = LICENSE
+AIRCRACK_NG_DEPENDENCIES = openssl
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+	AIRCRACK_NG_MAKE_OPTS = sqlite=true
+	AIRCRACK_NG_MAKE_OPTS += LIBSQL="-lsqlite3"
+
+	AIRCRACK_NG_DEPENDENCIES += sqlite
+else
+	AIRCRACK_NG_MAKE_OPTS = sqlite=false
+endif
+
+define AIRCRACK_NG_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)\
+		$(AIRCRACK_NG_MAKE_OPTS) all
+endef
+
+define AIRCRACK_NG_CLEAN_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)\
+		$(AIRCRACK_NG_MAKE_OPTS) clean
+endef
+
+define AIRCRACK_NG_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		$(AIRCRACK_NG_MAKE_OPTS) install
+endef
+
+define AIRCRACK_NG_UNINSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		$(AIRCRACK_NG_MAKE_OPTS) uninstall
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4

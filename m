From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 25 Oct 2012 13:04:30 +0100
Subject: [Buildroot] [PATCH v2] lcdapi: new package
Message-ID: <1351166671-16726-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Incorporated changes suggested by Arnout Vandecappelle, use new upstream

 package/Config.in        |    1 +
 package/lcdapi/Config.in |   11 +++++++++++
 package/lcdapi/lcdapi.mk |   41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/lcdapi/Config.in
 create mode 100644 package/lcdapi/lcdapi.mk

diff --git a/package/Config.in b/package/Config.in
index 1650c71..6ebf2ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -392,6 +392,7 @@ endmenu
 
 menu "Hardware handling"
 source "package/ccid/Config.in"
+source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
diff --git a/package/lcdapi/Config.in b/package/lcdapi/Config.in
new file mode 100644
index 0000000..5c997d1
--- /dev/null
+++ b/package/lcdapi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LCDAPI
+	bool "lcdapi"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  C++ client API for lcdproc, containing a set of widget classes.
+
+	  https://github.com/spdawson/lcdapi
+
+comment "lcdapi requires a toolchain with C++ and thread support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
new file mode 100644
index 0000000..3b5aaa3
--- /dev/null
+++ b/package/lcdapi/lcdapi.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# lcdapi
+#
+#############################################################
+LCDAPI_VERSION = 27e16c37a39c7fab2cf2e912795a730c0e92bcf1
+LCDAPI_SITE = git://github.com/spdawson/lcdapi.git
+LCDAPI_LICENSE = LGPLv2.1+
+LCDAPI_LICENSE_FILES = COPYING
+
+LCDAPI_INSTALL_STAGING = YES
+
+define LCDAPI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define LCDAPI_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR="$(STAGING_DIR)" install
+endef
+
+define LCDAPI_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" install
+endef
+
+define LCDAPI_UNINSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR="$(STAGING_DIR)" uninstall
+endef
+
+define LCDAPI_UNINSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" uninstall
+endef
+
+define LCDAPI_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4

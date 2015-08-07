From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  7 Aug 2015 15:29:03 +0200
Subject: [Buildroot] [PATCHv3 4/4]
	package/openpowerlink-apps-demo-mn-console: new package
In-Reply-To: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
References: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438954143-23533-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3: rename to openpowerlink-apps-demo-mn-console
    Provide a hash file via a symlink to
    openpowerlink.hash
    Don't use $(OPENPOWERLINK_*) since they will not
    be set in openpowerlink-apps-demo-mn-console.mk
    move openpowerlink-apps-demo-mn-console to package
    directory.
---
 package/Config.in                                  |  1 +
 .../openpowerlink-apps-demo-mn-console/Config.in   |  6 +++
 .../openpowerlink-apps-demo-mn-console.hash        |  1 +
 .../openpowerlink-apps-demo-mn-console.mk          | 50 ++++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/openpowerlink-apps-demo-mn-console/Config.in
 create mode 120000 package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.hash
 create mode 100644 package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.mk

diff --git a/package/Config.in b/package/Config.in
index 830b9a2..0681e05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ endif
 	source "package/openpowerlink/Config.in"
 	source "package/openpowerlink-kernel-drivers/Config.in"
 	source "package/openpowerlink-pcap-daemon/Config.in"
+	source "package/openpowerlink-apps-demo-mn-console/Config.in"
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
diff --git a/package/openpowerlink-apps-demo-mn-console/Config.in b/package/openpowerlink-apps-demo-mn-console/Config.in
new file mode 100644
index 0000000..e7b31eb
--- /dev/null
+++ b/package/openpowerlink-apps-demo-mn-console/Config.in
@@ -0,0 +1,6 @@
+
+config BR2_PACKAGE_OPENPOWERLINK_APPS_DEMO_MN_CONSOLE
+	bool "openpowerlink demo_mn_console"
+	depends on BR2_PACKAGE_OPENPOWERLINK
+	help
+	  Managing Node console demo application
diff --git a/package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.hash b/package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.hash
new file mode 120000
index 0000000..cbbc194
--- /dev/null
+++ b/package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.hash
@@ -0,0 +1 @@
+../openpowerlink/openpowerlink.hash
\ No newline at end of file
diff --git a/package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.mk b/package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.mk
new file mode 100644
index 0000000..b7952e3
--- /dev/null
+++ b/package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# openpowerlink-apps-demo-mn-console
+#
+################################################################################
+
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_VERSION = V2.2.0
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_VERSION)
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_SOURCE = openPOWERLINK-$(OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_VERSION).tar.gz
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_LICENSE = BSD-2c, GPLv2
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_LICENSE_FILES = license.md
+
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_DEPENDENCIES = openpowerlink
+
+define OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_EXTRACT_CMDS
+	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
+endef
+
+define OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_APPLY_PATCHES
+	$(APPLY_PATCHES) $(@D) package/openpowerlink \*.patch
+endef
+
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_POST_PATCH_HOOKS += \
+	OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_APPLY_PATCHES
+
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_SUBDIR = apps/demo_mn_console/
+
+# See apps/common/cmake/configure-linux.cmake for available options list.
+
+# CFG_DEBUG_LVL is taken into account only in Debug
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_CONF_OPTS = \
+	-DCFG_DEBUG_LVL="$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))"
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Link to Application"
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Linux Userspace Daemon" \
+	-DCFG_DEMO_MN_CONSOLE_USE_SYNCTHREAD=ON
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
+OPENPOWERLINK_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Linux Kernel Module" \
+	-DCFG_DEMO_MN_CONSOLE_USE_SYNCTHREAD=ON
+endif
+
+$(eval $(cmake-package))
-- 
2.4.3

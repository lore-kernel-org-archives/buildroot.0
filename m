From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 11 May 2015 18:14:14 +0200
Subject: [Buildroot] [PATCH v2 4/4]
	package/openpowerlink2-apps-demo-mn-console: new package
In-Reply-To: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
References: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1431360854-18305-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openpowerlink2/Config.in                   |  1 +
 .../openpowerlink2-apps-demo-mn-console/Config.in  |  6 +++
 .../openpowerlink2-apps-demo-mn-console.mk         | 50 ++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 package/openpowerlink2/openpowerlink2-apps-demo-mn-console/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk

diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
index 53317f0..2fbf195 100644
--- a/package/openpowerlink2/Config.in
+++ b/package/openpowerlink2/Config.in
@@ -74,6 +74,7 @@ endchoice
 
 source "package/openpowerlink2/openpowerlink2-kernel-drivers/Config.in"
 source "package/openpowerlink2/openpowerlink2-pcap-daemon/Config.in"
+source "package/openpowerlink2/openpowerlink2-apps-demo-mn-console/Config.in"
 
 config BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL
 	string "debug level for openpowerlink stack"
diff --git a/package/openpowerlink2/openpowerlink2-apps-demo-mn-console/Config.in b/package/openpowerlink2/openpowerlink2-apps-demo-mn-console/Config.in
new file mode 100644
index 0000000..ab84984
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-apps-demo-mn-console/Config.in
@@ -0,0 +1,6 @@
+
+config BR2_PACKAGE_OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE
+	bool "demo_mn_console"
+	depends on BR2_PACKAGE_OPENPOWERLINK2
+	help
+	  Managing Node console demo application
diff --git a/package/openpowerlink2/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk b/package/openpowerlink2/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk
new file mode 100644
index 0000000..b69d8c5
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# openpowerlink2-apps-demo-mn-console
+#
+################################################################################
+
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_VERSION = $(OPENPOWERLINK2_VERSION)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_SITE = $(OPENPOWERLINK2_SITE)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_SOURCE = $(OPENPOWERLINK2_SOURCE)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_LICENSE = $(OPENPOWERLINK2_LICENSE)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
+
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_DEPENDENCIES = openpowerlink2
+
+define OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_EXTRACT_CMDS
+	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
+endef
+
+define OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_APPLY_PATCHES
+	$(APPLY_PATCHES) $(@D) package/openpowerlink2 \*.patch
+endef
+
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_POST_PATCH_HOOKS += \
+	OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_APPLY_PATCHES
+
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_SUBDIR = apps/demo_mn_console/
+
+# See apps/common/cmake/configure-linux.cmake for available options list.
+
+# CFG_DEBUG_LVL is taken into account only in Debug
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_CONF_OPTS = \
+	-DCFG_DEBUG_LVL="$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL))"
+endif
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB),y)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Link to Application"
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB),y)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Linux Userspace Daemon" \
+	-DCFG_DEMO_MN_CONSOLE_USE_SYNCTHREAD=ON
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB),y)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Linux Kernel Module" \
+	-DCFG_DEMO_MN_CONSOLE_USE_SYNCTHREAD=ON
+endif
+
+$(eval $(cmake-package))
-- 
1.9.3

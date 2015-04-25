From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 25 Apr 2015 15:01:20 +0200
Subject: [Buildroot] [PATCH 3/3] package/openpowerlink2: add demo mn console
	application
In-Reply-To: <1429966880-18690-1-git-send-email-romain.naour@openwide.fr>
References: <1429966880-18690-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1429966880-18690-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openpowerlink2/Config.in                   |  1 +
 .../openpowerlink2/openpowerlink2-apps/Config.in   |  2 ++
 .../openpowerlink2-apps-demo-mn-console/Config.in  |  5 +++
 .../openpowerlink2-apps-demo-mn-console.mk         | 42 ++++++++++++++++++++++
 .../openpowerlink2-apps/openpowerlink2-apps.mk     |  2 ++
 package/openpowerlink2/openpowerlink2.mk           |  1 +
 6 files changed, 53 insertions(+)
 create mode 100644 package/openpowerlink2/openpowerlink2-apps/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk
 create mode 100644 package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps.mk

diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
index c651031..e82e738 100644
--- a/package/openpowerlink2/Config.in
+++ b/package/openpowerlink2/Config.in
@@ -35,6 +35,7 @@ choice
 
 endchoice
 
+source "package/openpowerlink2/openpowerlink2-apps/Config.in"
 source "package/openpowerlink2/openpowerlink2-drivers/Config.in"
 source "package/openpowerlink2/openpowerlink2-stack/Config.in"
 
diff --git a/package/openpowerlink2/openpowerlink2-apps/Config.in b/package/openpowerlink2/openpowerlink2-apps/Config.in
new file mode 100644
index 0000000..6f10a6a
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-apps/Config.in
@@ -0,0 +1,2 @@
+
+source "package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/Config.in"
diff --git a/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/Config.in b/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/Config.in
new file mode 100644
index 0000000..dcf2605
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/Config.in
@@ -0,0 +1,5 @@
+
+config BR2_PACKAGE_OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE
+	bool "demo_mn_console"
+	help
+	  Managing Node console demo application
diff --git a/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk b/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk
new file mode 100644
index 0000000..d4fb9ab
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# openpowerlink2-apps-demo-mn-console
+#
+################################################################################
+
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_VERSION = $(OPENPOWERLINK2_VERSION)
+
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_LICENSE = $(OPENPOWERLINK2_LICENSE)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
+
+# We want to use the same archive for all sub-packages.
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_SOURCE =
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_DEPENDENCIES = openpowerlink2-stack
+
+define OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_SYMLINK_TO_SRC_HOOK
+	ln -s $(OPENPOWERLINK2_DIR) $(OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_DIR)/src
+endef
+
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_POST_EXTRACT_HOOKS += \
+	OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_SYMLINK_TO_SRC_HOOK
+
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_SUBDIR = src/apps/demo_mn_console/
+
+# See apps/common/cmake/configure-linux.cmake for available options list.
+
+# PCAP is used for directlink or userspace daemon
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB),y)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Link to Application"
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB),y)
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Linux Userspace Daemon" \
+	-DCFG_DEMO_MN_CONSOLE_USE_SYNCTHREAD=ON
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB),y)
+# kernel stack
+OPENPOWERLINK2_APPS_DEMO_MN_CONSOLE_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Linux Kernel Module" \
+	-DCFG_DEMO_MN_CONSOLE_USE_SYNCTHREAD=ON
+endif
+
+$(eval $(cmake-package))
diff --git a/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps.mk b/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps.mk
new file mode 100644
index 0000000..802dcbf
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps.mk
@@ -0,0 +1,2 @@
+
+include $(sort $(wildcard package/openpowerlink2/openpowerlink2-apps/*/*.mk))
diff --git a/package/openpowerlink2/openpowerlink2.mk b/package/openpowerlink2/openpowerlink2.mk
index 144fa98..ba0d418 100644
--- a/package/openpowerlink2/openpowerlink2.mk
+++ b/package/openpowerlink2/openpowerlink2.mk
@@ -14,5 +14,6 @@ OPENPOWERLINK2_LICENSE_FILES = license.md
 
 $(eval $(generic-package))
 
+include package/openpowerlink2/openpowerlink2-apps/openpowerlink2-apps.mk
 include package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
 include package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
-- 
1.9.3

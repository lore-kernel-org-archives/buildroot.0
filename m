From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 28 May 2015 17:36:07 +0200
Subject: [Buildroot] [PATCH] package/schedtool: new package
Message-ID: <1432827367-3043-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Schedtool is the definitive interface to Linux's scheduler.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in              |  1 +
 package/schedtool/Config.in    | 10 ++++++++++
 package/schedtool/schedtool.mk | 18 ++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/schedtool/Config.in
 create mode 100644 package/schedtool/schedtool.mk

diff --git a/package/Config.in b/package/Config.in
index 6661240..35f02e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1414,6 +1414,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
 endif
+	source "package/schedtool/Config.in"
 	source "package/smack/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/start-stop-daemon/Config.in"
diff --git a/package/schedtool/Config.in b/package/schedtool/Config.in
new file mode 100644
index 0000000..928a02e
--- /dev/null
+++ b/package/schedtool/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SCHEDTOOL
+	bool "schedtool"
+	help
+	  schedtool was born, because there was no tool to change or query
+	  all CPU-scheduling policies under Linux, in one handy command.
+	  Support for CPU-affinity has also been added and most recently
+	  (re-)nicing of processes.
+	  Thus, schedtool is the definitive interface to Linux's scheduler.
+
+	  https://github.com/jlelli/schedtool-dl
diff --git a/package/schedtool/schedtool.mk b/package/schedtool/schedtool.mk
new file mode 100644
index 0000000..a75f844
--- /dev/null
+++ b/package/schedtool/schedtool.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# schedtool
+#
+################################################################################
+
+SCHEDTOOL_VERSION = 3ffb479929c31cbae09de08f94f58b8f0f061d91
+SCHEDTOOL_SITE = $(call github,jlelli,schedtool-dl,$(SCHEDTOOL_VERSION))
+
+define SCHEDTOOL_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define SCHEDTOOL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/schedtool $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
1.9.1

From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue, 23 Feb 2016 12:54:48 -0300
Subject: [Buildroot] [PATCH] procrank_linux: new package
Message-ID: <1456242888-23322-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/Config.in                        |  3 +++
 package/procrank_linux/Config.in         |  7 +++++++
 package/procrank_linux/procrank_linux.mk | 21 +++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/procrank_linux/Config.in
 create mode 100644 package/procrank_linux/procrank_linux.mk

diff --git a/package/Config.in b/package/Config.in
index 00132df..c1be419 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1595,6 +1595,9 @@ endif
 	source "package/powerpc-utils/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/procps-ng/Config.in"
+endif
+	source "package/procrank_linux/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/psmisc/Config.in"
 endif
 	source "package/pwgen/Config.in"
diff --git a/package/procrank_linux/Config.in b/package/procrank_linux/Config.in
new file mode 100644
index 0000000..59d462b
--- /dev/null
+++ b/package/procrank_linux/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PROCRANK_LINUX
+	bool "procrank_linux"
+	help
+	  procrank is a tool commonly used by Android platform
+	  developers to find out how much memory is really being used.
+
+	  https://github.com/csimmonds/procrank_linux
diff --git a/package/procrank_linux/procrank_linux.mk b/package/procrank_linux/procrank_linux.mk
new file mode 100644
index 0000000..7e74319
--- /dev/null
+++ b/package/procrank_linux/procrank_linux.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# procrank_linux
+#
+################################################################################
+
+PROCRANK_LINUX_VERSION = 21c30ab4514a5b15ac6e813e21bee0d3d714cb08
+PROCRANK_LINUX_SITE = $(call github,csimmonds,procrank_linux,$(PROCRANK_LINUX_VERSION))
+PROCRANK_LINUX_LICENSE = Apache-2.0
+PROCRANK_LINUX_LICENSE_FILES = NOTICE
+
+define PROCRANK_LINUX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)"
+endef
+
+define PROCRANK_LINUX_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/procrank \
+		$(TARGET_DIR)/usr/bin/procrank
+endef
+
+$(eval $(generic-package))
-- 
2.4.10

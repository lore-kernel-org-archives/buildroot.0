From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri, 18 Dec 2015 14:44:58 +0100
Subject: [Buildroot] [PATCH 1/1] emlog: new package
Message-ID: <1450446298-3523-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/Config.in        |  1 +
 package/emlog/Config.in  | 12 ++++++++++++
 package/emlog/emlog.hash |  2 ++
 package/emlog/emlog.mk   | 21 +++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/emlog/Config.in
 create mode 100644 package/emlog/emlog.hash
 create mode 100644 package/emlog/emlog.mk

diff --git a/package/Config.in b/package/Config.in
index c78baac..dfa4d3b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1515,6 +1515,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/debianutils/Config.in"
 endif
 	source "package/dsp-tools/Config.in"
+	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
diff --git a/package/emlog/Config.in b/package/emlog/Config.in
new file mode 100644
index 0000000..85a9ed6
--- /dev/null
+++ b/package/emlog/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_EMLOG
+	bool "emlog"
+	help
+	  emlog is a Linux kernel module that makes it easy to access the most
+	  recent (and only the most recent) output from a process. It works
+	  just like "tail -f" on a log file, except that the storage required
+	  never grows. This can be useful in embedded systems where there isn't
+	  enough memory or disk space for keeping complete log files, but the
+	  most recent debugging messages are sometimes needed (e.g., after an
+	  error is observed).
+
+	  https://github.com/nicupavel/emlog
diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
new file mode 100644
index 0000000..ab729f8
--- /dev/null
+++ b/package/emlog/emlog.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 37b03b79684245ddcb33cfff388a7f2d74f465f2e1fce4f661b81726f5ccd595 emlog-0.52.tar.gz
diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
new file mode 100644
index 0000000..d368652
--- /dev/null
+++ b/package/emlog/emlog.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# emlog
+#
+################################################################################
+
+EMLOG_VERSION = 0.52
+EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
+EMLOG_LICENSE = GPLv2
+EMLOG_LICENSE_FILES = COPYING
+
+define EMLOG_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(@D) nbcat
+endef
+
+define EMLOG_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/nbcat $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
1.8.3.1

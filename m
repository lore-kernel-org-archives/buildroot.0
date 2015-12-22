From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Tue, 22 Dec 2015 11:36:36 +0100
Subject: [Buildroot] [PATCH v2] emlog: new package
Message-ID: <1450780596-23774-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
Changes v1 -> v2:
 - use kernel-module infra
 - use TARGET_CONFIGURE_OPTS
 - add extra comments
 - add dependcy on the linux kernel

 package/Config.in        |  1 +
 package/emlog/Config.in  | 16 ++++++++++++++++
 package/emlog/emlog.hash |  2 ++
 package/emlog/emlog.mk   | 23 +++++++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/emlog/Config.in
 create mode 100644 package/emlog/emlog.hash
 create mode 100644 package/emlog/emlog.mk

diff --git a/package/Config.in b/package/Config.in
index b57c3ee..dbfa5de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1533,6 +1533,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/debianutils/Config.in"
 endif
 	source "package/dsp-tools/Config.in"
+	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
diff --git a/package/emlog/Config.in b/package/emlog/Config.in
new file mode 100644
index 0000000..c279860
--- /dev/null
+++ b/package/emlog/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_EMLOG
+	bool "emlog"
+	depends on BR2_LINUX_KERNEL
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
+
+comment "emlog needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
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
index 0000000..76c97f7
--- /dev/null
+++ b/package/emlog/emlog.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# emlog
+#
+################################################################################
+
+EMLOG_VERSION = 0.52
+EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
+EMLOG_DEPENDENCIES = linux
+EMLOG_LICENSE = GPLv2
+EMLOG_LICENSE_FILES = COPYING
+
+define EMLOG_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) nbcat
+endef
+
+# make install tries to strip, so install manually.
+define EMLOG_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/nbcat $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
1.8.3.1

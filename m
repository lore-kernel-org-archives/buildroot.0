From: pierre <p.floury@gmail.com>
Date: Tue, 30 Jul 2013 16:01:42 +0200
Subject: [Buildroot] [PATCH] pacakge : add trace-cmd package
Message-ID: <1375192902-29236-1-git-send-email-pierre.floury@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in            |    1 +
 package/tracecmd/Config.in   |    9 +++++++++
 package/tracecmd/tracecmd.mk |   24 ++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/tracecmd/Config.in
 create mode 100644 package/tracecmd/tracecmd.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..4a7bc5d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -39,6 +39,7 @@ source "package/memstat/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
 source "package/perf/Config.in"
+source "package/tracecmd/Config.in"
 source "package/ramspeed/Config.in"
 source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
diff --git a/package/tracecmd/Config.in b/package/tracecmd/Config.in
new file mode 100644
index 0000000..cb24816
--- /dev/null
+++ b/package/tracecmd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TRACECMD
+	bool "trace-cmd"
+	help
+	  trace-cmd - command line reader for ftrace 
+	  need to have ftrace enable into your kernel:
+
+	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
+
+comment "trace-cmd - command line reader for ftrace"
diff --git a/package/tracecmd/tracecmd.mk b/package/tracecmd/tracecmd.mk
new file mode 100644
index 0000000..3ddff28
--- /dev/null
+++ b/package/tracecmd/tracecmd.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# tracecmd
+#
+#############################################################
+
+TRACECMD_VERSION = 8c10a774f1f8586cd8b0e
+TRACECMD_SITE = http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
+TRACECMD_SITE_METHOD = git
+TRACECMD_INSTALL_STAGING = YES
+TRACECMD_LICENSE = GPL
+# No license file, the license is in the installed header
+TRACECMD_LICENSE_FILES = COPYING
+define TRACECMD_BUILD_CMDS
+     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define TRACECMD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/trace-cmd $(TARGET_DIR)/usr/bin
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/trace-cmd/plugins
+	$(INSTALL) -D -m 0755 $(@D)/plugin_*.so $(TARGET_DIR)/usr/lib/trace-cmd/plugins
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4

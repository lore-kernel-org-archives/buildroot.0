From: Pierre Floury <p.floury@gmail.com>
Date: Fri,  2 Aug 2013 09:53:54 +0200
Subject: [Buildroot] [PATCH v3] trace-cmd : new package
Message-ID: <1375430034-5257-1-git-send-email-pierre.floury@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: pierre <pierre.floury@gmail.com>

This commit adds a new package for the trace-cmd tool.
This tool is a command line front end of ftrace.
It collects traces on your target.
You can analyse these traces on the target or on the host via
the gui "kernel shark".

http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git

Signed-off-by: Pierre Floury <pierre.floury@gmail.com>

---
Change since v2 :
- apply change recommanded by Thomas De Schampheleire
- use full name in signed off
- use alphabetic order on Config.in
- respect the #80

Change since v1 :
- apply change recommanded by Thomas De Schampheleire and Thomas
Petazzoni
- set good license
- set good license files
- change name in the .mk from TRACECMD to TRACE_CMD
- change comment on the Config.in
- use a tag git instread of a commit number
---
 package/Config.in              |    1 +
 package/trace-cmd/Config.in    |   10 ++++++++++
 package/trace-cmd/trace-cmd.mk |   23 +++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/trace-cmd/Config.in
 create mode 100644 package/trace-cmd/trace-cmd.mk

diff --git a/package/Config.in b/package/Config.in
index 7069d77..f5b14f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -48,6 +48,7 @@ source "package/strace/Config.in"
 source "package/stress/Config.in"
 source "package/sysprof/Config.in"
 source "package/tinymembench/Config.in"
+source "package/trace-cmd/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
 source "package/pv/Config.in"
diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
new file mode 100644
index 0000000..5b2b5e4
--- /dev/null
+++ b/package/trace-cmd/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TRACE_CMD
+	bool "trace-cmd"
+	help
+	  Command line reader for ftrace
+	  To use this profiling tool, you should enable ftrace in your kernel
+	  configuration. This command collect traces on your target.
+	  You can analyse these traces on the target or on the host via the gui
+	  "kernel shark"
+
+	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
new file mode 100644
index 0000000..1f81124
--- /dev/null
+++ b/package/trace-cmd/trace-cmd.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# trace-cmd
+#
+#############################################################
+
+TRACE_CMD_VERSION = trace-cmd-v2.2.1
+TRACE_CMD_SITE = http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
+TRACE_CMD_SITE_METHOD = git
+TRACE_CMD_INSTALL_STAGING = YES
+TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
+TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
+define TRACE_CMD_BUILD_CMDS
+     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define TRACE_CMD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/trace-cmd $(TARGET_DIR)/usr/bin
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/trace-cmd/plugins
+	$(INSTALL) -D -m 0755 $(@D)/plugin_*.so $(TARGET_DIR)/usr/lib/trace-cmd/plugins
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4

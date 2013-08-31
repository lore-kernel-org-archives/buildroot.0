From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:00 -0000
Subject: [Buildroot] [git commit] trace-cmd: new package
Message-ID: <20130831213336.950D99B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07203d78c24df74a77d73b17437d37dce41d232e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new package for the trace-cmd tool.  This tool is a
command line front end of ftrace.  It collects traces on your target.
You can analyse these traces on the target or on the host via the gui
"kernel shark".

[Thomas: use TARGET_CONFIGURE_OPTS, define _GNU_SOURCE to get
O_CLOEXEC definition on uClibc, add thread and largefile
dependencies.]

Signed-off-by: Pierre Floury <pierre.floury@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/trace-cmd/Config.in    |   16 ++++++++++++++++
 package/trace-cmd/trace-cmd.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)

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
index 0000000..8d79304
--- /dev/null
+++ b/package/trace-cmd/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_TRACE_CMD
+	bool "trace-cmd"
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Command line reader for ftrace.
+
+	  To use this profiling tool, you should enable ftrace in your kernel
+	  configuration. This command collect traces on your target.
+	  You can analyse these traces on the target or on the host via the gui
+	  "kernel shark"
+
+	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
+
+comment "trace-cmd needs a toolchain with largefile and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
new file mode 100644
index 0000000..ada0306
--- /dev/null
+++ b/package/trace-cmd/trace-cmd.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# trace-cmd
+#
+################################################################################
+
+TRACE_CMD_VERSION = trace-cmd-v2.2.1
+TRACE_CMD_SITE = http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
+TRACE_CMD_SITE_METHOD = git
+TRACE_CMD_INSTALL_STAGING = YES
+TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
+TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
+
+define TRACE_CMD_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		-C $(@D) all
+endef
+
+define TRACE_CMD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/trace-cmd $(TARGET_DIR)/usr/bin/trace-cmd
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/trace-cmd/plugins
+	$(INSTALL) -D -m 0755 $(@D)/plugin_*.so $(TARGET_DIR)/usr/lib/trace-cmd/plugins
+endef
+
+$(eval $(generic-package))

From: Richard Braun <rbraun@sceen.net>
Date: Thu, 20 Sep 2012 17:12:33 +0200
Subject: [Buildroot] [PATCH] iucode-tool: new package
Message-ID: <1348153953-30568-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 package/Config.in                  |    1 +
 package/iucode-tool/Config.in      |    8 ++++++++
 package/iucode-tool/S00iucode-tool |   23 +++++++++++++++++++++++
 package/iucode-tool/iucode-tool.mk |   20 ++++++++++++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/iucode-tool/Config.in
 create mode 100755 package/iucode-tool/S00iucode-tool
 create mode 100644 package/iucode-tool/iucode-tool.mk

diff --git a/package/Config.in b/package/Config.in
index e8a3f50..e74845b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -214,6 +214,7 @@ source "package/input-event-daemon/Config.in"
 source "package/input-tools/Config.in"
 source "package/intel-microcode/Config.in"
 source "package/iostat/Config.in"
+source "package/iucode-tool/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
diff --git a/package/iucode-tool/Config.in b/package/iucode-tool/Config.in
new file mode 100644
index 0000000..a9670ce
--- /dev/null
+++ b/package/iucode-tool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IUCODE_TOOL
+	bool "iucode-tool"
+	depends on BR2_x86_64 || BR2_i386
+	select BR2_PACKAGE_INTEL_MICROCODE
+	help
+	  Intel processor microcode tool
+
+	  http://packages.debian.org/source/sid/iucode-tool
diff --git a/package/iucode-tool/S00iucode-tool b/package/iucode-tool/S00iucode-tool
new file mode 100755
index 0000000..0c1e409
--- /dev/null
+++ b/package/iucode-tool/S00iucode-tool
@@ -0,0 +1,23 @@
+#!/bin/sh
+#
+# Upload microcode into the processor.
+#
+
+microcode_file="/usr/share/misc/intel-microcode.dat"
+
+case "$1" in
+  start)
+	echo "Starting iucode-tool:"
+	/usr/sbin/iucode_tool -k $microcode_file
+	echo "done"
+	;;
+  stop)
+	;;
+  restart|reload)
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
new file mode 100644
index 0000000..0991bbf
--- /dev/null
+++ b/package/iucode-tool/iucode-tool.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# iucode-tool
+#
+#############################################################
+
+IUCODE_TOOL_VERSION = v0.8.3
+IUCODE_TOOL_SITE = git://anonscm.debian.org/users/hmh/iucode-tool.git
+IUCODE_TOOL_SITE_METHOD = git
+IUCODE_TOOL_AUTORECONF = YES
+IUCODE_TOOL_LICENSE = GPLv2+
+IUCODE_TOOL_LICENSE_FILES = COPYING
+
+define IUCODE_TOOL_INSTALL_INIT_SYSV
+	[ -f $(TARGET_DIR)/etc/init.d/S00iucode-tool ] || \
+		$(INSTALL) -D -m 0755 package/iucode-tool/S00iucode-tool \
+			$(TARGET_DIR)/etc/init.d/S00iucode-tool
+endef
+
+$(eval $(autotools-package))
-- 
1.7.2.5

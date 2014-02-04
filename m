From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Feb 2014 10:25:58 +0100
Subject: [Buildroot] [PATCH 2/2] iucode-tools: new package
In-Reply-To: <1391505958-17221-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1391505958-17221-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1391505958-17221-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iucode_tool is a program to manipulate Intel? X86 and X86-64 processor
microcode collections, and to use the kernel facilities to upgrade the
microcode on Intel system processors.
It was originally sent by Richard Braun <rbraun@sceen.net>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Richard Braun <rbraun@sceen.net>
---
 package/Config.in                  |  1 +
 package/iucode-tool/Config.in      |  8 ++++++++
 package/iucode-tool/S00iucode-tool | 23 +++++++++++++++++++++++
 package/iucode-tool/iucode-tool.mk | 19 +++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/iucode-tool/Config.in
 create mode 100644 package/iucode-tool/S00iucode-tool
 create mode 100644 package/iucode-tool/iucode-tool.mk

diff --git a/package/Config.in b/package/Config.in
index e452c1e..ee2a68e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -304,6 +304,7 @@ source "package/input-tools/Config.in"
 source "package/intel-microcode/Config.in"
 source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
+source "package/iucode-tool/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
 source "package/lm-sensors/Config.in"
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
new file mode 100644
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
index 0000000..2d52b16
--- /dev/null
+++ b/package/iucode-tool/iucode-tool.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# iucode-tool
+#
+################################################################################
+
+IUCODE_TOOL_VERSION = v1.0.1
+IUCODE_TOOL_SITE = git://git.debian.org/users/hmh/iucode-tool.git
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
1.8.5.3

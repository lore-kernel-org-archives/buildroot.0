From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:53:57 +0100
Subject: [Buildroot] [git commit] iucode-tools: new package
Message-ID: <20140204150218.A9B759C7D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f2d43e3ed631d803fb7b9eadbdb18a5b79d5b63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iucode_tool is a program to manipulate Intel?? X86 and X86-64 processor
microcode collections, and to use the kernel facilities to upgrade the
microcode on Intel system processors.
It was originally sent by Richard Braun <rbraun@sceen.net>

[Peter: drop 'sid' from upstream URL]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Richard Braun <rbraun@sceen.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                  |    1 +
 package/iucode-tool/Config.in      |    8 ++++++++
 package/iucode-tool/S00iucode-tool |   23 +++++++++++++++++++++++
 package/iucode-tool/iucode-tool.mk |   19 +++++++++++++++++++
 4 files changed, 51 insertions(+), 0 deletions(-)

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
index 0000000..19e2254
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
+	  http://packages.debian.org/source/iucode-tool
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

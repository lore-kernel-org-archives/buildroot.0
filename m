From: Rhys Williams <github@wilberforce.co.nz>
Date: Sat, 21 Mar 2015 23:18:44 +1300
Subject: [Buildroot] [PATCH 1/1] lirc-tools: new package
Message-ID: <1426933124-1445-1-git-send-email-github@wilberforce.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rhys Williams <github@wilberforce.co.nz>
---
 package/Config.in                |  1 +
 package/lirc-tools/Config.in     | 15 +++++++++++++++
 package/lirc-tools/S25lircd      | 39 +++++++++++++++++++++++++++++++++++++++
 package/lirc-tools/lirc-tools.mk | 30 ++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/lirc-tools/Config.in
 create mode 100755 package/lirc-tools/S25lircd
 create mode 100644 package/lirc-tools/lirc-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 93fde92..f97ea6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -342,6 +342,7 @@ endif
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
 	source "package/lsuio/Config.in"
diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
new file mode 100644
index 0000000..011d85d
--- /dev/null
+++ b/package/lirc-tools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIRC_TOOLS
+	bool "lirc-tools"
+	help
+	  Linux Infrared Remote Control IR receiver/transmitter Daemon and tools
+		  LIRC is a package that supports receiving and sending IR
+          signals of the most common IR remote controls. It contains a
+          daemon that decodes and sends IR signals, a mouse daemon
+          that translates IR signals to mouse movements and a couple
+          of user programs that allow to control your computer with a
+          remote control.
+          
+	  lircd, irw, irrecord, mode2 etc
+	  
+	  http://www.lirc.org/
+	  
diff --git a/package/lirc-tools/S25lircd b/package/lirc-tools/S25lircd
new file mode 100755
index 0000000..ebf5ce4
--- /dev/null
+++ b/package/lirc-tools/S25lircd
@@ -0,0 +1,39 @@
+#!/bin/sh
+#
+# Start lirc
+#
+# Support for remotes - Add remotes to /etc/lirc/lircd.conf.d/
+#
+
+start() {
+	echo -n "Starting lirc: "
+	mkdir /var/run/lirc
+	ln -s /var/run/lirc/lircd /dev/lircd
+	#lircd -O /etc/lirc/lirc_options.conf
+	start-stop-daemon -b -S -q -m -p /var/run/lirc.pid --exec /usr/sbin/lircd -- -O /etc/lirc/lirc_options.conf
+	echo "OK"
+}
+
+stop() {
+	echo -n "Stopping lirc: "
+	start-stop-daemon -K -q -p /var/run/lirc.pid
+	echo "OK"
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	stop
+	start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
new file mode 100644
index 0000000..cd3b38c
--- /dev/null
+++ b/package/lirc-tools/lirc-tools.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# lirc-tools
+#
+#############################################################
+
+LIRC_TOOLS_VERSION = 0.9.2
+LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
+LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)/
+
+LIRC_TOOLS_INSTALL_STAGING = YES
+LIRC_TOOLS_INSTALL_TARGET = YES
+
+LIRC_TOOLS_AUTORECONF=YES
+
+LIRC_TOOLS_CONF_OPTS = --without-x --enable-sandboxed --with-driver=userspace
+
+LIRC_TOOLS_POST_INSTALL_TARGET_HOOKS += LIRC_TOOLS_INSTALL_TARGET_SCRIPTS
+LIRC_TOOLS_POST_UNINSTALL_TARGET_HOOKS += LIRC_TOOLS_UNINSTALL_TARGET_SCRIPTS
+
+define LIRC_TOOLS_INSTALL_TARGET_SCRIPTS
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/lirc-tools/S25lircd $(TARGET_DIR)/etc/init.d/
+endef
+
+define LIRC_TOOLS_UNINSTALL_TARGET_SCRIPTS
+	rm -f $(TARGET_DIR)/etc/init.d/S25lircd
+endef
+
+$(eval $(autotools-package))
-- 
2.3.2

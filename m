From: Rhys Williams <github@wilberforce.co.nz>
Date: Wed, 25 Mar 2015 10:40:28 +1300
Subject: [Buildroot] [PATCH v5] lirc-tools: new package
Message-ID: <1427233228-13602-1-git-send-email-github@wilberforce.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the userspace tools and daemons LIRC -
Linux remote control

Signed-off-by: Rhys Williams <github@wilberforce.co.nz>
---
 package/lirc-tools/Config.in       | 17 +++++++++++++++++
 package/lirc-tools/S25lircd        | 38 ++++++++++++++++++++++++++++++++++++++
 package/lirc-tools/lirc-tools.hash |  2 ++
 package/lirc-tools/lirc-tools.mk   | 19 +++++++++++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 package/lirc-tools/Config.in
 create mode 100755 package/lirc-tools/S25lircd
 create mode 100644 package/lirc-tools/lirc-tools.hash
 create mode 100644 package/lirc-tools/lirc-tools.mk

diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
new file mode 100644
index 0000000..f29724b
--- /dev/null
+++ b/package/lirc-tools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIRC_TOOLS
+	bool "lirc-tools"
+	help
+	  Linux Infrared Remote Control IR receiver/transmitter Daemon and tools
+	  LIRC is a package that supports receiving and sending IR
+	  signals of the most common IR remote controls. It contains a
+	  daemon that decodes and sends IR signals, a mouse daemon
+	  that translates IR signals to mouse movements and a couple
+	  of user programs that allow to control your computer with a
+	  remote control.
+          
+	  lircd, irw, irrecord, mode2 etc
+	  
+	  Requires the kernel LIRC interface driver , add modules to support
+	  your hardware.
+	  
+	  http://www.lirc.org/
diff --git a/package/lirc-tools/S25lircd b/package/lirc-tools/S25lircd
new file mode 100755
index 0000000..e4d98f5
--- /dev/null
+++ b/package/lirc-tools/S25lircd
@@ -0,0 +1,38 @@
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
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
new file mode 100644
index 0000000..3986767
--- /dev/null
+++ b/package/lirc-tools/lirc-tools.hash
@@ -0,0 +1,2 @@
+#hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.2/
+sha1 585daed1eaa169b9683a507e26b1331a947a4dcd lirc-0.9.2.tar.bz2
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
new file mode 100644
index 0000000..44e1848
--- /dev/null
+++ b/package/lirc-tools/lirc-tools.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# lirc-tools
+#
+################################################################################
+
+LIRC_TOOLS_VERSION = 0.9.2
+LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
+LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)/
+LIRC_TOOLS_LICENSE = GPLv2+
+LIRC_TOOLS_LICENSE_FILES = COPYING
+
+LIRC_TOOLS_CONF_OPTS = --without-x --enable-sandboxed --with-driver=userspace
+
+define LIRC_TOOLS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd $(TARGET_DIR)/etc/init.d/
+endef
+
+$(eval $(autotools-package))
-- 
2.3.2

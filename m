From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:16:40 +0200
Subject: [Buildroot] [git commit] lirc-tools: new package
Message-ID: <20150403131732.31840819B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ba7e76d5786114e05482ae6528e6da61eb12be3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds the userspace tools and daemons LIRC - Linux remote
control

[Thomas:
 - rewrap Config.in help text, lines were too long. And do a bit of
   rewording also.
 - remove trailing whitespaces in Config.in.
 - make sure Config.in is included from package/Config.in, otherwise
   the package is not visible.
 - use a full destination path when installing the sysv init script.
 - add dependency on BR2_USE_MMU, since fork() is used.
 - fix init script: use -n option to not daemonize since
   start-stop-daemon is already doing that, use 'mkdir -p' and 'ln
   -sf' to make the 'start' action re-executable.]

Signed-off-by: Rhys Williams <github@wilberforce.co.nz>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/lirc-tools/Config.in       |   15 ++++++++++++++
 package/lirc-tools/S25lircd        |   38 ++++++++++++++++++++++++++++++++++++
 package/lirc-tools/lirc-tools.hash |    2 +
 package/lirc-tools/lirc-tools.mk   |   23 +++++++++++++++++++++
 5 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 65e2683..4dd3ff2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -360,6 +360,7 @@ endif
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
 	source "package/lsuio/Config.in"
diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
new file mode 100644
index 0000000..0f58662
--- /dev/null
+++ b/package/lirc-tools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIRC_TOOLS
+	bool "lirc-tools"
+	depends on BR2_USE_MMU # fork()
+	help
+	  LIRC is a package that supports receiving and sending IR
+	  signals of the most common IR remote controls. It contains a
+	  daemon that decodes and sends IR signals, a mouse daemon
+	  that translates IR signals to mouse movements and a couple
+	  of user programs that allow to control your computer with a
+	  remote control.
+
+	  It requires the kernel LIRC interface driver, make sure to
+	  enable the kernel drivers to support your hardware.
+
+	  http://www.lirc.org/
diff --git a/package/lirc-tools/S25lircd b/package/lirc-tools/S25lircd
new file mode 100755
index 0000000..0f57f55
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
+	mkdir -p /var/run/lirc
+	ln -sf /var/run/lirc/lircd /dev/lircd
+	start-stop-daemon -b -S -q -m -p /var/run/lirc.pid --exec /usr/sbin/lircd -- -n -O /etc/lirc/lirc_options.conf
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
index 0000000..af332ea
--- /dev/null
+++ b/package/lirc-tools/lirc-tools.mk
@@ -0,0 +1,23 @@
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
+LIRC_TOOLS_CONF_OPTS = \
+	--without-x \
+	--enable-sandboxed \
+	--with-driver=userspace
+
+define LIRC_TOOLS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd \
+		$(TARGET_DIR)/etc/init.d/S25lircd
+endef
+
+$(eval $(autotools-package))

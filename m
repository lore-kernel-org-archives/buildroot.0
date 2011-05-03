From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 May 2011 22:43:55 +0200
Subject: [Buildroot] [git commit] New package: input-event-daemon
Message-ID: <20110503204512.3C5D082BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c17f4134384666e1ae6116a08b2ce92da633abef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new package: input-event-daemon

input-event-daemon -  input event handling daemon for linux.

[Peter: minor tweaks, use v0.1.3 tag, pass LDFLAGS, combine install step]
Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                |    1 +
 package/input-event-daemon/Config.in             |    8 ++++
 package/input-event-daemon/S99input-event-daemon |   39 ++++++++++++++++++++++
 package/input-event-daemon/input-event-daemon.mk |   36 ++++++++++++++++++++
 4 files changed, 84 insertions(+), 0 deletions(-)
 create mode 100644 package/input-event-daemon/Config.in
 create mode 100755 package/input-event-daemon/S99input-event-daemon
 create mode 100644 package/input-event-daemon/input-event-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index 8e78f0f..6f3384c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -177,6 +177,7 @@ source "package/hdparm/Config.in"
 endif
 source "package/hwdata/Config.in"
 source "package/i2c-tools/Config.in"
+source "package/input-event-daemon/Config.in"
 source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
diff --git a/package/input-event-daemon/Config.in b/package/input-event-daemon/Config.in
new file mode 100644
index 0000000..edf2886
--- /dev/null
+++ b/package/input-event-daemon/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_INPUT_EVENT_DAEMON
+	bool "input-event-daemon"
+	help
+	  input-event-daemon is a daemon which executes
+	  a user-defined command on input events, such as
+	  keys, mouse buttons and switches.
+
+	  http://github.com/gandro/input-event-daemon
diff --git a/package/input-event-daemon/S99input-event-daemon b/package/input-event-daemon/S99input-event-daemon
new file mode 100755
index 0000000..3a82b06
--- /dev/null
+++ b/package/input-event-daemon/S99input-event-daemon
@@ -0,0 +1,39 @@
+#! /bin/sh
+
+[ -f /usr/bin/input-event-daemon ] || exit 0
+
+start() {
+	echo -n "Starting input-event-daemon: "
+	input-event-daemon
+	echo "done"
+}
+
+
+stop() {
+	echo -n "Stopping input-event-daemon: "
+	killall input-event-daemon
+	echo "done"
+}
+
+restart() {
+	stop
+	start
+}
+
+# See how we were called.
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|reload|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
new file mode 100644
index 0000000..c335be3
--- /dev/null
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# input-event-daemon
+#
+#############################################################
+
+INPUT_EVENT_DAEMON_VERSION = v0.1.3
+INPUT_EVENT_DAEMON_SITE = git://github.com/gandro/input-event-daemon.git
+
+define INPUT_EVENT_DAEMON_BUILD_CMDS
+	touch  $(@D)/input-event-table.h
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
+
+define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/input-event-daemon \
+		$(TARGET_DIR)/usr/bin/input-event-daemon
+	[ -f $(TARGET_DIR)/etc/input-event-daemon.conf ] || \
+		$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
+			$(TARGET_DIR)/etc/input-event-daemon.conf
+	[ -f $(TARGET_DIR)/etc/init.d/S99input-event-daemon ] || \
+		$(INSTALL) -m 0755 -D package/input-event-daemon/S99input-event-daemon \
+			$(TARGET_DIR)/etc/init.d/S99input-event-daemon
+endef
+
+define INPUT_EVENT_DAEMON_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/input-event-daemon
+	rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
+endef
+
+$(eval $(call GENTARGETS,package,input-event-daemon))
-- 
1.7.3.4

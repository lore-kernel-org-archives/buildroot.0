From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 31 Mar 2018 15:56:31 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: add
 sysv init script
Message-ID: <20180331135641.E63FD83F79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d83eacaaa8f17b5d573d540ca6338390fcfa0ba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need ":0.0 vt01" to make sure Xorg finds the correct terminal.

Quoting https://www.x.org/archive/X11R6.8.0/doc/Xorg.1.html

-allowMouseOpenFail
    Allow the server to start up even if the mouse device can't be
    opened or initialised.

We need this option in case BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE was
not enabled.

-noreset
    prevents a server reset when the last client connection is closed.

We need this option to prevent auto-close of Xorg.

Tested with a qemu image and Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: copy an abbreviate version of the explanation above to the
         script.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xserver_xorg-server/S40xorg          | 46 ++++++++++++++++++++++
 .../xserver_xorg-server/xserver_xorg-server.mk     |  5 +++
 2 files changed, 51 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/S40xorg b/package/x11r7/xserver_xorg-server/S40xorg
new file mode 100755
index 0000000000..215c0b7acf
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/S40xorg
@@ -0,0 +1,46 @@
+#!/bin/sh
+#
+# Starts Xorg
+#
+
+BIN=/usr/bin/Xorg
+PIDFILE=/var/run/xorg.pid
+
+# ":0.0 vt01" makes sure Xorg finds the correct terminal.
+# -allowMouseOpenFail allows the server to start up even if the mouse device
+#   can't be opened or initialised.
+# -noreset prevents a server reset when the last client connection is closed.
+XORG_ARGS=":0.0 vt01 -s 0 -noreset -allowMouseOpenFail"
+
+start() {
+	printf "Starting Xorg: "
+	start-stop-daemon -S -q -b -m -p $PIDFILE --exec $BIN -- $XORG_ARGS
+	[ $? = 0 ] && sleep 3 && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping Xorg: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+	stop
+	sleep 2
+	start
+}
+
+case "$1" in
+	start)
+		start
+	;;
+	stop)
+		stop
+	;;
+	restart|reload)
+		restart
+	;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 45a2c81f2b..d605a2c742 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -258,4 +258,9 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
+define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
+		$(TARGET_DIR)/etc/init.d/S40xorg
+endef
+
 $(eval $(autotools-package))

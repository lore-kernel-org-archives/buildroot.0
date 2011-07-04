From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 4 Jul 2011 21:03:37 +0200
Subject: [Buildroot] [git commit] Rework the logging daemons startup
Message-ID: <20110704191001.ADED18A31E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ad501b6634dc9d974da7e86299041fe441d58088
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logging mechanism startup being in inittab, it isn't easy to
overcharge the default policy. With this patch, the startup of the
syslog daemon is moved to an init.d script, that can easily be
overwritten.

[Peter: use install -D]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/inittab    |    2 --
 package/busybox/S01logging |   26 ++++++++++++++++++++++++++
 package/busybox/busybox.mk |    6 ++++++
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 package/busybox/S01logging

diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index 0e50467..191c525 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -28,8 +28,6 @@ null::sysinit:/bin/hostname -F /etc/hostname
 
 # Logging junk
 null::sysinit:/bin/touch /var/log/messages
-null::respawn:/sbin/syslogd -n -m 0
-null::respawn:/sbin/klogd -n
 tty3::respawn:/usr/bin/tail -f /var/log/messages
 
 # Stuff to do for the 3-finger salute
diff --git a/package/busybox/S01logging b/package/busybox/S01logging
new file mode 100644
index 0000000..6badebe
--- /dev/null
+++ b/package/busybox/S01logging
@@ -0,0 +1,26 @@
+#!/bin/sh
+#
+# Start logging
+#
+
+case "$1" in
+  start)
+	echo -n "Starting logging :"
+	start-stop-daemon -S -q -p /var/run/syslog.pid --exec /sbin/syslogd -- -m 0
+	start-stop-daemon -S -q -p /var/run/klogd.pid --exec /sbin/klogd
+	echo "OK"
+	;;
+  stop)
+	echo -n "Stopping logging :"
+	start-stop-daemon -K -q -p /var/run/syslog.pid
+	start-stop-daemon -K -q -p /var/run/klogd.pid
+	echo "OK"
+	;;
+  restart|reload)
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d2ba226..4931b07 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -122,6 +122,11 @@ define BUSYBOX_DISABLE_MMU_APPLETS
 endef
 endif
 
+define BUSYBOX_INSTALL_LOGGING_SCRIPT
+	$(INSTALL) -m 0755 -D package/busybox/S01logging \
+		$(TARGET_DIR)/etc/init.d/S01logging
+endef
+
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
@@ -152,6 +157,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
 	fi
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
+	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
-- 
1.7.3.4

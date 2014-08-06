From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed,  6 Aug 2014 15:39:10 +0200
Subject: [Buildroot] [PATCH v2 3/3] rpi-userland: Fix vcfiled startup
In-Reply-To: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <1407332350-27220-3-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The VideoCore file server daemon startup script installed from this package is
not compatible with BuildRoot (because of its naming and other Debian
dependencies), which prevented vcfiled from starting. Hence, prevent this
package from installing its vcfiled startup script, and install a vcfiled SysV
init script suitable for BuildRoot.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

---

Changes in v2:
 - Indent .mk rules with tabs.
 - Simplify the new vcfiled startup script.
 - Rename S97vcfiled to S94vcfiled for a better integration with existing init
   scripts.
---
 package/rpi-userland/S94vcfiled      | 47 ++++++++++++++++++++++++++++++++++++
 package/rpi-userland/rpi-userland.mk |  8 ++++++
 2 files changed, 55 insertions(+)
 create mode 100755 package/rpi-userland/S94vcfiled

diff --git a/package/rpi-userland/S94vcfiled b/package/rpi-userland/S94vcfiled
new file mode 100755
index 0000000..25a0fcd
--- /dev/null
+++ b/package/rpi-userland/S94vcfiled
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+NAME=vcfiled
+DESC="VideoCore file server daemon $NAME"
+DAEMON="/usr/sbin/$NAME"
+DAEMON_ARGS=""
+CFGFILE="/etc/default/$NAME"
+PIDFILE="/var/run/$NAME/$NAME"
+
+# Read configuration variable file if it is present
+[ -r "$CFGFILE" ] && . "$CFGFILE"
+
+do_start()
+{
+	echo -n "Starting $DESC: "
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS &&
+			echo "done" || echo "failed"
+}
+
+do_stop()
+{
+	echo -n "Stopping $DESC: "
+	if start-stop-daemon -K -q -R TERM/30/KILL/5 -p "$PIDFILE" -n "$NAME"; then
+		# This daemon does not remove its PID file when it exits.
+		rm -f "$PIDFILE"
+		echo "done"
+	else
+		echo "failed"
+	fi
+}
+
+case "$1" in
+	start)
+		do_start
+		;;
+	stop)
+		do_stop
+		;;
+	restart|reload)
+		do_stop
+		do_start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}" >&2
+		exit 1
+		;;
+esac
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 81ed95c..0d29f24 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -13,7 +13,15 @@ RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
 
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
+define RPI_USERLAND_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/rpi-userland/S94vcfiled \
+			$(TARGET_DIR)/etc/init.d/S94vcfiled
+endef
+
 define RPI_USERLAND_POST_TARGET_CLEANUP
+	rm -f $(TARGET_DIR)/etc/init.d/vcfiled
+	rm -f $(TARGET_DIR)/usr/share/install/vcfiled
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/install
 	rm -Rf $(TARGET_DIR)/usr/src
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
-- 
1.9.1

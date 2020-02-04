From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  4 Feb 2020 02:09:42 -0800
Subject: [Buildroot] [PATCH 1/1] package/restorecond: Fix restorecond init
 script.
Message-ID: <20200204100942.421804-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current restorecond init script has several issues which prevent
it from starting:

  - Busybox ash will error at "test $EUID = 0  || exit 4" with the error
    "sh: 0: unknown operand"

  - start-stop-daemon is not used
  - Failures happen silently.

Add our own S20restorecond to the package file and use that instead.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/restorecond/S20restorecond | 45 ++++++++++++++++++++++++++++++
 package/restorecond/restorecond.mk |  2 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 package/restorecond/S20restorecond

diff --git a/package/restorecond/S20restorecond b/package/restorecond/S20restorecond
new file mode 100644
index 0000000000..1abf678177
--- /dev/null
+++ b/package/restorecond/S20restorecond
@@ -0,0 +1,45 @@
+#!/bin/sh
+RESTORECOND=/usr/sbin/restorecond
+PIDFILE=/run/restorecond.pid
+if [ -x /usr/sbin/selinuxenabled ]; then
+  if ! /usr/sbin/selinuxenabled; then
+    echo "Selinux is not enabled!"
+    exit 7
+  fi
+fi
+
+# Check that we are root ... so non-root users stop here
+if [ $EUID != 0 ]; then
+  echo "Restorecond must be ran as root!"
+  exit 4
+fi
+
+test -x /usr/sbin/restorecond  || exit 5
+test -f /etc/selinux/restorecond.conf  || exit 6
+
+case "$1" in
+  start)
+    echo "Starting restorecond..."
+    unset HOME MAIL USER USERNAME
+    start-stop-daemon -S -x "${RESTORECOND}" -p "${PIDFILE}"
+  ;;
+  stop)
+  echo "Stopping restorecond..."
+  start-stop-daemon -K -x "${RESTORECOND}" -p "${PIDFILE}" -o
+  ;;
+  reload|force-reload)
+  echo "Reloading restorecond..."
+  restart
+  ;;
+  restart)
+  stop
+  start
+  ;;
+  condrestart)
+  [ -e /var/lock/subsys/restorecond ] && restart
+  ;;
+  *)
+  echo "Usage: $0 {start|stop|restart|reload|force-reload|condrestart}"
+  exit 3
+  ;;
+esac
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index c519b5de2b..cb4859c2d0 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -27,7 +27,7 @@ define RESTORECOND_BUILD_CMDS
 endef
 
 define RESTORECOND_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D $(@D)/restorecond.init \
+	$(INSTALL) -m 0755 -D $(RESTORECOND_PKGDIR)/S20restorecond \
 		$(TARGET_DIR)/etc/init.d/S20restorecond
 endef
 
-- 
2.24.1

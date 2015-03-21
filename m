From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:35:42 +0200
Subject: [Buildroot] [RFC 11/11] openvpn: new init infrastructure
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <2459853676c44571c63db02d3b7c136fd9e1ebd7.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only case so far that install-run can not handle.
Openvpn initscript spawns several processes, one for each
configured tunnel.

Initscripts is the only system that allows this, primarily
because it does not need to track spawned processes.
---
 package/openvpn/S60openvpn   | 103 -------------------------------------------
 package/openvpn/openvpn.init | 103 +++++++++++++++++++++++++++++++++++++++++++
 package/openvpn/openvpn.mk   |   5 ---
 package/openvpn/openvpn.run  |   1 +
 4 files changed, 104 insertions(+), 108 deletions(-)
 delete mode 100755 package/openvpn/S60openvpn
 create mode 100755 package/openvpn/openvpn.init
 create mode 100644 package/openvpn/openvpn.run

diff --git a/package/openvpn/S60openvpn b/package/openvpn/S60openvpn
deleted file mode 100755
index 94bdc60..0000000
--- a/package/openvpn/S60openvpn
+++ /dev/null
@@ -1,103 +0,0 @@
-#!/bin/sh -e
-#
-# Original version by Robert Leslie
-# <rob@mars.org>, edited by iwj and cs
-# Modified for openvpn by Alberto Gonzalez Iniesta <agi@agi.as>
-# Modified for restarting / starting / stopping single tunnels by Richard Mueller <mueller@teamix.net>
-
-test $DEBIAN_SCRIPT_DEBUG && set -v -x
-
-DAEMON=/usr/sbin/openvpn
-CONFIG_DIR=/etc/openvpn
-test -x $DAEMON || exit 0
-test -d $CONFIG_DIR || exit 0
-
-start_vpn () {
-    $DAEMON --daemon --writepid /var/run/openvpn.$NAME.pid \
-            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || echo -n " FAILED->"
-    echo -n " $NAME"
-}
-stop_vpn () {
-   kill `cat $PIDFILE` || true
-  rm $PIDFILE
-}
-
-case "$1" in
-start)
-  echo -n "Starting openvpn:"
-
-  if test -z $2 ; then
-    for CONFIG in `cd $CONFIG_DIR; ls *.conf 2> /dev/null`; do
-      NAME=${CONFIG%%.conf}
-      start_vpn
-    done
-  else
-    if test -e $CONFIG_DIR/$2.conf ; then
-      NAME=$2
-      start_vpn
-    else
-      echo -n " No such VPN: $2"
-    fi
-  fi
-  echo "."
-
-  ;;
-stop)
-  echo -n "Stopping openvpn:"
-
-  if test -z $2 ; then
-    for PIDFILE in `ls /var/run/openvpn.*.pid 2> /dev/null`; do
-      NAME=`echo $PIDFILE | cut -c18-`
-      NAME=${NAME%%.pid}
-      stop_vpn
-      echo -n " $NAME"
-    done
-  else
-    if test -e /var/run/openvpn.$2.pid ; then
-      PIDFILE=`ls /var/run/openvpn.$2.pid 2> /dev/null`
-      NAME=`echo $PIDFILE | cut -c18-`
-      NAME=${NAME%%.pid}
-      stop_vpn
-      echo -n " $NAME"
-    else
-      echo -n " No such VPN: $2"
-    fi
-  fi
-  echo "."
-  ;;
-# We only 'reload' for running VPNs. New ones will only start with 'start' or 'restart'.
-reload|force-reload)
-  echo -n "Reloading openvpn:"
-  for PIDFILE in `ls /var/run/openvpn.*.pid 2> /dev/null`; do
-    NAME=`echo $PIDFILE | cut -c18-`
-    NAME=${NAME%%.pid}
-# If openvpn if running under a different user than root we'll need to restart
-    if egrep '^( |\t)*user' $CONFIG_DIR/$NAME.conf > /dev/null 2>&1 ; then
-      stop_vpn
-      sleep 1
-      start_vpn
-      echo -n "(restarted)"
-    else
-      kill -HUP `cat $PIDFILE` || true
-#    start-stop-daemon --stop --signal HUP --quiet --oknodo \
-#      --exec $DAEMON --pidfile $PIDFILE
-    echo -n " $NAME"
-    fi
-  done
-  echo "."
-  ;;
-
-restart)
-  $0 stop $2
-  sleep 1
-  $0 start $2
-  ;;
-*)
-  echo "Usage: $0 {start|stop|reload|restart|force-reload}" >&2
-  exit 1
-  ;;
-esac
-
-exit 0
-
-# vim:set ai et sts=2 sw=2 tw=0:
diff --git a/package/openvpn/openvpn.init b/package/openvpn/openvpn.init
new file mode 100755
index 0000000..94bdc60
--- /dev/null
+++ b/package/openvpn/openvpn.init
@@ -0,0 +1,103 @@
+#!/bin/sh -e
+#
+# Original version by Robert Leslie
+# <rob@mars.org>, edited by iwj and cs
+# Modified for openvpn by Alberto Gonzalez Iniesta <agi@agi.as>
+# Modified for restarting / starting / stopping single tunnels by Richard Mueller <mueller@teamix.net>
+
+test $DEBIAN_SCRIPT_DEBUG && set -v -x
+
+DAEMON=/usr/sbin/openvpn
+CONFIG_DIR=/etc/openvpn
+test -x $DAEMON || exit 0
+test -d $CONFIG_DIR || exit 0
+
+start_vpn () {
+    $DAEMON --daemon --writepid /var/run/openvpn.$NAME.pid \
+            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || echo -n " FAILED->"
+    echo -n " $NAME"
+}
+stop_vpn () {
+   kill `cat $PIDFILE` || true
+  rm $PIDFILE
+}
+
+case "$1" in
+start)
+  echo -n "Starting openvpn:"
+
+  if test -z $2 ; then
+    for CONFIG in `cd $CONFIG_DIR; ls *.conf 2> /dev/null`; do
+      NAME=${CONFIG%%.conf}
+      start_vpn
+    done
+  else
+    if test -e $CONFIG_DIR/$2.conf ; then
+      NAME=$2
+      start_vpn
+    else
+      echo -n " No such VPN: $2"
+    fi
+  fi
+  echo "."
+
+  ;;
+stop)
+  echo -n "Stopping openvpn:"
+
+  if test -z $2 ; then
+    for PIDFILE in `ls /var/run/openvpn.*.pid 2> /dev/null`; do
+      NAME=`echo $PIDFILE | cut -c18-`
+      NAME=${NAME%%.pid}
+      stop_vpn
+      echo -n " $NAME"
+    done
+  else
+    if test -e /var/run/openvpn.$2.pid ; then
+      PIDFILE=`ls /var/run/openvpn.$2.pid 2> /dev/null`
+      NAME=`echo $PIDFILE | cut -c18-`
+      NAME=${NAME%%.pid}
+      stop_vpn
+      echo -n " $NAME"
+    else
+      echo -n " No such VPN: $2"
+    fi
+  fi
+  echo "."
+  ;;
+# We only 'reload' for running VPNs. New ones will only start with 'start' or 'restart'.
+reload|force-reload)
+  echo -n "Reloading openvpn:"
+  for PIDFILE in `ls /var/run/openvpn.*.pid 2> /dev/null`; do
+    NAME=`echo $PIDFILE | cut -c18-`
+    NAME=${NAME%%.pid}
+# If openvpn if running under a different user than root we'll need to restart
+    if egrep '^( |\t)*user' $CONFIG_DIR/$NAME.conf > /dev/null 2>&1 ; then
+      stop_vpn
+      sleep 1
+      start_vpn
+      echo -n "(restarted)"
+    else
+      kill -HUP `cat $PIDFILE` || true
+#    start-stop-daemon --stop --signal HUP --quiet --oknodo \
+#      --exec $DAEMON --pidfile $PIDFILE
+    echo -n " $NAME"
+    fi
+  done
+  echo "."
+  ;;
+
+restart)
+  $0 stop $2
+  sleep 1
+  $0 start $2
+  ;;
+*)
+  echo "Usage: $0 {start|stop|reload|restart|force-reload}" >&2
+  exit 1
+  ;;
+esac
+
+exit 0
+
+# vim:set ai et sts=2 sw=2 tw=0:
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3854b23..6937d50 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -52,9 +52,4 @@ define OPENVPN_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/sbin/openvpn
 endef
 
-define OPENVPN_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/openvpn/S60openvpn \
-		$(TARGET_DIR)/etc/init.d/S60openvpn
-endef
-
 $(eval $(autotools-package))
diff --git a/package/openvpn/openvpn.run b/package/openvpn/openvpn.run
new file mode 100644
index 0000000..20ce79c
--- /dev/null
+++ b/package/openvpn/openvpn.run
@@ -0,0 +1 @@
+initscripts 60:openvpn.init
-- 
2.0.3

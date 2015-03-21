From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:31:26 +0200
Subject: [Buildroot] [RFC 07/11] upmpcli: new init infrastructure
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <0e6b45452042c82907180fb823fe2fc42ce843f8.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Typical package: simple foreground daemon and its effective user entry.
---
 package/upmpdcli/S99upmpdcli    | 40 ----------------------------------------
 package/upmpdcli/upmpdcli.mk    |  9 ---------
 package/upmpdcli/upmpdcli.run   |  1 +
 package/upmpdcli/upmpdcli.users |  1 +
 4 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/upmpdcli/S99upmpdcli
 create mode 100644 package/upmpdcli/upmpdcli.run
 create mode 100644 package/upmpdcli/upmpdcli.users

diff --git a/package/upmpdcli/S99upmpdcli b/package/upmpdcli/S99upmpdcli
deleted file mode 100644
index 07b10a6..0000000
--- a/package/upmpdcli/S99upmpdcli
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-
-NAME=upmpdcli
-DAEMON=/usr/bin/$NAME
-CONFFILE=/etc/$NAME.conf
-PIDFILE=/var/run/$NAME.pid
-DAEMON_ARGS="-D -c $CONFFILE"
-
-# Sanity checks
-test -f $DAEMON || exit 0
-
-start() {
-        echo -n "Starting $NAME: "
-        start-stop-daemon --start --quiet --background --exec $DAEMON \
-                -- $DAEMON_ARGS \
-                && echo "OK" || echo "FAIL"
-}
-
-stop() {
-        echo -n "Stopping $NAME: "
-        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
-                && echo "OK" || echo "FAIL"
-}
-
-case "$1" in
-        start)
-                start
-                ;;
-        stop)
-                stop
-                ;;
-        restart)
-                stop
-                sleep 1
-                start
-                ;;
-        *)
-                echo "Usage: $0 {start|stop|restart}"
-                exit 1
-esac
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 0be4d91..ab9e447 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -10,15 +10,6 @@ UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp
 
-# Upmpdcli only runs if user upmpdcli exists
-define UPMPDCLI_USERS
-	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli MPD UPnP Renderer Front-End
-endef
-
-define UPMPDCLI_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/S99upmpdcli
-endef
-
 define UPMPDCLI_INSTALL_CONF_FILE
 	$(INSTALL) -D -m 0755 $(@D)/src/upmpdcli.conf $(TARGET_DIR)/etc/upmpdcli.conf
 endef
diff --git a/package/upmpdcli/upmpdcli.run b/package/upmpdcli/upmpdcli.run
new file mode 100644
index 0000000..54bd8ec
--- /dev/null
+++ b/package/upmpdcli/upmpdcli.run
@@ -0,0 +1 @@
+exec /usr/bin/upmpdcli
diff --git a/package/upmpdcli/upmpdcli.users b/package/upmpdcli/upmpdcli.users
new file mode 100644
index 0000000..c0adbd8
--- /dev/null
+++ b/package/upmpdcli/upmpdcli.users
@@ -0,0 +1 @@
+upmpdcli -1 upmpdcli -1 * - - - Upmpdcli MPD UPnP Renderer Front-End
-- 
2.0.3

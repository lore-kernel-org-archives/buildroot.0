From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 6 Apr 2015 01:02:09 +0300
Subject: [Buildroot] [RFC v2 2/6] squid: common service startup
In-Reply-To: <cover.1428263859.git.alex.suykov@gmail.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
Message-ID: <6963d8ed535a99f2f142bbe5abfb8eb891eeef8a.1428263859.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A typical simple daemon.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/squid/S97squid  | 40 ----------------------------------------
 package/squid/squid.mk  |  5 +----
 package/squid/squid.run |  3 +++
 3 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100755 package/squid/S97squid
 create mode 100644 package/squid/squid.run

diff --git a/package/squid/S97squid b/package/squid/S97squid
deleted file mode 100755
index b30af5b..0000000
--- a/package/squid/S97squid
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-
-[ -x /usr/sbin/squid ] || exit 0
-[ -f /etc/squid.conf ] || exit 0
-
-case "$1" in
-  start)
-    echo -n "Starting squid: "
-    if [ ! -d /var/log/squid ]; then
-      mkdir -p /var/log/squid
-      chown squid:squid /var/log/squid
-    fi
-    start-stop-daemon -S -x /usr/sbin/squid
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-
-   stop)
-    echo -n "Stopping squid: "
-    /usr/sbin/squid -k shutdown
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-
-  reload)
-    echo -n "Reloading squid configuration: "
-    /usr/sbin/squid -k reconfigure
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-
-  restart)
-    echo -n "Restarting squid: "
-    /usr/sbin/squid -k restart
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-
-  *)
-    echo "Usage: $0 {start|stop|reload|restart}"
-    exit 1
-esac
-
-exit 0
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index f4d6ae3..52209bd 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -76,9 +76,6 @@ define SQUID_USERS
 	squid -1 squid -1 * - - - Squid proxy cache
 endef
 
-define SQUID_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/squid/S97squid \
-		$(TARGET_DIR)/etc/init.d/S97squid
-endef
+SQUID_INIT_RUN = squid.run
 
 $(eval $(autotools-package))
diff --git a/package/squid/squid.run b/package/squid/squid.run
new file mode 100644
index 0000000..12c2a52
--- /dev/null
+++ b/package/squid/squid.run
@@ -0,0 +1,3 @@
+description: Squid proxy server
+prestart: mkdir -p /var/log/squid
+foreground: /usr/sbin/squid -N
-- 
2.0.3

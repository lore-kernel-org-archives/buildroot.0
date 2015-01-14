From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 16:14:44 -0300
Subject: [Buildroot] [PATCH 2/2] squid: add sysv initscript
In-Reply-To: <1421262884-5512-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421262884-5512-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421262884-5512-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add SysV-style initscript, complete rewrite from
http://patchwork.ozlabs.org/patch/412057/

'stop' is handled by squid itself to gracefully (as possible) close
every pending connection and commit changes to disk. By default this is
configured for 30 seconds and can be configured via shutdown_lifetime in
/etc/squid.conf if someone is too anxious.
The script won't block until squid is properly shutdown - but people
should _REALLY_ use restart or reload if that's what they want, instead
of stop+start.

'restart' is handled by squid itself, since if we do a stop/start cycle
we must wait for a clean shutdown cycle (takes time).

'reload' is also handled by squid itself and it's not the same as
restart, it will just trigger a configuration reload without purging
runtime cache (RAM) contents.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/S97squid | 40 ++++++++++++++++++++++++++++++++++++++++
 package/squid/squid.mk |  5 +++++
 2 files changed, 45 insertions(+)
 create mode 100755 package/squid/S97squid

diff --git a/package/squid/S97squid b/package/squid/S97squid
new file mode 100755
index 0000000..b30af5b
--- /dev/null
+++ b/package/squid/S97squid
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+[ -x /usr/sbin/squid ] || exit 0
+[ -f /etc/squid.conf ] || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting squid: "
+    if [ ! -d /var/log/squid ]; then
+      mkdir -p /var/log/squid
+      chown squid:squid /var/log/squid
+    fi
+    start-stop-daemon -S -x /usr/sbin/squid
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+
+   stop)
+    echo -n "Stopping squid: "
+    /usr/sbin/squid -k shutdown
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+
+  reload)
+    echo -n "Reloading squid configuration: "
+    /usr/sbin/squid -k reconfigure
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+
+  restart)
+    echo -n "Restarting squid: "
+    /usr/sbin/squid -k restart
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+
+  *)
+    echo "Usage: $0 {start|stop|reload|restart}"
+    exit 1
+esac
+
+exit 0
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 5e2e659..0bf516f 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -65,4 +65,9 @@ define SQUID_USERS
 	squid -1 squid -1 * - - - Squid proxy cache
 endef
 
+define SQUID_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/squid/S97squid \
+		$(TARGET_DIR)/etc/init.d/S97squid
+endef
+
 $(eval $(autotools-package))
-- 
2.0.5

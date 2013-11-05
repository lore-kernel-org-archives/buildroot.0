From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  6 Nov 2013 00:28:17 +0100
Subject: [Buildroot] [PATCH 2/5] package/ser2net: add startup script and
	template config file
In-Reply-To: <cover.1383693880.git.yann.morin.1998@free.fr>
References: <cover.1383693880.git.yann.morin.1998@free.fr>
Message-ID: <c6a85755fde5fe01c692d627c05eaa83544dbccf.1383693880.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The default config file we install is intentionally limited, but given
the number of possible configurations (port number, method, serial
port...) it is not posible to provide a simple one-fits-all config file.

Instead, just provide a minimalistic one, that the user may customise
with a post-build script, or a rootfs overlay.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ser2net/S50ser2net   | 48 ++++++++++++++++++++++++++++++++++++++++++++
 package/ser2net/ser2net.conf |  3 +++
 package/ser2net/ser2net.mk   |  9 +++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 package/ser2net/S50ser2net
 create mode 100644 package/ser2net/ser2net.conf

diff --git a/package/ser2net/S50ser2net b/package/ser2net/S50ser2net
new file mode 100644
index 0000000..58a98fc
--- /dev/null
+++ b/package/ser2net/S50ser2net
@@ -0,0 +1,48 @@
+#! /bin/sh
+# ser2net startup script
+
+# Author: Yann E. MORIN <yann.morin.1998@free.fr>
+
+PATH=/usr/sbin:/usr/bin:/sbin:/bin
+NAME=ser2net
+DAEMON=/usr/bin/$NAME
+PIDFILE=/var/run/$NAME.pid
+
+[ -f "${DAEMON}" -a -x "${DAEMON}" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r "/etc/default/${NAME}" ] && . "/etc/default/${NAME}"
+
+ARGS="-c /etc/ser2net.conf -P ${PIDFILE}"
+[ -z "${CONTROLPORT}" ] || ARGS="${ARGS} -p ${CONTROLPORT}"
+
+case "$1" in
+    start)
+        printf "Starting ser2net daemon: "
+        if start-stop-daemon -S -q -p ${PIDFILE} -m --exec "${DAEMON}" -- ${ARGS}; then
+            printf "OK\n"
+        else
+            printf "failed\n"
+        fi
+        ;;
+    stop)
+        printf "Stoping ser2net daemon: "
+        start-stop-daemon -K -q -p ${PIDFILE} -s TERM
+        sleep 2
+        if start-stop-daemon -K -q -p ${PIDFILE} -t; then
+            printf "failed, killing: "
+            start-stop-daemon -K -q -p ${PIDFILE} -s KILL -o
+        fi
+        rm -f "${PIDFILE}"
+        printf "OK\n"
+        ;;
+    restart|force-reload)
+        "${0}" stop
+        sleep 2
+        "${0}" start
+        ;;
+    *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
diff --git a/package/ser2net/ser2net.conf b/package/ser2net/ser2net.conf
new file mode 100644
index 0000000..ba6fd43
--- /dev/null
+++ b/package/ser2net/ser2net.conf
@@ -0,0 +1,3 @@
+#CONTROLPORT:1000
+BANNER:buildroot:Welcome to ser2net, running on Buildroot\r\n
+2000:raw:600:/dev/ttyS1:9600 8DATABITS NONE 1STOPBIT buildroot
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 5e77d36..a6f1cbb 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -9,4 +9,13 @@ SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
+define SER2NET_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/ser2net/S50ser2net $(TARGET_DIR)/etc/init.d/S50ser2net
+endef
+
+define SER2NET_INSTALL_CONF
+	$(INSTALL) -m 0644 -D package/ser2net/ser2net.conf $(TARGET_DIR)/etc/ser2net.conf
+endef
+SER2NET_POST_INSTALL_TARGET_HOOKS += SER2NET_INSTALL_CONF
+
 $(eval $(autotools-package))
-- 
1.8.1.2

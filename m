From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:54:00 +0100
Subject: [Buildroot] [PATCH 08/17] busybox: move udhcp script from skeleton
	to package
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-9-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 fs/skeleton/usr/share/udhcpc/default.script |   39 ---------------------------
 package/busybox/busybox.mk                  |    2 +-
 package/busybox/udhcpc.script               |   39 +++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 40 deletions(-)
 delete mode 100755 fs/skeleton/usr/share/udhcpc/default.script
 create mode 100755 package/busybox/udhcpc.script

diff --git a/fs/skeleton/usr/share/udhcpc/default.script b/fs/skeleton/usr/share/udhcpc/default.script
deleted file mode 100755
index a52a7f8..0000000
--- a/fs/skeleton/usr/share/udhcpc/default.script
+++ /dev/null
@@ -1,39 +0,0 @@
-#!/bin/sh
-
-# udhcpc script edited by Tim Riker <Tim@Rikers.org>
-
-[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
-
-RESOLV_CONF="/etc/resolv.conf"
-[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
-[ -n "$subnet" ] && NETMASK="netmask $subnet"
-
-case "$1" in
-	deconfig)
-		/sbin/ifconfig $interface 0.0.0.0
-		;;
-
-	renew|bound)
-		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
-
-		if [ -n "$router" ] ; then
-			echo "deleting routers"
-			while route del default gw 0.0.0.0 dev $interface ; do
-				:
-			done
-
-			for i in $router ; do
-				route add default gw $i dev $interface
-			done
-		fi
-
-		echo -n > $RESOLV_CONF
-		[ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
-		for i in $dns ; do
-			echo adding dns $i
-			echo nameserver $i >> $RESOLV_CONF
-		done
-		;;
-esac
-
-exit 0
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b7f4740..da391ba 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -141,7 +141,7 @@ endif
 
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_BINARY)
-	-chmod a+rx $(TARGET_DIR)/usr/share/udhcpc/default.script
+	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script $(TARGET_DIR)/usr/share/udhcpc/default.script
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
new file mode 100755
index 0000000..a52a7f8
--- /dev/null
+++ b/package/busybox/udhcpc.script
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+# udhcpc script edited by Tim Riker <Tim@Rikers.org>
+
+[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
+
+RESOLV_CONF="/etc/resolv.conf"
+[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
+[ -n "$subnet" ] && NETMASK="netmask $subnet"
+
+case "$1" in
+	deconfig)
+		/sbin/ifconfig $interface 0.0.0.0
+		;;
+
+	renew|bound)
+		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
+
+		if [ -n "$router" ] ; then
+			echo "deleting routers"
+			while route del default gw 0.0.0.0 dev $interface ; do
+				:
+			done
+
+			for i in $router ; do
+				route add default gw $i dev $interface
+			done
+		fi
+
+		echo -n > $RESOLV_CONF
+		[ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
+		for i in $dns ; do
+			echo adding dns $i
+			echo nameserver $i >> $RESOLV_CONF
+		done
+		;;
+esac
+
+exit 0
-- 
1.7.2.3

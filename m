From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jun 2013 14:22:13 +0200
Subject: [Buildroot] [git commit] busybox: use a single udhcpc script,
	with or without avahi-autoipd
Message-ID: <20130626132359.DC0379B088@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c229f70ea270069e981bfb59e3aea80b21bbcfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're currently using two different udhcpc scripts, one in the busybox
package and another in the avahi one, which calls avahi-autoipd on
dhcp failures.

The avahi one actually only does something differently from the default
if avahi-autoipd is available, so let's just always use this one instead
of the complicated logic about writing the file if not present /
overwriting it afterwards.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk                      |    2 -
 package/avahi/busybox-udhcpc-default.script |   58 ---------------------------
 package/busybox/udhcpc.script               |   21 +++++++++-
 3 files changed, 20 insertions(+), 61 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 89dfc33..028f3ae 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -147,8 +147,6 @@ endef
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_REMOVE_INITSCRIPT
 
 define AVAHI_INSTALL_AUTOIPD
-	rm -rf $(TARGET_DIR)/etc/dhcp3/
-	$(INSTALL) -D -m 0755 package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
 	$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/lib
diff --git a/package/avahi/busybox-udhcpc-default.script b/package/avahi/busybox-udhcpc-default.script
deleted file mode 100755
index 0bb3dea..0000000
--- a/package/avahi/busybox-udhcpc-default.script
+++ /dev/null
@@ -1,58 +0,0 @@
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
-		grep -q -v ip= /proc/cmdline
-		if [ $? -eq 0 ]; then
-			/sbin/ifconfig $interface up
-		fi
-		grep -q -v nfsroot= /proc/cmdline
-		if [ $? -eq 0 ]; then
-			/sbin/ifconfig $interface 0.0.0.0
-		fi
-		if [ -x /usr/sbin/avahi-autoipd ]; then
-			/usr/sbin/avahi-autoipd -k $interface
-		fi
-		;;
-
-	leasefail|nak)
-		if [ -x /usr/sbin/avahi-autoipd ]; then
-			/usr/sbin/avahi-autoipd -wD $interface --no-chroot
-		fi
-		;;
-
-	renew|bound)
-		if [ -x /usr/sbin/avahi-autoipd ]; then
-			/usr/sbin/avahi-autoipd -k $interface
-		fi
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
diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index a52a7f8..0bb3dea 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -10,10 +10,29 @@ RESOLV_CONF="/etc/resolv.conf"
 
 case "$1" in
 	deconfig)
-		/sbin/ifconfig $interface 0.0.0.0
+		grep -q -v ip= /proc/cmdline
+		if [ $? -eq 0 ]; then
+			/sbin/ifconfig $interface up
+		fi
+		grep -q -v nfsroot= /proc/cmdline
+		if [ $? -eq 0 ]; then
+			/sbin/ifconfig $interface 0.0.0.0
+		fi
+		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -k $interface
+		fi
+		;;
+
+	leasefail|nak)
+		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -wD $interface --no-chroot
+		fi
 		;;
 
 	renew|bound)
+		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -k $interface
+		fi
 		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
 
 		if [ -n "$router" ] ; then

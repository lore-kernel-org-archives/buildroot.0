From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:24:06 -0500 (EST)
Subject: [Buildroot] [PATCH] Include a default udhcpc script with
 BR2_PACKAGE_BUSYBOX_SKELETON
Message-ID: <alpine.LFD.2.00.0812031423150.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


When this option is turned on, the selected skeleton does not include
the udhcpc script which is good for a nice moment of confusion.
Here's the remedy.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: target/generic/target_busybox_skeleton/usr/share/udhcpc/default.script
===================================================================
--- target/generic/target_busybox_skeleton/usr/share/udhcpc/default.script	(revision 0)
+++ target/generic/target_busybox_skeleton/usr/share/udhcpc/default.script	(revision 0)
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

Property changes on: target/generic/target_busybox_skeleton/usr/share/udhcpc/default.script
___________________________________________________________________
Name: svn:executable
   + *

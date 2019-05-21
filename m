From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Tue, 21 May 2019 12:54:28 +1000
Subject: [Buildroot] [PATCH v5 2/2] busybox: wait for ipv6 default route in
 udhcpc6
In-Reply-To: <20190521025428.9409-1-sam@mendozajonas.com>
References: <20190521025428.9409-1-sam@mendozajonas.com>
Message-ID: <20190521025428.9409-2-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udhcpc6 implements "stateful" DHCPv6 for explicitly requesting an address
and other configuration information. A major difference between DHCPv4
and DHCPv6 is that DHCPv6 does *not* advertise a default route; this is
determined by normal IPv6 autoconfiguration.
Included is a change from Rob, which if handling a DHCPv6 address waits
a moment for the IPv6 route to be configured; as above this doesn't come
from DHCPv6 but rather the IPv6 Router Advertisement (RA) which happens
independently from udhcpc6. The intent here is to try and ensure that
the interface is route-able upon the script's completion as it would be
if called from udhcpc.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
v5: Split into two patches, modify the wait_for_ipv6_default_route loop
to resemble the loop in package/ifupdown-scripts/network/if-pre-up.d/wait_iface
v4: Expand description of stateful DHCPv6 in commit message
v3: Point out 'stateful' DHCPv6 in commit, send to the correct list...
v2: Avoid bashisms

 package/busybox/udhcpc.script | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 90cc6b62ba..69e0be68a1 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -11,6 +11,23 @@ RESOLV_CONF="/etc/resolv.conf"
 # Busybox's udhcpc only supports stateful DHCPv6 for now
 [ -n "$ipv6" ] && ip="$ipv6/128"
 
+if [ -z "${IF_WAIT_DELAY}" ]; then
+	IF_WAIT_DELAY=10
+fi
+wait_for_ipv6_default_route() {
+	printf "Waiting for IPv6 default route to appear"
+	while [ $IF_WAIT_DELAY -gt 0 ]; do
+		if [ -z "$(ip -6 route list | grep default)" ]; then
+			printf "\n"
+			return
+		fi
+		sleep 1
+		printf "."
+		: $((IF_WAIT_DELAY -= 1))
+	done
+	printf " timeout!\n"
+}
+
 case "$1" in
 	deconfig)
 		/sbin/ifconfig $interface up
@@ -39,6 +56,9 @@ case "$1" in
 			/usr/sbin/avahi-autoipd -k $interface
 		fi
 		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
+		if [ -n "$ipv6" ] ; then
+			wait_for_ipv6_default_route
+		fi
 
 		if [ -n "$router" ] ; then
 			echo "deleting routers"
-- 
2.21.0

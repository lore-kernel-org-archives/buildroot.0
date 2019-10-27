From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 20:24:33 +0100
Subject: [Buildroot] [git commit] package/busybox: udhcpc.script: wait for
 ipv6 default route from RA for stateful DHCPv6
Message-ID: <20191027191758.454678A523@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d458a2d7c7f3418242aae52464306ef9f4a407f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udhcpc6 implements "stateful" DHCPv6 for explicitly requesting an address
and other configuration information. A major difference between DHCPv4
and DHCPv6 is that DHCPv6 does *not* advertise a default route; this is
determined by normal IPv6 autoconfiguration.

Add logic to wait up to IF_WAIT_DELAY seconds for the IPv6 route to be
configured; as above this doesn't come from DHCPv6 but rather the IPv6
Router Advertisement (RA) which happens independently from udhcpc6.  The
intent here is to try and ensure that the interface is route-able upon the
script's completion as it would be if called from udhcpc.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index c2804a3b5a..711963f974 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -11,6 +11,24 @@ RESOLV_CONF="/etc/resolv.conf"
 # Handle stateful DHCPv6 like DHCPv4
 [ -n "$ipv6" ] && ip="$ipv6/128"
 
+if [ -z "${IF_WAIT_DELAY}" ]; then
+	IF_WAIT_DELAY=10
+fi
+
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
@@ -39,6 +57,9 @@ case "$1" in
 			/usr/sbin/avahi-autoipd -k $interface
 		fi
 		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
+		if [ -n "$ipv6" ] ; then
+			wait_for_ipv6_default_route
+		fi
 
 		if [ -n "$router" ] ; then
 			echo "deleting routers"

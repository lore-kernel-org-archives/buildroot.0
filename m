From: Matt Weber <matt@thewebers.ws>
Date: Wed, 29 Apr 2015 20:41:58 -0500
Subject: [Buildroot] [PATCH 1/1] busybox: udhcpc create leases file
Message-ID: <1430358118-5304-1-git-send-email-matt@thewebers.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matt@thewebers.ws>
---
 package/busybox/udhcpc.script | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 50c52e6..d5d81bf 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -61,6 +61,29 @@ case "$1" in
 			echo adding dns $i
 			echo "nameserver $i # $interface" >> $RESOLV_CONF
 		done
+
+		# Based on http://sourceforge.net/p/kboot/mailman/message/1168535/
+		{
+		    echo "lease {"
+		    echo "  interface \"$interface\";"
+		    echo "  fixed-address $ip;"
+		    [ -n "$boot_file" ] && echo "  filename \"$boot_file\";"
+		    [ -n "$subnet" ] && echo "  option subnet-mask $subnet;"
+		    [ -n "$router" ] && echo "  option routers $router;"
+		    echo "  option dhcp-lease-time $lease;"
+		    echo "  option dhcp-message-type $dhcptype;"
+		    [ -n "$dns" ] && echo "  option domain-name-servers $dns;"
+		    echo "  option dhcp-server-identifier ${siaddr:-$serverid};"
+		    [ -n "$domain" ] && echo "  option domain-name \"$domain\";"
+		    d=$(expr "$(date "+%Y.%m.%d-%H:%M:%S")" : "\(.*\):")
+		    t=$(date -d "$d:$(expr $lease / 2)" "+%w %Y/%m/%d %H:%M:%S" 2>/dev/null)
+		    [ -n "$t" ] && echo "  renew $t;"
+		    t=$(date -d "$d:$(expr 7 '*' $lease / 8)" "+%w %Y/%m/%d %H:%M:%S" 2>/dev/null)
+		    [ -n "$t" ] && echo "  rebind $t;"
+		    t=$(date -d "$d:$lease" "+%w %Y/%m/%d %H:%M:%S" 2>/dev/null)
+		    [ -n "$t" ] && echo "  expire $t;"
+		    echo "}"
+		} >> /var/lib/misc/udhcpc-$interface.leases
 		;;
 esac

--
1.9.1

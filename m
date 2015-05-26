From: Matt Weber <matt@thewebers.ws>
Date: Mon, 25 May 2015 22:10:57 -0500
Subject: [Buildroot] [PATCH v2] busybox: udhcpc create leases file
Message-ID: <1432609857-26391-1-git-send-email-matt@thewebers.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Capture the lease information for use by applications
after a lease is aquired.

Signed-off-by: Matt Weber <matthew.l.weber@gmail.com>
---

Changes v1 -> v2
 - Changed from appending to keeping just the last lease
 - Adjusted format to pure shell variables instead of
   dhclient format.
 - Moved location to /var/run instead of /var/lib/misc
---
 package/busybox/udhcpc.script | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 50c52e6..e913111 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -61,6 +61,27 @@ case "$1" in
 			echo adding dns $i
 			echo "nameserver $i # $interface" >> $RESOLV_CONF
 		done
+
+		# Record last lease
+		{
+		    echo "IFACE=$interface"
+		    echo "IP=$ip"
+		    [ -n "$subnet" ]    && echo "MASK=$subnet"
+		    [ -n "$router" ]    && echo "ROUTER=$router"
+		    [ -n "$dns" ]       && echo "DNS=\"$dns\""
+		    [ -n "$domain" ]    && echo "DOMAIN=$domain"
+		    [ -n "$boot_file" ] && echo "BOOT_FILE=$boot_file"
+		    echo "DHCP_LEASE_TIME=$lease"
+		    echo "DHCP_MSG_TYPE=$dhcptype"
+		    echo "DHCP_SERVER_ID=${siaddr:-$serverid}"
+		    d=$(expr "$(date "+%Y.%m.%d-%H:%M:%S")" : "\(.*\):")
+		    t=$(date -d "$d:$(expr $lease / 2)" "+%w %Y/%m/%d %H:%M:%S" 2>/dev/null)
+		    [ -n "$t" ] && echo "DHCP_RENEW=\"$t\""
+		    t=$(date -d "$d:$(expr 7 '*' $lease / 8)" "+%w %Y/%m/%d %H:%M:%S" 2>/dev/null)
+		    [ -n "$t" ] && echo "DHCP_REBIND=\"$t\""
+		    t=$(date -d "$d:$lease" "+%w %Y/%m/%d %H:%M:%S" 2>/dev/null)
+		    [ -n "$t" ] && echo "DHCP_EXPIRE=\"$t\""
+		} > /var/run/udhcpc.$interface.leases
 		;;
 esac
 
-- 
1.9.1

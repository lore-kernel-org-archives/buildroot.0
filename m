From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue, 13 Oct 2015 11:35:23 +0200
Subject: [Buildroot] [PATCH v2 2/8] package/dhcp/S80dhcp-server: support
	extra options
In-Reply-To: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
References: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
Message-ID: <1444728929-46246-2-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an OPTIONS configuration variable in order to make it possible to
pass custom extra options to dhcpd.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

---
Changes v1 -> v2:
 - Rebase.
---
 package/dhcp/S80dhcp-server | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index f7907e2..c1ef53b 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -7,6 +7,9 @@
 #       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
 INTERFACES=""
 
+# Additional options that are passed to the DHCP server daemon?
+OPTIONS=""
+
 # Read configuration variable file if it is present
 CFG_FILE="/etc/default/dhcpd"
 [ -r "${CFG_FILE}" ] && . "${CFG_FILE}"
@@ -21,7 +24,7 @@ case "$1" in
 		printf "Starting DHCP server: "
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
 		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases
-		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $INTERFACES
+		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $OPTIONS $INTERFACES
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
-- 
2.1.4

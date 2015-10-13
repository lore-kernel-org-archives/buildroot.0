From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue, 13 Oct 2015 11:35:28 +0200
Subject: [Buildroot] [PATCH v2 7/8] package/dhcp/S80dhcp-server: support
	IPv6 lease file
In-Reply-To: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
References: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
Message-ID: <1444728929-46246-7-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The IPv6 lease file has a different name.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

---
Changes v1 -> v2:
 - Rebase.
---
 package/dhcp/S80dhcp-server | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 1c2ff74..b6f76ee 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -25,7 +25,10 @@ case "$1" in
 	start)
 		printf "Starting DHCP server: "
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
-		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases
+		for lease_file in /var/lib/dhcp/dhcpd.leases \
+					/var/lib/dhcp/dhcpd6.leases; do
+			test -f "${lease_file}" || touch "${lease_file}"
+		done
 		start-stop-daemon -S -q -x /usr/sbin/dhcpd -- -q $OPTIONS $INTERFACES
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
-- 
2.1.4

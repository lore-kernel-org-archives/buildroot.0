From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 14:54:01 +0100
Subject: [Buildroot] [git commit] dhcp: misc improvements to S80dhcp-server
Message-ID: <20151224135818.8FF1A82700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a118f32e9a72994d46818b8a3374f7905967c52d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit does misc improvements to the S80dhcp-server init script:

 - Use more variables: NAME, DAEMON, CFG_FILE

 - Read the configuration file in /etc/default/ in a more usual way
   (as done in S21rngd for example)

 - Remove leftover dhcpd3 string in the stopping action.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/S80dhcp-server | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 06b7ab1..f52ca98 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -7,8 +7,12 @@
 #       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
 INTERFACES=""
 
-# Allow a few customizations from a config file
-test -r /etc/default/dhcpd && . /etc/default/dhcpd
+NAME="dhcpd"
+DAEMON="/usr/sbin/${NAME}"
+CFG_FILE="/etc/default/${NAME}"
+
+# Read configuration variable file if it is present
+[ -r "${CFG_FILE}" ] && . "${CFG_FILE}"
 
 # Sanity checks
 test -f /usr/sbin/dhcpd || exit 0
@@ -20,12 +24,12 @@ case "$1" in
 		printf "Starting DHCP server: "
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
 		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases
-		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $INTERFACES
+		start-stop-daemon -S -x ${DAEMON} -- -q $INTERFACES
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
-		printf "Stopping DHCP server: dhcpd3"
-		start-stop-daemon -K -x /usr/sbin/dhcpd
+		printf "Stopping DHCP server: "
+		start-stop-daemon -K -x ${DAEMON}
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart | force-reload)

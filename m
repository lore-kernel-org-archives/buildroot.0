From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:02:25 +0100
Subject: [Buildroot] [git commit] package/dhcp/S80dhcp-server: allow empty
	INTERFACES
Message-ID: <20151224140230.78649826C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12590c7d21925093a701b323261afc50a7961438
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dhcpd daemon does not require network interface names to be
specified on the command line.

From dhcpd(8):
"The names of the network interfaces on which dhcpd should listen for
broadcasts may be specified on the command line.  This should be done
on systems where dhcpd is unable to identify non-broadcast interfaces,
but should not be required on other systems.  If no interface names
are specified on the command line dhcpd will identify all network
interfaces which are up, eliminating non-broadcast interfaces if
possible, and listen for DHCP broadcasts on each interface."

dhcpd exits with "Not configured to listen on any interfaces!" only if
no requested (those in INTERFACES, or all if empty) non-broadcast
interfaces matching the subnet declarations in dhcpd.conf are up.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/S80dhcp-server | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 2538d42..9d59636 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -20,7 +20,6 @@ CFG_FILE="/etc/default/${NAME}"
 # Sanity checks
 test -f /usr/sbin/dhcpd || exit 0
 test -f /etc/dhcp/dhcpd.conf || exit 0
-test -n "$INTERFACES" || exit 0
 
 case "$1" in
 	start)

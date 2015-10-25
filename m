From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 25 Oct 2015 02:59:31 +0200
Subject: [Buildroot] [PATCH v3 05/13] package/dhcp/S80dhcp-server: allow
	empty INTERFACES
In-Reply-To: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <1445734779-7212-5-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Beno?t Th?baudeau <benoit@wsystem.com>

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

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

---
Changes v2 -> v3: none.

Changes v1 -> v2:
 - Rebase.
---
 package/dhcp/S80dhcp-server | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index c1ef53b..079727b 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -17,7 +17,6 @@ CFG_FILE="/etc/default/dhcpd"
 # Sanity checks
 test -f /usr/sbin/dhcpd || exit 0
 test -f /etc/dhcp/dhcpd.conf || exit 0
-test -n "$INTERFACES" || exit 0
 
 case "$1" in
 	start)
-- 
2.1.4

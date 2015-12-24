From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 14:57:17 +0100
Subject: [Buildroot] [git commit] package/dhcp: make S80dhcp-relay read a
	file from /etc/default/
Message-ID: <20151224135818.86FB7826F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0bc15867dad61c24769d635c31c8263695ed92c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The S80dhcp-relay init script has configuration variables like
INTERFACES whose contents have to be passed to the daemon. These
variables are initialized as empty strings, but some of them are not
allowed to be empty and there was no means of filling them apart from
creating a root FS overlay to overwrite these scripts.

This commit adds support for reading dhcrelay under /etc/default/ to
set these configuration variables.

[Thomas: adapt to patch only S80dhcp-relay, since S80dhcp-server has
already been changed by previous commits.]

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/S80dhcp-relay | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dhcp/S80dhcp-relay b/package/dhcp/S80dhcp-relay
index 5ee06c7..0f383e6 100755
--- a/package/dhcp/S80dhcp-relay
+++ b/package/dhcp/S80dhcp-relay
@@ -13,6 +13,10 @@ INTERFACES=""
 # Additional options that are passed to the DHCP relay daemon?
 OPTIONS=""
 
+# Read configuration variable file if it is present
+CFG_FILE="/etc/default/dhcrelay"
+[ -r "${CFG_FILE}" ] && . "${CFG_FILE}"
+
 # Sanity checks
 test -f /usr/sbin/dhcrelay || exit 0
 test -n "$INTERFACES" || exit 0

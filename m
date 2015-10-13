From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue, 13 Oct 2015 11:35:22 +0200
Subject: [Buildroot] [PATCH v2 1/8] package/dhcp: fix SysV init scripts
	option passing
Message-ID: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SysV init scripts have configuration variables like INTERFACES whose
contents have to be passed to the daemon. These variables are
initialized as empty strings, but some of them are not allowed to be
empty and there was no means of filling them apart from creating a root
FS overlay to overwrite these scripts.

This commit adds support for files under /etc/default/ to set these
configuration variables. Such light files can now be added to the root
FS skeleton or overlays without having to duplicate most of the SysV
init scripts.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

---
Changes v1 -> v2:
 - Rebase.
---
 package/dhcp/S80dhcp-relay  | 4 ++++
 package/dhcp/S80dhcp-server | 4 ++++
 2 files changed, 8 insertions(+)

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
diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 3df14ff..f7907e2 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -7,6 +7,10 @@
 #       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
 INTERFACES=""
 
+# Read configuration variable file if it is present
+CFG_FILE="/etc/default/dhcpd"
+[ -r "${CFG_FILE}" ] && . "${CFG_FILE}"
+
 # Sanity checks
 test -f /usr/sbin/dhcpd || exit 0
 test -f /etc/dhcp/dhcpd.conf || exit 0
-- 
2.1.4

From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon,  4 Aug 2014 20:19:03 +0200
Subject: [Buildroot] [PATCH 1/2] dhcp: Fix config files paths
Message-ID: <1407176344-13291-1-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The built dhcp binaries and the installed startup scripts used configuration
files under /etc/, but the configuration files were installed under /etc/dhcp/.
Fix everything to have configuration files under /etc/dhcp/.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 package/dhcp/S80dhcp-server | 2 +-
 package/dhcp/dhcp.mk        | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 98bd3cc..5280c31 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -9,7 +9,7 @@ INTERFACES=""
 
 # Sanity checks
 test -f /usr/sbin/dhcpd || exit 0
-test -f /etc/dhcpd.conf || exit 0
+test -f /etc/dhcp/dhcpd.conf || exit 0
 test -n "$INTERFACES" || exit 0
 
 case "$1" in
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 1044f89..32dbea0 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,7 +9,10 @@ DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
-DHCP_CONF_ENV = ac_cv_file__dev_random=yes
+DHCP_CONF_ENV = \
+	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
+		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
+	ac_cv_file__dev_random=yes
 DHCP_CONF_OPT = \
 	--localstatedir=/var/lib/dhcp \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
-- 
1.9.1

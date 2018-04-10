From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:24:33 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] dhcp: disable isc
 assertions (reproducible builds)
Message-ID: <20180410205255.2BCD388398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec1617d6e595d3e8caaa33f4ebe5abbf430ab587
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The isc assertions from the bundled bind dns library are
using the __FILE__ macro for debug messages (see
dhcp-4.3.5/bind/bind-9.9.9-P3/lib/isc/include/isc/assertions.h).

Disabling the assertions gains:

- reproducible builds (no build time paths in the executable)
- space saving on the target:
  dhcpd: 1.9M -> 1.6M
  dhcrelay: 1.6M -> 1.3M

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3d1a7a86205a31625a8d5e8666ae7eb357e0de75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 4e1b24b700..a1285184d3 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -11,7 +11,9 @@ DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
-		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"'
+		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
+	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
+
 DHCP_CONF_OPTS = \
 	--with-randomdev=/dev/random \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \

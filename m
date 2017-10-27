From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 21:24:24 +0200
Subject: [Buildroot] [PATCH v1 2/2] dhcp: disable isc assertions
	(reproducible builds)
In-Reply-To: <20171027192424.19760-1-ps.report@gmx.net>
References: <20171027192424.19760-1-ps.report@gmx.net>
Message-ID: <20171027192424.19760-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The isc assertions from the bundled bind dns library are
using the __FILE__ macro for debug messages (see
dhcp-4.3.5/bind/bind-9.9.9-P3/lib/isc/include/isc/assertions.h).

Disabling the assertions gains:

- reproducible builds (no built time pathes in the executable)
- space saving on the target:
  dhcpd: 1.9M -> 1.6M
  dhcrelay: 1.6M -> 1.3M

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dhcp/dhcp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 45cae087aa..0bae61283a 100644
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
-- 
2.14.2

From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 27 Jun 2018 04:19:41 +0900
Subject: [Buildroot] [PATCH v2] package/dhcp: copy dhcpctl and omapi
 libraries and headers into staging
Message-ID: <20180626191941.7941-1-daniel@0x0f.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These libraries/headers are used to control dhclient/dhcpd via omapi
(https://www.isc.org/wp-content/uploads/2017/08/dhcp41omapi.html) from
another applications and thus a potentially useful in situations where
you need to interact with dhclient/dhcpd and need something more reliable
than parsing their output.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 package/dhcp/dhcp.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index a1285184d3..dac7235f08 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -118,4 +118,25 @@ define DHCP_INSTALL_TARGET_CMDS
 	$(DHCP_INSTALL_CLIENT)
 endef
 
+define DHCP_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/dhcpctl/dhcpctl.h \
+		$(HOST_DIR)/usr/include/dhcpctl/dhcpctl.h
+	$(INSTALL) -D -m 644 $(@D)/includes/isc-dhcp/dst.h \
+		$(HOST_DIR)/usr/include/isc-dhcp/dst.h
+	$(INSTALL) -D -m 644 -t $(HOST_DIR)/usr/include/omapip/ \
+		$(@D)/includes/omapip/alloc.h \
+		$(@D)/includes/omapip/buffer.h \
+		$(@D)/includes/omapip/convert.h \
+		$(@D)/includes/omapip/hash.h \
+		$(@D)/includes/omapip/isclib.h \
+		$(@D)/includes/omapip/omapip.h \
+		$(@D)/includes/omapip/omapip_p.h \
+		$(@D)/includes/omapip/result.h \
+		$(@D)/includes/omapip/trace.h
+	$(INSTALL) -D -m 644 $(@D)/dhcpctl/libdhcpctl.a \
+		$(HOST_DIR)/usr/lib/libdhcpctl.a
+	$(INSTALL) -D -m 644 $(@D)/omapip/libomapi.a \
+		$(HOST_DIR)/usr/lib/libomapi.a
+endef
+
 $(eval $(autotools-package))
-- 
2.18.0

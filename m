From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Oct 2019 14:24:10 -0700
Subject: [Buildroot] [PATCH 1/5] package/openvpn: add systemd support
Message-ID: <20191028212414.123964-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If the systemd package is selected, add the package to the
dependency list and explicitly set --enable-systemd.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openvpn/openvpn.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 4c6956fe12..75dde04493 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -38,6 +38,13 @@ else
 OPENVPN_CONF_OPTS += --disable-lzo
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+OPENVPN_DEPENDENCIES += systemd
+OPENVPN_CONF_OPTS += --enable-systemd
+else
+OPENVPN_CONF_OPTS += --disable-systemd
+endif
+
 define OPENVPN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
-- 
2.21.0

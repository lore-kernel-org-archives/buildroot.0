From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Jun 2014 07:39:39 -0300
Subject: [Buildroot] [PATCH] dhcp: bump to version 4.1-ESV-R9
Message-ID: <1402483179-17307-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also install the SysV initscripts from the proper hook.
Since the scripts check for the proper files to be present there's no
need to exclude them according to options since they won't try to start
anything.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/dhcp.mk | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 3885bba..1044f89 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.1-ESV-R8
+DHCP_VERSION = 4.1-ESV-R9
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
@@ -31,8 +31,6 @@ define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
-	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server \
-		$(TARGET_DIR)/etc/init.d/S80dhcp-server
 	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
 		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
 endef
@@ -44,8 +42,6 @@ define DHCP_INSTALL_RELAY
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
 		$(TARGET_DIR)/usr/sbin/dhcrelay
-	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay \
-		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
 endef
 endif
 
@@ -62,6 +58,14 @@ define DHCP_INSTALL_CLIENT
 endef
 endif
 
+# Options don't matter, scripts won't start if binaries aren't there
+define DHCP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server \
+		$(TARGET_DIR)/etc/init.d/S80dhcp-server
+	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay \
+		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
+endef
+
 define DHCP_INSTALL_TARGET_CMDS
 	$(DHCP_INSTALL_RELAY)
 	$(DHCP_INSTALL_SERVER)
-- 
1.8.5.5

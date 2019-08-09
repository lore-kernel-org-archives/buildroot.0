From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu,  8 Aug 2019 23:27:28 -0300
Subject: [Buildroot] [PATCH] package/dhcp: fix installation with
 BR2_STATIC_LIBS=y
Message-ID: <20190809022728.8521-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

We disable libtool for static builds so the binaries are not in a
".libs" subdir.

Fixes:
  http://autobuild.buildroot.net/results/0c43c02b8d418b60b4734187abde1da585e9e0ca/
  http://autobuild.buildroot.net/results/e61b246df60af1e59b8f643510557ef2270f2d97/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/dhcp/dhcp.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 5f56c86414..1e9eebb1be 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -32,8 +32,10 @@ DHCP_CONF_OPTS = \
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
 DHCP_CONF_OPTS += --disable-libtool
+DHCP_DOT_LIBS = .
 else
 DHCP_CONF_OPTS += --enable-libtool
+DHCP_DOT_LIBS = .libs
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
@@ -52,7 +54,7 @@ endef
 define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(@D)/server/.libs/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
+	$(INSTALL) -m 0755 -D $(@D)/server/$(DHCP_DOT_LIBS)/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
 	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
 		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
 endef
@@ -62,7 +64,7 @@ ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
 define DHCP_INSTALL_RELAY
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/.libs/dhcrelay \
+	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/$(DHCP_DOT_LIBS)/dhcrelay \
 		$(TARGET_DIR)/usr/sbin/dhcrelay
 endef
 endif
@@ -71,7 +73,7 @@ ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 define DHCP_INSTALL_CLIENT
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/.libs/dhclient \
+	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/$(DHCP_DOT_LIBS)/dhclient \
 		$(TARGET_DIR)/sbin/dhclient
 	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
 		$(TARGET_DIR)/etc/dhcp/dhclient.conf
-- 
2.18.1

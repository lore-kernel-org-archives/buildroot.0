From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Feb 2011 14:30:32 +0100
Subject: [Buildroot] [git commit master 1/1] dhcp: fix install -D invocation
	in target-install
Message-ID: <20110201133310.EC11C8E5FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6bfe29326d64d7048be525bccf0c83b24f73700a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3181

When install -D is used (to ensure destination dirs exists), the destination
file name has to be given as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    1 +
 package/dhcp/dhcp.mk |   17 ++++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 25c3163..724ef77 100644
--- a/CHANGES
+++ b/CHANGES
@@ -80,6 +80,7 @@
 	#3007: kexec doesn't build: Missing regdef.h file
 	#3103: make external-deps wants to download gcc-.tar.bz2 when...
 	#3109: abnormal `make busybox-menuconfig`
+	#3181: dhcp.mk copies S80dhcp-server to etc/init.d, not etc/init.d/
 
 2010.11, Released November 30th, 2010:
 
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index bf3f775..64472c9 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -21,9 +21,10 @@ define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
-	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server $(TARGET_DIR)/etc/init.d
-	mkdir -p $(TARGET_DIR)/etc/dhcp
-	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf $(TARGET_DIR)/etc/dhcp/dhcpd.conf
+	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server \
+		$(TARGET_DIR)/etc/init.d/S80dhcp-server
+	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
+		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
 endef
 endif
 
@@ -31,8 +32,10 @@ ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
 define DHCP_INSTALL_RELAY
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay $(TARGET_DIR)/usr/sbin/
-	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
+		$(TARGET_DIR)/usr/sbin/dhcrelay
+	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay \
+		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
 endef
 endif
 
@@ -40,8 +43,8 @@ ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 define DHCP_INSTALL_CLIENT
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient $(TARGET_DIR)/usr/sbin
-	mkdir -p $(TARGET_DIR)/etc/dhcp
+	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
+		$(TARGET_DIR)/usr/sbin/dhclient
 	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
 		$(TARGET_DIR)/etc/dhcp/dhclient.conf
 	$(INSTALL) -m 0755 -D package/dhcp/dhclient-script \
-- 
1.7.3.4

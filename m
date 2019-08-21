From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 13:47:59 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/dhcp: fix target
 installation
Message-ID: <20190821114533.2C89483F62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=900939e0d61b9163526114a4d8a31c1ae0004e9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

We don't use "make install" for the target installation so we must pick
the executables from the ".libs" directories on which libtool generates
them otherwise we install the automatically generated wrapper scripts.

This was not necessary before the upgrade to version 4.4.1.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12051

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ffe5fcadfcd42af8a582b8f5fe49b56900b43a51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 1cef9724bd..86f5c69a77 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -44,7 +44,7 @@ ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
 define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
+	$(INSTALL) -m 0755 -D $(@D)/server/.libs/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
 	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
 		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
 endef
@@ -54,7 +54,7 @@ ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
 define DHCP_INSTALL_RELAY
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
+	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/.libs/dhcrelay \
 		$(TARGET_DIR)/usr/sbin/dhcrelay
 endef
 endif
@@ -63,7 +63,7 @@ ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 define DHCP_INSTALL_CLIENT
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
+	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/.libs/dhclient \
 		$(TARGET_DIR)/sbin/dhclient
 	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
 		$(TARGET_DIR)/etc/dhcp/dhclient.conf

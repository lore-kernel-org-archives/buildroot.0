From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 13:17:15 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/dhcp: fix
 installation with BR2_STATIC_LIBS=y
Message-ID: <20190902113832.B906C88FD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=540ea336cf315de8aa422ec0e9261c4a5f76922b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Use the "install-sbinPROGRAMS" make target to install the utilities
instead of guessing their locations. We disable libtool for static
builds so the binaries are not always in a ".libs" subdir.

Fixes:
  http://autobuild.buildroot.net/results/0c43c02b8d418b60b4734187abde1da585e9e0ca/
  http://autobuild.buildroot.net/results/e61b246df60af1e59b8f643510557ef2270f2d97/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5799fd04a1db6a8207f769bc423715b40e3002fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 5f56c86414..0abb0aebd7 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -52,7 +52,7 @@ endef
 define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(@D)/server/.libs/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
+	$(MAKE) -C $(@D)/server DESTDIR=$(TARGET_DIR) install-sbinPROGRAMS
 	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
 		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
 endef
@@ -62,8 +62,7 @@ ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
 define DHCP_INSTALL_RELAY
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/.libs/dhcrelay \
-		$(TARGET_DIR)/usr/sbin/dhcrelay
+	$(MAKE) -C $(@D)/relay DESTDIR=$(TARGET_DIR) install-sbinPROGRAMS
 endef
 endif
 
@@ -71,8 +70,8 @@ ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 define DHCP_INSTALL_CLIENT
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
-	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/.libs/dhclient \
-		$(TARGET_DIR)/sbin/dhclient
+	$(MAKE) -C $(@D)/client DESTDIR=$(TARGET_DIR) sbindir=/sbin \
+		install-sbinPROGRAMS
 	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
 		$(TARGET_DIR)/etc/dhcp/dhclient.conf
 	$(INSTALL) -m 0755 -D package/dhcp/dhclient-script \

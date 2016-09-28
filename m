From: Root, Build <gvb.buildroot@unssw.com>
Date: Wed, 28 Sep 2016 12:07:12 -0400
Subject: [Buildroot] [PATCH] Fix dhcp symlink in target/var/lib/dhcp
Message-ID: <CAK-g76X-fwsZnfmQaDN8a90kLrJCRfduAgNYyXuYa-UytHSfpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The symlink was to /tmp causing an error on the target install step:
rsync: chgrp "/<path>/output/target/var/lib/dhcp" failed: Operation
not permitted

Changing the symlink to "../../tmp" rather than "/tmp" references the
target's /tmp directory rather than the build machine's /tmp directory.

Signed-off-by: Gerald Van Baren <jerry@vibrationresearch.com>
---
 package/dhcp/dhcp.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 5cb6043..80c984b 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -56,7 +56,7 @@ endif
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
 define DHCP_INSTALL_SERVER
        mkdir -p $(TARGET_DIR)/var/lib
-       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
+       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
        $(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
        $(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
                $(TARGET_DIR)/etc/dhcp/dhcpd.conf
@@ -66,7 +66,7 @@ endif
 ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
 define DHCP_INSTALL_RELAY
        mkdir -p $(TARGET_DIR)/var/lib
-       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
+       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
        $(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
                $(TARGET_DIR)/usr/sbin/dhcrelay
 endef
@@ -75,7 +75,7 @@ endif
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 define DHCP_INSTALL_CLIENT
        mkdir -p $(TARGET_DIR)/var/lib
-       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
+       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
        $(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
                $(TARGET_DIR)/sbin/dhclient
        $(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
--
1.9.1

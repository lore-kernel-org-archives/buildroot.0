From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:39:25 +0200
Subject: [Buildroot] [git commit] package/mender: fix install path for
 identity and inventory scripts
Message-ID: <20180820144409.4297F8DE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a9fd97d43568f0acdd42618227b1396b76d686e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These scripts are used to generate the device identity and to populate
the the device inventory. The Mender client will call these and at least
the mender-device-identity is required to be present at the correct
location. Inventory scripts are there as an example and not
actually required.

Example output from identity script:

    $ ./mender-device-identity
    mac=de:ad:ca:fe:00:01
    cpuid=1112233

Example output from inventory script:

    $ ./mender-inventory-network
    mac_br-fbfdad18c33c=02:42:7e:74:96:85
    network_interfaces=br-fbfdad18c33c
    ipv4_br-fbfdad18c33c=172.21.0.1/16
    mac_enp0s25=de:ad:be:ef:bb:05
    network_interfaces=enp0s25
    ipv4_enp0s25=123.22.0.197/16
    ipv4_enp0s25=10.20.20.105/16
    ipv6_enp0s25=fe80::2aad:beff:feef:bb05/64

Inventory and device identity data is presented on the Mender server
front-end.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 695b5e7a91..deab0cb039 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -14,12 +14,13 @@ define MENDER_INSTALL_CONFIG_FILES
 		$(TARGET_DIR)/etc/mender/tenant.conf
 	$(INSTALL) -D -m 0644 package/mender/server.crt \
 		$(TARGET_DIR)/etc/mender/server.crt
+
 	$(INSTALL) -D -m 0755 package/mender/mender-device-identity \
-		$(TARGET_DIR)/var/share/mender/identity/mender-device-identity
+		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
 	$(INSTALL) -D -m 0755 package/mender/mender-inventory-network \
-		$(TARGET_DIR)/var/share/mender/inventory/mender-inventory-network
+		$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-network
 	$(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
-		$(TARGET_DIR)/var/share/mender/inventory/mender-inventory-hostinfo
+		$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-hostinfo
 endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES

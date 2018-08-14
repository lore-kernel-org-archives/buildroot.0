From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 01:13:35 +0200
Subject: [Buildroot] [PATCH 6/8] package/mender: populate the mender.conf
 template
In-Reply-To: <20180814231337.19114-1-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
Message-ID: <20180814231337.19114-7-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Options are provided for the Mender configuration and the
default values should work together with a Mender demo
environment.

https://docs.mender.io//getting-started/create-a-test-environment

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/Config.in   | 69 ++++++++++++++++++++++++++++++++++++++
 package/mender/mender.conf | 14 +++-----
 package/mender/mender.mk   | 12 +++++--
 3 files changed, 84 insertions(+), 11 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 4297c17a90..6fa9079b1d 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -34,6 +34,75 @@ config BR2_PACKAGE_MENDER_DEVICE_TYPE
 	  Will be stored in /data/mender/device_type. Note that /data is a mount
 	  point for the persistent data partition.
 
+config BR2_PACKAGE_MENDER_INVENTORY_POLL_INTERVAL_SEC
+	int "Inventory poll interval"
+	default 1800
+	help
+	  An integer that sets the number of seconds to wait between each inventory
+	  poll to the Mender server.
+
+	  https://docs.mender.io/client-configuration/configuration-file/polling-intervals
+
+config BR2_PACKAGE_MENDER_UPDATE_POLL_INTERVAL_SEC
+	int "Update poll interval"
+	default 1800
+	help
+	  An integer that sets the number of seconds to wait between each check for
+	  a new update. Note that the client may occasionally check more often if
+	  there has been recent activity on the device
+
+	  https://docs.mender.io/client-configuration/configuration-file/polling-intervals
+
+config BR2_PACKAGE_MENDER_RETRY_POLL_INTERVAL_SEC
+	int "Retry poll interval"
+	default 300
+	help
+	  An integer that sets the number of seconds to wait between each attempt
+	  to download an update file. Note that the client may attempt more often
+	  initially to enable rapid upgrades, but will gradually fall back to this
+	  value if the server is busy.
+
+	  https://docs.mender.io/client-configuration/configuration-file/polling-intervals
+
+config BR2_PACKAGE_MENDER_SERVER_URL
+	string "Server URL"
+	default "https://docker.mender.io"
+	help
+	  The server URL which is used as the basis for API requests. This should
+	  be set to the server that runs the Mender server services. It should
+	  include the whole URL, including https:// and a trailing slash.
+
+	  The default points to the Mender demo server setup,
+	  https://docs.mender.io/1.5/getting-started/create-a-test-environment
+
+config BR2_PACKAGE_MENDER_TENANT_TOKEN
+	string "Hosted Mender tenant token"
+	default "dummy"
+	help
+	  A token which identifies which tenant a device belongs to. This is only
+	  relevant if using Hosted Mender.
+
+config BR2_PACKAGE_MENDER_SERVER_CRT
+	string "Public certificate of the Mender server"
+	default "/etc/mender/server.crt"
+	help
+	  The location of the public certificate of the server, if any. If this
+	  certificate is missing, or the one presented by the server doesn't match
+	  the one specified in this setting, the server certificate will be
+	  validated using standard certificate trust chains
+
+config BR2_PACKAGE_MENDER_ROOTFS_PART_A
+	string "Root filesystem A device"
+	default "mmcblk0p2"
+	help
+	  The Linux device that contains root filesystem A.
+
+config BR2_PACKAGE_MENDER_ROOTFS_PART_B
+	string "Root filesystem B device"
+	default "mmcblk0p3"
+	help
+	  The Linux device that contains root filesystem B.
+
 endif
 
 comment "mender needs a toolchain w/ threads"
diff --git a/package/mender/mender.conf b/package/mender/mender.conf
index a5c7c545c3..cee8c7be9d 100644
--- a/package/mender/mender.conf
+++ b/package/mender/mender.conf
@@ -1,14 +1,10 @@
 {
-  "ClientProtocol": "http",
-  "HttpsClient": {
-    "Certificate": "",
-    "Key": ""
-  },
-  "RootfsPartA": "@MENDER_ROOTFS_PART_A@",
-  "RootfsPartB": "@MENDER_ROOTFS_PART_B@",
-  "UpdatePollIntervalSeconds": @MENDER_UPDATE_POLL_INTERVAL_SECONDS@,
   "InventoryPollIntervalSeconds": @MENDER_INVENTORY_POLL_INTERVAL_SECONDS@,
+  "UpdatePollIntervalSeconds": @MENDER_UPDATE_POLL_INTERVAL_SECONDS@,
   "RetryPollIntervalSeconds": @MENDER_RETRY_POLL_INTERVAL_SECONDS@,
+  "RootfsPartA": "@MENDER_ROOTFS_PART_A@",
+  "RootfsPartB": "@MENDER_ROOTFS_PART_B@",
+  "ServerCertificate": "@MENDER_CERT_LOCATION@",
   "ServerURL": "@MENDER_SERVER_URL@",
-  "ServerCertificate": "@MENDER_CERT_LOCATION@"
+  "TenantToken": "@MENDER_TENANT_TOKEN@"
 }
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 670f9eb956..ce48c82671 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -26,8 +26,6 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
 	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
 
-	$(INSTALL) -D -m 0644 package/mender/mender.conf \
-		$(TARGET_DIR)/etc/mender/mender.conf
 	$(INSTALL) -D -m 0644 package/mender/server.crt \
 		$(TARGET_DIR)/etc/mender/server.crt
 	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
@@ -42,6 +40,16 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	echo "device_type=$(call qstrip,$(BR2_PACKAGE_MENDER_DEVICE_TYPE))" > \
 		$(TARGET_DIR)/data/mender/device_type
+
+	sed -e 's#@MENDER_ROOTFS_PART_A@#$(call qstrip,$(BR2_PACKAGE_MENDER_ROOTFS_PART_A))#g' \
+		-e 's#@MENDER_ROOTFS_PART_B@#$(call qstrip,$(BR2_PACKAGE_MENDER_ROOTFS_PART_B))#g' \
+		-e 's/@MENDER_UPDATE_POLL_INTERVAL_SECONDS@/$(call qstrip,$(BR2_PACKAGE_MENDER_UPDATE_POLL_INTERVAL_SEC))/' \
+		-e 's/@MENDER_INVENTORY_POLL_INTERVAL_SECONDS@/$(call qstrip,$(BR2_PACKAGE_MENDER_INVENTORY_POLL_INTERVAL_SEC))/' \
+		-e 's/@MENDER_RETRY_POLL_INTERVAL_SECONDS@/$(call qstrip,$(BR2_PACKAGE_MENDER_RETRY_POLL_INTERVAL_SEC))/' \
+		-e 's#@MENDER_SERVER_URL@#$(call qstrip,$(BR2_PACKAGE_MENDER_SERVER_URL))#g' \
+		-e 's#@MENDER_CERT_LOCATION@#$(call qstrip,$(BR2_PACKAGE_MENDER_SERVER_CRT))#g' \
+		-e 's/@MENDER_TENANT_TOKEN@/$(call qstrip,$(BR2_PACKAGE_MENDER_TENANT_TOKEN))/' \
+		package/mender/mender.conf > $(TARGET_DIR)/etc/mender/mender.conf
 endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
-- 
2.18.0

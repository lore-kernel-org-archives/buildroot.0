From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 01:13:34 +0200
Subject: [Buildroot] [PATCH 5/8] package/mender: add
 BR2_PACKAGE_MENDER_DEVICE_TYPE option
In-Reply-To: <20180814231337.19114-1-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
Message-ID: <20180814231337.19114-6-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MENDER_DEVICE_TYPE is used to verify compatibility of Mender artifacts
against devices and it will also be reported to the Mender management
server from the device for the server to be able to verify this.

Device type can not change once a device has been provisioned with the
initial software and this is why it is stored on the persistent data
partition which is preserved across updates.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/Config.in | 10 ++++++++++
 package/mender/mender.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 036b7cf798..4297c17a90 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -24,6 +24,16 @@ config BR2_PACKAGE_MENDER_ARTIFACT_NAME
 
 	  Will be stored in /etc/mender/artifact_info
 
+config BR2_PACKAGE_MENDER_DEVICE_TYPE
+	string "Mender device type"
+	help
+	  A string that defines the type of device which will be used to check
+	  compatibility of update artifacts. Once a device is flashed with this,
+	  it will not change, even if the device is updated using Mender.
+
+	  Will be stored in /data/mender/device_type. Note that /data is a mount
+	  point for the persistent data partition.
+
 endif
 
 comment "mender needs a toolchain w/ threads"
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 08bdd4bd78..670f9eb956 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -13,6 +13,10 @@ ifeq ($(call qstrip,$(BR2_PACKAGE_MENDER_ARTIFACT_NAME)),)
 $(error Mender device type not set. Check your BR2_PACKAGE_MENDER_ARTIFACT_NAME setting)
 endif
 
+ifeq ($(call qstrip,$(BR2_PACKAGE_MENDER_DEVICE_TYPE)),)
+$(error Mender device type not set. Check your BR2_PACKAGE_MENDER_DEVICE_TYPE setting)
+endif
+
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
@@ -35,6 +39,9 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	echo "artifact_name=$(call qstrip,$(BR2_PACKAGE_MENDER_ARTIFACT_NAME))" > \
 		$(TARGET_DIR)/etc/mender/artifact_info
+
+	echo "device_type=$(call qstrip,$(BR2_PACKAGE_MENDER_DEVICE_TYPE))" > \
+		$(TARGET_DIR)/data/mender/device_type
 endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
-- 
2.18.0

From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:14 +0200
Subject: [Buildroot] [[PATCH v2 14/14] package/mender: add
 BR2_PACKAGE_MENDER_DEVICE_TYPE option
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-15-mirza.krak@northern.tech>
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
 package/mender/Config.in | 11 +++++++++++
 package/mender/mender.mk |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 8a6359c906..c9987adc36 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -25,6 +25,17 @@ config BR2_PACKAGE_MENDER_ARTIFACT_NAME
 
 	  Will be stored in /etc/mender/artifact_info
 
+config BR2_PACKAGE_MENDER_DEVICE_TYPE
+	string "Mender device type"
+	help
+	  A string that defines the type of device which will be used
+	  to check compatibility of update artifacts. Once a device is
+	  flashed with this, it will not change, even if the device is
+	  updated using Mender.
+
+	  Will be stored in /data/mender/device_type. Note that /data
+	  is a mount point for the persistent data partition.
+
 endif
 
 comment "mender needs a toolchain w/ threads"
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 0d4df3a763..89965f4c85 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -38,6 +38,10 @@ ifeq ($(call qstrip,$(BR2_PACKAGE_MENDER_ARTIFACT_NAME)),)
 $(error Mender device type not set. Check your BR2_PACKAGE_MENDER_ARTIFACT_NAME setting)
 endif
 
+ifeq ($(call qstrip,$(BR2_PACKAGE_MENDER_DEVICE_TYPE)),)
+$(error Mender device type not set. Check your BR2_PACKAGE_MENDER_DEVICE_TYPE setting)
+endif
+
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
@@ -62,6 +66,9 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	echo "artifact_name=$(call qstrip,$(BR2_PACKAGE_MENDER_ARTIFACT_NAME))" > \
 		$(TARGET_DIR)/etc/mender/artifact_info
+
+	echo "device_type=$(call qstrip,$(BR2_PACKAGE_MENDER_DEVICE_TYPE))" > \
+		$(TARGET_DIR)/data/mender/device_type
 endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
-- 
2.11.0

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 21:02:45 +0100
Subject: [Buildroot] [git commit] package/linux-firmware : Install binary
 blobs for e100 ethernet driver
Message-ID: <20190116200300.863778B6AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc799d7bc9a635f83a05a0dd112b7f02333ba5ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option in the menuconfig  submenu of linux-firmware package. Install
the firmware binary files to the target directory if the option is selected.

Signed-off-by: David Picard <dplamp@gmx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in           | 6 ++++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index dcc8d4bade..eaf68de8a5 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -325,6 +325,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
 	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards
 	  (cxgb4)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
+	bool "Intel e100 825xx"
+	help
+	  Firmware files for Intel 825xx handled by driver e100
+	  (e100)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
 	bool "QLogic FastLinQ 4xxxx"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 12310d55ed..b44934893c 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -29,3 +29,4 @@ sha256 fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f LICENSE.
 sha256 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 LICENSE.sdma_firmware
 sha256 9b873499a822762177a7a02d2a3ead9fdf0d514c0f9899fb16a2d22ed99f4acc WHENCE
 sha256 fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a qcom/NOTICE.txt
+sha256 bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604 LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ee02c7a030..86e1d1e750 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -389,6 +389,11 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100),y)
+LINUX_FIRMWARE_FILES += e100/*.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X),y)
 LINUX_FIRMWARE_FILES += \
 	qed/qed_init_values_zipped-*.bin

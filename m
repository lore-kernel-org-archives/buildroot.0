From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Aug 2017 00:05:29 +0200
Subject: [Buildroot] [git commit] linux-firmware: Add QLogic FC Adapters
Message-ID: <20170902130619.7D9E881DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91983091455e2b82432509c11f958409e7bbefcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option to install the ql2xxx firmware binaries for QLogic
Fibre Channel adapters.
Since this doesn't quite fit under the existing categories in Config.in,
include it under a new category named "Fibre Channel Adapter Firmware".

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 9 +++++++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f0d6476..ad750e8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -329,4 +329,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA
 
 endmenu
 
+menu "Fibre Channel Adapter Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX
+	bool "QLogic 2xxx Fibre Channel Adapters"
+	help
+	  Firmware files for ql2xxx adapters
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e03788a..b01585f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -414,6 +414,14 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
+# ql2xxx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX),y)
+LINUX_FIRMWARE_FILES += \
+	ql2100_fw.bin ql2200_fw.bin ql2300_fw.bin ql2322_fw.bin \
+	ql2400_fw.bin ql2500_fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qla2xxx
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \

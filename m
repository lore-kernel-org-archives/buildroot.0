From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 10:54:01 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: install license
	files with 'make legal-info'
Message-ID: <20131226095410.E23B29C1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0d82bd35327ce281ea3fed4be3cb7a6084d2cda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the license files for the many firmware files are installed
in the target, alongside the firmware files, and are not available to the
legal-info infrastructture.

This patch separates the license files from the firmware files, and makes
them available to the legal-info infrastructure, so they get installed
with all the other license files.

Since most firmware files are proprietary (at least those we currently
install), we just have a single license definition. When we later support
other firmwares that have an OSS license, those can add their own
licensing information on a case-by-case basis.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk |  144 ++++++++++++++++++++----------
 1 files changed, 97 insertions(+), 47 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c6a3e28..27b6ab5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -9,64 +9,86 @@ LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/li
 LINUX_FIRMWARE_SITE_METHOD = git
 
 # rt2501/rt61
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61) += \
-	rt2561.bin rt2561s.bin rt2661.bin LICENCE.ralink-firmware.txt
-
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
+LINUX_FIRMWARE_FILES_ += rt2561.bin rt2561s.bin rt2661.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
+endif
 
 # rt73
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73) += \
-	rt73.bin LICENCE.ralink-firmware.txt
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73),y)
+LINUX_FIRMWARE_FILES += rt73.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
+endif
 
 # rt2xx
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
-	rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin 	\
-	LICENCE.ralink-firmware.txt
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX),y)
+LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
+endif
 
 # rtl81xx
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX) += \
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX),y)
+LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin 		\
 	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
 	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
 	rtlwifi/rtl8188efw.bin rtlwifi/rtl8192cufw_A.bin	\
-	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin	\
-	LICENCE.rtlwifi_firmware.txt
+	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
 
 # rtl87xx
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX) += \
-	rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin		\
-	rtlwifi/rtl8723fw_B.bin					\
-	LICENCE.rtlwifi_firmware.txt
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX),y)
+LINUX_FIRMWARE_FILES += rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin	\
+	rtlwifi/rtl8723fw_B.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
 
 # ar7010
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010) += \
-	LICENCE.atheros_firmware ar7010.fw ar7010_1_1.fw htc_7010.fw
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010),y)
+LINUX_FIRMWARE_FILES += ar7010.fw ar7010_1_1.fw htc_7010.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
 
 # ar9170
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170) += \
-	LICENCE.atheros_firmware ar9170-1.fw ar9170-2.fw
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170),y)
+LINUX_FIRMWARE_FILES += ar9170-1.fw ar9170-2.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
 
 # ar9271
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271) += \
-	LICENCE.atheros_firmware ar9271.fw htc_9271.fw
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271),y)
+LINUX_FIRMWARE_FILES += ar9271.fw htc_9271.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
 
 # sd8686 v8
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8) += \
-	libertas/sd8686_v8.bin libertas/sd8686_v8_helper.bin LICENCE.Marvell
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8),y)
+LINUX_FIRMWARE_FILES += libertas/sd8686_v8.bin libertas/sd8686_v8_helper.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
 
 # sd8686 v9
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9) += \
-	libertas/sd8686_v9.bin libertas/sd8686_v9_helper.bin LICENCE.Marvell
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9),y)
+LINUX_FIRMWARE_FILES += libertas/sd8686_v9.bin libertas/sd8686_v9_helper.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
 
 # sd8688
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688) += \
-	libertas/sd8688.bin libertas/sd8688_helper.bin LICENCE.Marvell
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688),y)
+LINUX_FIRMWARE_FILES += libertas/sd8688.bin libertas/sd8688_helper.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
 
 # sd8787
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787) += \
-	mrvl/sd8787_uapsta.bin LICENCE.Marvell
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787),y)
+LINUX_FIRMWARE_FILES += mrvl/sd8787_uapsta.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
 
 # wl127x
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
+LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl1271-fw-2.bin				\
 	ti-connectivity/wl1271-fw-ap.bin			\
 	ti-connectivity/wl1271-fw.bin				\
@@ -80,11 +102,13 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
 	ti-connectivity/wl127x-fw-5-mr.bin			\
 	ti-connectivity/wl127x-fw-5-plt.bin			\
 	ti-connectivity/wl127x-fw-5-sr.bin			\
-	ti-connectivity/TIInit_7.2.31.bts 			\
-	LICENCE.ti-connectivity
+	ti-connectivity/TIInit_7.2.31.bts
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
 
 # wl128x
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X),y)
+LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl128x-fw-3.bin				\
 	ti-connectivity/wl128x-fw-ap.bin			\
 	ti-connectivity/wl128x-fw-plt-3.bin			\
@@ -98,34 +122,60 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
 	ti-connectivity/wl128x-fw-5-mr.bin			\
 	ti-connectivity/wl128x-fw-5-plt.bin			\
 	ti-connectivity/wl128x-fw-5-sr.bin			\
-	ti-connectivity/TIInit_7.2.31.bts 			\
-	LICENCE.ti-connectivity
+	ti-connectivity/TIInit_7.2.31.bts
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
 
 # iwlwifi 5000. Multiple files are available (iwlwifi-5000-1.ucode,
 # iwlwifi-5000-2.ucode, iwlwifi-5000-5.ucode), corresponding to
 # different versions of the firmware API. For now, we only install the
 # most recent one.
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000) += \
-	iwlwifi-5000-5.ucode LICENCE.iwlwifi_firmware
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000),y)
+LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
 
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_XC5000) += \
-	dvb-fe-xc5000-1.6.114.fw
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XC5000),y)
+LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc5000
+endif
 
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_DIB0700) += \
-	dvb-usb-dib0700-1.20.fw
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_DIB0700),y)
+LINUX_FIRMWARE_FILES += dvb-usb-dib0700-1.20.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.dib0700
+endif
 
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK) += \
-	dvb-usb-terratec-h5-drxk.fw
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK),y)
+LINUX_FIRMWARE_FILES += dvb-usb-terratec-h5-drxk.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
 
 # brcm
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX) += \
-	brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX),y)
+LINUX_FIRMWARE_FILES += brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+endif
+
+ifneq ($(LINUX_FIRMWARE_FILES),)
+
+# Most firmware files are under a proprietary license, so no need to
+# repeat it for every selections above. Those firmwares that have more
+# lax licensing terms may still add them on a per-case basis.
+LINUX_FIRMWARE_LICENSE += Proprietary
+
+# This file contains some licensing information about all the firmware
+# files found in the linux-firmware package, so we always add it, even
+# for firmwares that have their own licensing terms.
+LINUX_FIRMWARE_ALL_LICENSE_FILES += WHENCE
 
-ifneq ($(LINUX_FIRMWARE_FILES_y),)
+# Some license files may be listed more than once, so we have to remove
+# duplicates
+LINUX_FIRMWARE_LICENSE_FILES = $(sort $(LINUX_FIRMWARE_ALL_LICENSE_FILES))
 
 define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware
-	$(TAR) c -C $(@D) $(LINUX_FIRMWARE_FILES_y) | \
+	$(TAR) c -C $(@D) $(LINUX_FIRMWARE_FILES) | \
 		$(TAR) x -C $(TARGET_DIR)/lib/firmware
 endef
 

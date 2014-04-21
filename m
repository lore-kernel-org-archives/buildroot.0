From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 20:24:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/linux-firmware: install missing
	symlink-target files
In-Reply-To: <cover.1398104592.git.yann.morin.1998@free.fr>
References: <cover.1398104592.git.yann.morin.1998@free.fr>
Message-ID: <dc9af8ce0711ae9a66c28327546aeb999f08cca4.1398104592.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

AS reported by ovf on IRC, some of the firmwares we install are in fact
symlinks to some other files.

Install those files as well, and document the existing symlinks.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 135b29b..9c7e05c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -22,6 +22,8 @@ endif
 
 # rt2xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX),y)
+# rt3090.bin is a symlink to rt2860.bin
+# rt3070.bin is a symlink to rt2870.bin
 LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
 endif
@@ -77,6 +79,8 @@ endif
 # sd8688
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688),y)
 LINUX_FIRMWARE_FILES += libertas/sd8688.bin libertas/sd8688_helper.bin
+# The two files above are but symlinks to those two ones:
+LINUX_FIRMWARE_FILES += mrvl/sd8688.bin mrvl/sd8688_helper.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
 
@@ -88,6 +92,7 @@ endif
 
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
+# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
 LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl1271-fw-2.bin				\
 	ti-connectivity/wl1271-fw-ap.bin			\
@@ -123,6 +128,8 @@ LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl128x-fw-5-plt.bin			\
 	ti-connectivity/wl128x-fw-5-sr.bin			\
 	ti-connectivity/TIInit_7.2.31.bts
+# wl12xx-nvs.bin (above) is a symlink to:
+LINUX_FIRMWARE_FILES += ti-connectivity/wl127x-nvs.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
@@ -155,9 +162,8 @@ LINUX_FIRMWARE_FILES += \
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4),y)
-LINUX_FIRMWARE_FILES += \
-	cxgb4/t4fw-1.9.23.0.bin \
-	cxgb4/t4fw.bin
+# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.9.23.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.9.23.0.bin cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
@@ -201,7 +207,7 @@ LINUX_FIRMWARE_LICENSE_FILES = $(sort $(LINUX_FIRMWARE_ALL_LICENSE_FILES))
 
 define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware
-	$(TAR) c -C $(@D) $(LINUX_FIRMWARE_FILES) | \
+	$(TAR) c -C $(@D) $(sort $(LINUX_FIRMWARE_FILES)) | \
 		$(TAR) x -C $(TARGET_DIR)/lib/firmware
 endef
 
-- 
1.8.3.2

From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat,  4 Nov 2017 22:40:45 +0300
Subject: [Buildroot] [PATCH 1/5] xr819-firmware: new package
In-Reply-To: <20171104194049.24550-1-geomatsi@gmail.com>
References: <20171104194049.24550-1-geomatsi@gmail.com>
Message-ID: <20171104194049.24550-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add firmware for XR819 SDIO WiFi chip.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/xr819-firmware/Config.in           |  4 ++++
 package/xr819-firmware/xr819-firmware.hash |  5 +++++
 package/xr819-firmware/xr819-firmware.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/xr819-firmware/Config.in
 create mode 100644 package/xr819-firmware/xr819-firmware.hash
 create mode 100644 package/xr819-firmware/xr819-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c651bf26fa..ab2d0a36b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1432,6 +1432,7 @@ F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	package/xr819-xradio/
+F:	package/xr819-firmware/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..7b7a85a574 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ menu "Firmware"
 	source "package/wilc1000-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
+	source "package/xr819-firmware/Config.in"
 endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpica/Config.in"
diff --git a/package/xr819-firmware/Config.in b/package/xr819-firmware/Config.in
new file mode 100644
index 0000000000..d1be7f8554
--- /dev/null
+++ b/package/xr819-firmware/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XR819_FIRMWARE
+	bool "xr819-firmware"
+	help
+	  Firmware for XR819 SDIO WiFi chip
diff --git a/package/xr819-firmware/xr819-firmware.hash b/package/xr819-firmware/xr819-firmware.hash
new file mode 100644
index 0000000000..91a2a80a91
--- /dev/null
+++ b/package/xr819-firmware/xr819-firmware.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 6583350b3eb12f70fc6d6081426717bd0019b55c6558ffe820c1548f0702bb8c boot_xr819.bin
+sha256 4954ceb85807959c42e82c432109455bd9eabe95971402299a16d77ddd7d79f5 fw_xr819.bin
+sha256 84d3fb3ca8e5d25a0c113a5063bccbeb5b53da230a0afa236b5b625f37db5161 sdd_xr819.bin
+
diff --git a/package/xr819-firmware/xr819-firmware.mk b/package/xr819-firmware/xr819-firmware.mk
new file mode 100644
index 0000000000..a14719f6fa
--- /dev/null
+++ b/package/xr819-firmware/xr819-firmware.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# xr819-firmware
+#
+################################################################################
+
+XR819_FIRMWARE_VERSION = v2017.07
+XR819_FIRMWARE_SITE =  https://github.com/armbian/build/raw/$(XR819_FIRMWARE_VERSION)/packages/extras/firmware/xr819
+XR819_FIRMWARE_SOURCE = fw_xr819.bin
+XR819_FIRMWARE_EXTRA_DOWNLOADS = boot_xr819.bin sdd_xr819.bin
+XR819_FIRMWARE_LICENSE = PROPRIETARY
+
+define XR819_FIRMWARE_EXTRACT_CMDS
+	mkdir -p $(@D)/xr819
+	cp $(DL_DIR)/fw_xr819.bin $(@D)/xr819/
+	cp $(DL_DIR)/sdd_xr819.bin $(@D)/xr819/
+	cp $(DL_DIR)/boot_xr819.bin $(@D)/xr819/
+endef
+
+define XR819_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/xr819
+	cp $(@D)/xr819/* $(TARGET_DIR)/lib/firmware/xr819/
+endef
+
+$(eval $(generic-package))
-- 
2.11.0

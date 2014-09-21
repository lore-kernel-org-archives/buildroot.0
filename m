From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 20:38:13 +0200
Subject: [Buildroot] [PATCH 5/5 v3] package/linux-firmware: install
	Xceive/Cresta xc4000 and xc5000c
In-Reply-To: <cover.1411324588.git.yann.morin.1998@free.fr>
References: <cover.1411324588.git.yann.morin.1998@free.fr>
Message-ID: <3cf029249f53fbbd58a50d1275872fa46111034e.1411324588.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tweak the prompt, because Xceive is now part of Cresta, so the
new xc5000c-based devices might be branded under either name.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v2 -> v3:
  - add old option to Legacy  (Thomas P.)
---
 Config.in.legacy                         |  8 ++++++++
 package/linux-firmware/Config.in         |  6 +++---
 package/linux-firmware/linux-firmware.mk | 10 +++++++---
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e233e3c..6e202fe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.11"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
+	bool "Xceive xc5000 option has been renamed"
+	select BR2_PACKAGE_LINUX_FIRMWARE_XCx000
+	help
+	  The Xceive xc5000 option now also handles older firmwares from
+	  Xceive (the xc4000 series), as well as new firmwares (the xc5000c)
+	  from Cresta, who bought Xceive.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
 	bool "Chelsio T4 option has been renamed"
 	select BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9d39df8..cd35dcc 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -217,10 +217,10 @@ config BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK
 	help
 	  Firmware file for Terratec H5 DRX-K based DVB tuner driver
 
-config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
-	bool "Xceive xc5000"
+config BR2_PACKAGE_LINUX_FIRMWARE_XCx000
+	bool "Xceive/Cresta xc4000/xc5000/xc500c"
 	help
-	  Firmware file for xc5000-based DVB tuner driver
+	  Firmware file for xc4000/xc5000/xc5000c based DVB tuner driver
 
 endmenu
 
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index bc036be..4303985 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -203,9 +203,13 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.11.27.0.bin cxgb4/t5fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XC5000),y)
-LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc5000
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
+LINUX_FIRMWARE_FILES += dvb-fe-xc4000-1.4.1.fw \
+			dvb-fe-xc5000-1.6.114.fw \
+			dvb-fe-xc5000c-4.1.30.7.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc4000 \
+				    LICENCE.xc5000 \
+				    LICENCE.xc5000c
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AS102),y)
-- 
1.9.1

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 20:38:12 +0200
Subject: [Buildroot] [PATCH 4/5 v3] package/linux-firmware: add option for
	Chelsio cxgb4 T5
In-Reply-To: <cover.1411324588.git.yann.morin.1998@free.fr>
References: <cover.1411324588.git.yann.morin.1998@free.fr>
Message-ID: <0e14daf258f75e35490db09c5df795f2f37fa65a.1411324588.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v2 -> v3:
  - add old option to Legacy  (Thomas P.)
---
 Config.in.legacy                         | 8 ++++++++
 package/linux-firmware/Config.in         | 8 +++++++-
 package/linux-firmware/linux-firmware.mk | 8 +++++++-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f7bde7f..e233e3c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.11"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
+	bool "Chelsio T4 option has been renamed"
+	select BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
+	help
+	  The Chelsio T4 option BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
+	  has been renamed to BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
+	  to better account for the fact that a T5 variant exists.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
 	bool "BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7 has been renamed"
 	help
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 00c7edb..9d39df8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -183,10 +183,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	help
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
 
-config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
 	bool "Chelsio T4"
 	help
 	  Firmware files for Chelsio T4 1Gb and 10Gb ethernet cards (cxgb4)
+
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
+	bool "Chelsio T5"
+	help
+	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards (cxgb4)
+
 endmenu
 
 menu "DVB firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4e78c63..bc036be 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -191,12 +191,18 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4),y)
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
 # cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.11.27.0.bin
 LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.11.27.0.bin cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
+# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.11.27.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.11.27.0.bin cxgb4/t5fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XC5000),y)
 LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc5000
-- 
1.9.1

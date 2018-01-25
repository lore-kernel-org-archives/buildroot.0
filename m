From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 25 Jan 2018 15:29:51 -0200
Subject: [Buildroot] [PATCH v2 2/2] linux-firmware: add menu for Intel
 QuickAssist firmware
In-Reply-To: <20180125172951.31196-1-casantos@datacom.ind.br>
References: <20180125172951.31196-1-casantos@datacom.ind.br>
Message-ID: <20180125172951.31196-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Firmware required when Intel QuickAssist is enabled in the kernel via
CRYPTO_DEV_QAT_DH895xCC, CRYPTO_DEV_QAT_C3XXX or CRYPTO_DEV_QAT_C62X.

See https://dpdk.org/doc/guides/cryptodevs/qat.html

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/linux-firmware/Config.in           | 19 +++++++++++++++++++
 package/linux-firmware/linux-firmware.hash |  1 +
 package/linux-firmware/linux-firmware.mk   | 16 ++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index e27fc35c4b..f93561ee14 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -354,4 +354,23 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX
 
 endmenu
 
+menu "Intel QuickAssist Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC
+	bool "Support for DH895xCC"
+	help
+	  Firmware files for Intel DH895xCC devices
+
+config BR2_PACKAGE_LINUX_FIRMWARE_QAT_C3XXX
+	bool "Support for C3XXX"
+	help
+	  Firmware files for Intel C3XXX devices
+
+config BR2_PACKAGE_LINUX_FIRMWARE_QAT_C62X
+	bool "Support for C62X"
+	help
+	  Firmware files for Intel C62X devices
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index ae5f80f2da..1beb1f76da 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -9,6 +9,7 @@ sha256 60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83 LICENCE.
 sha256 5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4 LICENCE.ibt_firmware
 sha256 0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d LICENCE.it913x
 sha256 e295020afd7597dc1b3bbe50a84a7e432d9cb92bc053c1c5e657b50d2517627b LICENCE.iwlwifi_firmware
+sha256 2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c LICENCE.qat_firmware
 sha256 4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822 LICENCE.qla2xxx
 sha256 d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd LICENCE.ralink-firmware.txt
 sha256 8568352b57f3574f9d5b2753cdb7c6e5eb2b79e82fbb9c9ba6566947467ef508 LICENCE.ralink_a_mediatek_company_firmware
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 3f7b79f25a..82680937aa 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -448,6 +448,22 @@ LINUX_FIRMWARE_FILES += rsi/rs9113_wlan_qspi.rps
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
+# qat_mmp.bin is a symlink to qat_895xcc_mmp.bin
+LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin qat_mmp.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_C3XXX),y)
+LINUX_FIRMWARE_FILES += qat_c3xxx.bin qat_c3xxx_mmp.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_C62X),y)
+LINUX_FIRMWARE_FILES += qat_c62x.bin qat_c62x_mmp.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
-- 
2.14.3

From: Neil Armstrong <narmstrong@baylibre.com>
Date: Mon,  6 Aug 2018 08:50:07 +0000
Subject: [Buildroot] [PATCH 1/2] boot: aml-s905x-cc-fip: new package for
 Libre Computer AML-S905X-CC boot firmwares
In-Reply-To: <1533545408-11248-1-git-send-email-narmstrong@baylibre.com>
References: <1533545408-11248-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1533545408-11248-2-git-send-email-narmstrong@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Libre Computer AML-S905X-CC is based on am Amlogic S905X SoCs and
needs some pre-build ATF firmwares named "FIP" in order to generate
a valid boot binary.

These files are used in the post-image board script to generate a
bootable sdcard.img file.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 DEVELOPERS                                  |  3 +++
 boot/Config.in                              |  1 +
 boot/aml-s905x-cc-fip/Config.in             |  5 +++++
 boot/aml-s905x-cc-fip/aml-s905x-cc-fip.hash |  2 ++
 boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 boot/aml-s905x-cc-fip/Config.in
 create mode 100644 boot/aml-s905x-cc-fip/aml-s905x-cc-fip.hash
 create mode 100644 boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 215506c..66d2c51 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1458,6 +1458,9 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
 F:	package/evemu/
 F:	package/libevdev/
 
+N:	Neil Armstrong <narmstrong@baylibre.com>
+F:	boot/aml-s905x-cc-fip/
+
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
 
diff --git a/boot/Config.in b/boot/Config.in
index 3687c41..a0d897f 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -4,6 +4,7 @@ source "boot/afboot-stm32/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
+source "boot/aml-s905x-cc-fip/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
 source "boot/binaries-marvell/Config.in"
diff --git a/boot/aml-s905x-cc-fip/Config.in b/boot/aml-s905x-cc-fip/Config.in
new file mode 100644
index 0000000..1cd0b99
--- /dev/null
+++ b/boot/aml-s905x-cc-fip/Config.in
@@ -0,0 +1,5 @@
+config BR2_TARGET_AML_S905X_CC_FIP
+	bool "aml-s905x-cc fip"
+	depends on BR2_aarch64
+	help
+	  Amlogic FIP boot firmwares for AML-S905X-CC
diff --git a/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.hash b/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.hash
new file mode 100644
index 0000000..aad3fc1
--- /dev/null
+++ b/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 957c96037bcd792a4139cc33eded2f006d55a82c0c56ae69ef43bdcb76a255e2 libretech-cc_fip_20170606.tar.gz
diff --git a/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk b/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk
new file mode 100644
index 0000000..7aa6af9
--- /dev/null
+++ b/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# aml-s905x-cc-fip
+#
+################################################################################
+
+AML_S905X_CC_FIP_VERSION = 20170606
+AML_S905X_CC_FIP_SOURCE = libretech-cc_fip_$(AML_S905X_CC_FIP_VERSION).tar.gz
+AML_S905X_CC_FIP_SITE = https://github.com/BayLibre/u-boot/releases/download/v2017.11-libretech-cc
+AML_S905X_CC_FIP_LICENSE = Amlogic
+
+AML_S905X_CC_FIP_INSTALL_IMAGES = YES
+
+define AML_S905X_CC_FIP_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/gxl/bl2.bin $(BINARIES_DIR)/fip/bl2.bin
+	$(INSTALL) -D -m 0644 $(@D)/gxl/acs.bin $(BINARIES_DIR)/fip/acs.bin
+	$(INSTALL) -D -m 0644 $(@D)/gxl/bl21.bin $(BINARIES_DIR)/fip/bl21.bin
+	$(INSTALL) -D -m 0644 $(@D)/gxl/bl30.bin $(BINARIES_DIR)/fip/bl30.bin
+	$(INSTALL) -D -m 0644 $(@D)/gxl/bl301.bin $(BINARIES_DIR)/fip/bl301.bin
+	$(INSTALL) -D -m 0644 $(@D)/gxl/bl31.img $(BINARIES_DIR)/fip/bl31.img
+	$(INSTALL) -D -m 0755 $(@D)/gxl/aml_encrypt_gxl $(BINARIES_DIR)/fip/aml_encrypt_gxl
+	$(INSTALL) -D -m 0755 $(@D)/blx_fix.sh $(BINARIES_DIR)/fip/blx_fix.sh
+	$(INSTALL) -D -m 0644 $(@D)/acs_tool.pyc $(BINARIES_DIR)/fip/acs_tool.pyc
+endef
+
+$(eval $(generic-package))
-- 
2.7.4

From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Wed,  6 Feb 2019 14:58:58 +0100
Subject: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: add option to
 choose custom version
Message-ID: <20190206135858.6707-1-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow user to choose specific, stable version from official ATF
repository

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v1 -> v2:
  - add option to choose custom version as it is done in uboot
---
 boot/arm-trusted-firmware/Config.in               | 11 +++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  8 ++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 885d93e62f..823a3510b5 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -16,6 +16,11 @@ choice
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	bool "v1.4"
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official versions
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -31,12 +36,18 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION
 
 endif
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
+	string "ATF version"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "v1.4"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
+	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE \
+				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
 
 if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
 
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 23f493653d..9bac1319d7 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -13,13 +13,17 @@ ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
 ARM_TRUSTED_FIRMWARE_TARBALL = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
 ARM_TRUSTED_FIRMWARE_SITE = $(patsubst %/,%,$(dir $(ARM_TRUSTED_FIRMWARE_TARBALL)))
 ARM_TRUSTED_FIRMWARE_SOURCE = $(notdir $(ARM_TRUSTED_FIRMWARE_TARBALL))
-BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
 else ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y)
 ARM_TRUSTED_FIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL))
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
-BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
 else
+# Handle stable official ATF versions
 ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
+ARM_TRUSTED_FIRMWARE_SOURCE = arm-trusted-firmware-$(ARM_TRUSTED_FIRMWARE_VERSION).tar.gz
+endif
+
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
 endif
 
 ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.18.1

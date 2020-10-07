From: Shlomi Vaknin <shlomi.39sd@gmail.com>
Date: Wed,  7 Oct 2020 17:49:42 +0300
Subject: [Buildroot] [PATCH v3 1/4] boot/uboot: add stm32 binary format
Message-ID: <20201007144945.1697081-1-shlomi.39sd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add `.stm32` binary format that uboot generates for the trusted configuration.

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
---
 boot/uboot/Config.in | 4 ++++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 9e44daffab..01dea01764 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -343,6 +343,10 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_STM32
+	bool "u-boot.stm32"
+	depends on BR2_arm
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index f27abbd5ba..72d5df412d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -121,6 +121,11 @@ UBOOT_MAKE_TARGET += u-boot.sb
 UBOOT_DEPENDENCIES += host-elftosb host-openssl
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_STM32),y)
+UBOOT_BINS += u-boot.stm32
+UBOOT_MAKE_TARGET += u-boot.stm32
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 endif
-- 
2.25.1

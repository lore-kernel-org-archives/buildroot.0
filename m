From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 22:41:41 +0200
Subject: [Buildroot] [git commit] boot/uboot: add stm32 binary format
Message-ID: <20201013205326.157A58F884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d277d20cc4e98d5571beb1d62e92c8c229a80e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add `.stm32` binary format that U-Boot generates for the trusted
configuration of STM32MP platforms.

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 4 ++++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 41cc1e1fdd..e4a0f48deb 100644
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

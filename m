From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Tue, 13 Mar 2012 13:52:11 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: add support for u-boot.sb file
	format
In-Reply-To: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
Message-ID: <1331643131-31435-3-git-send-email-eric.jarrige@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add u-boot.sb binary format in BR menuconfig - Safe Boot (.sb) file format
have to be used with Freescale CPUs like imx23, imx28, stp37xx

Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    4 ++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c8db9fb..5fd5258 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -90,6 +90,9 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 	depends on BR2_bfin
 	bool "u-boot.ldr"
 
+config BR2_TARGET_UBOOT_FORMAT_SB
+	bool "u-boot.sb"
+
 endchoice
 
 menuconfig BR2_TARGET_UBOOT_NETWORK
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index db9de8d..1394400 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -29,6 +29,10 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
+UBOOT_DEPENDENCIES += host-elftosb
+UBOOT_BIN          = u-boot.sb
+UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else
 UBOOT_BIN          = u-boot.bin
 endif
-- 
1.7.2.5

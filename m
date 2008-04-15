From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 14 Apr 2008 21:53:14 -0700 (PDT)
Subject: [Buildroot] [PATCH] UBOOT: Provide Version selection option to user
Message-ID: <16695022.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

  Below patch provides Uboot version selection option to user.

Comments welcome.

Regards
Gururaja

Modified Files:
target/u-boot/Config.in
target/u-boot/Makefile.in


diff -purN u-boot_orig/Config.in u-boot/Config.in
--- u-boot_orig/Config.in	2008-04-03 03:15:11.000000000 -0400
+++ u-boot/Config.in	2008-04-15 16:24:47.000000000 -0400
@@ -5,6 +5,29 @@ config BR2_TARGET_UBOOT
 	help
 	  Build "Das U-Boot" Boot Monitor
 
+choice
+	prompt "Uboot Version"
+	default BR2_UBOOT_VERSION_1_3_0
+	depends on BR2_TARGET_UBOOT
+	help
+	  Select the version of Uboot you wish to use.
+
+	config BR2_UBOOT_VERSION_1_3_0
+		bool "uboot 1.3.0"
+
+	config BR2_UBOOT_VERSION_1_3_1
+		bool "uboot 1.3.1"
+
+	config BR2_UBOOT_VERSION_1_3_2
+		bool "uboot 1.3.2"
+endchoice
+
+config BR2_UBOOT_VERSION
+	string
+	default "1.3.0"    if BR2_UBOOT_VERSION_1_3_0
+	default "1.3.1"    if BR2_UBOOT_VERSION_1_3_1
+	default "1.3.2"    if BR2_UBOOT_VERSION_1_3_2
+
 config BR2_TARGET_UBOOT_BOARDNAME
 	string "board name"
 	depends on BR2_TARGET_UBOOT

diff -purN u-boot_orig/Makefile.in u-boot/Makefile.in
--- u-boot_orig/Makefile.in	2008-04-15 16:21:56.000000000 -0400
+++ u-boot/Makefile.in	2008-04-15 16:18:32.000000000 -0400
@@ -3,7 +3,7 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION:=1.3.0
+U_BOOT_VERSION:=$(strip $(subst ",, $(BR2_UBOOT_VERSION)))
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)

-- 
View this message in context: http://www.nabble.com/-PATCH--UBOOT%3A-Provide-Version-selection-option-to-user-tp16695022p16695022.html
Sent from the BuildRoot mailing list archive at Nabble.com.

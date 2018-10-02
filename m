From: Denis OSTERLAND <denis.osterland@diehl.com>
Date: Tue, 2 Oct 2018 05:38:19 +0000
Subject: [Buildroot] [PATCH] u-boot: add option to generate env image from
 default env
Message-ID: <20181002053526.11374-1-Denis.Osterland@diehl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Denis Osterland <Denis.Osterland@diehl.com>

This patch adds support to extract compiled in default env
via u-boots get_default_envs script and generate env image from it.

Signed-off-by: Denis Osterland <Denis.Osterland@diehl.com>
---
 boot/uboot/Config.in | 15 +++++++++++++++
 boot/uboot/uboot.mk  |  6 +++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 9e40c11fa1..a2e9c3866a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -468,8 +468,23 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 
 if BR2_TARGET_UBOOT_ENVIMAGE
 
+choice
+	prompt "source"
+
+config BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE
+	bool "text file"
+
+config BR2_TARGET_UBOOT_ENVIMAGE_BUIILTIN
+	bool "compiled in"
+	help
+	  Use the default env from u-boot image.
+	  requires >= v2018.03
+
+endchoice # source
+
 config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
 	string "Source files for environment"
+	depends on BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE
 	help
 	  Text files describing the environment. Files should have
 	  lines of the form var=value, one per line. Blank lines and
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c5abc125f3..ae9e38c8c2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -263,7 +263,9 @@ endef
 
 ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
 define UBOOT_GENERATE_ENV_IMAGE
-	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
+	$(if $(BR2_TARGET_UBOOT_ENVIMAGE_BUIILTIN), \
+	CROSS_COMPILE="$(TARGET_CROSS)" $(@D)/scripts/get_default_envs.sh $(@D), \
+	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))) \
 		>$(@D)/buildroot-env.txt
 	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
@@ -376,9 +378,11 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
+ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
 $(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
 endif
+endif
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
 $(error Please provide Uboot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
 endif
-- 
2.19.0



Diehl Connectivity Solutions GmbH
Gesch?ftsf?hrung: Horst Leonberger
Sitz der Gesellschaft: N?rnberg - Registergericht: Amtsgericht
N?rnberg: HRB 32315
___________________________________________________________________________________________________

Der Inhalt der vorstehenden E-Mail ist nicht rechtlich bindend. Diese E-Mail enthaelt vertrauliche und/oder rechtlich geschuetzte Informationen.
Informieren Sie uns bitte, wenn Sie diese E-Mail faelschlicherweise erhalten haben. Bitte loeschen Sie in diesem Fall die Nachricht.
Jede unerlaubte Form der Reproduktion, Bekanntgabe, Aenderung, Verteilung und/oder Publikation dieser E-Mail ist strengstens untersagt.
The contents of the above mentioned e-mail is not legally binding. This e-mail contains confidential and/or legally protected information. Please inform us if you have received this e-mail by
mistake and delete it in such a case. Each unauthorized reproduction, disclosure, alteration, distribution and/or publication of this e-mail is strictly prohibited. 

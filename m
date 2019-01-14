From: Denis OSTERLAND <denis.osterland@diehl.com>
Date: Mon, 14 Jan 2019 15:28:19 +0000
Subject: [Buildroot] [PATCH v2] u-boot: add option to generate env image
 from default env
In-Reply-To: <20181002053526.11374-1-Denis.Osterland@diehl.com>
References: <20181002053526.11374-1-Denis.Osterland@diehl.com>
Message-ID: <20181112101748.24707-1-Denis.Osterland@diehl.com>
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
v1 -> v2: use compiled in env if sources list is empty,
          as suggested by Arnout Vandecappelle

 boot/uboot/Config.in | 2 ++
 boot/uboot/uboot.mk  | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index ac6f8bc8c1..2e3a112874 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -466,6 +466,8 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 
 	  The environment image will be called uboot-env.bin.
 
+	  Leave empty to generate image from compiled-in env.
+
 if BR2_TARGET_UBOOT_ENVIMAGE
 
 config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cbdfee6ac3..693fe69508 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -262,8 +262,11 @@ define UBOOT_BUILD_OMAP_IFT
 endef
 
 ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
+UBOOT_GENERATE_ENV_FILE=$(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 define UBOOT_GENERATE_ENV_IMAGE
-	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
+	$(if $(UBOOT_GENERATE_ENV_FILE), \
+	cat $(UBOOT_GENERATE_ENV_FILE), \
+	CROSS_COMPILE="$(TARGET_CROSS)" $(@D)/scripts/get_default_envs.sh $(@D)) \
 		>$(@D)/buildroot-env.txt
 	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
@@ -376,9 +379,6 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
-ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
-$(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
-endif
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
 $(error Please provide Uboot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
 endif
-- 
2.19.1



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

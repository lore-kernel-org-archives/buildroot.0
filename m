From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 12:52:29 +0200
Subject: [Buildroot] [git commit] boot/uboot: add option to generate env
 image from default env
Message-ID: <20190801104954.84EEC8A50B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c8ff251cb16d38fb417a488ee0367cd03eebda2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support to extract compiled in default env
via u-boot's get_default_envs script and generate env image from it.

Signed-off-by: Denis Osterland <Denis.Osterland@diehl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/Config.in | 2 ++
 boot/uboot/uboot.mk  | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1aa29a7d92..993979f273 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -487,6 +487,8 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 
 	  The environment image will be called uboot-env.bin.
 
+	  Leave empty to generate image from compiled-in env.
+
 if BR2_TARGET_UBOOT_ENVIMAGE
 
 config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ae09c37d84..0a8856d7db 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -271,8 +271,11 @@ define UBOOT_BUILD_OMAP_IFT
 endef
 
 ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
+UBOOT_GENERATE_ENV_FILE=$(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 define UBOOT_GENERATE_ENV_IMAGE
-	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
+	$(if $(UBOOT_GENERATE_ENV_FILE), \
+		cat $(UBOOT_GENERATE_ENV_FILE), \
+		CROSS_COMPILE="$(TARGET_CROSS)" $(@D)/scripts/get_default_envs.sh $(@D)) \
 		>$(@D)/buildroot-env.txt
 	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
@@ -385,9 +388,6 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
-ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
-$(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
-endif
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
 $(error Please provide Uboot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
 endif

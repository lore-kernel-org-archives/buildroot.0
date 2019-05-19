From: Michael Walle <michael@walle.cc>
Date: Sun, 19 May 2019 21:16:35 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add initial environment support
Message-ID: <20190519191635.23814-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since v2019.07 U-Boot supports extracting the compiled-in environment.
As a first step, add support to the environment generation in buildroot.
In the future, the text file may also be injected into the target
filesystem.

Signed-off-by: Michael Walle <michael@walle.cc>
---

Future u-boot versions will support this. Getting support into buildroot as
soon as possible would be cool.

 boot/uboot/Config.in | 13 +++++++++++++
 boot/uboot/uboot.mk  | 17 ++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 33b7e67ff7..92f00bf752 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -488,7 +488,19 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 	  The environment image will be called uboot-env.bin.
 
 if BR2_TARGET_UBOOT_ENVIMAGE
+choice
+	prompt "Environment image source"
+	default BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
+
+config BR2_TARGET_UBOOT_ENVIMAGE_INITIAL
+	bool "Using the initial environment file"
+
+config BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
+	bool "Using a custom environment file"
+
+endchoice
 
+if BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
 config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
 	string "Source files for environment"
 	help
@@ -497,6 +509,7 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
 	  lines starting with a # are ignored.
 
 	  Multiple source files are concatenated in the order listed.
+endif # BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
 
 config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 	string "Size of environment"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ae09c37d84..2ecf74036e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -271,9 +271,22 @@ define UBOOT_BUILD_OMAP_IFT
 endef
 
 ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
-define UBOOT_GENERATE_ENV_IMAGE
+ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM),y)
+define UBOOT_CREATE_ENV_SOURCE
 	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
 		>$(@D)/buildroot-env.txt
+endef
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_INITIAL),y)
+UBOOT_MAKE_TARGET += u-boot-initial-env
+define UBOOT_CREATE_ENV_SOURCE
+	cp -dpf $(@D)/u-boot-initial-env $(@D)/buildroot-env.txt
+endef
+endif
+
+define UBOOT_GENERATE_ENV_IMAGE
+	$(UBOOT_CREATE_ENV_SOURCE)
 	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
 		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
@@ -385,9 +398,11 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
+ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
 $(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
 endif
+endif
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
 $(error Please provide Uboot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
 endif
-- 
2.11.0

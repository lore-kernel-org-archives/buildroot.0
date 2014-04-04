From: Dima Zavin <dmitriyz@google.com>
Date: Fri,  4 Apr 2014 01:32:17 -0700
Subject: [Buildroot] [PATCH] grub2: add configuration options for grub
	config files
Message-ID: <1396600337-26228-1-git-send-email-dmitriyz@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option for embedding a config file directly in grub as
well as an option to provide a custom grub.cfg file through
a defconfig.

Signed-off-by: Dima Zavin <dmitriyz@google.com>
---
 boot/grub2/Config.in | 12 ++++++++++++
 boot/grub2/grub2.mk  |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e59626a..4adc9db 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -117,4 +117,16 @@ config BR2_TARGET_GRUB2_BUILTIN_MODULES
 	default "boot linux ext2 fat part_msdos part_gpt normal efi_gop" \
 		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
 
+config BR2_TARGET_GRUB2_CONFIG
+	string "config file"
+	help
+	  This config file will be installed into the target boot filesystem.
+
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG
+	string "bultin config"
+	help
+	  This config file will be embedded into the grub image itself. This
+	  allows one to seet the root device, etc.
+	  Note that one cannot have menu entries in the embedded config.
+
 endif # BR2_TARGET_GRUB2
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 72fc7f4..67b5eaa 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -36,6 +36,11 @@ GRUB2_PLATFORM = efi
 endif
 
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
+GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
+
+GRUB2_CFG_SRC = $(if $(call qstrip,$(BR2_TARGET_GRUB2_CONFIG)),\
+			$(call qstrip,$(BR2_TARGET_GRUB2_CONFIG)),\
+			boot/grub2/grub.cfg)
 
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the native tools (i.e to be executed on the build
@@ -73,9 +78,10 @@ define GRUB2_IMAGE_INSTALLATION
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
 		$(if $(GRUB2_PREFIX),-p $(GRUB2_PREFIX)) \
+		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
 	mkdir -p $(dir $(GRUB2_CFG))
-	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
+	$(INSTALL) -D -m 0644 $(GRUB2_CFG_SRC) $(GRUB2_CFG)
 endef
 GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_IMAGE_INSTALLATION
 
-- 
1.9.1.423.g4596e3a

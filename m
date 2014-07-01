From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  1 Jul 2014 12:23:52 +0200
Subject: [Buildroot] [PATCH v2] grub2: Specify boot partition
Message-ID: <1404210232-2185-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since boot partition was not specified, grub tools try to detect it
automatically. This patch add an option to force it.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

 Notice I am not sure -p option is usefull when -c option is used.

v1 -> v2:
 * Rewrite help for BR2_TARGET_GRUB2_BOOT_PARTITION option
 * Don't show BR2_TARGET_GRUB2_BOOT_PARTITION if EFI is selected
 * Rewrite log message

 boot/grub2/Config.in | 13 +++++++++++++
 boot/grub2/grub2.mk  | 10 ++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index b37e024..74ff0ca 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -111,6 +111,19 @@ config BR2_TARGET_GRUB2_X86_64_EFI
 
 endchoice
 
+if BR2_TARGET_GRUB2_I386_PC
+
+config BR2_TARGET_GRUB2_BOOT_PARTITION
+	string "boot partition"
+	default "(hd0,msdos1)"
+	help
+	  Specify the partition where the /boot/grub/grub.cfg is located.
+	  Use (hd0,msdos1) for the first partition of the first disk if
+	  using a legacy partition table, or (hd0,gpt1) if using GPT
+	  partition table.
+
+endif # BR2_TARGET_GRUB2_I386_PC
+
 config BR2_TARGET_GRUB2_BUILTIN_MODULES
 	string "builtin modules"
 	default "boot linux ext2 fat part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 50f93ee..a686b5d 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -11,9 +11,14 @@ GRUB2_LICENSE = GPLv3+
 GRUB2_LICENSE_FILES = COPYING
 GRUB2_DEPENDENCIES = host-bison host-flex
 
+GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
+GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
+GRUB2_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))
+
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
 GRUB2_IMAGE = $(BINARIES_DIR)/grub.img
 GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
+GRUB2_PREFIX = $(GRUB2_BOOT_PARTITION)/boot/grub
 GRUB2_TUPLE = i386-pc
 GRUB2_TARGET = i386
 GRUB2_PLATFORM = pc
@@ -33,9 +38,6 @@ GRUB2_TARGET = x86_64
 GRUB2_PLATFORM = efi
 endif
 
-GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
-GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
-
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the native tools (i.e to be executed on the build
 # machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS to
@@ -71,7 +73,7 @@ define GRUB2_IMAGE_INSTALLATION
 		-d $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
-		$(if $(GRUB2_PREFIX),-p $(GRUB2_PREFIX)) \
+		-p "$(GRUB2_PREFIX)" \
 		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
 	mkdir -p $(dir $(GRUB2_CFG))
-- 
2.0.0

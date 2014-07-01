From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  1 Jul 2014 10:44:49 +0200
Subject: [Buildroot] [PATCH] grub2: Specify boot partition
In-Reply-To: <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
References: <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
Message-ID: <1404204289-8303-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since boot partition was not specified, grub tools try to detect it
automatically. This patch add an option to force it.

Notice I am not sure -p option is usefull when -c option is used.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 boot/grub2/Config.in | 5 +++++
 boot/grub2/grub2.mk  | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index b37e024..0ebb3a0 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -111,6 +111,11 @@ config BR2_TARGET_GRUB2_X86_64_EFI
 
 endchoice
 
+config BR2_TARGET_GRUB2_BOOT_PARTITION
+	string "boot partition"
+	default "(hd0,msdos1)"
+	  Specifiy partition where /boot/grub/grub.cfg will be located.
+
 config BR2_TARGET_GRUB2_BUILTIN_MODULES
 	string "builtin modules"
 	default "boot linux ext2 fat part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 50f93ee..ab2b122 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -14,6 +14,7 @@ GRUB2_DEPENDENCIES = host-bison host-flex
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
 GRUB2_IMAGE = $(BINARIES_DIR)/grub.img
 GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
+GRUB2_PREFIX = /boot/grub
 GRUB2_TUPLE = i386-pc
 GRUB2_TARGET = i386
 GRUB2_PLATFORM = pc
@@ -35,6 +36,7 @@ endif
 
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
 GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
+GRUB2_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))
 
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the native tools (i.e to be executed on the build
@@ -71,7 +73,7 @@ define GRUB2_IMAGE_INSTALLATION
 		-d $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
-		$(if $(GRUB2_PREFIX),-p $(GRUB2_PREFIX)) \
+		-p $(GRUB2_BOOT_PARTITION)$(GRUB2_PREFIX) \
 		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
 	mkdir -p $(dir $(GRUB2_CFG))
-- 
2.0.0

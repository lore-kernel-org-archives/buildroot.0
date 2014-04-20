From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 17:48:46 +0200
Subject: [Buildroot] [git commit] grub2: add a configuration option to embed
	a config file
Message-ID: <20140420155051.9F35E9C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f9a0b38159feee1eae0c241ad960daf9d2e0998
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option for embedding a config file directly in grub.

Signed-off-by: Dima Zavin <dmitriyz@google.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/Config.in |    8 ++++++++
 boot/grub2/grub2.mk  |    2 ++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e59626a..b37e024 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -117,4 +117,12 @@ config BR2_TARGET_GRUB2_BUILTIN_MODULES
 	default "boot linux ext2 fat part_msdos part_gpt normal efi_gop" \
 		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
 
+config BR2_TARGET_GRUB2_BUILTIN_CONFIG
+	string "builtin config"
+	help
+	  Path to a Grub 2 configuration file that will be embedded
+	  into the Grub image itself. This allows to set the root
+	  device and other configuration parameters, but however menu
+	  entries cannot be described in this embedded configuration.
+
 endif # BR2_TARGET_GRUB2
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 5bb8884..50f93ee 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -34,6 +34,7 @@ GRUB2_PLATFORM = efi
 endif
 
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
+GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
 
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the native tools (i.e to be executed on the build
@@ -71,6 +72,7 @@ define GRUB2_IMAGE_INSTALLATION
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
 		$(if $(GRUB2_PREFIX),-p $(GRUB2_PREFIX)) \
+		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
 	mkdir -p $(dir $(GRUB2_CFG))
 	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)

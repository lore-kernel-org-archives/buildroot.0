From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 20:58:37 +0100
Subject: [Buildroot] [git commit] boot/grub2: separate target and host builds
Message-ID: <20181202071559.AEA02815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac0719e0869a18537b059b12fcbb3c05399e80fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grub2 requires the host grub2-mkimage tool to build some of its target
images. The current way of building this tool in the grub2 package is
to perform a simultaneous host-tools/target-bootloader build during
the grub2 build step.

This method makes the recipe complex to understand, and proved to be a
complication during the work to enable grub2 support for architectures
other than x86.

This patch tries to do a better separation between the build of grub2
host tools and target boot loader image, as a partial step to enable
grub2 to build for other architectures.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 35aea41287..1b366d0407 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -9,7 +9,10 @@ GRUB2_SITE = http://ftp.gnu.org/gnu/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
-GRUB2_DEPENDENCIES = host-bison host-flex
+GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
+HOST_GRUB2_DEPENDENCIES = host-bison host-flex
+GRUB2_INSTALL_IMAGES = YES
+GRUB2_INSTALL_TARGET = NO
 
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
 GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
@@ -39,26 +42,24 @@ GRUB2_PLATFORM = efi
 endif
 
 # Grub2 is kind of special: it considers CC, LD and so on to be the
-# tools to build the native tools (i.e to be executed on the build
-# machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS,
-# TARGET_LDFLAGS to build the bootloader itself. However, to add to
-# the confusion, it also uses NM, OBJCOPY and STRIP to build the
-# bootloader itself; none of these are used to build the native
-# tools.
+# tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
+# TARGET_CPPFLAGS, TARGET_LDFLAGS to build the bootloader itself.
 #
 # NOTE: TARGET_STRIP is overridden by !BR2_STRIP_strip, so always
 # use the cross compile variant to ensure grub2 builds
 
+HOST_GRUB2_CONF_ENV = \
+	CPP="$(HOSTCC) -E"
+
 GRUB2_CONF_ENV = \
-	$(HOST_CONFIGURE_OPTS) \
-	CPP="$(HOSTCC) -E" \
+	CPP="$(TARGET_CC) -E" \
 	TARGET_CC="$(TARGET_CC)" \
 	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
 	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
 	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
-	NM="$(TARGET_NM)" \
-	OBJCOPY="$(TARGET_OBJCOPY)" \
-	STRIP="$(TARGET_CROSS)strip"
+	TARGET_NM="$(TARGET_NM)" \
+	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
+	TARGET_STRIP="$(TARGET_CROSS)strip"
 
 GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
@@ -72,12 +73,13 @@ GRUB2_CONF_OPTS = \
 	--enable-libzfs=no \
 	--disable-werror
 
-# We don't want all the native tools and Grub2 modules to be installed
-# in the target. So we in fact install everything into the host
-# directory, and the image generation process (below) will use the
-# grub-mkimage tool and Grub2 modules from the host directory.
-
-GRUB2_INSTALL_TARGET_OPTS = DESTDIR=$(HOST_DIR) install
+HOST_GRUB2_CONF_OPTS = \
+	--disable-grub-mkfont \
+	--enable-efiemu=no \
+	ac_cv_lib_lzma_lzma_code=no \
+	--enable-device-mapper=no \
+	--enable-libzfs=no \
+	--disable-werror
 
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
 define GRUB2_IMAGE_INSTALL_ELTORITO
@@ -86,10 +88,10 @@ define GRUB2_IMAGE_INSTALL_ELTORITO
 endef
 endif
 
-define GRUB2_IMAGE_INSTALLATION
+define GRUB2_INSTALL_IMAGES_CMDS
 	mkdir -p $(dir $(GRUB2_IMAGE))
-	$(HOST_DIR)/bin/grub-mkimage \
-		-d $(HOST_DIR)/lib/grub/$(GRUB2_TUPLE) \
+	$(HOST_DIR)/usr/bin/grub-mkimage \
+		-d $(@D)/grub-core/ \
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
 		-p "$(GRUB2_PREFIX)" \
@@ -99,14 +101,14 @@ define GRUB2_IMAGE_INSTALLATION
 	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
 	$(GRUB2_IMAGE_INSTALL_ELTORITO)
 endef
-GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_IMAGE_INSTALLATION
 
 ifeq ($(GRUB2_PLATFORM),efi)
 define GRUB2_EFI_STARTUP_NSH
 	echo $(notdir $(GRUB2_IMAGE)) > \
 		$(BINARIES_DIR)/efi-part/startup.nsh
 endef
-GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_EFI_STARTUP_NSH
+GRUB2_POST_INSTALL_IMAGES_HOOKS += GRUB2_EFI_STARTUP_NSH
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))

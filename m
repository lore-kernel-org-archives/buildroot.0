From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 26 Apr 2017 23:39:48 +0200
Subject: [Buildroot] [PATCH v2 3/8] grub2: use grub2-tools as a host package
In-Reply-To: <20170426213953.14904-1-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
Message-ID: <20170426213953.14904-4-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grub 2 requires the host grub2-mkimage tool to build some of its target
images.
The current way of obtaining this tool in the grub2 package is to
perform a simultaneous host-tools/target-bootloader build during the
grub2 build step.

During work to enable Grub 2 support for arm/aarch64 (to come in
upcoming patches), this flow was a complication and led to hard-to-debug
problems in the target image (i.e. strange relocation errors in
runtime).

By making a better separation between the build of grub2 host tools and
target boot loader image, these problems have not been observed and it
makes the grub2 recipe less complex to understand.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v1 -> v2:
  - Moved a small fix from the next patch to this one (pointed out by
    Arnout Vandecappelle)
---
 boot/grub2/grub2.mk                | 32 +++++++++++---------------------
 package/grub2-tools/grub2-tools.mk |  7 +++++++
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 171829d..f0bd2ee 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -9,7 +9,9 @@ GRUB2_SITE = http://ftp.gnu.org/gnu/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
-GRUB2_DEPENDENCIES = host-bison host-flex
+GRUB2_DEPENDENCIES = host-bison host-flex host-grub2-tools
+GRUB2_INSTALL_TARGET = NO
+GRUB2_INSTALL_IMAGES = YES
 
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
 GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
@@ -41,24 +43,20 @@ endif
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the native tools (i.e to be executed on the build
 # machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS,
-# TARGET_LDFLAGS to build the bootloader itself. However, to add to
-# the confusion, it also uses NM, OBJCOPY and STRIP to build the
-# bootloader itself; none of these are used to build the native
-# tools.
+# TARGET_LDFLAGS to build the bootloader itself.
 #
 # NOTE: TARGET_STRIP is overridden by BR2_STRIP_none, so always
 # use the cross compile variant to ensure grub2 builds
 
 GRUB2_CONF_ENV = \
-	$(HOST_CONFIGURE_OPTS) \
-	CPP="$(HOSTCC) -E" \
+	CPP="$(TARGET_CC) -E" \
 	TARGET_CC="$(TARGET_CC)" \
 	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
 	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
 	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
-	NM="$(TARGET_NM)" \
-	OBJCOPY="$(TARGET_OBJCOPY)" \
-	STRIP="$(TARGET_CROSS)strip"
+	TARGET_NM="$(TARGET_NM)" \
+	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
+	TARGET_STRIP="$(TARGET_CROSS)strip"
 
 GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
@@ -70,13 +68,6 @@ GRUB2_CONF_OPTS = \
 	--enable-libzfs=no \
 	--disable-werror
 
-# We don't want all the native tools and Grub2 modules to be installed
-# in the target. So we in fact install everything into the host
-# directory, and the image generation process (below) will use the
-# grub-mkimage tool and Grub2 modules from the host directory.
-
-GRUB2_INSTALL_TARGET_OPTS = DESTDIR=$(HOST_DIR) install
-
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
 define GRUB2_IMAGE_INSTALL_ELTORITO
 	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
@@ -84,10 +75,10 @@ define GRUB2_IMAGE_INSTALL_ELTORITO
 endef
 endif
 
-define GRUB2_IMAGE_INSTALLATION
+define GRUB2_INSTALL_IMAGES_CMDS
 	mkdir -p $(dir $(GRUB2_IMAGE))
 	$(HOST_DIR)/usr/bin/grub-mkimage \
-		-d $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
+		-d $(@D)/grub-core/ \
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
 		-p "$(GRUB2_PREFIX)" \
@@ -97,14 +88,13 @@ define GRUB2_IMAGE_INSTALLATION
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
diff --git a/package/grub2-tools/grub2-tools.mk b/package/grub2-tools/grub2-tools.mk
index 8bf1a31..f98f4aa 100644
--- a/package/grub2-tools/grub2-tools.mk
+++ b/package/grub2-tools/grub2-tools.mk
@@ -10,6 +10,10 @@ GRUB2_TOOLS_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_TOOLS_LICENSE = GPLv3+
 GRUB2_TOOLS_LICENSE_FILES = COPYING
 GRUB2_TOOLS_DEPENDENCIES = host-bison host-flex
+HOST_GRUB2_TOOLS_DEPENDENCIES = host-bison host-flex
+
+HOST_GRUB2_TOOLS_CONF_ENV = \
+	CPP="$(HOSTCC) -E"
 
 GRUB2_TOOLS_CONF_ENV = \
 	CPP="$(TARGET_CC) -E" \
@@ -29,4 +33,7 @@ GRUB2_TOOLS_CONF_OPTS = \
 	--enable-libzfs=no \
 	--disable-werror
 
+HOST_GRUB2_TOOLS_CONF_OPTS = $(GRUB2_TOOLS_CONF_OPTS)
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.9.3

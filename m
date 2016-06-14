From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:05:12 +0200
Subject: [Buildroot] [PATCH 5/5] grub2: allow full install (for installer
	images)
In-Reply-To: <1465916712-29684-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614150412.GF3060@hermes.click-hack.org>
 <1465916712-29684-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465916712-29684-5-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compile grub2 with the target toolchain in the "full install" case, so
that the generated binaries do not depend on the host toolchain used.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 boot/grub2/Config.in | 10 ++++++++++
 boot/grub2/grub2.mk  | 34 ++++++++++++++++++++++++----------
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7dc5cae..901d38b 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -139,6 +139,14 @@ config BR2_TARGET_GRUB2_X86_64_EFI
 
 endchoice
 
+config BR2_TARGET_FULL_INSTALL
+	bool "full install on target"
+	help
+	  Select this option to install grub on target rather than
+	  generating images.
+
+if !BR2_TARGET_FULL_INSTALL
+
 if BR2_TARGET_GRUB2_I386_PC
 
 config BR2_TARGET_GRUB2_BOOT_PARTITION
@@ -166,4 +174,6 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
+endif
+
 endif # BR2_TARGET_GRUB2
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 112a401..e94f524 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -46,6 +46,17 @@ endif
 # bootloader itself; none of these are used to build the native
 # tools.
 
+GRUB2_CONF_OPTS = \
+	--target=$(GRUB2_TARGET) \
+	--with-platform=$(GRUB2_PLATFORM) \
+	--disable-grub-mkfont \
+	--enable-efiemu=no \
+	ac_cv_lib_lzma_lzma_code=no \
+	--enable-device-mapper=no \
+	--enable-libzfs=no \
+	--disable-werror
+
+ifneq ($(BR2_TARGET_FULL_INSTALL),y)
 GRUB2_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
 	CPP="$(HOSTCC) -E" \
@@ -57,16 +68,6 @@ GRUB2_CONF_ENV = \
 	OBJCOPY="$(TARGET_OBJCOPY)" \
 	STRIP="$(TARGET_STRIP)"
 
-GRUB2_CONF_OPTS = \
-	--target=$(GRUB2_TARGET) \
-	--with-platform=$(GRUB2_PLATFORM) \
-	--disable-grub-mkfont \
-	--enable-efiemu=no \
-	ac_cv_lib_lzma_lzma_code=no \
-	--enable-device-mapper=no \
-	--enable-libzfs=no \
-	--disable-werror
-
 # We don't want all the native tools and Grub2 modules to be installed
 # in the target. So we in fact install everything into the host
 # directory, and the image generation process (below) will use the
@@ -104,4 +105,17 @@ endef
 GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_EFI_STARTUP_NSH
 endif
 
+else
+GRUB2_CONF_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CPP="$(TARGET_CC) -E" \
+	TARGET_CC="$(TARGET_CC)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+	NM="$(TARGET_NM)" \
+	OBJCOPY="$(TARGET_OBJCOPY)" \
+	STRIP="$(TARGET_STRIP)"
+endif
+
 $(eval $(autotools-package))
-- 
2.8.2

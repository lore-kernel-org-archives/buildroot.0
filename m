From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:21 +0200
Subject: [Buildroot] [PATCH 25/34] grub2: allow full install (for installer
	images)
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-25-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 boot/grub2/Config.in | 10 ++++++++++
 boot/grub2/grub2.mk  |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index c465a4d..5e41b89 100644
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
index 112a401..e2352b6 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -67,6 +67,7 @@ GRUB2_CONF_OPTS = \
 	--enable-libzfs=no \
 	--disable-werror
 
+ifneq ($(BR2_TARGET_FULL_INSTALL),y)
 # We don't want all the native tools and Grub2 modules to be installed
 # in the target. So we in fact install everything into the host
 # directory, and the image generation process (below) will use the
@@ -103,5 +104,6 @@ define GRUB2_EFI_STARTUP_NSH
 endef
 GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_EFI_STARTUP_NSH
 endif
+endif
 
 $(eval $(autotools-package))
-- 
2.7.4

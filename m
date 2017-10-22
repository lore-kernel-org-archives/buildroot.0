From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 22 Oct 2017 11:38:40 +0200
Subject: [Buildroot] [PATCH 2/4] grub2: introduce BR2_TARGET_GRUB2_CFG
In-Reply-To: <20171022093842.21788-1-nunes.erico@gmail.com>
References: <20171022093842.21788-1-nunes.erico@gmail.com>
Message-ID: <20171022093842.21788-3-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This config can be used to provide a custom Grub 2 configuration file
containing menu entries. Previously, this had to be always done by an
external script which would overwrite the default file.
This is backwards compatible for existing configs as the default value
is the previously hardcoded value.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/Config.in | 7 +++++++
 boot/grub2/grub2.mk  | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 9a61b3b633..e560ec8324 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -76,6 +76,13 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
+config BR2_TARGET_GRUB2_CFG
+	string "grub2 menu entries config"
+	default "boot/grub2/grub.cfg"
+	help
+	  Path to a Grub 2 configuration file containing the grub2 menu
+	  entries.
+
 endif # BR2_TARGET_GRUB2
 
 comment "grub2 needs a toolchain w/ wchar"
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 492cddf1a5..a801c2cda9 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -95,8 +95,9 @@ define GRUB2_IMAGE_INSTALLATION
 		-p "$(GRUB2_PREFIX)" \
 		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
-	mkdir -p $(dir $(GRUB2_CFG))
-	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
+	$(if $(BR2_TARGET_GRUB2_CFG), \
+		mkdir -p $(dir $(GRUB2_CFG)) && \
+		$(INSTALL) -D -m 0644 $(BR2_TARGET_GRUB2_CFG) $(GRUB2_CFG))
 	$(GRUB2_IMAGE_INSTALL_ELTORITO)
 endef
 GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_IMAGE_INSTALLATION
-- 
2.13.6

From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 26 Apr 2017 23:39:50 +0200
Subject: [Buildroot] [PATCH v2 5/8] grub2: introduce BR2_TARGET_GRUB2_CFG
In-Reply-To: <20170426213953.14904-1-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
Message-ID: <20170426213953.14904-6-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This config can be used to provide a custom Grub 2 configuration file
containing menu entries. In the previous implementation, this had to be
always done by an external script, overwriting the default file.
This should be backwards compatible as the default value is the previous
hardcoded value.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v1 -> v2:
  - Only patch rebase and commit rewording.
---
 boot/grub2/Config.in | 7 +++++++
 boot/grub2/grub2.mk  | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 498d5cd..77f5e7b 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -197,6 +197,13 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG
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
index 7bbdb40..7c9505f 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -105,8 +105,9 @@ define GRUB2_INSTALL_IMAGES_CMDS
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
 
-- 
2.9.3

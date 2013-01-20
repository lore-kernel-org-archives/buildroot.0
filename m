From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:19 +0100
Subject: [Buildroot] [RFC v1 10/14] uboot: support out of tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ea77259..1a4f251 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -10,6 +10,7 @@ UBOOT_LICENSE = GPLv2+
 UBOOT_LICENSE_FILES = COPYING
 
 UBOOT_INSTALL_IMAGES = YES
+UBOOT_SUPPORTS_OUT_OF_TREE = YES
 
 ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
@@ -71,8 +72,8 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
 define UBOOT_CONFIGURE_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
+	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 		\
+		$(MAKE) -C $(UBOOT_SRCDIR) O=$(@D) $(UBOOT_MAKE_OPTS)	\
 		$(UBOOT_BOARD_NAME)_config
 	@echo >> $(@D)/include/config.h
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
@@ -91,7 +92,7 @@ endef
 
 define UBOOT_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
+		$(MAKE) -C $(UBOOT_SRCDIR) O=$(@D) $(UBOOT_MAKE_OPTS) 		\
 		$(UBOOT_MAKE_TARGET)
 endef
 
-- 
1.7.9.5

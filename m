From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Apr 2015 16:03:06 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: migrate to pkg-kconfig
Message-ID: <1428328986-1625-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mauro Condarelli <mc5686@mclink.it>

In at91bootstrap3, defconfig files are spread out in various
sub-directories, so we can't easily construct the path to those
defconfig files.

As it turns out, there are no two defconfig files named the same; they
all contain at least the board name, plus some extra info. And there is
always only one directory depth below board/ where all defconfig files
are to be found.

Also, at91bootstrap3's own Makefile relies on this single-match as it
runs a 'find' command to locate the defconfig file.

So, even though we do not know the path to the defconfig file, we can
construct a shell-glob quite easily (in the hope that there will never
be more than one directory depth).

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
[yann.morin.1998 at free.fr:
  - remove custom _CONFIGURE_CMDS, handled by pkg-kconfig  (Thomas)
  - remove redundant intermediate variable
  - fix using internal defconfig files
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index b780617..f35ffc7 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -10,10 +10,6 @@ AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VER
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
 AT91BOOTSTRAP3_INSTALL_TARGET = NO
 
-AT91BOOTSTRAP3_DEFCONFIG = \
-	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))
-AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE = \
-	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
 AT91BOOTSTRAP3_CUSTOM_PATCH_DIR = \
 	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR))
 
@@ -27,16 +23,6 @@ endef
 AT91BOOTSTRAP3_POST_PATCH_HOOKS += AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
 endif
 
-ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
-define AT91BOOTSTRAP3_CONFIGURE_CMDS
-	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D) $(AT91BOOTSTRAP3_DEFCONFIG)_defconfig
-endef
-else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
-define AT91BOOTSTRAP3_CONFIGURE_CMDS
-	cp $(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE) $(@D)/.config
-endef
-endif
-
 define AT91BOOTSTRAP3_BUILD_CMDS
 	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D)
 endef
@@ -45,18 +31,25 @@ define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
 	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
 endef
 
-$(eval $(generic-package))
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
+AT91BOOTSTRAP3_KCONFIG_FILE = $(AT91BOOTSTRAP3_DIR)/board/*/$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
+AT91BOOTSTRAP3_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
+endif
+AT91BOOTSTRAP3_KCONFIG_EDITORS = menuconfig xconfig gconfig
+AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
+$(eval $(kconfig-package))
 
 # Checks to give errors that the user can understand
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
-ifeq ($(AT91BOOTSTRAP3_DEFCONFIG),)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
 $(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
 endif
 endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
-ifeq ($(AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE),)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)),)
 $(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE setting)
 endif
 endif
-- 
1.9.1

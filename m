From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:00:34 +0100
Subject: [Buildroot] [git commit] boot/at91bootstrap3: bump to v3.7.1
Message-ID: <20141207220123.2A5C280137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2b5425a07f1ba5102b10d6d9541224f3a05906b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change to use the _defconfig targets of at91bootstrap3 build system
when a defconfig is used.

[Thomas: adjust to make a better use of at91bootstrap3 defconfig
mechanism.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk |   16 +++++++---------
 1 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index bc8d912..098e7bf 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT91BOOTSTRAP3_VERSION = v3.6.2
+AT91BOOTSTRAP3_VERSION = v3.7.1
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
@@ -29,19 +29,17 @@ AT91BOOTSTRAP3_POST_PATCH_HOOKS += AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
 endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
-AT91BOOTSTRAP3_SOURCE_CONFIG = \
-	$(@D)/board/*/$(AT91BOOTSTRAP3_DEFCONFIG)_defconfig
+define AT91BOOTSTRAP3_CONFIGURE_CMDS
+	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D) $(AT91BOOTSTRAP3_DEFCONFIG)_defconfig
+endef
 else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
-AT91BOOTSTRAP3_SOURCE_CONFIG = $(AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)
-endif
-
 define AT91BOOTSTRAP3_CONFIGURE_CMDS
-	cp $(AT91BOOTSTRAP3_SOURCE_CONFIG) $(@D)/.config
-	$(SED) 's/image.bin/uImage/' $(@D)/.config
+	cp $(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE) $(@D)/.config
 endef
+endif
 
 define AT91BOOTSTRAP3_BUILD_CMDS
-	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D) boot
+	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D)
 endef
 
 define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS

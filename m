From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Feb 2020 21:20:20 +0100
Subject: [Buildroot] [PATCH 2/2] boot/uboot: needs make >= 4.0
In-Reply-To: <cover.1580761209.git.yann.morin.1998@free.fr>
References: <cover.1580761209.git.yann.morin.1998@free.fr>
Message-ID: <214c0588eab33158185f6199444bd0b6dbc577ba.1580761209.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with 2020.01, uboot started using the 'undefine' make
directive, which was only introduced with make 4.0.

In the general case, we do not have a way to know if the uboot
selected by the user is older or later than 2020.01, so we have
no way to know before hand if make >= 4.0 is needed or not. As
such, we have no other option than to always require it.

So, use the existing $(BR2_MAKE_HOST_DEPENDENCY) and $(BR2_MAKE),
both of each will ensure that we do use a make that is at least 4.0.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/uboot.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a4879bb8b2..19dfb08e81 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -12,6 +12,8 @@ UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 UBOOT_INSTALL_IMAGES = YES
 
+UBOOT_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+
 ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
@@ -242,7 +244,7 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
+		$(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_BOARD_NAME)_config
 endef
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
@@ -279,7 +281,7 @@ define UBOOT_BUILD_CMDS
 		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
+		$(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
 		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
-- 
2.20.1

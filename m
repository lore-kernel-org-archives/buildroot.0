From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 21:29:56 +0100
Subject: [Buildroot] [git commit] boot/uboot: needs make >= 4.0
Message-ID: <20200203202048.E0B4588ED5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab7b96e8132e7ad8d088ce3df041b2d1eb3fcd31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a4879bb8b2..1f444351d7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -12,6 +12,9 @@ UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 UBOOT_INSTALL_IMAGES = YES
 
+# u-boot 2020.01+ needs make 4.0+
+UBOOT_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+
 ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
@@ -242,7 +245,7 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
+		$(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_BOARD_NAME)_config
 endef
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
@@ -279,7 +282,7 @@ define UBOOT_BUILD_CMDS
 		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
+		$(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
 		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)

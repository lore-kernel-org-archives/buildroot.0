From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 16:54:20 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] boot/uboot: Fix kconfig
 to use $(BR2_MAKE)
Message-ID: <20200828155321.B9E1F86539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a31976ce5baa6554aa41c446bd637679dbe4aa2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

U-Boot must use $(BR2_MAKE) as it uses a Make feature from v4.0. We
already use $(BR2_MAKE) in the BUILD_CMDS, but the kconfig commands
still uses $(MAKE). Without this fix, building U-Boot with kconfig will
fail with the following cryptic error.

> Makefile:37: *** missing separator.  Stop.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 43dc2007a93194f6126987a2f2716dda1f3f17b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1d50e72846..dc9f065332 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -16,6 +16,7 @@ UBOOT_INSTALL_IMAGES = YES
 
 # u-boot 2020.01+ needs make 4.0+
 UBOOT_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+UBOOT_MAKE = $(BR2_MAKE)
 
 ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
@@ -257,7 +258,7 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		$(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
+		$(UBOOT_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_BOARD_NAME)_config
 endef
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
@@ -294,7 +295,7 @@ define UBOOT_BUILD_CMDS
 		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) \
-		$(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
+		$(UBOOT_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
 		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)

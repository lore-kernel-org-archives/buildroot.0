From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 16:54:12 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] boot/uboot: Fix kconfig
 to use $(BR2_MAKE)
Message-ID: <20200828155253.366BE83DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff849fed4576757007d0af1d7e055ed6f26dd9c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
index 2bfa50779b..9cbd81b05b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -16,6 +16,7 @@ UBOOT_INSTALL_IMAGES = YES
 
 # u-boot 2020.01+ needs make 4.0+
 UBOOT_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+UBOOT_MAKE = $(BR2_MAKE)
 
 ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
@@ -247,7 +248,7 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		$(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
+		$(UBOOT_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_BOARD_NAME)_config
 endef
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
@@ -284,7 +285,7 @@ define UBOOT_BUILD_CMDS
 		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) \
-		$(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
+		$(UBOOT_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
 		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)

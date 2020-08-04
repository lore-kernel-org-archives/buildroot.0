From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue,  4 Aug 2020 14:00:05 -0500
Subject: [Buildroot] [PATCH 2/2] boot/uboot: Fix kconfig to use $(BR2_MAKE)
In-Reply-To: <20200804190005.114872-1-brandon.maier@rockwellcollins.com>
References: <20200804190005.114872-1-brandon.maier@rockwellcollins.com>
Message-ID: <20200804190005.114872-2-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot must use $(BR2_MAKE) as it uses a Make feature from v4.0. We
already use $(BR2_MAKE) in the BUILD_CMDS, but the kconfig commands
still uses $(MAKE). Without this fix, building U-Boot with kconfig will
fail with the following cryptic error.

> Makefile:37: *** missing separator.  Stop.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 boot/uboot/uboot.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 8a09969de1..1831466780 100644
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
-- 
2.28.0

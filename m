From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 23:48:01 +0200
Subject: [Buildroot] [git commit] uboot: Add support for U-Boot SPL
Message-ID: <20120505215402.B148D90BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c79537cffbf52ceecd3a46ed5d52211eeefcd1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SPL is a first stage bootloader. On pandaboard it supercedes x-loader,
and should now be used.

This patch ensures that either SPL or xloader can be selected.

A config variable has been added for the name of the SPL binary generated
during u-boot build. For most platform it is u-boot-spl.bin but not always.
It is MLO on OMAP for example.

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |   18 ++++++++++++++++++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 99d5623..cb40648 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -141,4 +141,22 @@ config BR2_TARGET_UBOOT_ETH1ADDR
 
 endif # BR2_TARGET_UBOOT_NETWORK
 
+config BR2_TARGET_UBOOT_SPL
+	bool "U-Boot SPL support"
+	depends on !BR2_TARGET_XLOADER
+	help
+	  Enable the U-Boot SPL support. SPL is a first stage
+	  bootloader loaded into internal memory in charge of
+	  enabling and configuring the external memory (DDR),
+	  and load the u-boot program into DDR.
+
+config BR2_TARGET_UBOOT_SPL_NAME
+	string "U-Boot SPL target name"
+	default "u-boot-spl.bin"
+	depends on BR2_TARGET_UBOOT_SPL
+	help
+	  This is the name of the SPL binary, generated during
+	  u-boot build. For most platform it is u-boot-spl.bin
+	  but not always. It is MLO on OMAP for example.
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index db9de8d..f64964c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -88,6 +88,8 @@ endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	$(if $(BR2_TARGET_UBOOT_SPL),
+		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
 endef
 
 $(eval $(call GENTARGETS))

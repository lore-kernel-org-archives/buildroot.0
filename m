From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:56:13 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] configs/imx6sabre: Create
 distinct pre-processed mkimage config files
Message-ID: <20181126165335.68DDB887CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f3d5c056e518bb5c9f2927822dc064457c978cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Commit 0c4bccf9e882 ("configs/imxsabre: Fix U-Boot parallel build issue")
tried to fix the parallel build issue, but the real fix was developed
later by Trent Piepho later, so add such commit to fix Buildroot
build failures on rel_imx_4.9.x_1.0.0_ga NXP branch.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/123771053
https://gitlab.com/buildroot.org/buildroot/-/jobs/123771054
https://gitlab.com/buildroot.org/buildroot/-/jobs/123771055

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ad9c45a059deaaae65a78a9ed7f78b579fed422)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...distinct-pre-processed-mkimage-config-fil.patch | 89 ++++++++++++++++++++++
 ...emove-failure-when-no-IVT-offset-is-found.patch | 55 -------------
 2 files changed, 89 insertions(+), 55 deletions(-)

diff --git a/board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch b/board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch
new file mode 100644
index 0000000000..b8989cb965
--- /dev/null
+++ b/board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch
@@ -0,0 +1,89 @@
+From 27a2cd6a1980adf3002412678c8fdec6528dc47d Mon Sep 17 00:00:00 2001
+From: Trent Piepho <tpiepho@impinj.com>
+Date: Fri, 6 Apr 2018 17:11:27 -0700
+Subject: [PATCH] imx: Create distinct pre-processed mkimage config files
+
+Each imx image is created by a separate sub-make and during this process
+the mkimage config file is run though cpp.
+
+The cpp output is to the same file no matter what imx image is being
+created.
+
+This means if two imx images are generated in parallel they will attempt
+to independently produce the same pre-processed mkimage config file at
+the same time.
+
+Avoid the problem by making the pre-processed config file name unique
+based on the imx image it will be used in.  This way each image will
+create a unique config file and they won't clobber each other when run
+in parallel.
+
+This should fixed the build bug referenced in b5b0e4e3 ("imximage:
+Remove failure when no IVT offset is found").
+
+Cc: Breno Lima <breno.lima@nxp.com>
+Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Cc: Fabio Estevam <fabio.estevam@nxp.com>
+Signed-off-by: Trent Piepho <tpiepho@impinj.com>
+Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
+[fabio: Adapted to imx_v2017.03_4.9.11_1.0.0_ga]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ arch/arm/imx-common/Makefile | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/arch/arm/imx-common/Makefile b/arch/arm/imx-common/Makefile
+index d862258..f1bae8d 100644
+--- a/arch/arm/imx-common/Makefile
++++ b/arch/arm/imx-common/Makefile
+@@ -69,9 +69,11 @@ endif
+ quiet_cmd_cpp_cfg = CFGS    $@
+       cmd_cpp_cfg = $(CPP) $(cpp_flags) -x c -o $@ $<
+ 
+-IMX_CONFIG = $(CONFIG_IMX_CONFIG:"%"=%).cfgtmp
++# mkimage source config file
++IMX_CONFIG = $(CONFIG_IMX_CONFIG:"%"=%)
+ 
+-$(IMX_CONFIG): %.cfgtmp: % FORCE
++# How to create a cpp processed config file, they all use the same source
++%.cfgout: $(IMX_CONFIG) FORCE
+ 	$(Q)mkdir -p $(dir $@)
+ 	$(call if_changed_dep,cpp_cfg)
+ 
+@@ -79,7 +81,7 @@ MKIMAGEFLAGS_u-boot.imx = -n $(filter-out $(PLUGIN).bin $< $(PHONY),$^) -T imxim
+ 	-e $(CONFIG_SYS_TEXT_BASE)
+ u-boot.imx: MKIMAGEOUTPUT = u-boot.imx.log
+ 
+-u-boot.imx: u-boot.bin $(IMX_CONFIG) $(PLUGIN).bin FORCE
++u-boot.imx: u-boot.bin u-boot.cfgout $(PLUGIN).bin FORCE
+ 	$(call if_changed,mkimage)
+ 
+ ifeq ($(CONFIG_OF_SEPARATE),y)
+@@ -87,16 +89,15 @@ MKIMAGEFLAGS_u-boot-dtb.imx = -n $(filter-out $(PLUGIN).bin $< $(PHONY),$^) -T i
+ 	-e $(CONFIG_SYS_TEXT_BASE)
+ u-boot-dtb.imx: MKIMAGEOUTPUT = u-boot-dtb.imx.log
+ 
+-u-boot-dtb.imx: u-boot-dtb.bin $(IMX_CONFIG) $(PLUGIN).bin FORCE
++u-boot-dtb.imx: u-boot-dtb.bin u-boot-dtb.cfgout $(PLUGIN).bin FORCE
+ 	$(call if_changed,mkimage)
+ endif
+ 
+ MKIMAGEFLAGS_SPL = -n $(filter-out $(PLUGIN).bin $< $(PHONY),$^) -T imximage \
+ 	-e $(CONFIG_SPL_TEXT_BASE)
+-
+ SPL: MKIMAGEOUTPUT = SPL.log
+ 
+-SPL: spl/u-boot-spl.bin $(IMX_CONFIG) $(PLUGIN).bin FORCE
++SPL: spl/u-boot-spl.bin spl/u-boot-spl.cfgout $(PLUGIN).bin FORCE
+ 	$(call if_changed,mkimage)
+ 
+ MKIMAGEFLAGS_u-boot.uim = -A arm -O U-Boot -a $(CONFIG_SYS_TEXT_BASE) \
+@@ -124,4 +125,4 @@ cmd_u-boot-nand-spl_imx = (printf '\000\000\000\000\106\103\102\040\001' && \
+ spl/u-boot-nand-spl.imx: SPL FORCE
+ 	$(call if_changed,u-boot-nand-spl_imx)
+ 
+-targets += $(addprefix ../../../,$(IMX_CONFIG) SPL u-boot.uim spl/u-boot-nand-spl.imx)
++targets += $(addprefix ../../../,SPL spl/u-boot-spl.cfgout u-boot-dtb.cfgout u-boot.cfgout u-boot.uim spl/u-boot-nand-spl.imx)
+-- 
+2.7.4
+
diff --git a/board/freescale/imx6sabre/patches/uboot/0002-imximage-Remove-failure-when-no-IVT-offset-is-found.patch b/board/freescale/imx6sabre/patches/uboot/0002-imximage-Remove-failure-when-no-IVT-offset-is-found.patch
deleted file mode 100644
index 92eff7574d..0000000000
--- a/board/freescale/imx6sabre/patches/uboot/0002-imximage-Remove-failure-when-no-IVT-offset-is-found.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 24ba28680abe868e8db3442a9bf523ad3af1febd Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <fabio.estevam@nxp.com>
-Date: Fri, 9 Mar 2018 08:25:00 -0300
-Subject: [PATCH] imximage: Remove failure when no IVT offset is found
-
-Sometimes imximage throws the following error:
-
-  CFGS    board/freescale/vf610twr/imximage.cfg.cfgtmp
-  CFGS    board/freescale/vf610twr/imximage.cfg.cfgtmp
-  MKIMAGE u-boot-dtb.imx
-Error: No BOOT_FROM tag in board/freescale/vf610twr/imximage.cfg.cfgtmp
-arch/arm/mach-imx/Makefile:100: recipe for target 'u-boot-dtb.imx' failed
-
-Later on, when running mkimage for the u-boot.imx it will succeed in
-finding the IVT offset.
-
-Looks like some race condition happening during parallel build when
-processing mkimage for u-boot-dtb.imx and u-boot.imx.
-
-A proper fix still needs to be implemented, but as a workaround let's
-remove the error when the IVT offset is not found.
-
-It is useful to have such message, especially during bring-up phase,
-but the build error that it causes is severe, so better avoid the
-build error for now.
-
-The error checking can be re-implemented later when we have a proper
-fix.
-
-Reported-by: Breno Lima <breno.lima@nxp.com>
-Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
----
- tools/imximage.c | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/tools/imximage.c b/tools/imximage.c
-index 0c43196..bef56f8 100644
---- a/tools/imximage.c
-+++ b/tools/imximage.c
-@@ -765,11 +765,6 @@ static uint32_t parse_cfg_file(struct imx_header *imxhdr, char *name)
- 	(*set_dcd_rst)(imxhdr, dcd_len, name, lineno);
- 	fclose(fd);
- 
--	/* Exit if there is no BOOT_FROM field specifying the flash_offset */
--	if (imximage_ivt_offset == FLASH_OFFSET_UNDEFINED) {
--		fprintf(stderr, "Error: No BOOT_FROM tag in %s\n", name);
--		exit(EXIT_FAILURE);
--	}
- 	return dcd_len;
- }
- 
--- 
-2.7.4
-

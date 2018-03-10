From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 10 Mar 2018 19:45:37 -0300
Subject: [Buildroot] [PATCH] imxsabre: Fix U-Boot parallel build issue
Message-ID: <1520721937-25765-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes imximage throws the following error:

MKIMAGE u-boot-dtb.imx
Error: No BOOT_FROM tag in board/freescale/mx6sxsabresd/imximage.cfg.cfgtmp
arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed

Later on, when running mkimage for the u-boot.imx it will succeed in
finding the IVT offset.

Looks like some race condition happening during parallel build when
processing mkimage for u-boot-dtb.imx and u-boot.imx.

A proper fix still needs to be implemented, but as a workaround let's
remove the error when the IVT offset is not found.

It is useful to have such message, especially during bring-up phase,
but the build error that it causes is severe, so better avoid the
build error for now.

The error checking can be re-implemented later when we have a proper
fix.

This workaround has already been applied in mainline U-Boot:
http://git.denx.de/?p=u-boot.git;a=commit;h=b5b0e4e351e20a606de22db6a56ad6bc1e2aa8fd

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ...emove-failure-when-no-IVT-offset-is-found.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 board/freescale/imx6sabre/patches/uboot/0002-imximage-Remove-failure-when-no-IVT-offset-is-found.patch

diff --git a/board/freescale/imx6sabre/patches/uboot/0002-imximage-Remove-failure-when-no-IVT-offset-is-found.patch b/board/freescale/imx6sabre/patches/uboot/0002-imximage-Remove-failure-when-no-IVT-offset-is-found.patch
new file mode 100644
index 0000000..92eff75
--- /dev/null
+++ b/board/freescale/imx6sabre/patches/uboot/0002-imximage-Remove-failure-when-no-IVT-offset-is-found.patch
@@ -0,0 +1,55 @@
+From 24ba28680abe868e8db3442a9bf523ad3af1febd Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@nxp.com>
+Date: Fri, 9 Mar 2018 08:25:00 -0300
+Subject: [PATCH] imximage: Remove failure when no IVT offset is found
+
+Sometimes imximage throws the following error:
+
+  CFGS    board/freescale/vf610twr/imximage.cfg.cfgtmp
+  CFGS    board/freescale/vf610twr/imximage.cfg.cfgtmp
+  MKIMAGE u-boot-dtb.imx
+Error: No BOOT_FROM tag in board/freescale/vf610twr/imximage.cfg.cfgtmp
+arch/arm/mach-imx/Makefile:100: recipe for target 'u-boot-dtb.imx' failed
+
+Later on, when running mkimage for the u-boot.imx it will succeed in
+finding the IVT offset.
+
+Looks like some race condition happening during parallel build when
+processing mkimage for u-boot-dtb.imx and u-boot.imx.
+
+A proper fix still needs to be implemented, but as a workaround let's
+remove the error when the IVT offset is not found.
+
+It is useful to have such message, especially during bring-up phase,
+but the build error that it causes is severe, so better avoid the
+build error for now.
+
+The error checking can be re-implemented later when we have a proper
+fix.
+
+Reported-by: Breno Lima <breno.lima@nxp.com>
+Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+ tools/imximage.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/tools/imximage.c b/tools/imximage.c
+index 0c43196..bef56f8 100644
+--- a/tools/imximage.c
++++ b/tools/imximage.c
+@@ -765,11 +765,6 @@ static uint32_t parse_cfg_file(struct imx_header *imxhdr, char *name)
+ 	(*set_dcd_rst)(imxhdr, dcd_len, name, lineno);
+ 	fclose(fd);
+ 
+-	/* Exit if there is no BOOT_FROM field specifying the flash_offset */
+-	if (imximage_ivt_offset == FLASH_OFFSET_UNDEFINED) {
+-		fprintf(stderr, "Error: No BOOT_FROM tag in %s\n", name);
+-		exit(EXIT_FAILURE);
+-	}
+ 	return dcd_len;
+ }
+ 
+-- 
+2.7.4
+
-- 
2.7.4

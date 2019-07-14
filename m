From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:46:17 +0200
Subject: [Buildroot] [git commit] package/uboot-tools: bump to version
 2019.07
Message-ID: <20190714134431.0235982AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87168927fae8988f444961f6240cf7029ff30e51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 2019.07.
- remove the patches that have been upstreamed.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Make-FIT-support-really-optional.patch    | 101 ---------------------
 ...ile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch |  28 ------
 package/uboot-tools/uboot-tools.hash               |   2 +-
 package/uboot-tools/uboot-tools.mk                 |   2 +-
 4 files changed, 2 insertions(+), 131 deletions(-)

diff --git a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
deleted file mode 100644
index 329245ffdd..0000000000
--- a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 794aeeb82ab7c0304e343499ee5d82c1f1c5c39a Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Sun, 8 May 2016 11:11:39 -0300
-Subject: [PATCH] Make FIT support really optional
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Due to some mistakes in the source code, it was not possible to really
-turn FIT support off. This commit fixes the problem by means of the
-following changes:
-
-- Enclose "bootm_host_load_image" and "bootm_host_load_images" between
-  checks for CONFIG_FIT_SIGNATURE, in common/bootm.c.
-
-- Enclose the declaration of "bootm_host_load_images" between checks for
-  CONFIG_FIT_SIGNATURE, in common/bootm.h.
-
-- Condition the compilation and linking of fit_common.o fit_image.o
-  image-host.o common/image-fit.o to CONFIG_FIT=y, in tools/Makefile.
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
-[fabio: adapt for 2016.07]
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
-[Ricardo: fix conditional compilation and linking of the files mentioned above
-for 2016.07]
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
-[J??rg: adapt for 2019.01]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- common/bootm.c  | 2 ++
- include/bootm.h | 2 ++
- tools/Makefile  | 6 ++----
- 3 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/common/bootm.c b/common/bootm.c
-index 8bf84ebcb7..ecc29fb7b4 100644
---- a/common/bootm.c
-+++ b/common/bootm.c
-@@ -922,6 +922,7 @@ void memmove_wd(void *to, void *from, size_t len, ulong chunksz)
- 	memmove(to, from, len);
- }
- 
-+#if defined(CONFIG_FIT_SIGNATURE)
- static int bootm_host_load_image(const void *fit, int req_image_type)
- {
- 	const char *fit_uname_config = NULL;
-@@ -986,5 +987,6 @@ int bootm_host_load_images(const void *fit, int cfg_noffset)
- 	/* Return the first error we found */
- 	return err;
- }
-+#endif
- 
- #endif /* ndef USE_HOSTCC */
-diff --git a/include/bootm.h b/include/bootm.h
-index dbd6f49c2d..f5fe9cb2d3 100644
---- a/include/bootm.h
-+++ b/include/bootm.h
-@@ -42,7 +42,9 @@ void lynxkdi_boot(image_header_t *hdr);
- 
- boot_os_fn *bootm_os_get_boot_func(int os);
- 
-+#if defined(CONFIG_FIT_SIGNATURE)
- int bootm_host_load_images(const void *fit, int cfg_noffset);
-+#endif
- 
- int boot_selected_os(int argc, char * const argv[], int state,
- 		     bootm_headers_t *images, boot_os_fn *boot_fn);
-diff --git a/tools/Makefile b/tools/Makefile
-index 081383d7a7..4d23c3941e 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -58,6 +58,7 @@ hostprogs-$(CONFIG_FIT_SIGNATURE) += fit_info fit_check_sign
- 
- hostprogs-$(CONFIG_CMD_BOOTEFI_SELFTEST) += file2include
- 
-+FIT_OBJS-$(CONFIG_FIT) := fit_common.o fit_image.o image-host.o common/image-fit.o
- FIT_SIG_OBJS-$(CONFIG_FIT_SIGNATURE) := common/image-sig.o
- 
- # The following files are synced with upstream DTC.
-@@ -80,16 +81,13 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
- # common objs for dumpimage and mkimage
- dumpimage-mkimage-objs := aisimage.o \
- 			atmelimage.o \
-+			$(FIT_OBJS-y) \
- 			$(FIT_SIG_OBJS-y) \
- 			common/bootm.o \
- 			lib/crc32.o \
- 			default_image.o \
- 			lib/fdtdec_common.o \
- 			lib/fdtdec.o \
--			fit_common.o \
--			fit_image.o \
--			common/image-fit.o \
--			image-host.o \
- 			common/image.o \
- 			imagetool.o \
- 			imximage.o \
--- 
-2.20.1
-
diff --git a/package/uboot-tools/0004-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch b/package/uboot-tools/0004-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch
deleted file mode 100644
index 5c54f4cea6..0000000000
--- a/package/uboot-tools/0004-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9f2dce5887bb52e8c7f9ef40a6733d70af72ff1c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 30 Apr 2019 18:45:17 +0200
-Subject: [PATCH] tools/Makefile: fix HOSTCFLAGS with CROSS_BUILD_TOOLS
-
-When CROSS_BUILD_TOOLS is set, set HOSTCFLAGS to CFLAGS otherwise CC
-will be used with HOSTCFLAGS which seems wrong
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/Makefile b/tools/Makefile
-index 12a3027e23..eadeba417d 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -272,6 +272,7 @@ subdir- += env
- 
- ifneq ($(CROSS_BUILD_TOOLS),)
- override HOSTCC = $(CC)
-+override HOSTCFLAGS = $(CFLAGS)
- 
- quiet_cmd_crosstools_strip = STRIP   $^
-       cmd_crosstools_strip = $(STRIP) $^; touch $@
--- 
-2.20.1
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index b8b06a2911..d2830eeba5 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  76b7772d156b3ddd7644c8a1736081e55b78828537ff714065d21dbade229bef  u-boot-2019.04.tar.bz2
+sha256  bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0  u-boot-2019.07.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index ba6b6db13f..6bfc2ff82d 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2019.04
+UBOOT_TOOLS_VERSION = 2019.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+

From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun,  8 May 2016 16:46:40 -0300
Subject: [Buildroot] [PATCH v3] uboot-tools: fix FIT support and make it
	optional
In-Reply-To: <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
References: <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1462736800-9552-2-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix several issues regarding the support for Flat Image Trees (FIT).

- Add a dependence on the dtc utilities because mkimage needs it when
  FIT is enabled; otherwise mkimage fails like this:

    $ mkimage -f firmware.its firmware.im
    sh: dtc: command not found

- Turn FIT support an independent switch for host and target controlled
  by BR2_PACKAGE_{HOST_,}UBOOT_TOOLS_FIT_SUPPORT

- Dettach FIT signature support from mkimage installation by means of a
  BR2_PACKAGE_{HOST_,}UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT, subordinated to
  ...TOOLS_FIT_SUPPORT.

- Improve the descriptions of the knobs to install mkimage, mkenvimage,
  dumpimage, fw_printenv and fw_setenv.

- Use $(TARGET_STRIP) to control stripping of the target utilities,
  otherwise they are always stripped.

- Add a patch to really allow turning FIT support on/off, which was not
  possible due to bugs in the code and in the tools Makefile.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

---

Changes v2 -> v3:

Turns out that the state of uboot-tools was even worst than initially
thought. Due to some mistakes in the source code, it was not possible
to really turn FIT support off. This required an additional patch that
fixes the code and the tools Makefile. This patch was already sent
upstream.

Moreover the package had many errors that needed to be fixed, as
described above.

Changes v1 -> v2:

First attempt to allow turning FIT support on/off.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 .../0004-Make-FIT-support-really-optional.patch    | 93 ++++++++++++++++++++++
 package/uboot-tools/Config.in                      | 47 ++++++++---
 package/uboot-tools/Config.in.host                 | 16 ++++
 package/uboot-tools/uboot-tools.mk                 | 35 +++++---
 4 files changed, 168 insertions(+), 23 deletions(-)
 create mode 100644 package/uboot-tools/0004-Make-FIT-support-really-optional.patch

diff --git a/package/uboot-tools/0004-Make-FIT-support-really-optional.patch b/package/uboot-tools/0004-Make-FIT-support-really-optional.patch
new file mode 100644
index 0000000..d8b8680
--- /dev/null
+++ b/package/uboot-tools/0004-Make-FIT-support-really-optional.patch
@@ -0,0 +1,93 @@
+From 1c0040aeed5d4dc17a549ad8a1a1c3e889f74e98 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sun, 8 May 2016 11:11:39 -0300
+Subject: [PATCH 4/4] Make FIT support really optional
+
+Due to some mistakes in the source code, it was not possible to really
+turn FIT support off. This commit fixes the problem by means of the
+following changes:
+
+- Enclose "bootm_host_load_image" and "bootm_host_load_images" between
+  checks for CONFIG_FIT_SIGNATURE, in common/bootm.c.
+
+- Enclose the declaration of "bootm_host_load_images" between checks for
+  CONFIG_FIT_SIGNATURE, in common/bootm.h.
+
+- Condition the compilation and linking of fit_common.o fit_image.o
+  image-host.o common/image-fit.o to CONFIG_FIT=y, in tools/Makefile.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ common/bootm.c  | 2 ++
+ include/bootm.h | 2 ++
+ tools/Makefile  | 6 ++----
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/common/bootm.c b/common/bootm.c
+index c965326..ab477ba 100644
+--- a/common/bootm.c
++++ b/common/bootm.c
+@@ -891,6 +891,7 @@ void memmove_wd(void *to, void *from, size_t len, ulong chunksz)
+ 	memmove(to, from, len);
+ }
+ 
++#if defined(CONFIG_FIT_SIGNATURE)
+ static int bootm_host_load_image(const void *fit, int req_image_type)
+ {
+ 	const char *fit_uname_config = NULL;
+@@ -955,5 +956,6 @@ int bootm_host_load_images(const void *fit, int cfg_noffset)
+ 	/* Return the first error we found */
+ 	return err;
+ }
++#endif
+ 
+ #endif /* ndef USE_HOSTCC */
+diff --git a/include/bootm.h b/include/bootm.h
+index 4981377..94d62a1 100644
+--- a/include/bootm.h
++++ b/include/bootm.h
+@@ -41,7 +41,9 @@ void lynxkdi_boot(image_header_t *hdr);
+ 
+ boot_os_fn *bootm_os_get_boot_func(int os);
+ 
++#if defined(CONFIG_FIT_SIGNATURE)
+ int bootm_host_load_images(const void *fit, int cfg_noffset);
++#endif
+ 
+ int boot_selected_os(int argc, char * const argv[], int state,
+ 		     bootm_headers_t *images, boot_os_fn *boot_fn);
+diff --git a/tools/Makefile b/tools/Makefile
+index da50e1b..0a3d279 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -54,6 +54,7 @@ mkenvimage-objs := mkenvimage.o os_support.o lib/crc32.o
+ hostprogs-y += dumpimage mkimage
+ hostprogs-$(CONFIG_FIT_SIGNATURE) += fit_info fit_check_sign
+ 
++FIT_OBJS-$(CONFIG_FIT) := fit_common.o fit_image.o image-host.o common/image-fit.o
+ FIT_SIG_OBJS-$(CONFIG_FIT_SIGNATURE) := common/image-sig.o
+ # Flattened device tree objects
+ LIBFDT_OBJS := $(addprefix lib/libfdt/, \
+@@ -68,18 +69,15 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
+ # common objs for dumpimage and mkimage
+ dumpimage-mkimage-objs := aisimage.o \
+ 			atmelimage.o \
++			$(FIT_OBJS-y) \
+ 			$(FIT_SIG_OBJS-y) \
+ 			common/bootm.o \
+ 			lib/crc32.o \
+ 			default_image.o \
+ 			lib/fdtdec_common.o \
+ 			lib/fdtdec.o \
+-			fit_common.o \
+-			fit_image.o \
+ 			gpimage.o \
+ 			gpimage-common.o \
+-			common/image-fit.o \
+-			image-host.o \
+ 			common/image.o \
+ 			imagetool.o \
+ 			imximage.o \
+-- 
+2.7.4
+
diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index aca310b..eddc39f 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -7,15 +7,22 @@ config BR2_PACKAGE_UBOOT_TOOLS
 
 if BR2_PACKAGE_UBOOT_TOOLS
 
-config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
-	bool "mkimage"
+config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
+	bool "Flattened Image Tree (FIT) support"
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_DTC_PROGRAMS
 	help
-	  The mkimage tool from Das U-Boot bootloader, which allows
-	  generation of U-Boot images in various formats.
+	  Enables support for Flattened Image Tree (FIT).
 
-if BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
+	  This option allows to boot the new uImage structrure,
+	  Flattened Image Tree.  FIT is formally a FDT, which can include
+	  images of various types (kernel, FDT blob, ramdisk, etc.)
+	  in a single blob.  To boot this new uImage structure,
+	  pass the address of the blob to the "bootm" command.
 
-config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
+if BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
+
+config BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	bool "FIT signature verification support"
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -38,25 +45,39 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
 
 endif
 
+config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
+	bool "mkimage"
+	help
+	  Install the mkimage tool on the target system
+
+	  The mkimage tool from Das U-Boot bootloader, which allows
+	  generation of U-Boot images in various formats.
+
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
 	help
+	  Install the mkenvimage tool on the target system
+
 	  The mkenvimage tool from Das U-Boot bootloader, which allows
 	  generation of a valid binary environment image from a text file
 	  describing the key=value pairs of the environment.
 
+config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
+	bool "dumpimage"
+	help
+	  Install the dumpimage tool on the target system
+
+	  The dumpimage tool from Das U-Boot bootloader, which allows
+	  extraction of data from U-Boot images.
+
 config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 	bool "fw_printenv"
 	default y
 	help
-	  The fw_printenv / fw_setenv tools from Das U-Boot
+	  Install the fw_printenv / fw_setenv tools on the target system
+
+	  The fw_printenv and fw_setenv tools from Das U-Boot
 	  bootloader, which allows access to the U-Boot environment
 	  from Linux.
 
-config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
-	bool "dumpimage"
-	help
-	  The dumpimage tool from Das U-Boot bootloader, which allows
-	  extraction of data from U-Boot images.
-
 endif
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index b5a42d9..292cc21 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -7,6 +7,20 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS
 
 if BR2_PACKAGE_HOST_UBOOT_TOOLS
 
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
+	bool "Flattened Image Tree (FIT) support"
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  Enables support for Flattened Image Tree (FIT).
+
+	  This option allows to boot the new uImage structrure,
+	  Flattened Image Tree.  FIT is formally a FDT, which can include
+	  images of various types (kernel, FDT blob, ramdisk, etc.)
+	  in a single blob.  To boot this new uImage structure,
+	  pass the address of the blob to the "bootm" command.
+
+if BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
+
 config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	bool "FIT signature verification support"
 	help
@@ -24,3 +38,5 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	  be verified in this way.
 
 endif
+
+endif
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index d1ebd6f..a21cda5 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -16,18 +16,30 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 endef
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
+UBOOT_TOOLS_CONFIG_FIT = CONFIG_FIT=$(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT)
+UBOOT_TOOLS_DEPENDENCIES += dtc
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
+UBOOT_TOOLS_CONFIG_FIT_SIGNATURE = CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT)
+UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
+endif # BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
+endif # BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
+
 define UBOOT_TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) 	\
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
+		STRIP=$(TARGET_STRIP)		\
 		CROSS_BUILD_TOOLS=y		\
-		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
+		$(UBOOT_TOOLS_CONFIG_FIT)	\
+		$(UBOOT_TOOLS_CONFIG_FIT_SIGNATURE) \
 		tools-only
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) 	\
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
+		STRIP=$(TARGET_STRIP)		\
 		env no-dot-config-targets=env
 endef
 
@@ -35,10 +47,7 @@ ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE),y)
 define UBOOT_TOOLS_INSTALL_MKIMAGE
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin/mkimage
 endef
-ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT),y)
-UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
-endif # BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
-endif # BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
+endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE),y)
 define UBOOT_TOOLS_INSTALL_MKENVIMAGE
@@ -74,18 +83,24 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
 endef
 
-ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
-endif
-
 define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
 	touch $(@D)/include/config/auto.conf
 endef
 
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
+HOST_UBOOT_TOOLS_CONFIG_FIT = CONFIG_FIT=$(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT)
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
+HOST_UBOOT_TOOLS_CONFIG_FIT_SIGNATURE = CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT)
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
+endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
+endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
+
 define HOST_UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE1) -C $(@D) 			\
-		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
+		$(HOST_UBOOT_TOOLS_CONFIG_FIT)	\
+		$(HOST_UBOOT_TOOLS_CONFIG_FIT_SIGNATURE) \
 		HOSTCC="$(HOSTCC)"		\
 		HOSTCFLAGS="$(HOST_CFLAGS)"	\
 		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
-- 
2.7.4

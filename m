From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 09:34:08 +0200
Subject: [Buildroot] [git commit master] rename TOOL_BUILD_DIR to
	TOOLCHAIN_DIR
Message-ID: <20090923073603.205C2777AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cb5710c538fce01f4875a64e6de4b37a7718005b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To reflect the new output directory hierachy rename the Makefile variable
TOOL_BUILD_DIR to TOOLCHAIN_DIR.

Signed-off-by: Michael Roth <mroth@nessie.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                           |    8 ++--
 package/Makefile.in                                |    8 ++--
 package/file/file.mk                               |   10 +++---
 package/gmp/gmp.mk                                 |    8 ++--
 package/lzma/lzma.mk                               |   18 +++++-----
 package/module-init-tools/module-init-tools.mk     |    4 +-
 package/modutils/modutils.mk                       |    4 +-
 package/mpfr/mpfr.mk                               |    8 ++--
 package/mtd/mtd-utils.git/mtd.mk                   |    6 ++--
 package/mtd/mtd-utils/mtd.mk                       |    6 ++--
 package/oprofile/oprofile.mk                       |    2 +-
 package/sed/sed.mk                                 |    8 ++--
 .../Atmel/at91rm9200df/at91rm9200df_defconfig      |    2 +-
 .../Atmel/at91sam9260dfc/at91sam9260dfc_defconfig  |    2 +-
 .../Atmel/at91sam9261ek/at91sam9261ek_defconfig    |    2 +-
 .../Atmel/at91sam9263ek/at91sam9263ek_defconfig    |    2 +-
 .../Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig  |    2 +-
 target/device/Atmel/atngw100/atngw100_defconfig    |    2 +-
 target/x86/syslinux/syslinux.mk                    |    2 +-
 toolchain/Makefile.in                              |    4 +-
 toolchain/binutils/binutils.mk                     |   12 +++---
 toolchain/ccache/Config.in                         |    2 +-
 toolchain/ccache/ccache.mk                         |    4 +-
 toolchain/elf2flt/elf2flt.mk                       |    4 +-
 toolchain/gcc/gcc-uclibc-3.x.mk                    |   14 ++++----
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   12 +++---
 toolchain/gdb/gdb.mk                               |   10 +++---
 .../kernel-headers/kernel-headers-new.makefile     |    8 ++--
 toolchain/kernel-headers/kernel-headers.mk         |    2 +-
 toolchain/uClibc/uclibc.mk                         |   36 ++++++++++----------
 30 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/Makefile b/Makefile
index c7697c9..a8a5858 100644
--- a/Makefile
+++ b/Makefile
@@ -326,7 +326,7 @@ $(BR2_DEPENDS_DIR): .config
 	mkdir -p $(@D)
 	cp -dpRf $(CONFIG)/buildroot-config $@
 
-dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs
@@ -337,7 +337,7 @@ world: dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 .PHONY: all world dirs clean dirclean distclean source \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
-	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 #############################################################
@@ -346,7 +346,7 @@ world: dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
+$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -446,7 +446,7 @@ distclean:
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)
 	rm -rf $(DL_DIR)
 endif
-	rm -rf $(TOOL_BUILD_DIR) $(BUILD_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
+	rm -rf $(TOOLCHAIN_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
 	.config.cmd
 	$(MAKE) -C $(CONFIG) clean
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 9852be2..fa7c740 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -112,10 +112,10 @@ COND_ARCH_FPU_SUFFIX:=
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
-TOOL_BUILD_DIR=$(BASE_DIR)/toolchain
+TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
-TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
+TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
@@ -124,8 +124,8 @@ KERNEL_CROSS=$(TARGET_CROSS)
 else
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-TOOL_BUILD_DIR=$(BASE_DIR)/toolchain
-TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
+TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
+TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 
diff --git a/package/file/file.mk b/package/file/file.mk
index fd04d20..1318ba8 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -7,7 +7,7 @@ FILE_VERSION:=4.26
 FILE_SOURCE:=file-$(FILE_VERSION).tar.gz
 FILE_SITE:=ftp://ftp.astron.com/pub/file/
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
-FILE_DIR1:=$(TOOL_BUILD_DIR)/file-$(FILE_VERSION)-host
+FILE_DIR1:=$(TOOLCHAIN_DIR)/file-$(FILE_VERSION)-host
 FILE_DIR2:=$(BUILD_DIR)/file-$(FILE_VERSION)-target
 FILE_CAT:=$(ZCAT)
 FILE_BINARY:=src/file
@@ -33,11 +33,11 @@ $(FILE_DIR1)/.configured: $(FILE_SOURCE_DIR)/.unpacked
 	)
 	touch $@
 
-$(TOOL_BUILD_DIR)/bin/file: $(FILE_DIR1)/.configured
+$(TOOLCHAIN_DIR)/bin/file: $(FILE_DIR1)/.configured
 	$(MAKE) -C $(FILE_DIR1) install
-	ln -sf $(FILE_DIR1)/install/bin/file $(TOOL_BUILD_DIR)/bin/file
+	ln -sf $(FILE_DIR1)/install/bin/file $(TOOLCHAIN_DIR)/bin/file
 
-host-file: $(TOOL_BUILD_DIR)/bin/file
+host-file: $(TOOLCHAIN_DIR)/bin/file
 
 host-file-clean:
 	-$(MAKE) -C $(FILE_DIR1) clean
@@ -84,7 +84,7 @@ $(FILE_DIR2)/.configured: $(FILE_SOURCE_DIR)/.unpacked
 	)
 	touch $@
 
-$(FILE_DIR2)/$(FILE_BINARY): $(FILE_DIR2)/.configured $(TOOL_BUILD_DIR)/bin/file
+$(FILE_DIR2)/$(FILE_BINARY): $(FILE_DIR2)/.configured $(TOOLCHAIN_DIR)/bin/file
 	ln -sf $(FILE_DIR1)/install/bin/file $(FILE_DIR2)/magic/file
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="-static" -C $(FILE_DIR2)
 
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index dafd5db..ae9f422 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -7,7 +7,7 @@ GMP_VERSION:=4.2.4
 GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
 GMP_SITE:=$(BR2_GNU_MIRROR)/gmp
 GMP_CAT:=$(BZCAT)
-GMP_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
+GMP_DIR:=$(TOOLCHAIN_DIR)/gmp-$(GMP_VERSION)
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_BINARY:=libgmp$(LIBTGTEXT)
 GMP_HOST_BINARY:=libgmp$(HOST_LIBEXT)
@@ -25,7 +25,7 @@ $(DL_DIR)/$(GMP_SOURCE):
 libgmp-source: $(DL_DIR)/$(GMP_SOURCE)
 
 $(GMP_DIR)/.unpacked: $(DL_DIR)/$(GMP_SOURCE)
-	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GMP_DIR) package/gmp/ \*.patch
 	$(CONFIG_UPDATE) $(@D)
 	touch $@
@@ -72,8 +72,8 @@ libgmp-clean:
 libgmp-dirclean:
 	rm -rf $(GMP_TARGET_DIR) $(GMP_DIR)
 
-GMP_DIR2:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)-host
-GMP_HOST_DIR:=$(TOOL_BUILD_DIR)/gmp
+GMP_DIR2:=$(TOOLCHAIN_DIR)/gmp-$(GMP_VERSION)-host
+GMP_HOST_DIR:=$(TOOLCHAIN_DIR)/gmp
 $(GMP_DIR2)/.configured: $(GMP_DIR)/.unpacked
 	mkdir -p $(GMP_DIR2)
 	(cd $(GMP_DIR2); rm -rf config.cache; \
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 89faf28..e383e7b 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -7,12 +7,12 @@ LZMA_VERSION:=4.32.6
 LZMA_SOURCE:=lzma-$(LZMA_VERSION).tar.gz
 LZMA_CAT:=$(ZCAT)
 LZMA_SITE:=http://tukaani.org/lzma/
-LZMA_HOST_DIR:=$(TOOL_BUILD_DIR)/lzma-$(LZMA_VERSION)
+LZMA_HOST_DIR:=$(TOOLCHAIN_DIR)/lzma-$(LZMA_VERSION)
 LZMA_TARGET_DIR:=$(BUILD_DIR)/lzma-$(LZMA_VERSION)
 LZMA_TARGET_BINARY:=bin/lzma
 
 # lzma binary for use on the host
-LZMA=$(TOOL_BUILD_DIR)/bin/lzma
+LZMA=$(TOOLCHAIN_DIR)/bin/lzma
 HOST_LZMA_BINARY=$(shell package/lzma/lzmacheck.sh)
 HOST_LZMA_IF_ANY=$(shell toolchain/dependencies/check-host-lzma.sh)
 
@@ -27,7 +27,7 @@ $(DL_DIR)/$(LZMA_SOURCE):
 ######################################################################
 
 $(LZMA_HOST_DIR)/.unpacked: $(DL_DIR)/$(LZMA_SOURCE)
-	$(LZMA_CAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(LZMA_CAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LZMA_HOST_DIR) package/lzma/ lzma\*.patch
 	touch $@
 
@@ -51,15 +51,15 @@ $(STAGING_DIR)/bin/lzma: $(LZMA_HOST_DIR)/src/lzma/lzma
 
 .PHONY: lzma-host use-lzma-host-binary
 use-lzma-host-binary:
-	if [ ! -f "$(TOOL_BUILD_DIR)/bin/lzma" ]; then \
-		[ -d $(TOOL_BUILD_DIR)/bin ] || mkdir -p $(TOOL_BUILD_DIR)/bin; \
-		ln -sf "$(HOST_LZMA_IF_ANY)" "$(TOOL_BUILD_DIR)/bin/lzma"; \
+	if [ ! -f "$(TOOLCHAIN_DIR)/bin/lzma" ]; then \
+		[ -d $(TOOLCHAIN_DIR)/bin ] || mkdir -p $(TOOLCHAIN_DIR)/bin; \
+		ln -sf "$(HOST_LZMA_IF_ANY)" "$(TOOLCHAIN_DIR)/bin/lzma"; \
 	fi
 
 build-lzma-host-binary: $(LZMA_HOST_DIR)/src/lzma/lzma
-	-rm -f $(TOOL_BUILD_DIR)/bin/lzma
-	[ -d $(TOOL_BUILD_DIR)/bin ] || mkdir $(TOOL_BUILD_DIR)/bin
-	cp -pf $(LZMA_HOST_DIR)/src/lzma/lzma $(TOOL_BUILD_DIR)/bin/lzma
+	-rm -f $(TOOLCHAIN_DIR)/bin/lzma
+	[ -d $(TOOLCHAIN_DIR)/bin ] || mkdir $(TOOLCHAIN_DIR)/bin
+	cp -pf $(LZMA_HOST_DIR)/src/lzma/lzma $(TOOLCHAIN_DIR)/bin/lzma
 
 host-lzma: $(HOST_LZMA_BINARY)
 
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index ff316cf..18907b9 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -8,7 +8,7 @@ MODULE_INIT_TOOLS_SOURCE=module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
 MODULE_INIT_TOOLS_CAT:=$(BZCAT)
 MODULE_INIT_TOOLS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
 MODULE_INIT_TOOLS_DIR=$(BUILD_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
-MODULE_INIT_TOOLS_DIR2=$(TOOL_BUILD_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
+MODULE_INIT_TOOLS_DIR2=$(TOOLCHAIN_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
 MODULE_INIT_TOOLS_BINARY=depmod
 MODULE_INIT_TOOLS_TARGET_BINARY=$(TARGET_DIR)/sbin/$(MODULE_INIT_TOOLS_BINARY)
 
@@ -73,7 +73,7 @@ module-init-tools-dirclean:
 
 
 $(MODULE_INIT_TOOLS_DIR2)/.source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
-	$(MODULE_INIT_TOOLS_CAT) $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE) | tar -C $(TOOL_BUILD_DIR) -xvf -
+	$(MODULE_INIT_TOOLS_CAT) $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE) | tar -C $(TOOLCHAIN_DIR) -xvf -
 	toolchain/patch-kernel.sh $(MODULE_INIT_TOOLS_DIR2) package/module-init-tools \*.patch
 	$(CONFIG_UPDATE) $(MODULE_INIT_TOOLS_DIR2)
 	touch $(MODULE_INIT_TOOLS_DIR2)/.source
diff --git a/package/modutils/modutils.mk b/package/modutils/modutils.mk
index dca94f4..a8b6fa5 100644
--- a/package/modutils/modutils.mk
+++ b/package/modutils/modutils.mk
@@ -8,7 +8,7 @@ MODUTILS_SOURCE=modutils-$(MODUTILS_VERSION).tar.bz2
 MODUTILS_CAT:=$(BZCAT)
 MODUTILS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/modutils/v2.4/
 MODUTILS_DIR1=$(BUILD_DIR)/modutils-$(MODUTILS_VERSION)
-MODUTILS_DIR2=$(TOOL_BUILD_DIR)/modutils-$(MODUTILS_VERSION)
+MODUTILS_DIR2=$(TOOLCHAIN_DIR)/modutils-$(MODUTILS_VERSION)
 MODUTILS_BINARY=depmod
 MODUTILS_TARGET_BINARY=sbin/$(MODUTILS_BINARY)
 
@@ -95,7 +95,7 @@ DEPMOD_EXTRA_STUFF=CFLAGS=-D__MIPSEL__
 endif
 
 $(MODUTILS_DIR2)/.source: $(DL_DIR)/$(MODUTILS_SOURCE)
-	$(MODUTILS_CAT) $(DL_DIR)/$(MODUTILS_SOURCE) | tar -C $(TOOL_BUILD_DIR) -xvf -
+	$(MODUTILS_CAT) $(DL_DIR)/$(MODUTILS_SOURCE) | tar -C $(TOOLCHAIN_DIR) -xvf -
 	toolchain/patch-kernel.sh $(MODUTILS_DIR2) \
 		package/modutils \*.patch
 	touch $@
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index b2787ec..4bd100c 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -9,7 +9,7 @@ MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
 MPFR_SITE:=http://www.mpfr.org/mpfr-$(MPFR_VERSION)
-MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
+MPFR_DIR:=$(TOOLCHAIN_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
 MPFR_HOST_BINARY:=libmpfr$(HOST_LIBEXT)
@@ -30,7 +30,7 @@ $(DL_DIR)/$(MPFR_SOURCE):
 	 $(call DOWNLOAD,$(MPFR_SITE),$(MPFR_SOURCE))
 
 $(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE) $(MPFR_PATCH_SOURCE)
-	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
 	$(CONFIG_UPDATE) $(@D)
 ifneq ($(MPFR_PATCH),)
@@ -86,8 +86,8 @@ libmpfr-clean:
 libmpfr-dirclean:
 	rm -rf $(MPFR_TARGET_DIR)
 
-MPFR_DIR2:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)-host
-MPFR_HOST_DIR:=$(TOOL_BUILD_DIR)/mpfr
+MPFR_DIR2:=$(TOOLCHAIN_DIR)/mpfr-$(MPFR_VERSION)-host
+MPFR_HOST_DIR:=$(TOOLCHAIN_DIR)/mpfr
 $(MPFR_DIR2)/.configured: $(MPFR_DIR)/.unpacked $(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY)
 	mkdir -p $(MPFR_DIR2)
 	(cd $(MPFR_DIR2); \
diff --git a/package/mtd/mtd-utils.git/mtd.mk b/package/mtd/mtd-utils.git/mtd.mk
index ca25ee5..b7e584e 100644
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ b/package/mtd/mtd-utils.git/mtd.mk
@@ -6,7 +6,7 @@
 MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
-MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
+MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd-utils-$(MTD_VERSION)
 MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
 MTD_CAT:=$(ZCAT)
 MTD_NAME:=mtd-utils
@@ -24,9 +24,9 @@ $(DL_DIR)/$(MTD_SOURCE):
 	$(WGET) -O $(DL_DIR)/$(MTD_SOURCE) "$(MTD_URL)"
 
 $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	rm -rf $(MTD_HOST_DIR)
-	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
+	mv $(TOOLCHAIN_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
 		package/mtd/mtd-utils.git mtd-utils-all\*.patch
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index 5a37f9e..a686661 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -6,7 +6,7 @@
 MTD_VERSION:=1.1.0
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
-MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd_orig
+MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd_orig
 MTD_DIR:=$(BUILD_DIR)/mtd_orig
 MTD_CAT:=$(BZCAT)
 MTD_NAME:=mtd-utils-$(MTD_VERSION)
@@ -24,9 +24,9 @@ $(DL_DIR)/$(MTD_SOURCE):
 	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
 
 $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	rm -rf $(MTD_HOST_DIR)
-	mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
+	mv $(TOOLCHAIN_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
 		package/mtd/mtd-utils mtd-utils-$(MTD_VERSION)-all\*.patch
 	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index ee6be3d..215e85b 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -6,7 +6,7 @@
 OPROFILE_VERSION := 0.9.4
 OPROFILE_CONF_OPT :=	--localstatedir=/var \
 			--with-extra-includes="$(BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)-target/bfd \
-			-I$(TOOL_BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)/include" \
+			-I$(TOOLCHAIN_DIR)/binutils-$(BR2_BINUTILS_VERSION)/include" \
 			--with-extra-libs=$(BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)-target/bfd \
 			--with-kernel-support
 
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 4d5313b..052f352 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -7,7 +7,7 @@ SED_VERSION:=4.1.5
 SED_SOURCE:=sed-$(SED_VERSION).tar.gz
 SED_SITE:=$(BR2_GNU_MIRROR)/sed
 SED_CAT:=$(ZCAT)
-SED_DIR1:=$(TOOL_BUILD_DIR)/sed-$(SED_VERSION)
+SED_DIR1:=$(TOOLCHAIN_DIR)/sed-$(SED_VERSION)
 SED_DIR2:=$(BUILD_DIR)/sed-$(SED_VERSION)
 SED_BINARY:=sed/sed
 SED_TARGET_BINARY:=bin/sed
@@ -15,7 +15,7 @@ ifeq ($(BR2_LARGEFILE),y)
 SED_CPPFLAGS=-D_FILE_OFFSET_BITS=64
 endif
 #HOST_SED_DIR:=$(STAGING_DIR)
-HOST_SED_DIR:=$(TOOL_BUILD_DIR)
+HOST_SED_DIR:=$(TOOLCHAIN_DIR)
 SED:=$(HOST_SED_DIR)/bin/sed -i -e
 HOST_SED_BINARY=$(shell package/sed/sedcheck.sh)
 HOST_SED_IF_ANY=$(shell toolchain/dependencies/check-host-sed.sh)
@@ -33,9 +33,9 @@ sed-source: $(DL_DIR)/$(SED_SOURCE)
 #
 #############################################################
 $(SED_DIR1)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
-	mkdir -p $(TOOL_BUILD_DIR)
+	mkdir -p $(TOOLCHAIN_DIR)
 	mkdir -p $(HOST_SED_DIR)/bin
-	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
 	$(CONFIG_UPDATE) $(SED_DIR1)/config
 	touch $@
diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
index 7eb49a0..de1db56 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
@@ -283,7 +283,7 @@ BR2_GCC_SHARED_LIBGCC=y
 # Ccache Options
 #
 BR2_CCACHE=y
-BR2_CCACHE_DIR="$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
+BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 
 #
 # Gdb Options
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
index e3a1566..c50b25d 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
@@ -303,7 +303,7 @@ BR2_GCC_SHARED_LIBGCC=y
 # Ccache Options
 #
 BR2_CCACHE=y
-BR2_CCACHE_DIR="$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
+BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 
 #
 # Gdb Options
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
index 5a922bc..d7e86aa 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
@@ -306,7 +306,7 @@ BR2_GCC_SHARED_LIBGCC=y
 # Ccache Options
 #
 BR2_CCACHE=y
-BR2_CCACHE_DIR="$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
+BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 
 #
 # Gdb Options
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
index ae8c0e0..93ff2f5 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
@@ -297,7 +297,7 @@ BR2_GCC_SHARED_LIBGCC=y
 # Ccache Options
 #
 BR2_CCACHE=y
-BR2_CCACHE_DIR="$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
+BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 
 #
 # Gdb Options
diff --git a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
index ef8fdba..a7a5c8c 100644
--- a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
+++ b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
@@ -297,7 +297,7 @@ BR2_GCC_SHARED_LIBGCC=y
 # Ccache Options
 #
 BR2_CCACHE=y
-BR2_CCACHE_DIR="$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
+BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 
 #
 # Gdb Options
diff --git a/target/device/Atmel/atngw100/atngw100_defconfig b/target/device/Atmel/atngw100/atngw100_defconfig
index e1840b8..8dfb872 100644
--- a/target/device/Atmel/atngw100/atngw100_defconfig
+++ b/target/device/Atmel/atngw100/atngw100_defconfig
@@ -237,7 +237,7 @@ BR2_GCC_SHARED_LIBGCC=y
 # Ccache Options
 #
 BR2_CCACHE=y
-BR2_CCACHE_DIR="$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
+BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 
 #
 # Gdb Options
diff --git a/target/x86/syslinux/syslinux.mk b/target/x86/syslinux/syslinux.mk
index 27930c7..3006dfd 100644
--- a/target/x86/syslinux/syslinux.mk
+++ b/target/x86/syslinux/syslinux.mk
@@ -24,7 +24,7 @@ ifeq ($(SYSLINUX_SUPPORTED_ARCH),y)
 
 SYSLINUX_VERSION:=3.61
 SYSLINUX_DIR=$(BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
-SYSLINUX_DIR2=$(TOOL_BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
+SYSLINUX_DIR2=$(TOOLCHAIN_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_CAT:=$(BZCAT)
 SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/Old
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index d312b56..db1a87a 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -21,7 +21,7 @@ ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 BR2_SYSROOT_PREFIX=# nothing, straight into /usr
 BR2_SYSROOT_STAGING_DESTDIR=DESTDIR=$(STAGING_DIR)/
 BR2_SYSROOT_TARGET_DESTDIR=DESTDIR=$(TARGET_DIR)/
-BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOL_BUILD_DIR)/uClibc_dev/
+BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
 BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)
 BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
 BR2_SYSROOT=--sysroot=$(STAGING_DIR)/
@@ -30,7 +30,7 @@ else
 BR2_SYSROOT_PREFIX=$(STAGING_DIR)
 BR2_SYSROOT_STAGING_DESTDIR=# nothing
 BR2_SYSROOT_TARGET_DESTDIR=# nothing
-BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOL_BUILD_DIR)/uClibc_dev/
+BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
 BR2_CONFIGURE_STAGING_SYSROOT=# nothing
 BR2_CONFIGURE_BUILD_TOOLS=# nothing
 BR2_SYSROOT=# nothing
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 0337ca4..8300420 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -32,8 +32,8 @@ BINUTILS_NO_MPFR:=y
 endif
 
 ifndef BINUTILS_NO_MPFR
-BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_LIBEXT) \
-	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
+BINUTILS_HOST_PREREQ:=$(TOOLCHAIN_DIR)/gmp/lib/libgmp$(HOST_LIBEXT) \
+	$(TOOLCHAIN_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
 
 BINUTILS_TARGET_PREREQ:=$(TARGET_DIR)/usr/lib/libgmp$(LIBTGTEXT) \
 	$(TARGET_DIR)/usr/lib/libmpfr$(LIBTGTEXT)
@@ -59,10 +59,10 @@ BINUTILS_PATCH_EXTRA:=$(call XTENSA_PATCH,binutils,$(BINUTILS_PATCH_DIR),. ..)
 endif
 
 BINUTILS_SOURCE:=binutils-$(BINUTILS_OFFICIAL_VERSION).tar.bz2
-BINUTILS_DIR:=$(TOOL_BUILD_DIR)/binutils-$(BINUTILS_OFFICIAL_VERSION)
+BINUTILS_DIR:=$(TOOLCHAIN_DIR)/binutils-$(BINUTILS_OFFICIAL_VERSION)
 BINUTILS_CAT:=$(BZCAT)
 
-BINUTILS_DIR1:=$(TOOL_BUILD_DIR)/binutils-$(BINUTILS_VERSION)-build
+BINUTILS_DIR1:=$(TOOLCHAIN_DIR)/binutils-$(BINUTILS_VERSION)-build
 
 $(DL_DIR)/$(BINUTILS_SOURCE):
 	mkdir -p $(DL_DIR)
@@ -70,9 +70,9 @@ $(DL_DIR)/$(BINUTILS_SOURCE):
 
 binutils-unpacked: $(BINUTILS_DIR)/.patched
 $(BINUTILS_DIR)/.unpacked: $(DL_DIR)/$(BINUTILS_SOURCE)
-	mkdir -p $(TOOL_BUILD_DIR)
+	mkdir -p $(TOOLCHAIN_DIR)
 	rm -rf $(BINUTILS_DIR)
-	$(BINUTILS_CAT) $(DL_DIR)/$(BINUTILS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(BINUTILS_CAT) $(DL_DIR)/$(BINUTILS_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
diff --git a/toolchain/ccache/Config.in b/toolchain/ccache/Config.in
index 70856a7..6f36650 100644
--- a/toolchain/ccache/Config.in
+++ b/toolchain/ccache/Config.in
@@ -10,7 +10,7 @@ config BR2_CCACHE
 config BR2_CCACHE_DIR
 	string "ccache dir location?"
 	depends on BR2_CCACHE
-	default "$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)/cache"
+	default "$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 	help
 	    Where ccache should store cached files.
 
diff --git a/toolchain/ccache/ccache.mk b/toolchain/ccache/ccache.mk
index 723b871..43ed2a7 100644
--- a/toolchain/ccache/ccache.mk
+++ b/toolchain/ccache/ccache.mk
@@ -6,7 +6,7 @@
 CCACHE_VER:=2.4
 CCACHE_SITE:=http://samba.org/ftp/ccache
 CCACHE_SOURCE:=ccache-$(CCACHE_VER).tar.gz
-CCACHE_DIR1:=$(TOOL_BUILD_DIR)/ccache-$(CCACHE_VER)
+CCACHE_DIR1:=$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)
 CCACHE_DIR2:=$(BUILD_DIR)/ccache-$(CCACHE_VER)
 CCACHE_CAT:=$(ZCAT)
 CCACHE_BINARY:=ccache
@@ -16,7 +16,7 @@ $(DL_DIR)/$(CCACHE_SOURCE):
 	$(call DOWNLOAD,$(CCACHE_SITE),$(CCACHE_SOURCE))
 
 $(CCACHE_DIR1)/.unpacked: $(DL_DIR)/$(CCACHE_SOURCE)
-	$(CCACHE_CAT) $(DL_DIR)/$(CCACHE_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(CCACHE_CAT) $(DL_DIR)/$(CCACHE_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	touch $@
 
 $(CCACHE_DIR1)/.patched: $(CCACHE_DIR1)/.unpacked
diff --git a/toolchain/elf2flt/elf2flt.mk b/toolchain/elf2flt/elf2flt.mk
index f5a92b1..ac1bebd 100644
--- a/toolchain/elf2flt/elf2flt.mk
+++ b/toolchain/elf2flt/elf2flt.mk
@@ -6,11 +6,11 @@
 
 # we keep a local checkout of uClinux CVS
 ELF2FLT_SOURCE:=$(ELF2FLT_DIR)/elf2flt
-ELF2FLT_DIR:=$(TOOL_BUILD_DIR)/elf2flt
+ELF2FLT_DIR:=$(TOOLCHAIN_DIR)/elf2flt
 ELF2FLT_BINARY:=elf2flt
 
 $(ELF2FLT_DIR)/.unpacked:
-	cp -r toolchain/elf2flt/elf2flt "$(TOOL_BUILD_DIR)/elf2flt"
+	cp -r toolchain/elf2flt/elf2flt "$(TOOLCHAIN_DIR)/elf2flt"
 	touch $@
 
 $(ELF2FLT_DIR)/.patched: $(ELF2FLT_DIR)/.unpacked
diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index dde609b..1652aaf 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -40,7 +40,7 @@ GCC_PATCH_DIR:=toolchain/gcc/ext_source/$(VENDOR_PATCH_DIR)/$(GCC_OFFICIAL_VERSI
 endif
 
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
-GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
+GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_OFFICIAL_VER)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 ifeq ($(GCC_SNAP_DATE),)
@@ -111,7 +111,7 @@ GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
 ifeq ($(BR2_INSTALL_FORTRAN),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
 #GCC_TARGET_PREREQ += $(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libgmp.so
-#GCC_STAGING_PREREQ+= $(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
+#GCC_STAGING_PREREQ+= $(TOOLCHAIN_DIR)/mpfr/lib/libmpfr.so
 GCC_WITH_TARGET_GMP=--with-gmp="$(GMP_TARGET_DIR)"
 GCC_WITH_TARGET_MPFR=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
@@ -130,7 +130,7 @@ HOST_SOURCE+=gcc-source
 # build the first pass gcc compiler
 #
 #############################################################
-GCC_BUILD_DIR1:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-initial
+GCC_BUILD_DIR1:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-initial
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
@@ -138,8 +138,8 @@ $(DL_DIR)/$(GCC_SOURCE):
 
 gcc-unpacked: $(GCC_DIR)/.patched
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
-	mkdir -p $(TOOL_BUILD_DIR)
-	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(TOOLCHAIN_DIR)
+	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
@@ -176,7 +176,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--enable-languages=c \
-		--with-sysroot=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
@@ -226,7 +226,7 @@ gcc_initial-dirclean:
 # affect gcc-target. However, I haven't tested gcc-target yet so no
 # guarantees. mjn3
 
-GCC_BUILD_DIR2:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final
+GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR2)
 	# Important! Required for limits.h to be fixed.
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 4129152..98295e3 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -56,7 +56,7 @@ GCC_PATCH_EXTRA:=$(call XTENSA_PATCH,gcc,$(GCC_PATCH_DIR),. ..)
 endif
 
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VERSION).tar.bz2
-GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VERSION)
+GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_OFFICIAL_VERSION)
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=nope
 GCC_SRC_DIR:=$(GCC_DIR)
@@ -125,7 +125,7 @@ GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
 ifeq ($(BR2_INSTALL_FORTRAN),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
 #GCC_TARGET_PREREQ+=$(TARGET_DIR)/usr/lib/libmpfr.so $(TARGET_DIR)/usr/lib/libgmp.so
-#GCC_STAGING_PREREQ+=$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
+#GCC_STAGING_PREREQ+=$(TOOLCHAIN_DIR)/mpfr/lib/libmpfr.so
 GCC_WITH_TARGET_GMP=--with-gmp="$(GMP_TARGET_DIR)"
 GCC_WITH_TARGET_MPFR=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
@@ -160,9 +160,9 @@ $(DL_DIR)/$(GCC_SOURCE):
 
 gcc-unpacked: $(GCC_DIR)/.patched
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
-	mkdir -p $(TOOL_BUILD_DIR)
+	mkdir -p $(TOOLCHAIN_DIR)
 	rm -rf $(GCC_DIR)
-	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
@@ -196,7 +196,7 @@ endif
 # build the first pass gcc compiler
 #
 #############################################################
-GCC_BUILD_DIR1:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-initial
+GCC_BUILD_DIR1:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-initial
 
 
 # The --without-headers option stopped working with gcc 3.0 and has never been
@@ -274,7 +274,7 @@ gcc_initial-dirclean:
 # affect gcc-target. However, I haven't tested gcc-target yet so no
 # guarantees. mjn3
 
-GCC_BUILD_DIR2:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final
+GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR2)
 	# Important! Required for limits.h to be fixed.
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 569f449..c51348f 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -23,19 +23,19 @@ include target/xtensa/patch.in
 GDB_PATCH_EXTRA:=$(call XTENSA_PATCH,gdb,$(GDB_PATCH_DIR),. ..)
 endif
 
-GDB_DIR:=$(TOOL_BUILD_DIR)/gdb-$(GDB_OFFICIAL_VERSION)
+GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_OFFICIAL_VERSION)
 
 $(DL_DIR)/$(GDB_SOURCE):
 	$(call DOWNLOAD,$(GDB_SITE),$(GDB_SOURCE))
 
 gdb-unpacked: $(GDB_DIR)/.unpacked
 $(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
-	mkdir -p $(TOOL_BUILD_DIR)
-	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(TOOLCHAIN_DIR)
+	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 ifeq ($(GDB_VERSION),snapshot)
 	GDB_REAL_DIR=$(shell \
 		tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1)
-	ln -sf $(TOOL_BUILD_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
+	ln -sf $(TOOLCHAIN_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
 endif
 	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch $(GDB_PATCH_EXTRA)
 	$(CONFIG_UPDATE) $(@D)
@@ -174,7 +174,7 @@ gdbserver-dirclean:
 #
 ######################################################################
 
-GDB_HOST_DIR:=$(TOOL_BUILD_DIR)/gdbhost-$(GDB_VERSION)
+GDB_HOST_DIR:=$(TOOLCHAIN_DIR)/gdbhost-$(GDB_VERSION)
 
 $(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
 	mkdir -p $(GDB_HOST_DIR)
diff --git a/toolchain/kernel-headers/kernel-headers-new.makefile b/toolchain/kernel-headers/kernel-headers-new.makefile
index 2074e46..29deaae 100644
--- a/toolchain/kernel-headers/kernel-headers-new.makefile
+++ b/toolchain/kernel-headers/kernel-headers-new.makefile
@@ -19,8 +19,8 @@ LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.26.8")
 LINUX_RT_VERSION:=rt16
@@ -39,8 +39,8 @@ endif
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	@echo "*** Using kernel-headers generated from kernel source"
 	rm -rf $(LINUX_HEADERS_DIR)
-	[ -d $(TOOL_BUILD_DIR) ] || $(INSTALL) -d $(TOOL_BUILD_DIR)
-	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	[ -d $(TOOLCHAIN_DIR) ] || $(INSTALL) -d $(TOOLCHAIN_DIR)
+	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	touch $@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 7897a45..1f637f9 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -11,7 +11,7 @@ DEFAULT_KERNEL_HEADERS:=$(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 
 LINUX_HEADERS_SITE:=127.0.0.1
 LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-null
+LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-libc-headers-null
 
 KERNEL_ARCH:=$(shell $(SHELL) -c "echo \"$(ARCH)\" | sed -e \"s/-.*//\" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 3a5e770..292f895 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -18,9 +18,9 @@ UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
-UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc
+UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc
 else
-UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
+UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
 UCLIBC_SITE:=http://www.uclibc.org/downloads
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
 UCLIBC_SITE:=$(VENDOR_SITE)
@@ -94,9 +94,9 @@ endif
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
-	mkdir -p $(TOOL_BUILD_DIR)
+	mkdir -p $(TOOLCHAIN_DIR)
 	rm -rf $(UCLIBC_DIR)
-	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
 	touch $@
 
 uclibc-patched: $(UCLIBC_DIR)/.patched
@@ -412,14 +412,14 @@ endif
 
 $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 	cp -f $(UCLIBC_DIR)/.oldconfig $(UCLIBC_DIR)/.config
-	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
-	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
-	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
+	mkdir -p $(TOOLCHAIN_DIR)/uClibc_dev/usr/include
+	mkdir -p $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib
+	mkdir -p $(TOOLCHAIN_DIR)/uClibc_dev/lib
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
 		oldconfig
 	touch $@
@@ -427,27 +427,27 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.config
 	set -x && $(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" headers \
 		$(if $(BR2_UCLIBC_VERSION_0_9_28_3),install_dev,install_headers)
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
-	if [ ! -f $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/linux/version.h ]; then \
+	if [ ! -f $(TOOLCHAIN_DIR)/uClibc_dev/usr/include/linux/version.h ]; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
-			$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
+			$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
 	fi
 else
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm \
-			$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
+			$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/linux \
-			$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
+			$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
 		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ]; then \
 			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
-				$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/; \
+				$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
 		fi; \
 	fi
 endif
@@ -466,9 +466,9 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial) $(LIBFLOAT_TA
 uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
 		menuconfig && \
 	touch -c $(UCLIBC_DIR)/.config
-- 
1.6.3.3

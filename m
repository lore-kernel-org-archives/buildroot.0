From: Michael Roth <mroth@nessie.de>
Date: Mon, 18 May 2009 15:31:38 +0200
Subject: [Buildroot] [PATCH] Makefile: New macro 'strip_dquotes' to remove
	quoting
Message-ID: <1242653498-28145-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Everywhere in Makefiles there are lines of the form:

	FOOBAR = $(strip $(subst ",, $(FOOBAR)))
	#"))

The #")) part is a (ugly) workaround to fix syntax
highlighting in miscellaneous editors.

Replace these constructs with:

	FOOBAR = $(call strip_dquotes, $(FOOBAR))

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 Makefile                                           |    7 ++-
 package/Makefile.autotools.in                      |    2 +-
 package/Makefile.in                                |   25 +++-----
 package/busybox/busybox.mk                         |    6 +-
 package/haserl/haserl.mk                           |    3 +-
 package/microperl/microperl.mk                     |    3 +-
 package/qtopia4/qtopia4.mk                         |   18 ++----
 package/quagga/quagga.mk                           |    3 +-
 package/socat/socat.mk                             |    9 +--
 project/Makefile.in                                |   69 +++++++-------------
 scripts/test/Makefile                              |    4 +-
 target/Makefile.in                                 |   22 ++----
 target/cpio/cpioroot.mk                            |    5 +-
 target/cramfs/cramfs.mk                            |    3 +-
 target/device/ARMLTD/Makefile.in                   |    6 +-
 target/device/Atmel/DataFlashBoot/DataflashBoot.mk |    3 +-
 target/device/Atmel/Makefile.in                    |   22 ++----
 target/device/Atmel/arch-arm/u-boot/Makefile.in    |    3 +-
 target/device/Atmel/at91bootstrap/at91bootstrap.mk |   18 ++----
 target/device/KwikByte/Makefile.in                 |   10 +--
 target/device/x86/i686/Makefile.in                 |    6 +-
 target/ext2/ext2root.mk                            |    6 +-
 target/generic/Makefile.in                         |    6 +-
 target/iso9660/iso9660.mk                          |    6 +-
 target/jffs2/jffs2root.mk                          |    6 +-
 target/linux/Makefile.in                           |   19 ++----
 target/linux/Makefile.in.advanced                  |   54 +++++----------
 target/squashfs/squashfsroot.mk                    |    3 +-
 target/tar/tarroot.mk                              |    3 +-
 target/u-boot/Makefile.in                          |   30 +++------
 target/ubifs/ubifsroot.mk                          |    6 +-
 toolchain/binutils/binutils.mk                     |    6 +-
 toolchain/external-toolchain/ext-tool.mk           |   10 +--
 toolchain/gcc/Makefile.in                          |   28 +++------
 toolchain/gdb/gdb.mk                               |    3 +-
 toolchain/kernel-headers/kernel-headers.mk         |    3 +-
 toolchain/uClibc/uclibc.mk                         |   12 +--
 37 files changed, 155 insertions(+), 293 deletions(-)

diff --git a/Makefile b/Makefile
index 76dd2cd..609d1ca 100644
--- a/Makefile
+++ b/Makefile
@@ -45,6 +45,10 @@ comma:=,
 empty:=
 space:=$(empty) $(empty)
 
+# Syntax highlighting friendly macro to remove double quotes
+strip_dquotes = $(strip $(subst ",,$(1)))
+#"))
+
 # $(shell find . -name *_defconfig |sed 's/.*\///')
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
@@ -362,8 +366,7 @@ endif
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(PROJECT_BUILD_DIR)/locales.nopurge
-LOCALE_NOPURGE=$(strip $(subst ",,$(BR2_ENABLE_LOCALE_WHITELIST)))
-#"))
+LOCALE_NOPURGE=$(call strip_dquotes,$(BR2_ENABLE_LOCALE_WHITELIST))
 
 target-purgelocales:
 	rm -f $(LOCALE_WHITELIST)
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d6da7e8..7fd9203 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -140,7 +140,7 @@ DOWNLOAD=$(WGET) -P $(DL_DIR) $(1)/$(2)
 else
 define DOWNLOAD
 	$(Q)test -e $(DL_DIR)/$(2) || \
-	for site in $(strip $(subst ",,$(BR2_PRIMARY_SITE))) $(1) $(strip $(subst ",,$(BR2_BACKUP_SITE))); \
+	for site in $(call strip_dquotes,$(BR2_PRIMARY_SITE)) $(1) $(call strip_dquotes,$(BR2_BACKUP_SITE)); \
 	do $(WGET) -P $(DL_DIR) $$site/$(2) && exit; done
 endef
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
index 7daa3b4..b55f9d6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -45,12 +45,9 @@ TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
 TARGET_LDFLAGS+= $(BR2_SYSROOT)
 endif
 
-CC_TARGET_TUNE_:=$(strip $(subst ",,$(BR2_GCC_TARGET_TUNE)))
-#"))
-CC_TARGET_ARCH_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ARCH)))
-#"))
-CC_TARGET_ABI_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ABI)))
-#"))
+CC_TARGET_TUNE_:=$(call strip_dquotes,$(BR2_GCC_TARGET_TUNE))
+CC_TARGET_ARCH_:=$(call strip_dquotes,$(BR2_GCC_TARGET_ARCH))
+CC_TARGET_ABI_:=$(call strip_dquotes,$(BR2_GCC_TARGET_ABI))
 ifneq ($(CC_TARGET_TUNE_),)
 TARGET_CFLAGS+=-mtune=$(CC_TARGET_TUNE_)
 endif
@@ -99,7 +96,7 @@ TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
 #########################################################################
 #ifeq ($(BR2_ROOTFS_SUFFIX),)
-ROOTFS_SUFFIX:=$(strip $(subst ",, $(BR2_ROOTFS_SUFFIX)))
+ROOTFS_SUFFIX:=$(call strip_dquotes, $(BR2_ROOTFS_SUFFIX))
 ifeq ($(ROOTFS_SUFFIX),)
 ROOTFS_SUFFIX:=
 else
@@ -107,7 +104,7 @@ XXXX=xxxx
 ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
 endif
 
-ifeq ($(strip $(subst ",, $(BR2_FPU_SUFFIX))),y)
+ifeq ($(call strip_dquotes, $(BR2_FPU_SUFFIX)),y)
 COND_ARCH_FPU_SUFFIX:=$(ARCH_FPU_SUFFIX)
 else
 COND_ARCH_FPU_SUFFIX:=
@@ -124,10 +121,8 @@ REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 KERNEL_CROSS=$(TARGET_CROSS)
 else
-TOOLCHAIN_EXTERNAL_PREFIX:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PREFIX)))
-#"))
-TOOLCHAIN_EXTERNAL_PATH:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PATH)))
-#"))
+TOOLCHAIN_EXTERNAL_PREFIX:=$(call strip_dquotes, $(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
+TOOLCHAIN_EXTERNAL_PATH:=$(call strip_dquotes, $(BR2_TOOLCHAIN_EXTERNAL_PATH))
 #TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 TARGET_PATH="$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
@@ -206,8 +201,7 @@ HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 	-e 's/cris.*/cris/' \
 	-e 's/i[3-9]86/i386/' \
 	)
-GNU_HOST_NAME:=$(HOST_ARCH)-$(subst ",,$(BR2_GNU_BUILD_SUFFIX))
-#")
+GNU_HOST_NAME:=$(HOST_ARCH)-$(call strip_dquotes,$(BR2_GNU_BUILD_SUFFIX))
 
 AUTO_CONFIGURE_TARGET=\
 	$(TARGET_CONFIGURE_OPTS) \
@@ -397,7 +391,6 @@ ifeq ($(BR2_PACKAGE_XGGI),y)
 XSERVER+=xggi
 endif
 
-X11_PREFIX:=$(strip $(subst ",, $(BR2_X11_PREFIX)))
-#"))
+X11_PREFIX:=$(call strip_dquotes, $(BR2_X11_PREFIX))
 
 include package/Makefile.autotools.in
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fcec41a..10a4337 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -11,8 +11,7 @@ BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
 else
-BUSYBOX_VERSION=$(strip $(subst ",, $(BR2_BUSYBOX_VERSION)))
-#"))
+BUSYBOX_VERSION=$(call strip_dquotes, $(BR2_BUSYBOX_VERSION))
 BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox-$(BUSYBOX_VERSION)
 BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
@@ -21,8 +20,7 @@ endif
 BUSYBOX_UNZIP=$(BZCAT)
 
 ifndef BUSYBOX_CONFIG_FILE
-BUSYBOX_CONFIG_FILE=$(subst ",, $(strip $(BR2_PACKAGE_BUSYBOX_CONFIG)))
-#")
+BUSYBOX_CONFIG_FILE=$(call strip_dquotes,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
 $(DL_DIR)/$(BUSYBOX_SOURCE):
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 33d9615..4be20ae 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-HASERL_VERSION:=$(strip $(subst ",,$(BR2_PACKAGE_HASERL_VERSION)))
-#"))
+HASERL_VERSION:=$(call strip_dquotes,$(BR2_PACKAGE_HASERL_VERSION))
 HASERL_SOURCE:=haserl-$(HASERL_VERSION).tar.gz
 HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
 HASERL_AUTORECONF:=no
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 5a41f38..c6ea3d1 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -11,8 +11,7 @@ MICROPERL_SITE=ftp://ftp.cpan.org/pub/CPAN/src/5.0
 MICROPERL_DIR=$(BUILD_DIR)/perl-$(MICROPERL_VERSION)
 
 MICROPERL_MODS_DIR=/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VERSION)
-MICROPERL_MODS=$(subst ",,$(BR2_PACKAGE_MICROPERL_MODULES))
-# ")
+MICROPERL_MODS=$(call strip_dquotes,$(BR2_PACKAGE_MICROPERL_MODULES))
 ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
 MICROPERL_MODS+=File/Basename.pm Errno.pm Config.pm IO/File.pm Symbol.pm \
 	SelectSaver.pm IO/Seekable.pm IO/Handle.pm IO.pm XSLoader.pm \
diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index a198a41..e602c72 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -24,10 +24,8 @@
 QTOPIA4_VERSION:=4.5.1
 QTOPIA4_CAT:=$(BZCAT)
 
-BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
-#"))
-BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD)))
-#"))
+BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(call strip_dquotes, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME))
+BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD:=$(call strip_dquotes, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD))
 
 QTOPIA4_CONFIGURE:=#empty
 
@@ -165,8 +163,7 @@ ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB),y)
 QTOPIA4_CONFIGURE += -qt-mouse-tslib
 QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
-QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
-#"))
+QTOPIA4_TSLIB_DEB:=$(call strip_dquotes, $(QTOPIA4_TSLIB_DEB))
 else
 QTOPIA4_CONFIGURE += -no-mouse-tslib
 endif
@@ -323,10 +320,8 @@ else
 QTOPIA4_CONFIGURE+= -no-webkit
 endif
 
-QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
-#"))
-BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
-#"))
+QTOPIA4_CONFIGURE:=$(call strip_dquotes, $(QTOPIA4_CONFIGURE))
+BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(call strip_dquotes, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM))
 
 # x86x86fix
 # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
@@ -334,8 +329,7 @@ BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_
 ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
 ifeq ($(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM),x86)
 QTOPIA4_CONFIGURE+= -platform linux-g++
-QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
-#"))
+QTOPIA4_CONFIGURE:=$(call strip_dquotes, $(QTOPIA4_CONFIGURE))
 endif
 endif
 # End of workaround.
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 8ffc156..9857b41 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -110,8 +110,7 @@ else
 QUAGGA_CONFIGURE+=--disable-opaque-lsa
 endif
 
-QUAGGA_CONFIGURE+=$(subst ",,$(BR2_PACKAGE_QUAGGA_CONFIGURE))
-# ")
+QUAGGA_CONFIGURE+=$(call strip_dquotes,$(BR2_PACKAGE_QUAGGA_CONFIGURE))
 
 $(DL_DIR)/$(QUAGGA_SOURCE):
 	$(call DOWNLOAD,$(QUAGGA_SITE),$(QUAGGA_SOURCE))
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index d45b306..d63358b 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -21,12 +21,9 @@ SOCAT_DIR=$(BUILD_DIR)/socat-$(SOCAT_MAJOR_VERSION)
 SOCAT_WORKDIR=$(SOCAT_DIR)
 
 # SOCAT Configure opts taken from Config/config.Linux-2.6.24.h
-CRDLY_SHIFT := $(strip $(subst ",,$(BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT)))
-#"))
-TABDLY_SHIFT := $(strip $(subst ",,$(BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT)))
-#"))
-CSIZE_SHIFT := $(strip $(subst ",,$(BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT)))
-#"))
+CRDLY_SHIFT := $(call strip_dquotes,$(BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT))
+TABDLY_SHIFT := $(call strip_dquotes,$(BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT))
+CSIZE_SHIFT := $(call strip_dquotes,$(BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT))
 
 SOCAT_CONFIGURE_OPTS :=
 ifneq ($(CRDLY_SHIFT),)
diff --git a/project/Makefile.in b/project/Makefile.in
index 49aec14..6b2b4e8 100644
--- a/project/Makefile.in
+++ b/project/Makefile.in
@@ -1,30 +1,19 @@
-PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
-#"))
-TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
-#"))
-BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
-#"))
+PROJECT:=$(call strip_dquotes,$(BR2_PROJECT))
+TARGET_HOSTNAME:=$(call strip_dquotes,$(BR2_HOSTNAME))
+BANNER:=$(call strip_dquotes,$(BR2_BANNER))
 
 # silent mode requested?
 QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q,)
 
 # Strip off the annoying quoting
-ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
-#"))
-WGET:=$(strip $(subst ",, $(BR2_WGET))) $(SPIDER) $(QUIET)
-#"))
-SVN_CO:=$(strip $(subst ",, $(BR2_SVN_CO))) $(QUIET)
-#"))
-SVN_UP:=$(strip $(subst ",, $(BR2_SVN_UP))) $(QUIET)
-#"))
-GIT:=$(strip $(subst ",, $(BR2_GIT))) $(QUIET)
-#"))
-ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
-#"))
-BZCAT:=$(strip $(subst ",, $(BR2_BZCAT)))
-#"))
-TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
-#")
+ARCH:=$(call strip_dquotes, $(BR2_ARCH))
+WGET:=$(call strip_dquotes, $(BR2_WGET)) $(SPIDER) $(QUIET)
+SVN_CO:=$(call strip_dquotes, $(BR2_SVN_CO)) $(QUIET)
+SVN_UP:=$(call strip_dquotes, $(BR2_SVN_UP)) $(QUIET)
+GIT:=$(call strip_dquotes, $(BR2_GIT)) $(QUIET)
+ZCAT:=$(call strip_dquotes, $(BR2_ZCAT))
+BZCAT:=$(call strip_dquotes, $(BR2_BZCAT))
+TAR_OPTIONS=$(call strip_dquotes, $(BR2_TAR_OPTIONS)) -xf
 
 # Buildroot supports building out of tree similarly to the Linux kernel.
 # To use, add O= to the make command line (make O=/tmp/build)
@@ -42,10 +31,8 @@ MAKEOVERRIDES =
 endif
 endif
 
-TOPDIR_PREFIX:=$(strip $(subst ",, $(BR2_TOPDIR_PREFIX)))_
-#"))
-TOPDIR_SUFFIX:=_$(strip $(subst ",, $(BR2_TOPDIR_SUFFIX)))
-#"))
+TOPDIR_PREFIX:=$(call strip_dquotes, $(BR2_TOPDIR_PREFIX))_
+TOPDIR_SUFFIX:=_$(call strip_dquotes, $(BR2_TOPDIR_SUFFIX))
 ifeq ($(TOPDIR_PREFIX),_)
 TOPDIR_PREFIX:=
 endif
@@ -53,8 +40,7 @@ ifeq ($(TOPDIR_SUFFIX),_)
 TOPDIR_SUFFIX:=
 endif
 
-DL_DIR=$(strip $(subst ",, $(BR2_DL_DIR)))
-#"))
+DL_DIR=$(call strip_dquotes, $(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR:=$(BASE_DIR)/dl
 endif
@@ -62,11 +48,9 @@ endif
 # All non-configurable packages should be built in BUILD_DIR
 BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
-GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
-#"))
+GNU_TARGET_SUFFIX:=-$(call strip_dquotes, $(BR2_GNU_TARGET_SUFFIX))
 
-STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
-#"))
+STAGING_DIR:=$(call strip_dquotes, $(BR2_STAGING_DIR))
 
 # packages compiled for the host goes here
 HOST_DIR:=$(BUILD_DIR)/host_dir
@@ -81,17 +65,10 @@ BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
 TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
 
 # define values for prepatched source trees for toolchains
-VENDOR_SITE:=$(strip $(subst ",,$(BR2_VENDOR_SITE)))
-#"))
-VENDOR_SUFFIX:=$(strip $(subst ",,$(BR2_VENDOR_SUFFIX)))
-#"))
-VENDOR_BINUTILS_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_BINUTILS_RELEASE)))
-#"))
-VENDOR_GCC_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_GCC_RELEASE)))
-#"))
-VENDOR_UCLIBC_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_UCLIBC_RELEASE)))
-#"))
-VENDOR_GDB_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_GDB_RELEASE)))
-#"))
-VENDOR_PATCH_DIR:=$(strip $(subst ",,$(BR2_VENDOR_PATCH_DIR)))
-#"))
+VENDOR_SITE:=$(call strip_dquotes,$(BR2_VENDOR_SITE))
+VENDOR_SUFFIX:=$(call strip_dquotes,$(BR2_VENDOR_SUFFIX))
+VENDOR_BINUTILS_RELEASE:=$(call strip_dquotes,$(BR2_VENDOR_BINUTILS_RELEASE))
+VENDOR_GCC_RELEASE:=$(call strip_dquotes,$(BR2_VENDOR_GCC_RELEASE))
+VENDOR_UCLIBC_RELEASE:=$(call strip_dquotes,$(BR2_VENDOR_UCLIBC_RELEASE))
+VENDOR_GDB_RELEASE:=$(call strip_dquotes,$(BR2_VENDOR_GDB_RELEASE))
+VENDOR_PATCH_DIR:=$(call strip_dquotes,$(BR2_VENDOR_PATCH_DIR))
diff --git a/scripts/test/Makefile b/scripts/test/Makefile
index 7396cf7..cecf298 100644
--- a/scripts/test/Makefile
+++ b/scripts/test/Makefile
@@ -2,6 +2,4 @@ include .config
 
 
 ARCH:	
-	@echo	$(strip $(subst ",,$(BR2_ARCH)))
-#")))
-
+	@echo	$(call strip_dquotes,$(BR2_ARCH))
diff --git a/target/Makefile.in b/target/Makefile.in
index b145041..efe4024 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -1,12 +1,9 @@
-BR2_PACKAGE_LINUX_FORMAT:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
-#"))
-BR2_PACKAGE_LINUX_KCONFIG:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
-#"))
+BR2_PACKAGE_LINUX_FORMAT:=$(call strip_dquotes,$(BR2_PACKAGE_LINUX_FORMAT))
+BR2_PACKAGE_LINUX_KCONFIG:=$(call strip_dquotes,$(BR2_PACKAGE_LINUX_KCONFIG))
 
 
 # COPY_FILE absolute_path_to_file, target_directory, filename
-ifneq ($(strip $(subst ",,$(BUILDROOT_COPYTO))),)	# Use shell definition
-#"))
+ifneq ($(call strip_dquotes,$(BUILDROOT_COPYTO)),)	# Use shell definition
 define COPY_FILE
 	@echo "BUILDROOT_COPYTO: Copy to $(BUILDROOT_COPYTO)/$(strip $(3))" ; \
 	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
@@ -18,25 +15,23 @@ define COPY_FILE
 		cp $(1) $(BUILDROOT_COPYTO)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 	fi
 endef
-COPYTO=$(strip $(subst ",,$(BUILDROOT_COPYTO)))
+COPYTO=$(call strip_dquotes,$(BUILDROOT_COPYTO))
 else
-ifneq ($(strip $(subst ",,$(BR2_COPYTO))),)	# Global override
-#"))
+ifneq ($(call strip_dquotes,$(BR2_COPYTO)),)	# Global override
 define COPY_FILE
 	@echo "BR2_COPYTO: Copy to $(BR2_COPYTO)/$(strip $(3))" ; \
 	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
 	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
 		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 	fi ; \
-	if [ "$(strip $(subst ",,$(BR2_COPYTO)))X" != "X" ] ; then \
+	if [ "$(call strip_dquotes,$(BR2_COPYTO))X" != "X" ] ; then \
 		mkdir -p $(BR2_COPYTO)  || echo "Could not create $(BR2_COPYTO)" ; \
 		if [ -d $(BR2_COPYTO) -o -w $(BR2_COPYTO) ] ; then \
 			cp $(1) $(BR2_COPYTO)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 		fi ; \
 	fi
 endef
-#"))
-COPYTO=$(strip $(subst ",,$(BR2_COPYTO)))
+COPYTO=$(call strip_dquotes,$(BR2_COPYTO))
 else	# Package specific copyto, or empty
 define COPY_FILE
 	@echo "Copy to $(2)/$(strip $(3))" ; \
@@ -44,14 +39,13 @@ define COPY_FILE
 	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
 		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 	fi ; \
-	if [ "$(strip $(subst ",,$(2)))X" != "X" ] ; then \
+	if [ "$(call strip_dquotes,$(2))X" != "X" ] ; then \
 		mkdir -p $(2) || echo "Could not create $(2)" ; \
 		if [ -d $(2) -o  -w $(2) ] ; then \
 			cp $(1) $(2)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 		fi ; \
 	fi
 endef
-#"))
 endif
 endif
 
diff --git a/target/cpio/cpioroot.mk b/target/cpio/cpioroot.mk
index 08983ff..a92e493 100644
--- a/target/cpio/cpioroot.mk
+++ b/target/cpio/cpioroot.mk
@@ -31,9 +31,8 @@ else
 CPIO_TARGET := $(CPIO_BASE)
 endif
 
-ROOTFS_CPIO_COPYTO:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_CPIO_COPYTO)))
-# "))
-#
+ROOTFS_CPIO_COPYTO:=$(call strip_dquotes,$(BR2_TARGET_ROOTFS_CPIO_COPYTO))
+
 
 cpioroot-init:
 	rm -f $(TARGET_DIR)/init
diff --git a/target/cramfs/cramfs.mk b/target/cramfs/cramfs.mk
index e2ca415..c6feba9 100644
--- a/target/cramfs/cramfs.mk
+++ b/target/cramfs/cramfs.mk
@@ -5,8 +5,7 @@
 #############################################################
 CRAMFS_DIR=$(BUILD_DIR)/cramfs-1.1
 CRAMFS_SOURCE=cramfs-1.1.tar.gz
-ifeq ($(strip $(subst ",,$(BR2_SOURCEFORGE_MIRROR))),unc)
-# "))
+ifeq ($(call strip_dquotes,$(BR2_SOURCEFORGE_MIRROR)),unc)
 # UNC does not seem to have cramfs
 CRAMFS_SITE=http://internap.dl.sourceforge.net/sourceforge/cramfs
 else
diff --git a/target/device/ARMLTD/Makefile.in b/target/device/ARMLTD/Makefile.in
index a846ba6..d4eefba 100644
--- a/target/device/ARMLTD/Makefile.in
+++ b/target/device/ARMLTD/Makefile.in
@@ -1,8 +1,6 @@
 ifeq ($(BR2_TARGET_ARMLTD),y)
-BOARD_NAME=$(strip $(subst ",,$(BR2_BOARD_NAME)))
-#"))
-BOARD_PATH=$(strip $(subst ",,$(BR2_BOARD_PATH)))
-#"))
+BOARD_NAME=$(call strip_dquotes,$(BR2_BOARD_NAME))
+BOARD_PATH=$(call strip_dquotes,$(BR2_BOARD_PATH))
 
 
 # pin some settings
diff --git a/target/device/Atmel/DataFlashBoot/DataflashBoot.mk b/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
index b3735bc..8ff95fa 100644
--- a/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
+++ b/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
@@ -5,8 +5,7 @@
 #############################################################
 DATAFLASHBOOT_VERSION:=1.05
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
-ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
-# "))
+ATMEL_MIRROR:=$(call strip_dquotes, $(BR2_ATMEL_MIRROR))
 DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
 DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)
diff --git a/target/device/Atmel/Makefile.in b/target/device/Atmel/Makefile.in
index 70d3805..8302b12 100644
--- a/target/device/Atmel/Makefile.in
+++ b/target/device/Atmel/Makefile.in
@@ -3,10 +3,8 @@
 ifeq ($(BR2_TARGET_ATMEL),y)
 ATMEL_PATH:=target/device/Atmel
 
-BOARD_NAME:=$(strip $(subst ",, $(BR2_BOARD_NAME)))
-#"))
-BOARD_PATH:=$(strip $(subst ",, $(BR2_BOARD_PATH)))
-#"))
+BOARD_NAME:=$(call strip_dquotes, $(BR2_BOARD_NAME))
+BOARD_PATH:=$(call strip_dquotes, $(BR2_BOARD_PATH))
 
 ATMEL_TARGET:=$(ATMEL_PATH)/root
 TARGET_SKELETON:=$(ATMEL_TARGET)/target_skeleton
@@ -18,26 +16,23 @@ KERNEL_HEADERS_PATCH_DIR=target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2
 endif
 
 ifneq ($(COPYTO),)
-TARGET_ATMEL_COPYTO:=$(strip $(subst ",, $(BR2_COPYTO)))
+TARGET_ATMEL_COPYTO:=$(call strip_dquotes, $(BR2_COPYTO))
 else
-TARGET_ATMEL_COPYTO:=$(strip $(subst ",, $(BR2_TARGET_ATMEL_COPYTO)))
+TARGET_ATMEL_COPYTO:=$(call strip_dquotes, $(BR2_TARGET_ATMEL_COPYTO))
 endif
 
 # These are set by Config.in
-DOWNLOAD_LINUX26_VERSION:= $(strip $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
-#"))
+DOWNLOAD_LINUX26_VERSION:= $(call strip_dquotes, $(BR2_DOWNLOAD_LINUX26_VERSION))
 ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
-LINUX26_VERSION:=$(strip $(subst ",, $(BR2_LINUX26_VERSION)))
-#"))
+LINUX26_VERSION:=$(call strip_dquotes, $(BR2_LINUX26_VERSION))
 ifeq ($(LINUX26_VERSION),)
 LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
-LINUX26_RC_PATCH:=$(strip $(subst ",, $(BR2_LINUX26_RC_PATCH)))
-#"))
+LINUX26_RC_PATCH:=$(call strip_dquotes, $(BR2_LINUX26_RC_PATCH))
 
 # These are set by "new" Config.in
 LINUX26_KCONFIG:=$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config
@@ -62,8 +57,7 @@ DFB_BOARD_NAME:=$(BOARD_NAME)
 
 #BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config
 
-U_BOOT_VERSION:=$(strip $(subst ",,$(BR2_UBOOT_VERSION)))
-#"))
+U_BOOT_VERSION:=$(call strip_dquotes,$(BR2_UBOOT_VERSION))
 
 # Update things in board specific makefiles
 include target/device/Atmel/*/Makefile.in
diff --git a/target/device/Atmel/arch-arm/u-boot/Makefile.in b/target/device/Atmel/arch-arm/u-boot/Makefile.in
index 841895c..3e98a4a 100644
--- a/target/device/Atmel/arch-arm/u-boot/Makefile.in
+++ b/target/device/Atmel/arch-arm/u-boot/Makefile.in
@@ -1,5 +1,4 @@
 ifneq ($(BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR),)
-U_BOOT_ARCH_PATCH_DIR:=$(strip $(subst ",, $(BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR)))
-#"))
+U_BOOT_ARCH_PATCH_DIR:=$(call strip_dquotes, $(BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR))
 endif
 
diff --git a/target/device/Atmel/at91bootstrap/at91bootstrap.mk b/target/device/Atmel/at91bootstrap/at91bootstrap.mk
index b68be5e..2f58132 100644
--- a/target/device/Atmel/at91bootstrap/at91bootstrap.mk
+++ b/target/device/Atmel/at91bootstrap/at91bootstrap.mk
@@ -7,29 +7,23 @@ AT91BOOTSTRAP_VERSION:=2.10
 AT91BOOTSTRAP_PATCH_LEVEL:=
 AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION)$(AT91BOOTSTRAP_PATCH_LEVEL)
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
-ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
-#"))
+ATMEL_MIRROR:=$(call strip_dquotes, $(BR2_ATMEL_MIRROR))
 AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
 AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
-AT91BOOTSTRAP:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP)))
-#"))
+AT91BOOTSTRAP:=$(call strip_dquotes, $(BR2_AT91BOOTSTRAP))
 AT91BOOTSTRAP_ZCAT:=$(BZCAT)
 
-AT91BOOTSTRAP_BOARD:=$(strip $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_BOARD)))
-#"))
+AT91BOOTSTRAP_BOARD:=$(call strip_dquotes, $(BR2_TARGET_AT91BOOTSTRAP_BOARD))
 
-AT91BOOTSTRAP_MEMORY:=$(strip $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_MEMORY)))
-#"))
+AT91BOOTSTRAP_MEMORY:=$(call strip_dquotes, $(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
 
 AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_PATCHED_VERSION).bin
 
 AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)
 
-AT91BOOTSTRAP_JUMP_ADDR:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP_JUMP_ADDR)))
-#"))
-AT91BOOTSTRAP_IMG_SIZE:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP_IMG_SIZE)))
-#"))
+AT91BOOTSTRAP_JUMP_ADDR:=$(call strip_dquotes, $(BR2_AT91BOOTSTRAP_JUMP_ADDR))
+AT91BOOTSTRAP_IMG_SIZE:=$(call strip_dquotes, $(BR2_AT91BOOTSTRAP_IMG_SIZE))
 
 AT91_CUSTOM_FLAGS:=
 ifneq ($(AT91BOOTSTRAP_JUMP_ADDR),)
diff --git a/target/device/KwikByte/Makefile.in b/target/device/KwikByte/Makefile.in
index 347d6ab..dc27721 100644
--- a/target/device/KwikByte/Makefile.in
+++ b/target/device/KwikByte/Makefile.in
@@ -1,17 +1,15 @@
 ifeq ($(BR2_TARGET_KWIKBYTE),y)
 
-BOARD_NAME:=$(strip  $(subst ",, $(BR2_BOARD_NAME)))
-BOARD_PATH:=$(strip  $(subst ",, $(BR2_BOARD_PATH)))
+BOARD_NAME:=$(call strip_dquotes, $(BR2_BOARD_NAME))
+BOARD_PATH:=$(call strip_dquotes, $(BR2_BOARD_PATH))
 
 # These are set by Config.in
-DOWNLOAD_LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
-#"))
+DOWNLOAD_LINUX26_VERSION:=$(call strip_dquotes, $(BR2_DOWNLOAD_LINUX26_VERSION))
 ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
-LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_LINUX26_VERSION)))
-#"))
+LINUX26_VERSION:=$(call strip_dquotes, $(BR2_LINUX26_VERSION))
 ifeq ($(LINUX26_VERSION),)
 LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
diff --git a/target/device/x86/i686/Makefile.in b/target/device/x86/i686/Makefile.in
index 99ef63b..e2b0406 100644
--- a/target/device/x86/i686/Makefile.in
+++ b/target/device/x86/i686/Makefile.in
@@ -1,7 +1,5 @@
-BOARD_NAME=$(strip $(subst ",,$(BR2_BOARD_NAME)))
-#"))
-BOARD_PATH=$(strip $(subst ",,$(BR2_BOARD_PATH)))
-#"))
+BOARD_NAME=$(call strip_dquotes,$(BR2_BOARD_NAME))
+BOARD_PATH=$(call strip_dquotes,$(BR2_BOARD_PATH))
 
 
 
diff --git a/target/ext2/ext2root.mk b/target/ext2/ext2root.mk
index 4fadefa..af5bd19 100644
--- a/target/ext2/ext2root.mk
+++ b/target/ext2/ext2root.mk
@@ -58,8 +58,7 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),)
 EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
-EXT2_BASE := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_OUTPUT))
-#")
+EXT2_BASE := $(call strip_dquotes,$(BR2_TARGET_ROOTFS_EXT2_OUTPUT))
 
 EXT2_ROOTFS_COMPRESSOR:=
 EXT2_ROOTFS_COMPRESSOR_EXT:=
@@ -121,8 +120,7 @@ $(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(E
 	$(EXT2_ROOTFS_COMPRESSOR) $(EXT2_BASE) > $(EXT2_TARGET)
 endif
 
-EXT2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO)))
-# "))
+EXT2_COPYTO := $(call strip_dquotes,$(BR2_TARGET_ROOTFS_EXT2_COPYTO))
 
 ext2root: $(EXT2_TARGET)
 	@ls -l $(EXT2_TARGET)
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 3541264..c72ef13 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -7,10 +7,8 @@ TARGET_SKELETON=target/generic/target_busybox_skeleton
 TARGET_DEVICE_TABLE=target/generic/mini_device_table.txt
 endif
 
-TARGET_GENERIC_GETTY:=$(strip $(subst ",, $(BR2_TARGET_GENERIC_GETTY_PORT)))
-#"))
-TARGET_GENERIC_GETTY_BAUDRATE:=$(strip $(subst ",, $(BR2_TARGET_GENERIC_GETTY_BAUDRATE)))
-#"))
+TARGET_GENERIC_GETTY:=$(call strip_dquotes, $(BR2_TARGET_GENERIC_GETTY_PORT))
+TARGET_GENERIC_GETTY_BAUDRATE:=$(call strip_dquotes, $(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 
 target-generic-getty:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
diff --git a/target/iso9660/iso9660.mk b/target/iso9660/iso9660.mk
index 151970f..9c79b48 100644
--- a/target/iso9660/iso9660.mk
+++ b/target/iso9660/iso9660.mk
@@ -44,10 +44,8 @@ mkisofs-dirclean:
 #############################################################
 
 ISO9660_TARGET_DIR=$(BUILD_DIR)/iso9660
-ISO9660_TARGET:=$(subst ",,$(BR2_TARGET_ROOTFS_ISO9660_OUTPUT))
-#")
-ISO9660_BOOT_MENU:=$(subst ",,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
-#")
+ISO9660_TARGET:=$(call strip_dquotes,$(BR2_TARGET_ROOTFS_ISO9660_OUTPUT))
+ISO9660_BOOT_MENU:=$(call strip_dquotes,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 ISO9660_OPTS:=
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
diff --git a/target/jffs2/jffs2root.mk b/target/jffs2/jffs2root.mk
index e0c994c..a002f05 100644
--- a/target/jffs2/jffs2root.mk
+++ b/target/jffs2/jffs2root.mk
@@ -32,8 +32,7 @@ JFFS2_OPTS += -n
 SUMTOOL_OPTS += -n
 endif
 
-JFFS2_TARGET := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT)))
-#"))
+JFFS2_TARGET := $(call strip_dquotes,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT))
 ifneq ($(TARGET_DEVICE_TABLE),)
 JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)
 endif
@@ -75,8 +74,7 @@ ifeq ($(BR2_JFFS2_TARGET_SREC),y)
 	@ls -l $(JFFS2_TARGET).srec
 endif
 
-JFFS2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_COPYTO)))
-#"))
+JFFS2_COPYTO := $(call strip_dquotes,$(BR2_TARGET_ROOTFS_JFFS2_COPYTO))
 
 jffs2root: $(JFFS2_TARGET)
 ifneq ($(JFFS2_COPYTO),)
diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index ff0b88e..11d8ddb 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -26,28 +26,23 @@ LINUX26_BZCAT:=$(BZCAT)
 LINUX26_SITE=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 
 ifeq ($(BOARD_PATH),)
-BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))
-#"))
+BOARD_PATH:=$(call strip_dquotes,$(BR2_BOARD_PATH))
 endif
 
 # Linux kernel configuration file
 # Has to be set by the target/device
 # If it is not set by the target/device, then pick the one from .config
 ifndef LINUX26_KCONFIG
-ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
-LINUX26_KCONFIG=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
-#"))
-#"))
+ifneq ($(call strip_dquotes,$(BR2_PACKAGE_LINUX_KCONFIG)),)
+LINUX26_KCONFIG=$(call strip_dquotes,$(BR2_PACKAGE_LINUX_KCONFIG))
 else
 # LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
 endif
 endif
 
 ifndef LINUX26_FORMAT
-ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
-LINUX26_FORMAT=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
-#"))
-#"))
+ifneq ($(call strip_dquotes,$(BR2_PACKAGE_LINUX_FORMAT)),)
+LINUX26_FORMAT=$(call strip_dquotes,$(BR2_PACKAGE_LINUX_FORMAT))
 else
 LINUX26_FORMAT=zImage
 endif
@@ -67,8 +62,7 @@ endif
 endif
 endif
 
-ROOTFS_STRIPPED_SUFFIX=$(strip $(subst ",,$(ROOTFS_SUFFIX)))
-#"))
+ROOTFS_STRIPPED_SUFFIX=$(call strip_dquotes,$(ROOTFS_SUFFIX))
 # File name for the Linux kernel binary
 ifndef LINUX26_KERNEL
 LINUX26_KERNEL_NAME=$(BINARIES_DIR)/$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
@@ -86,7 +80,6 @@ LINUX_KERNEL=$(LINUX26_KERNEL_NAME)
 ifeq ($(strip $(LINUX26_PATCH_DIR)),)
 ifneq ($(BOARD_PATH),)
 LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches/
-#"))
 endif
 endif
 __LINUX26_NO_PIC=-fPIC -fpic -DPIC -fwrapv -ftrapv
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 9d878f2..1c67775 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -20,8 +20,7 @@ endif
 # 4. Use default (2.6.22.1)
 ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 ifneq ($(BR2_DOWNLOAD_LINUX26_VERSION),)
-DOWNLOAD_LINUX26_VERSION:=$(strip $(subst ",,$(BR2_DOWNLOAD_LINUX26_VERSION)))
-#"))
+DOWNLOAD_LINUX26_VERSION:=$(call strip_dquotes,$(BR2_DOWNLOAD_LINUX26_VERSION))
 else
 DOWNLOAD_LINUX26_VERSION:=$(LINUX_HEADERS_VERSION)
 endif
@@ -35,8 +34,7 @@ endif
 # 4. Use default (2.6.22.1)
 ifeq ($(LINUX26_VERSION),)
 ifneq ($(BR2_LINUX26_VERSION),)
-LINUX26_VERSION:=$(strip $(subst ",,$(BR2_LINUX26_VERSION)))
-#"))
+LINUX26_VERSION:=$(call strip_dquotes,$(BR2_LINUX26_VERSION))
 else
 LINUX26_VERSION:=$(LINUX_HEADERS_VERSION)
 endif
@@ -46,8 +44,7 @@ endif
 LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) -s kernelrelease`
 
 ifeq ($(BOARD_PATH),)
-BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))
-#"))
+BOARD_PATH:=$(call strip_dquotes,$(BR2_BOARD_PATH))
 endif
 
 # Version of Linux AFTER patches
@@ -60,16 +57,12 @@ LINUX_DIR:=$(LINUX26_DIR)
 # -----------------------------------------------------------------------------
 # Define source name and sites
 LINUX26_SOURCE:=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
-LINUX26_SITE:=$(strip $(subst ",,$(BR2_KERNEL_SITE)))
-#"))
+LINUX26_SITE:=$(call strip_dquotes,$(BR2_KERNEL_SITE))
 
-LINUX26_PATCH_SOURCE:=$(strip $(subst ",,$(BR2_KERNEL_PATCH)))
-#"))
-LINUX26_PATCH_SITE:=$(strip $(subst ",,$(BR2_KERNEL_PATCH_SITE)))
-#"))
+LINUX26_PATCH_SOURCE:=$(call strip_dquotes,$(BR2_KERNEL_PATCH))
+LINUX26_PATCH_SITE:=$(call strip_dquotes,$(BR2_KERNEL_PATCH_SITE))
 
-LINUX26_BSP_PATCH:=$(strip $(subst ",,$(BR2_LINUX_BSP_PATCH)))
-#"))
+LINUX26_BSP_PATCH:=$(call strip_dquotes,$(BR2_LINUX_BSP_PATCH))
 
 ifneq ($(LINUX26_BSP_PATCH),)
 LINUX_HEADERS_DEPENDS:=  $(DL_DIR)/$(LINUX26_BSP_PATCH)
@@ -86,8 +79,7 @@ LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches/
 endif
 
 # kernel architecture patches provided by buildroot
-KERNEL_ARCH_PATCH_DIR:=$(strip $(subst ",,$(BR2_KERNEL_ARCH_PATCH_DIR)))
-#"))
+KERNEL_ARCH_PATCH_DIR:=$(call strip_dquotes,$(BR2_KERNEL_ARCH_PATCH_DIR))
 
 
 
@@ -98,10 +90,8 @@ KERNEL_ARCH_PATCH_DIR:=$(strip $(subst ",,$(BR2_KERNEL_ARCH_PATCH_DIR)))
 # Has to be set by the target/device
 # If it is not set by the target/device, then pick the one from .config
 ifndef LINUX26_KCONFIG
-ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
-LINUX26_KCONFIG:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
-#"))
-#"))
+ifneq ($(call strip_dquotes,$(BR2_PACKAGE_LINUX_KCONFIG)),)
+LINUX26_KCONFIG:=$(call strip_dquotes,$(BR2_PACKAGE_LINUX_KCONFIG))
 else
 ifeq ($(BR2_i386),y)
 LINUX26_KCONFIG:=$(BOARD_PATH)/linux26.config
@@ -111,18 +101,15 @@ endif
 endif
 endif
 
-KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
-#"))
+KERNEL_CONFIG_METHOD:=$(call strip_dquotes,$(BR2_KERNEL_CONFIG_METHOD))
 ifeq ($(KERNEL_CONFIG_METHOD),)
 KERNEL_CONFIG_METHOD:=menuconfig
 endif
 
 # -----------------------------------------------------------------------------
 ifndef LINUX26_FORMAT
-ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
-#"))
-LINUX26_FORMAT:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
-#"))
+ifneq ($(call strip_dquotes,$(BR2_PACKAGE_LINUX_FORMAT)),)
+LINUX26_FORMAT:=$(call strip_dquotes,$(BR2_PACKAGE_LINUX_FORMAT))
 else
 LINUX26_FORMAT:=zImage
 endif
@@ -168,8 +155,7 @@ LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
 endif
 endif
 
-ROOTFS_STRIPPED_SUFFIX=$(strip $(subst ",,$(ROOTFS_SUFFIX)))
-#"))
+ROOTFS_STRIPPED_SUFFIX=$(call strip_dquotes,$(ROOTFS_SUFFIX))
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
 LINUX26_KERNEL_NAME:=$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
@@ -236,10 +222,8 @@ ifeq ($(BR2_LINUX_COPYTO_TFTPBOOT),y)
 LINUX26_TARGETS+=/tftpboot/$(LINUX26_KERNEL_NAME)
 endif
 
-ifneq ($(strip $(subst ",,$(BR2_LINUX_COPYTO))),)
-LINUX_COPYTO:=$(strip $(subst ",,$(BR2_LINUX_COPYTO)))
-#"))
-#"))
+ifneq ($(call strip_dquotes,$(BR2_LINUX_COPYTO)),)
+LINUX_COPYTO:=$(call strip_dquotes,$(BR2_LINUX_COPYTO))
 LINUX26_TARGETS+=$(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
 endif
 
@@ -296,8 +280,7 @@ endif
 # =============================================================================
 linux_patch: $(LINUX26_DIR)/.patched.board
 
-KERNEL_EXTRA_VERSION:=$(strip $(subst ",,$(BR2_EXTRA_VERSION)))
-#"))
+KERNEL_EXTRA_VERSION:=$(call strip_dquotes,$(BR2_EXTRA_VERSION))
 
 lxcf:	$(LINUX26_DIR)/.config
 
@@ -339,10 +322,9 @@ ifeq ($(BR2_PACKAGE_LINUX_USE_KCONFIG),y)
 		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD) ; \
 	fi
 endif
-ifneq ($(strip $(subst ",,$(BR2_EXTRA_VERSION))),)
+ifneq ($(call strip_dquotes,$(BR2_EXTRA_VERSION)),)
 	$(SED) 's,^EXTRAVERSION.*,EXTRAVERSION = $(KERNEL_EXTRA_VERSION),g' $(LINUX26_DIR)/Makefile
 endif
-# $(strip $(subst ",, - ))
 
 # -----------------------------------------------------------------------------
 $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.config
diff --git a/target/squashfs/squashfsroot.mk b/target/squashfs/squashfsroot.mk
index 019ed8b..b22d7d5 100644
--- a/target/squashfs/squashfsroot.mk
+++ b/target/squashfs/squashfsroot.mk
@@ -3,8 +3,7 @@
 # mksquashfs to build to target squashfs filesystems
 #
 #############################################################
-SQUASHFS_VERSION:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_SQUASHFS_VERSION)))
-#"))
+SQUASHFS_VERSION:=$(call strip_dquotes,$(BR2_TARGET_ROOTFS_SQUASHFS_VERSION))
 SQUASHFS_DIR:=$(BUILD_DIR)/squashfs$(SQUASHFS_VERSION)
 SQUASHFS_SOURCE:=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
diff --git a/target/tar/tarroot.mk b/target/tar/tarroot.mk
index 5b33c62..b33a177 100644
--- a/target/tar/tarroot.mk
+++ b/target/tar/tarroot.mk
@@ -21,8 +21,7 @@ ifeq ($(BR2_TARGET_ROOTFS_TAR_LZMA),y)
 TAR_COMPRESSOR:=lzma -9 -c
 TAR_COMPRESSOR_EXT:=lzma
 endif
-ROOTFS_TAR_COPYTO:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_TAR_COPYTO)))
-# "))
+ROOTFS_TAR_COPYTO:=$(call strip_dquotes,$(BR2_TARGET_ROOTFS_TAR_COPYTO))
 
 tarroot: host-fakeroot makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index cd18404..9834e01 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -3,13 +3,11 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION:=$(strip $(subst ",,$(BR2_UBOOT_VERSION)))
-#"))
+U_BOOT_VERSION:=$(call strip_dquotes,$(BR2_UBOOT_VERSION))
 
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 
-U_BOOT_SITE:=$(strip $(subst ",,$(BR2_U_BOOT_SITE)))
-#"))
+U_BOOT_SITE:=$(call strip_dquotes,$(BR2_U_BOOT_SITE))
 U_BOOT_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
 U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
 U_BOOT_CAT:=$(BZCAT)
@@ -23,27 +21,20 @@ U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
 
 U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS)
 
-ifeq ($(strip $(subst ",,$(BR2_TARGET_UBOOT_DEFAULT_ENV))),y)
-#"))
+ifeq ($(call strip_dquotes,$(BR2_TARGET_UBOOT_DEFAULT_ENV)),y)
 U_BOOT_TARGETS += u-boot-autoscript
 endif
 
-TARGET_UBOOT_IPADDR:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_IPADDR)))
-#"))
-TARGET_UBOOT_SERVERIP:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_SERVERIP)))
-#"))
-TARGET_UBOOT_GATEWAY:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_GATEWAY)))
-#"))
-TARGET_UBOOT_NETMASK:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_NETMASK)))
-#"))
-TARGET_UBOOT_ETHADDR:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_ETHADDR)))
-#"))
+TARGET_UBOOT_IPADDR:=$(call strip_dquotes, $(BR2_TARGET_UBOOT_IPADDR))
+TARGET_UBOOT_SERVERIP:=$(call strip_dquotes, $(BR2_TARGET_UBOOT_SERVERIP))
+TARGET_UBOOT_GATEWAY:=$(call strip_dquotes, $(BR2_TARGET_UBOOT_GATEWAY))
+TARGET_UBOOT_NETMASK:=$(call strip_dquotes, $(BR2_TARGET_UBOOT_NETMASK))
+TARGET_UBOOT_ETHADDR:=$(call strip_dquotes, $(BR2_TARGET_UBOOT_ETHADDR))
 
 # u-boot still uses arch=ppc for powerpc
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 ifeq ($(UBOOT_BOARD_NAME),)
-UBOOT_BOARD_NAME:=$(strip $(subst ",,$(BR2_TARGET_UBOOT_BOARDNAME)))
-#"))
+UBOOT_BOARD_NAME:=$(call strip_dquotes,$(BR2_TARGET_UBOOT_BOARDNAME))
 endif
 
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/config.h
@@ -67,9 +58,8 @@ define insert_define
 @echo "#ifdef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#undef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#endif" >> $(U_BOOT_INC_CONF_FILE)
- at echo '#define $(strip $(1)) $(strip $(subst ",,$(2)))' >> $(U_BOOT_INC_CONF_FILE)
+ at echo '#define $(strip $(1)) $(call strip_dquotes,$(2))' >> $(U_BOOT_INC_CONF_FILE)
 endef
-#"))
 
 $(DL_DIR)/$(U_BOOT_SOURCE):
 	 $(call DOWNLOAD,$(U_BOOT_SITE),$(U_BOOT_SOURCE))
diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
index d0af449..0b2976e 100644
--- a/target/ubifs/ubifsroot.mk
+++ b/target/ubifs/ubifsroot.mk
@@ -6,8 +6,7 @@
 
 UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
 
-UBIFS_BASE := $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_OUTPUT))
-#")
+UBIFS_BASE := $(call strip_dquotes,$(BR2_TARGET_ROOTFS_UBIFS_OUTPUT))
 
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
 UBIFS_OPTS += -x zlib
@@ -73,8 +72,7 @@ $(UBIFS_BASE).$(UBIFS_ROOTFS_COMPRESSOR_EXT): $(UBIFS_ROOTFS_COMPRESSOR_PREREQ)
 	$(UBIFS_ROOTFS_COMPRESSOR) $(UBIFS_BASE) > $(UBIFS_TARGET)
 endif
 
-UBIFS_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO)))
-# "))
+UBIFS_COPYTO := $(call strip_dquotes,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO))
 
 ubifsroot: $(UBIFS_TARGET)
 	@ls -l $(UBIFS_TARGET)
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 66f393e..7be1878 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -3,11 +3,9 @@
 # build binutils for use on the host system
 #
 #############################################################
-BINUTILS_VERSION:=$(subst ",,$(BR2_BINUTILS_VERSION))
-#")
+BINUTILS_VERSION:=$(call strip_dquotes,$(BR2_BINUTILS_VERSION))
 
-EXTRA_BINUTILS_CONFIG_OPTIONS=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
-#"))
+EXTRA_BINUTILS_CONFIG_OPTIONS=$(call strip_dquotes, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS))
 BINUTILS_SITE:=$(BR2_KERNEL_MIRROR)/linux/devel/binutils
 ifeq ($(BINUTILS_VERSION),2.19.1)
 BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 1c9197b..b63698c 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -49,14 +49,12 @@ copy_toolchain_sysroot = \
 	if [ -n "$${SYSROOT_DIR}" ]; then cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
 	find $(STAGING_DIR) -type d | xargs chmod 755; fi
 
-uclibc: dependencies $(TARGET_DIR)/lib/$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C)))
+uclibc: dependencies $(TARGET_DIR)/lib/$(call strip_dquotes, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))
 
-$(TARGET_DIR)/lib/$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))):
-#"))
+$(TARGET_DIR)/lib/$(call strip_dquotes, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C)):
 	mkdir -p $(TARGET_DIR)/lib
-	@$(call copy_toolchain_lib_root, $(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C))), /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP))
-#")))
-	for libs in $(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_LIBS))); do \
+	@$(call copy_toolchain_lib_root, $(call strip_dquotes, $(BR2_TOOLCHAIN_EXTERNAL_LIB_C)), /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP))
+	for libs in $(call strip_dquotes, $(BR2_TOOLCHAIN_EXTERNAL_LIBS)); do \
 		$(call copy_toolchain_lib_root, $$libs, /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
 	$(call copy_toolchain_sysroot)
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index a1c5564..4ee5f0d 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -4,21 +4,15 @@
 # and arrange to include it soon after invoking make from
 # the top level.
 
-GCC_VERSION:=$(strip $(subst ",, $(BR2_GCC_VERSION)))
-#"))
-TARGET_OPTIMIZATION:=$(strip $(subst ",, $(BR2_TARGET_OPTIMIZATION)))
-#"))
-EXTRA_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
-#"))
+GCC_VERSION:=$(call strip_dquotes, $(BR2_GCC_VERSION))
+TARGET_OPTIMIZATION:=$(call strip_dquotes, $(BR2_TARGET_OPTIMIZATION))
+EXTRA_GCC_CONFIG_OPTIONS:=$(call strip_dquotes, $(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
-ifeq ($(strip $(subst ",, $(BR2_GCC_IS_SNAP))),y)
-#"))
-GCC_SNAP_DATE:=$(strip $(subst ",, $(BR2_GCC_SNAP_DATE)))
-#"))
+ifeq ($(call strip_dquotes, $(BR2_GCC_IS_SNAP)),y)
+GCC_SNAP_DATE:=$(call strip_dquotes, $(BR2_GCC_SNAP_DATE))
 else
 GCC_SNAP_DATE:=
 endif
-#")))
 
 ifeq ($(BR2_GCC_USE_SJLJ_EXCEPTIONS),y)
 GCC_USE_SJLJ_EXCEPTIONS:=--enable-sjlj-exceptions
@@ -57,16 +51,13 @@ ARCH_FPU_SUFFIX:=
 endif
 
 # some additional defaults
-ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ARCH))),)
-# ")))
+ifneq ($(call strip_dquotes,$(BR2_GCC_TARGET_ARCH)),)
 GCC_WITH_ARCH:=--with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
-ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_TUNE))),)
-# ")))
+ifneq ($(call strip_dquotes,$(BR2_GCC_TARGET_TUNE)),)
 GCC_WITH_TUNE:=--with-tune=$(BR2_GCC_TARGET_TUNE)
 endif
-ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ABI))),)
-# ")))
+ifneq ($(call strip_dquotes,$(BR2_GCC_TARGET_ABI)),)
 GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
 endif
 
@@ -95,8 +86,7 @@ endif
 
 
 # and finally pull in config opts from the user
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=$(strip $(subst ",, $(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS)))
-#"))
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=$(call strip_dquotes, $(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS))
 
 ifeq ($(BR2_PREFER_IMA),y)
 # >= 4.x
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index ba8a1f2..6396795 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -3,8 +3,7 @@
 # gdb
 #
 ######################################################################
-GDB_VERSION:=$(strip $(subst ",, $(BR2_GDB_VERSION)))
-#"))
+GDB_VERSION:=$(call strip_dquotes, $(BR2_GDB_VERSION))
 
 GDB_OFFICIAL_VERSION:=$(GDB_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GDB_RELEASE)
 
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 10e2648..e3a9e55 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -7,8 +7,7 @@
 #
 #############################################################
 
-DEFAULT_KERNEL_HEADERS:=$(strip $(subst ",, $(BR2_DEFAULT_KERNEL_HEADERS)))
-#"))
+DEFAULT_KERNEL_HEADERS:=$(call strip_dquotes, $(BR2_DEFAULT_KERNEL_HEADERS))
 
 LINUX_HEADERS_SITE:=127.0.0.1
 LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index b39b939..c672340 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -9,12 +9,10 @@ ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
 ifndef UCLIBC_CONFIG_FILE
-UCLIBC_CONFIG_FILE=$(subst ",, $(strip $(BR2_UCLIBC_CONFIG)))
-#")
+UCLIBC_CONFIG_FILE=$(call strip_dquotes, $(BR2_UCLIBC_CONFIG))
 endif
 
-UCLIBC_VER:=$(subst ",,$(BR2_UCLIBC_VERSION_STRING))
-#")
+UCLIBC_VER:=$(call strip_dquotes, $(BR2_UCLIBC_VERSION_STRING))
 
 UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 
@@ -75,10 +73,8 @@ else
 UCLIBC_NOT_TARGET_ENDIAN:=LITTLE
 endif
 
-UCLIBC_ARM_TYPE:=CONFIG_$(strip $(subst ",, $(BR2_ARM_TYPE)))
-#"))
-UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(strip $(subst ",, $(BR2_SPARC_TYPE)))
-#"))
+UCLIBC_ARM_TYPE:=CONFIG_$(call strip_dquotes, $(BR2_ARM_TYPE))
+UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call strip_dquotes, $(BR2_SPARC_TYPE))
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	$(call DOWNLOAD,$(UCLIBC_SITE),$(UCLIBC_SOURCE))
-- 
1.6.0.6

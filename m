From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Sep 2009 15:14:45 +0200
Subject: [Buildroot] [PATCH 3/7] packages: use qstrip
In-Reply-To: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3c35d55ea976148bfb479b40b904d5b37b71ecb6.1252156486.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in  |    2 +-
 package/Makefile.in            |   26 ++++++++++----------------
 package/busybox/busybox.mk     |    6 ++----
 package/haserl/haserl.mk       |    3 +--
 package/microperl/microperl.mk |    3 +--
 package/qt/qt.mk               |   18 ++++++------------
 package/quagga/quagga.mk       |    3 +--
 package/socat/socat.mk         |    9 +++------
 8 files changed, 25 insertions(+), 45 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d6da7e8..859e7bc 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -140,7 +140,7 @@ DOWNLOAD=$(WGET) -P $(DL_DIR) $(1)/$(2)
 else
 define DOWNLOAD
 	$(Q)test -e $(DL_DIR)/$(2) || \
-	for site in $(strip $(subst ",,$(BR2_PRIMARY_SITE))) $(1) $(strip $(subst ",,$(BR2_BACKUP_SITE))); \
+	for site in $(call qstrip,$(BR2_PRIMARY_SITE)) $(1) $(call qstrip,$(BR2_BACKUP_SITE)); \
 	do $(WGET) -P $(DL_DIR) $$site/$(2) && exit; done
 endef
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
index a67c1ca..0ae5bdb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -45,12 +45,10 @@ TARGET_CFLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT)
 TARGET_LDFLAGS+= $(BR2_SYSROOT)
 endif
 
-CC_TARGET_TUNE_:=$(strip $(subst ",,$(BR2_GCC_TARGET_TUNE)))
-#"))
-CC_TARGET_ARCH_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ARCH)))
-#"))
-CC_TARGET_ABI_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ABI)))
-#"))
+CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
+CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
+CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
+
 ifneq ($(CC_TARGET_TUNE_),)
 TARGET_CFLAGS+=-mtune=$(CC_TARGET_TUNE_)
 endif
@@ -99,7 +97,7 @@ TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
 #########################################################################
 #ifeq ($(BR2_ROOTFS_SUFFIX),)
-ROOTFS_SUFFIX:=$(strip $(subst ",, $(BR2_ROOTFS_SUFFIX)))
+ROOTFS_SUFFIX:=$(call qstrip,$(BR2_ROOTFS_SUFFIX))
 ifeq ($(ROOTFS_SUFFIX),)
 ROOTFS_SUFFIX:=
 else
@@ -107,7 +105,7 @@ XXXX=xxxx
 ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
 endif
 
-ifeq ($(strip $(subst ",, $(BR2_FPU_SUFFIX))),y)
+ifeq ($(call qstrip,$(BR2_FPU_SUFFIX)),y)
 COND_ARCH_FPU_SUFFIX:=$(ARCH_FPU_SUFFIX)
 else
 COND_ARCH_FPU_SUFFIX:=
@@ -124,10 +122,8 @@ REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 KERNEL_CROSS=$(TARGET_CROSS)
 else
-TOOLCHAIN_EXTERNAL_PREFIX:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PREFIX)))
-#"))
-TOOLCHAIN_EXTERNAL_PATH:=$(strip $(subst ",, $(BR2_TOOLCHAIN_EXTERNAL_PATH)))
-#"))
+TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
+TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 #TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
@@ -207,8 +203,7 @@ HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 	-e 's/i[3-9]86/i386/' \
 	-e 's/xtensa.*/xtensa/' \
 	)
-GNU_HOST_NAME:=$(HOST_ARCH)-$(subst ",,$(BR2_GNU_BUILD_SUFFIX))
-#")
+GNU_HOST_NAME:=$(HOST_ARCH)-$(call qstrip,$(BR2_GNU_BUILD_SUFFIX))
 
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
@@ -373,7 +368,6 @@ endif
 
 # X Windowing system
 
-X11_PREFIX:=$(strip $(subst ",, $(BR2_X11_PREFIX)))
-#"))
+X11_PREFIX:=$(call qstrip,$(BR2_X11_PREFIX))
 
 include package/Makefile.autotools.in
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 48f4574..45461f8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -11,8 +11,7 @@ BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
 else
-BUSYBOX_VERSION=$(strip $(subst ",, $(BR2_BUSYBOX_VERSION)))
-#"))
+BUSYBOX_VERSION=$(call qstrip,$(BR2_BUSYBOX_VERSION))
 BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox-$(BUSYBOX_VERSION)
 BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
@@ -21,8 +20,7 @@ endif
 BUSYBOX_UNZIP=$(BZCAT)
 
 ifndef BUSYBOX_CONFIG_FILE
-BUSYBOX_CONFIG_FILE=$(subst ",, $(strip $(BR2_PACKAGE_BUSYBOX_CONFIG)))
-#")
+BUSYBOX_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
 $(DL_DIR)/$(BUSYBOX_SOURCE):
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index d4c162e..41b89ae 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-HASERL_VERSION:=$(strip $(subst ",,$(BR2_PACKAGE_HASERL_VERSION)))
-#"))
+HASERL_VERSION:=$(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
 HASERL_SOURCE:=haserl-$(HASERL_VERSION).tar.gz
 HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
 HASERL_AUTORECONF:=no
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index ca80f39..63247e9 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -11,8 +11,7 @@ MICROPERL_SITE=ftp://ftp.cpan.org/pub/CPAN/src/5.0
 MICROPERL_DIR=$(BUILD_DIR)/perl-$(MICROPERL_VERSION)
 
 MICROPERL_MODS_DIR=/usr/lib/perl$(MICROPERL_MAJ)/$(MICROPERL_VERSION)
-MICROPERL_MODS=$(subst ",,$(BR2_PACKAGE_MICROPERL_MODULES))
-# ")
+MICROPERL_MODS=$(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
 ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
 MICROPERL_MODS+=File/Basename.pm Errno.pm Config.pm IO/File.pm Symbol.pm \
 	SelectSaver.pm IO/Seekable.pm IO/Handle.pm IO.pm XSLoader.pm \
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 1f373ac..01a3635 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -24,10 +24,8 @@
 QT_VERSION:=4.5.2
 QT_CAT:=$(BZCAT)
 
-BR2_PACKAGE_QT_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QT_COMMERCIAL_USERNAME)))
-#"))
-BR2_PACKAGE_QT_COMMERCIAL_PASSWORD:=$(strip $(subst ",, $(BR2_PACKAGE_QT_COMMERCIAL_PASSWORD)))
-#"))
+BR2_PACKAGE_QT_COMMERCIAL_USERNAME:=$(call qstrip,$(BR2_PACKAGE_QT_COMMERCIAL_USERNAME))
+BR2_PACKAGE_QT_COMMERCIAL_PASSWORD:=$(call qstrip,$(BR2_PACKAGE_QT_COMMERCIAL_PASSWORD))
 
 QT_CONFIGURE:=#empty
 
@@ -165,8 +163,7 @@ ifeq ($(BR2_PACKAGE_QT_MOUSE_TSLIB),y)
 QT_CONFIGURE += -qt-mouse-tslib
 QT_DEP_LIBS+=tslib
 QT_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
-QT_TSLIB_DEB:=$(strip $(subst ",, $(QT_TSLIB_DEB)))
-#"))
+QT_TSLIB_DEB:=$(call qstrip,$(QT_TSLIB_DEB))
 else
 QT_CONFIGURE += -no-mouse-tslib
 endif
@@ -329,10 +326,8 @@ else
 QT_CONFIGURE+= -no-stl
 endif
 
-QT_CONFIGURE:=$(strip $(subst ",, $(QT_CONFIGURE)))
-#"))
-BR2_PACKAGE_QT_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QT_EMB_PLATFORM)))
-#"))
+QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
+BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
 # x86x86fix
 # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
@@ -340,8 +335,7 @@ BR2_PACKAGE_QT_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QT_EMB_PLATFORM))
 ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
 ifeq ($(BR2_PACKAGE_QT_EMB_PLATFORM),x86)
 QT_CONFIGURE+= -platform linux-g++
-QT_CONFIGURE:=$(strip $(subst ",, $(QT_CONFIGURE)))
-#"))
+QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
 endif
 endif
 # End of workaround.
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index a39ebac..0997393 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -110,8 +110,7 @@ else
 QUAGGA_CONFIGURE+=--disable-opaque-lsa
 endif
 
-QUAGGA_CONFIGURE+=$(subst ",,$(BR2_PACKAGE_QUAGGA_CONFIGURE))
-# ")
+QUAGGA_CONFIGURE+=$(call qstrip,$(BR2_PACKAGE_QUAGGA_CONFIGURE))
 
 $(DL_DIR)/$(QUAGGA_SOURCE):
 	$(call DOWNLOAD,$(QUAGGA_SITE),$(QUAGGA_SOURCE))
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 6276a6a..ee77d96 100644
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
+CRDLY_SHIFT := $(call qstrip,$(BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT))
+TABDLY_SHIFT := $(call qstrip,$(BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT))
+CSIZE_SHIFT := $(call qstrip,$(BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT))
 
 SOCAT_CONFIGURE_OPTS :=
 ifneq ($(CRDLY_SHIFT),)
-- 
1.6.0.4

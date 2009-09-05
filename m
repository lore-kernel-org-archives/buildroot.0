From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Sep 2009 15:14:48 +0200
Subject: [Buildroot] [PATCH 6/7] toolchain: use qstrip
In-Reply-To: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
Message-ID: <af2390c0f437dbb26a31150eb7d526e1d0bdfd1a.1252156486.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/binutils/binutils.mk             |    6 ++----
 toolchain/gcc/Makefile.in                  |   25 +++++++++----------------
 toolchain/gdb/gdb.mk                       |    3 +--
 toolchain/kernel-headers/kernel-headers.mk |    3 +--
 toolchain/uClibc/uclibc.mk                 |   12 ++++--------
 5 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index bcfbe74..0337ca4 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -3,11 +3,9 @@
 # build binutils for use on the host system
 #
 #############################################################
-BINUTILS_VERSION:=$(subst ",,$(BR2_BINUTILS_VERSION))
-#")
+BINUTILS_VERSION:=$(call qstrip,$(BR2_BINUTILS_VERSION))
 
-EXTRA_BINUTILS_CONFIG_OPTIONS=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
-#"))
+EXTRA_BINUTILS_CONFIG_OPTIONS=$(call qstrip,$(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS))
 BINUTILS_SITE:=$(BR2_KERNEL_MIRROR)/linux/devel/binutils
 ifeq ($(BINUTILS_VERSION),2.19.1)
 BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index a1c5564..e148474 100644
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
+GCC_VERSION:=$(call qstrip,$(BR2_GCC_VERSION))
+TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+EXTRA_GCC_CONFIG_OPTIONS:=$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
-ifeq ($(strip $(subst ",, $(BR2_GCC_IS_SNAP))),y)
-#"))
-GCC_SNAP_DATE:=$(strip $(subst ",, $(BR2_GCC_SNAP_DATE)))
-#"))
+ifeq ($(call qstrip,$(BR2_GCC_IS_SNAP)),y)
+GCC_SNAP_DATE:=$(call qstrip,$(BR2_GCC_SNAP_DATE))
 else
 GCC_SNAP_DATE:=
 endif
-#")))
 
 ifeq ($(BR2_GCC_USE_SJLJ_EXCEPTIONS),y)
 GCC_USE_SJLJ_EXCEPTIONS:=--enable-sjlj-exceptions
@@ -57,15 +51,15 @@ ARCH_FPU_SUFFIX:=
 endif
 
 # some additional defaults
-ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ARCH))),)
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 # ")))
 GCC_WITH_ARCH:=--with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
-ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_TUNE))),)
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
 # ")))
 GCC_WITH_TUNE:=--with-tune=$(BR2_GCC_TARGET_TUNE)
 endif
-ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ABI))),)
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 # ")))
 GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
 endif
@@ -95,8 +89,7 @@ endif
 
 
 # and finally pull in config opts from the user
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=$(strip $(subst ",, $(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS)))
-#"))
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=$(call qstrip,$(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS))
 
 ifeq ($(BR2_PREFER_IMA),y)
 # >= 4.x
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 29c4c9c..569f449 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -3,8 +3,7 @@
 # gdb
 #
 ######################################################################
-GDB_VERSION:=$(strip $(subst ",, $(BR2_GDB_VERSION)))
-#"))
+GDB_VERSION:=$(call qstrip,$(BR2_GDB_VERSION))
 
 GDB_OFFICIAL_VERSION:=$(GDB_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GDB_RELEASE)
 
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 10e2648..7897a45 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -7,8 +7,7 @@
 #
 #############################################################
 
-DEFAULT_KERNEL_HEADERS:=$(strip $(subst ",, $(BR2_DEFAULT_KERNEL_HEADERS)))
-#"))
+DEFAULT_KERNEL_HEADERS:=$(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 
 LINUX_HEADERS_SITE:=127.0.0.1
 LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 764b503..3a5e770 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -9,12 +9,10 @@ ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
 ifndef UCLIBC_CONFIG_FILE
-UCLIBC_CONFIG_FILE=$(subst ",, $(strip $(BR2_UCLIBC_CONFIG)))
-#")
+UCLIBC_CONFIG_FILE=$(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
 
-UCLIBC_VER:=$(subst ",,$(BR2_UCLIBC_VERSION_STRING))
-#")
+UCLIBC_VER:=$(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
 
 UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 
@@ -76,10 +74,8 @@ else
 UCLIBC_NOT_TARGET_ENDIAN:=LITTLE
 endif
 
-UCLIBC_ARM_TYPE:=CONFIG_$(strip $(subst ",, $(BR2_ARM_TYPE)))
-#"))
-UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(strip $(subst ",, $(BR2_SPARC_TYPE)))
-#"))
+UCLIBC_ARM_TYPE:=CONFIG_$(call qstrip,$(BR2_ARM_TYPE))
+UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_SPARC_TYPE))
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	$(call DOWNLOAD,$(UCLIBC_SITE),$(UCLIBC_SOURCE))
-- 
1.6.0.4

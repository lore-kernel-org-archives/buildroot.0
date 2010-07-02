From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Jul 2010 14:04:34 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain: remove unused
	special detection of old toolchains
Message-ID: <20100702120718.5418B8227D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=52b8d0478a28d5c8bb29983ad9527e0fa5fae528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We only support gcc >= 4.2.x for the internal toolchain.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/binutils/binutils.mk  |    6 ------
 toolchain/gcc/gcc-uclibc-4.x.mk |   30 +-----------------------------
 2 files changed, 1 insertions(+), 35 deletions(-)

diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 9ac6a22..68ac3e9 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -16,11 +16,6 @@ endif
 BINUTILS_HOST_PREREQ:=
 BINUTILS_TARGET_PREREQ:=
 
-ifeq ($(findstring x4.0,x$(GCC_VERSION)),x4.0)
-BINUTILS_NO_MPFR:=y
-endif
-
-ifndef BINUTILS_NO_MPFR
 BINUTILS_HOST_PREREQ:=$(TOOLCHAIN_DIR)/gmp/lib/libgmp$(HOST_LIBEXT) \
 	$(TOOLCHAIN_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
 HOST_SOURCE += host-libgmp-source host-libmpfr-source
@@ -33,7 +28,6 @@ EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_HOST_DIR)"
 
 BINUTILS_TARGET_CONFIG_OPTIONS=--with-gmp="$(GMP_TARGET_DIR)"
 BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
-endif
 
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 6cede5e..081e906 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -37,10 +37,6 @@ GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=nope
 GCC_SRC_DIR:=$(GCC_DIR)
 
-ifeq ($(findstring x4.0.,x$(GCC_VERSION)),x4.0.)
-GCC_NO_MPFR:=y
-endif
-
 # Branding works on >= 4.3
 ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
 BUILDROOT_VERSION_STRING=$(call qstrip,$(BR2_VERSION))
@@ -101,7 +97,6 @@ ifeq ($(BR2_INSTALL_OBJC),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),objc
 endif
 
-ifndef GCC_NO_MPFR
 GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
 GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
 HOST_SOURCE += host-libgmp-source host-libmpfr-source
@@ -113,7 +108,6 @@ GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
 GCC_WITH_TARGET_GMP=--with-gmp="$(GMP_TARGET_DIR)"
 GCC_WITH_TARGET_MPFR=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
-endif # ifndef GCC_NO_MPFR
 
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 GCC_SHARED_LIBGCC:=--enable-shared
@@ -433,32 +427,10 @@ $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
 	$(MAKE) -C $(GCC_BUILD_DIR3) all
 	touch $@
 
-#
-# gcc-lib dir changes names to gcc with 3.4.mumble
-#
-GCC_LIB_SUBDIR=lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
-# sigh... we need to find a better way
-ifeq ($(findstring x4.0.,x$(GCC_VERSION)),x4.0.)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
-endif
-ifeq ($(findstring x4.1.,x$(GCC_VERSION)),x4.1.)
-GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
-endif
 ifeq ($(findstring x4.2,x$(GCC_VERSION)),x4.2)
-ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
-REAL_GCC_VERSION=$(shell cat $(GCC_SRC_DIR)/gcc/BASE-VER)
-GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(REAL_GCC_VERSION)
-else
-GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
-endif
-endif
 GCC_INCLUDE_DIR:=include
-ifeq ($(findstring x4.3,x$(GCC_VERSION)),x4.3)
-GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
-GCC_INCLUDE_DIR:=include-fixed
-endif
-ifeq ($(findstring x4.4,x$(GCC_VERSION)),x4.4)
-GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
+else
 GCC_INCLUDE_DIR:=include-fixed
 endif
 
-- 
1.7.1

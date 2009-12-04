From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Dec 2009 20:55:37 +0100
Subject: [Buildroot] [git commit master] toolchain: get rid of unused gcc
	3.x legacy handling
Message-ID: <20091204195654.7B902777CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=acc75665e54bc505f46a4f8ce09c0c6634f74b91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/binutils/binutils.mk  |    3 ---
 toolchain/gcc/Makefile.in       |   17 -----------------
 toolchain/gcc/gcc-uclibc-3.x.mk |    4 ----
 3 files changed, 0 insertions(+), 24 deletions(-)

diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index e482a8a..8cddf2d 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -27,9 +27,6 @@ endif
 BINUTILS_HOST_PREREQ:=
 BINUTILS_TARGET_PREREQ:=
 
-ifeq ($(findstring x3.,x$(GCC_VERSION)),x3.)
-BINUTILS_NO_MPFR:=y
-endif
 ifeq ($(findstring x4.0,x$(GCC_VERSION)),x4.0)
 BINUTILS_NO_MPFR:=y
 endif
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index e052b83..e92ecbc 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -19,17 +19,6 @@ GCC_USE_SJLJ_EXCEPTIONS:=--enable-sjlj-exceptions
 endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
-# gcc 3.4.x soft float configuration is different than previous versions.
-ifeq ($(findstring x3.4.,x$(GCC_VERSION)),x3.4.)
-ifneq ($(BR2_nios2),y)
-SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
-endif
-else
-SOFT_FLOAT_CONFIG_OPTION:=--without-float
-endif
-
-# again... there must be a better way
-ifeq ($(findstring x4.,x$(GCC_VERSION)),x4.)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
 ifeq ($(BR2_SOFT_FLOAT_FP),y)
 TARGET_SOFT_FLOAT:=-mfloat-abi=softfp
@@ -40,9 +29,6 @@ else
 TARGET_SOFT_FLOAT:=-msoft-float
 endif
 endif
-else # not gcc-4.x
-TARGET_SOFT_FLOAT:=-msoft-float
-endif
 ARCH_FPU_SUFFIX:=_nofpu
 else # no softfloat support
 SOFT_FLOAT_CONFIG_OPTION:=
@@ -89,10 +75,7 @@ endif
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=$(call qstrip,$(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS))
 
 ifeq ($(BR2_PREFER_IMA),y)
-# >= 4.x
-ifneq ($(findstring x3.,x$(GCC_VERSION)),x3.)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--enable-intermodule
-endif
 endif # BR2_PREFER_IMA=y
 
 TARGETS+=gcc_target
diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index 6531bfc..e737313 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -57,9 +57,6 @@ endif
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=true
 
-ifeq ($(findstring x3.,x$(GCC_VERSION)),x3.)
-GCC_NO_MPFR:=y
-else
 ifneq ($(BR2_INSTALL_FORTRAN),y)
 # fortran needs gmp and mpfr
 ifeq ($(findstring 4.0.,$(GCC_VERSION)),4.0.)
@@ -69,7 +66,6 @@ ifeq ($(findstring 4.1.,$(GCC_VERSION)),4.1.)
 GCC_NO_MPFR:=y
 endif
 endif
-endif
 
 #############################################################
 #
-- 
1.6.3.3

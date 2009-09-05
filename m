From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Sep 2009 15:24:12 +0200
Subject: [Buildroot] [git commit master] project: use qstrip
Message-ID: <20090905132512.A95BF77797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c4555d1f54f4ede48729f78119d12b696f72d76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 project/Makefile.in |   71 +++++++++++++++++---------------------------------
 1 files changed, 24 insertions(+), 47 deletions(-)

diff --git a/project/Makefile.in b/project/Makefile.in
index 85c0eae..7f359bc 100644
--- a/project/Makefile.in
+++ b/project/Makefile.in
@@ -1,33 +1,22 @@
-PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
-#"))
-TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
-#"))
-BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
-#"))
+PROJECT:=$(call qstrip,$(BR2_PROJECT))
+TARGET_HOSTNAME:=$(call qstrip,$(BR2_HOSTNAME))
+BANNER:=$(call qstrip,$(BR2_BANNER))
 
 # silent mode requested?
 QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q,)
 
 # Strip off the annoying quoting
-ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
+ARCH:=$(call qstrip,$(BR2_ARCH))
 ifeq ($(ARCH),xtensa)
-ARCH:=$(ARCH)_$(strip $(subst ",,$(BR2_xtensa_core_name)))
+ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
 endif
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
+WGET:=$(call qstrip,$(BR2_WGET)) $(SPIDER) $(QUIET)
+SVN_CO:=$(call qstrip,$(BR2_SVN_CO)) $(QUIET)
+SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
+GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+ZCAT:=$(call qstrip,$(BR2_ZCAT))
+BZCAT:=$(call qstrip,$(BR2_BZCAT))
+TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 # Buildroot supports building out of tree similarly to the Linux kernel.
 # To use, add O= to the make command line (make O=/tmp/build)
@@ -45,10 +34,8 @@ MAKEOVERRIDES =
 endif
 endif
 
-TOPDIR_PREFIX:=$(strip $(subst ",, $(BR2_TOPDIR_PREFIX)))_
-#"))
-TOPDIR_SUFFIX:=_$(strip $(subst ",, $(BR2_TOPDIR_SUFFIX)))
-#"))
+TOPDIR_PREFIX:=$(call qstrip,$(BR2_TOPDIR_PREFIX))_
+TOPDIR_SUFFIX:=_$(call qstrip,$(BR2_TOPDIR_SUFFIX))
 ifeq ($(TOPDIR_PREFIX),_)
 TOPDIR_PREFIX:=
 endif
@@ -56,8 +43,7 @@ ifeq ($(TOPDIR_SUFFIX),_)
 TOPDIR_SUFFIX:=
 endif
 
-DL_DIR=$(strip $(subst ",, $(BR2_DL_DIR)))
-#"))
+DL_DIR=$(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR:=$(BASE_DIR)/dl
 endif
@@ -65,11 +51,9 @@ endif
 # All non-configurable packages should be built in BUILD_DIR
 BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
-GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
-#"))
+GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 
-STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
-#"))
+STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
 
 # packages compiled for the host goes here
 HOST_DIR:=$(BUILD_DIR)/host_dir
@@ -84,17 +68,10 @@ BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
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
+VENDOR_SITE:=$(call qstrip,$(BR2_VENDOR_SITE))
+VENDOR_SUFFIX:=$(call qstrip,$(BR2_VENDOR_SUFFIX))
+VENDOR_BINUTILS_RELEASE:=$(call qstrip,$(BR2_VENDOR_BINUTILS_RELEASE))
+VENDOR_GCC_RELEASE:=$(call qstrip,$(BR2_VENDOR_GCC_RELEASE))
+VENDOR_UCLIBC_RELEASE:=$(call qstrip,$(BR2_VENDOR_UCLIBC_RELEASE))
+VENDOR_GDB_RELEASE:=$(call qstrip,$(BR2_VENDOR_GDB_RELEASE))
+VENDOR_PATCH_DIR:=$(call qstrip,$(BR2_VENDOR_PATCH_DIR))
-- 
1.6.3.3

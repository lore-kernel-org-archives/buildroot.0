From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:06 +0100
Subject: [Buildroot] [PATCH 11/21 RFC] package/gcc: make -initial and -final
	use sources from host-gcc
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <a29779217f39ad1b9a15eb2e82ecbeb847d8e4c9.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc does not build in-tree. We currently catter to this situation by
building gcc in a sub-dir. This virtually leaves the gcc sources intact.

So, we have three locations where we have identical gcc sources:
  - host-gcc (for legal-info),
  - host-gcc-initial,
  - host-gcc-final.

The gcc sources are not so large, but they still take more than 350Mib
(so more than 1GiB total) and it takes quite some time to extract them.

This patch:

  - changes both host-gcc-initial and host-gc-final to re-use the
    sources from host-gcc;

  - makes host-gcc-initial and host-gcc-final pure host packages, by
    prefixing all variables with HOST_ (we really do not have the target
    variants since we do not support a compiler on the target); not
    defining HOST_GCC_INITIAL_SOURCE will make Buildroot try to download
    a taball for it, which we do not want; ditto HOST_GCC_FINAL_SOURCE;

  - no longer build in a sub-directory, since we no longer have gcc
    sources in the build directory;

  - changes the configure symlink to a wrapper script, otherwise
    configure gets really confused as it only expects the source tree
    to be in either '.' or '..' ;

  - ditches HOST_GCC_APPLY_PATCHES now that it is unused.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 36 ++++++++++++----------------------
 package/gcc/gcc-initial/gcc-initial.mk | 26 +++++++-----------------
 package/gcc/gcc.mk                     | 21 +++++++-------------
 3 files changed, 26 insertions(+), 57 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 5479a4b..43d2644 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -1,37 +1,25 @@
 ################################################################################
 #
-# gcc-final
+# host-gcc-final
 #
 ################################################################################
 
-GCC_FINAL_VERSION = $(HOST_GCC_VERSION)
-GCC_FINAL_SITE = $(HOST_GCC_SITE)
-GCC_FINAL_SOURCE = $(HOST_GCC_SOURCE)
+HOST_GCC_FINAL_VERSION = $(HOST_GCC_VERSION)
+HOST_GCC_FINAL_SOURCE =
 
 # We only need to redistribute the gcc sources once, and that is handled by
 # the host-gcc package, not host-gcc-final. So, we fake a non-redistribuale
 # package, even though it *is* redistributable, but is already redistributed
 # thanks to host-gcc.
-GCC_FINAL_REDISTRIBUTE = IGNORE
+HOST_GCC_FINAL_REDISTRIBUTE = IGNORE
 
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	$(BR_LIBC)
 
-HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
-HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
-
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
-endif
-
-HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
-
-# gcc doesn't support in-tree build, so we create a 'build'
-# subdirectory in the gcc sources, and build from there.
-HOST_GCC_FINAL_SUBDIR = build
-
-HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+# gcc doesn't support in-tree build, so we re-use the sources extracted
+# # for the host-gcc package and do a complete out-of-tree build
+HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_CONFIGURE_WRAPPER
 
 define  HOST_GCC_FINAL_CONFIGURE_CMDS
 	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
@@ -49,14 +37,14 @@ endef
 
 
 # Languages supported by the cross-compiler
-GCC_FINAL_CROSS_LANGUAGES-y = c
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
-GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
+HOST_GCC_FINAL_CROSS_LANGUAGES-y = c
+HOST_GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+HOST_GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
+HOST_GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(HOST_GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
-	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
+	--enable-languages=$(HOST_GCC_FINAL_CROSS_LANGUAGES) \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1c478a5..74debe9 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -1,35 +1,23 @@
 ################################################################################
 #
-# gcc-initial
+# host-gcc-initial
 #
 ################################################################################
 
-GCC_INITIAL_VERSION = $(HOST_GCC_VERSION)
-GCC_INITIAL_SITE = $(HOST_GCC_SITE)
-GCC_INITIAL_SOURCE = $(HOST_GCC_SOURCE)
+HOST_GCC_INITIAL_VERSION = $(HOST_GCC_VERSION)
+HOST_GCC_INITIAL_SOURCE =
 
 # We only need to redistribute the gcc sources once, and that is handled by
 # the host-gcc package, not host-gcc-initial. So, we fake a non-redistribuale
 # package, even though it *is* redistributable, but is already redistributed
 # thanks to host-gcc.
-GCC_INITIAL_REDISTRIBUTE = IGNORE
+HOST_GCC_INITIAL_REDISTRIBUTE = IGNORE
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
-HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
-HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
-
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
-endif
-
-HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
-
-# gcc doesn't support in-tree build, so we create a 'build'
-# subdirectory in the gcc sources, and build from there.
-HOST_GCC_INITIAL_SUBDIR = build
-
-HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+# gcc doesn't support in-tree build, so we re-use the sources extracted
+# for the host-gcc package and do a complete out-of-tree build
+HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_CONFIGURE_WRAPPER
 
 HOST_GCC_INITIAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 28346b2..be58d96 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -58,20 +58,13 @@ HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_APPLY_POWERPC_PATCH
 endif
 endif
 
-define HOST_GCC_APPLY_PATCHES
-	if test -d package/gcc/$(HOST_GCC_VERSION); then \
-	  $(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_VERSION) \*.patch ; \
-	fi;
-	$(HOST_GCC_APPLY_POWERPC_PATCH)
-endef
-
-#
-# Create 'build' directory and configure symlink
-#
-
-define HOST_GCC_CONFIGURE_SYMLINK
-	mkdir -p $(@D)/build
-	ln -sf ../configure $(@D)/build/configure
+# Note: HOST_GCC_DIR is not yet defined, but this macro is only used in
+# the host-gcc-initial and host-gcc-final packages, which are included
+# only after we call the package infra, so HOST_GCC_DIR will be defined
+# when it is used.
+define HOST_GCC_CONFIGURE_WRAPPER
+	printf '#!/bin/sh\nexec "$(HOST_GCC_DIR)/configure" "$${@}"\n' >$(@D)/configure
+	chmod 755 $(@D)/configure
 endef
 
 #
-- 
1.9.1

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:04 +0100
Subject: [Buildroot] [PATCH 09/21 RFC] package/gcc: properly extract and
	patch sources
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <f84cab2dedb3294dbe1b41f309f63aa71b6ef043.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we're extracting the gcc sources three times, which takes a
bit of place:
  - for host-gcc, just for the sake of legal-info,
  - for host-gcc-initial,
  - for host-gcc-final.

However, gcc does not support in-tree builds, and for host-gcc-initial
as well as for host-gcc-final, wiile we do not build anything for
host-gcc we build in a sub-directory, which leaves the three gcc source
trees intact.

Thus, we could re-use the sources from host-gcc for the two builds, but
they are so far not completely patched. Most notably, the special Xtensa
tarball is not extracted, and the powerpc patch is not applied when
needed.

Re-organise the way the host-gcc package is defined, so that the source
tree is properly prepared. We need to move blocks around, so that hooks
are registered in the correct order; as a reference, we use the ordering
as seen in host-gcc-initial and host-gcc-final (same order in both).

The "standard" patches are applied by the package infra, so we add a
post-patch hook to apply the powerpc patch.

The list of exclusions is defined earlier, as it looks more logical to
have all extract-related defintions come before the patch-related ones.

Ditto for the testsuite.

We for now keep the HOST_GCC_APPLY_PATCHES and HOST_GCC_CONFIGURE_SYMLINK
macros, as host-gcc-initial and host-gcc-final have not yet been
converted. Once that's been done, we can get rid of the macros.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index fe984a7..fa5baa6 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -24,29 +24,37 @@ GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
 endif
 
-GCC_SOURCE ?= gcc-$(GCC_VERSION).tar.bz2
+HOST_GCC_EXCLUDES = \
+	libjava/* libgo/* \
+	gcc/testsuite/* libstdc++-v3/testsuite/*
+
+define HOST_GCC_FAKE_TESTSUITE
+	mkdir -p $(@D)/libstdc++-v3/testsuite/
+	echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
+	echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in
+endef
+HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
 #
 # Xtensa special hook
 #
-
+ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_XTENSA_OVERLAY_TAR = $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,$(BR2_XTENSA_CORE_NAME)).tar
-
 define HOST_GCC_XTENSA_OVERLAY_EXTRACT
 	tar xf $(HOST_GCC_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
 endef
-
-#
-# Apply patches
-#
+HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+endif # Xtensa
 
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_APPLY_POWERPC_PATCH
 	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
 endef
+HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_APPLY_POWERPC_PATCH
 endif
 endif
 
@@ -57,16 +65,6 @@ define HOST_GCC_APPLY_PATCHES
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
-HOST_GCC_EXCLUDES = \
-	libjava/* libgo/* \
-	gcc/testsuite/* libstdc++-v3/testsuite/*
-
-define HOST_GCC_FAKE_TESTSUITE
-	mkdir -p $(@D)/libstdc++-v3/testsuite/
-	echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
-	echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in
-endef
-
 #
 # Create 'build' directory and configure symlink
 #
-- 
1.9.1

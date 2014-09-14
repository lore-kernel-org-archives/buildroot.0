From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Sep 2014 11:50:00 +0200
Subject: [Buildroot] [PATCH 2/5] gcc/gcc-intermediate: remove package
In-Reply-To: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410688203-28621-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have switched to a two steps gcc build process that uses
only gcc-initial and gcc-final, we can get rid of the gcc-intermediate
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-intermediate/gcc-intermediate.mk | 49 ------------------------
 package/gcc/gcc.mk                               |  3 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 package/gcc/gcc-intermediate/gcc-intermediate.mk

diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
deleted file mode 100644
index db84d18..0000000
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-################################################################################
-#
-# gcc-intermediate
-#
-################################################################################
-
-GCC_INTERMEDIATE_VERSION = $(GCC_VERSION)
-GCC_INTERMEDIATE_SITE    = $(GCC_SITE)
-GCC_INTERMEDIATE_SOURCE  = $(GCC_SOURCE)
-
-HOST_GCC_INTERMEDIATE_DEPENDENCIES = \
-	$(HOST_GCC_COMMON_DEPENDENCIES) \
-	$(BR_LIBC)-configure
-
-HOST_GCC_INTERMEDIATE_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
-
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_INTERMEDIATE_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
-endif
-
-HOST_GCC_INTERMEDIATE_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
-
-# gcc doesn't support in-tree build, so we create a 'build'
-# subdirectory in the gcc sources, and build from there.
-HOST_GCC_INTERMEDIATE_SUBDIR = build
-
-HOST_GCC_INTERMEDIATE_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
-
-HOST_GCC_INTERMEDIATE_CONF_OPT = \
-	$(HOST_GCC_COMMON_CONF_OPT) \
-	--enable-languages=c \
-	--disable-largefile \
-	--disable-nls \
-	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
-
-HOST_GCC_INTERMEDIATE_CONF_ENV = \
-	$(HOST_GCC_COMMON_CONF_ENV)
-
-HOST_GCC_INTERMEDIATE_MAKE_OPT = all-gcc
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-HOST_GCC_INTERMEDIATE_MAKE_OPT += all-target-libgcc
-endif
-
-HOST_GCC_INTERMEDIATE_INSTALL_OPT = install-gcc
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-HOST_GCC_INTERMEDIATE_INSTALL_OPT += install-target-libgcc
-endif
-
-$(eval $(host-autotools-package))
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b344a14..7da4ee2 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -1,7 +1,6 @@
 ################################################################################
 #
-# Common variables for the gcc-initial, gcc-intermediate and gcc-final
-# packages.
+# Common variables for the gcc-initial and gcc-final packages.
 #
 ################################################################################
 
-- 
2.0.0

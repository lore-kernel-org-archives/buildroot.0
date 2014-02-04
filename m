From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Feb 2014 16:36:18 +0100
Subject: [Buildroot] [PATCH] Strip *.so* and not only executable files
Message-ID: <1391528178-2115-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our current stripping strategy requires that shared libraries have the
executable permission. However, this is by far not something
recognized as a standard behavior: Debian/Ubuntu distributions for
example do not have executable permissions on their
libraries. Therefore, pushing to upstream packages fixes that add the
executable permissions is not easy.

As a result, this commit improves the stripping logic so that it not
only strips the files that are executable, but also the ones that
match '*.so*', which should match both the shared libraries and the
dlopen()'able plugins, as long as they have a .so extension.

Thanks to this addition, a number of manual "chmod +x" done by various
packages can be removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                           | 2 +-
 package/gcc/gcc-final/gcc-final.mk | 4 +---
 package/gettext/gettext.mk         | 7 -------
 package/libiconv/libiconv.mk       | 8 --------
 package/pciutils/pciutils.mk       | 7 -------
 package/sunxi-mali/sunxi-mali.mk   | 2 --
 6 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/Makefile b/Makefile
index 4a675d4..6f588fe 100644
--- a/Makefile
+++ b/Makefile
@@ -487,7 +487,7 @@ STRIP_FIND_CMD = find $(TARGET_DIR)
 ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
 STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
 endif
-STRIP_FIND_CMD += -type f -perm /111
+STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
 target-finalize:
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 47b30da..ecc4068 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -103,14 +103,12 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_LD_LINUX_LINK
 endif
 
 # Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
-# libgcc_s to be installed in /lib and not /usr/lib. We add +x on
-# libgcc_s to ensure it will be stripped.
+# libgcc_s to be installed in /lib and not /usr/lib.
 define HOST_GCC_FINAL_INSTALL_LIBGCC
 	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(STAGING_DIR)/lib/
 	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(TARGET_DIR)/lib/
-	-chmod +x $(TARGET_DIR)/lib/libgcc_s.so.1
 endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index fbdb19c..748c2a5 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -57,12 +57,5 @@ endef
 endif
 endif # GETTEXT_TOOLS = n
 
-# Library lacks +x so strip skips it
-define GETTEXT_FIX_LIBRARY_MODE
-	-chmod +x $(TARGET_DIR)/usr/lib/libintl.so*
-endef
-
-GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_FIX_LIBRARY_MODE
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 3a513b3..ee313ce 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -20,14 +20,6 @@ endef
 LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
 LIBICONV_POST_INSTALL_STAGING_HOOKS += LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
 
-# Library lacks +x so strip skips it
-define LIBICONV_FIX_LIBRARY_MODE
-	-chmod +x $(TARGET_DIR)/usr/lib/libcharset.so*
-	-chmod +x $(TARGET_DIR)/usr/lib/libiconv.so*
-endef
-
-LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_FIX_LIBRARY_MODE
-
 $(eval $(autotools-package))
 
 # Configurations where the toolchain supports locales and the libiconv
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 16ba61b..bc88ab3 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -66,11 +66,4 @@ define PCIUTILS_INSTALL_STAGING_CMDS
 endef
 
 
-# Library lacks +x so strip skips it
-define PCIUTILS_FIX_LIBRARY_MODE
-	-chmod +x $(TARGET_DIR)/usr/lib/libpci.so*
-endef
-
-PCIUTILS_POST_INSTALL_TARGET_HOOKS += PCIUTILS_FIX_LIBRARY_MODE
-
 $(eval $(generic-package))
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index d9fd8be..c625c6e 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -68,8 +68,6 @@ endef
 define SUNXI_MALI_INSTALL_TARGET_CMDS
 	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D)/lib \
 		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-	# add execution permissions so that libraries are properly stripped
-	chmod +x $(addprefix $(TARGET_DIR)/usr/lib/lib,EGL.so GLESv1_CM.so GLESv2.so Mali.so UMP.so*)
 	$(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
 		$(INSTALL) -m 755 $(@D)/version/version $(TARGET_DIR)/usr/bin/maliver; \
 		$(INSTALL) -m 755 $(@D)/test/test $(TARGET_DIR)/usr/bin/malitest
-- 
1.8.3.2

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 15 Jul 2015 10:39:05 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: create symlink to 'lib' from
	ARCH_LIB_DIR iso fixed lib32/lib64
Message-ID: <1436949545-12487-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Currently, following symbolic links are created in both target and
staging directories:
- lib(32|64) --> lib
- usr/lib(32|64) --> lib

The decision for lib32 or lib64 is based on the target architecture
configuration in buildroot (BR2_ARCH_IS_64).

In at least one case this is not correct: when building for a Cavium Octeon
III processor using the toolchain from the Cavium Networks SDK, and
specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected
in directory 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).

More generally, for external toolchains, the correct symbolic link is
from (usr/)${ARCH_LIB_DIR} to lib. For internal toolchains, current
toolchains always use either lib32 or lib64.

Fix the problem as follows:
- create a symlink creation helper in toolchain/helpers.mk
- for external toolchains, call these helpers based on ARCH_LIB_DIR
- for internal toolchains, call these helpers based on the existing
  fixed lib32/lib64 logic, moved from Makefile

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 Makefile                                             | 10 ----------
 package/skeleton/skeleton.mk                         |  3 ---
 toolchain/helpers.mk                                 | 13 +++++++++++++
 toolchain/toolchain-buildroot/toolchain-buildroot.mk | 18 ++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk   | 12 ++++++++++++
 5 files changed, 43 insertions(+), 13 deletions(-)

Note: in output/staging/usr/ there would still be more directories than I
think are really necessary. This behavior is not changed by this patch, it
was already present before.
For example, with the mentioned Octeon III toolchain, output/staging/usr/
contains:
    bin      bin32      bin32-fp      bin64-fp,
    lib                 lib32-fp      lib64-fp
    libexec  libexec32  libexec32-fp  libexec64-fp
    sbin     sbin32     sbin32-fp     sbin64-fp

where bin/lib/libexec/sbin seem to be the 64-bit equivalents of
bin32/lib32/libexec32/sbin32.
This is related to the behavior of copy_toolchain_sysroot in
toolchain/helpers.mk. It already attempts to filter out lib32 and lib64, but
does not care about any bin/sbin/libexec directories, nor about such names
as lib32-fp.
As the behavior is not changed by this patch, and as I'm not fully aware
about which directories are really needed in all cases, I am not touching
this area.

diff --git a/Makefile b/Makefile
index 531ac5d..c1fec47 100644
--- a/Makefile
+++ b/Makefile
@@ -444,20 +444,10 @@ world: target-post-image
 $(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
-# We make a symlink lib32->lib or lib64->lib as appropriate
-# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
-ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
-LIB_SYMLINK = lib64
-else
-LIB_SYMLINK = lib32
-endif
-
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/bin
 	@mkdir -p $(STAGING_DIR)/lib
-	@ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
 	@mkdir -p $(STAGING_DIR)/usr/lib
-	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
 	@mkdir -p $(STAGING_DIR)/usr/include
 	@mkdir -p $(STAGING_DIR)/usr/bin
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 48e7085..2481bd1 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -25,9 +25,6 @@ define SKELETON_INSTALL_TARGET_CMDS
 		$(SKELETON_PATH)/ $(TARGET_DIR)/
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
-	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
-	mkdir -p $(TARGET_DIR)/usr
-	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
 endef
 
 SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 895f3f1..292a865 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -1,5 +1,18 @@
 # This Makefile fragment declares toolchain related helper functions.
 
+# Create the necessary symlink from (usr/)lib32|lib64|lib32-fp|... to lib
+# In general, for external toolchains, the correct link name is $ARCH_LIB_DIR.
+# $1: link name
+# $2: destination directory (TARGET_DIR / STAGING_DIR)
+create_lib_symlinks = \
+	LIB_SYMLINK="$(strip $1)" ; \
+	DESTDIR="$(strip $2)" ; \
+	if [ "$${LIB_SYMLINK}" != "lib" ]; then \
+		mkdir -p "$${DESTDIR}/usr" ; \
+		ln -snf lib "$${DESTDIR}/$${LIB_SYMLINK}" ; \
+		ln -snf lib "$${DESTDIR}/usr/$${LIB_SYMLINK}" ; \
+	fi
+
 # The copy_toolchain_lib_root function copies a toolchain library and
 # its symbolic links from the sysroot directory to the target
 # directory. Note that this function is used both by the external
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc33..30c50d6 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -14,4 +14,22 @@ TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+# The creation of lib32/lib64 symlinks into target and staging directories
+# needs to be done before the C library is installed. Hooking into the libc
+# hooks directly is tricky because there are multiple C libraries supported.
+# Instead, hook into the install step of host-gcc-initial.
+#
+# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+TOOLCHAIN_BUILDROOT_LIB_SYMLINK = lib64
+else
+TOOLCHAIN_BUILDROOT_LIB_SYMLINK = lib32
+endif
+
+define TOOLCHAIN_BUILDROOT_CREATE_STAGING_TARGET_SYMLINK
+	$(call create_lib_symlinks,$(TOOLCHAIN_BUILDROOT_LIB_SYMLINK),$(STAGING_DIR))
+	$(call create_lib_symlinks,$(TOOLCHAIN_BUILDROOT_LIB_SYMLINK),$(TARGET_DIR))
+endef
+HOST_GCC_INITIAL_POST_INSTALL_HOOKS += TOOLCHAIN_BUILDROOT_CREATE_STAGING_TARGET_SYMLINK
+
 $(eval $(virtual-package))
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index fcb033c..348e90f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -615,6 +615,16 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
 
+define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
+	$(Q)ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	$(call create_lib_symlinks,$${ARCH_LIB_DIR},$(STAGING_DIR))
+endef
+
+define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
+	$(Q)ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	$(call create_lib_symlinks,$${ARCH_LIB_DIR},$(TARGET_DIR))
+endef
+
 # Special installation target used on the Blackfin architecture when
 # FDPIC is not the primary binary format being used, but the user has
 # nonetheless requested the installation of the FDPIC libraries to the
@@ -733,6 +743,7 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 endef
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
+	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
@@ -742,6 +753,7 @@ endef
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
+	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
-- 
1.9.5

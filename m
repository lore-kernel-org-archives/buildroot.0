From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Dec 2015 11:24:29 +0100
Subject: [Buildroot] [PATCH v8] toolchain: create symlink ARCH_LIB_DIR->lib
	in addition to lib32/lib64->lib
Message-ID: <1450779869-29687-1-git-send-email-patrickdepinguin@gmail.com>
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

Feedback from Arnout Vandecappelle is that there are packages that do depend
on the lib32/lib64 symlink, even if ARCH_LIB_DIR is different. Hence, these
must be kept.

Fix the problem as follows:
- For internal toolchains: no functional change, but move the symlink
  creation from Makefile to package gcc-initial.
- For external toolchains: create a symlink creation helper in
  toolchain/helpers.mk, which first creates lib32->lib or lib64->lib as
  appropriate, and then creates ARCH_LIB_DIR->lib if that is different from
  lib32/lib64.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E. Morin" <yann.morin.1998@free.fr>

---
v8:
- use helper only for external toolchain and incorporate ARCH_LIB_DIR
  definition (Arnout)
- keep lib32/lib64->lib symlink anyway
v7: rebase
v6: rebase only
v5:
- move internal toolchain logic into gcc-initial.mk
- also silence the internal toolchain link steps with $(Q)
v4:
- merge both helpers into one
- remove the separate target for the internal toolchain and hook into
  gcc-initial
- re-add deleted comment about MIPS64/n32
v3:
- update commit message wrapping
- change dependency on $(BUILD_DIR) to a order-only dependency
v2:
- fix 'lib32-fp' leftover in toolchain-buildroot
- silence commands creating symlink with $(Q)
- fix case where ARCH_LIB_DIR is 'lib'

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
---
 Makefile                                           |  8 --------
 package/gcc/gcc-initial/gcc-initial.mk             | 14 +++++++++++++
 package/skeleton/skeleton.mk                       |  4 ----
 toolchain/helpers.mk                               | 24 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 10 +++++++++
 5 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index dc657d9..63f4c54 100644
--- a/Makefile
+++ b/Makefile
@@ -448,14 +448,6 @@ world: target-post-image
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
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1e58d8b..0cae42b 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -64,4 +64,18 @@ HOST_GCC_INITIAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_A
 HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
+# The creation of lib32/lib64 symlinks into target and staging directories
+# needs to be done before the C library is installed. Hooking into the libc
+# hooks directly is tricky because there are multiple C libraries supported.
+# Instead, hook into the install step of host-gcc-initial.
+define HOST_GCC_INITIAL_CREATE_STAGING_TARGET_SYMLINK
+	$(Q)mkdir -p $(STAGING_DIR)/usr
+	$(Q)ln -snf lib $(STAGING_DIR)/$(TOOLCHAIN_LIB_SYMLINK)
+	$(Q)ln -snf lib $(STAGING_DIR)/usr/$(TOOLCHAIN_LIB_SYMLINK)
+	$(Q)mkdir -p $(TARGET_DIR)/usr
+	$(Q)ln -snf lib $(TARGET_DIR)/$(TOOLCHAIN_LIB_SYMLINK)
+	$(Q)ln -snf lib $(TARGET_DIR)/usr/$(TOOLCHAIN_LIB_SYMLINK)
+endef
+HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INITIAL_CREATE_STAGING_TARGET_SYMLINK
+
 $(eval $(host-autotools-package))
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 790afaf..b1395b5 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -82,8 +82,6 @@ define SKELETON_INSTALL_TARGET_CMDS
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(SKELETON_PATH)/ $(TARGET_DIR)/
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
-	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
 endef
@@ -99,8 +97,6 @@ define SKELETON_INSTALL_STAGING_CMDS
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
-	ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
-	ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
 endef
 
 SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1452ec6..b78bf87 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -1,5 +1,29 @@
 # This Makefile fragment declares toolchain related helper functions.
 
+# Create the necessary symlink from (usr/)lib32|lib64|lib32-fp|... to lib
+# In general, for external toolchains, the correct link name is $ARCH_LIB_DIR.
+# However, there are some broken packages that expect lib32/lib64 anyway.
+# Therefore, create lib32->lib or lib64->lib (as appropriate) and additionally
+# $(ARCH_LIB_DIR)->lib.
+#
+# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+TOOLCHAIN_LIB_SYMLINK = lib64
+else
+TOOLCHAIN_LIB_SYMLINK = lib32
+endif
+# $1: destination directory (TARGET_DIR / STAGING_DIR)
+create_lib_symlinks = \
+	DESTDIR="$(strip $1)" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	mkdir -p "$${DESTDIR}/usr" ; \
+	ln -snf lib "$${DESTDIR}/$(TOOLCHAIN_LIB_SYMLINK)" ; \
+	ln -snf lib "$${DESTDIR}/usr/$(TOOLCHAIN_LIB_SYMLINK)" ; \
+	if [ "$${ARCH_LIB_DIR}" != "lib" -a "$${ARCH_LIB_DIR}" != "$(TOOLCHAIN_LIB_SYMLINK)" ]; then \
+		ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
+		ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
+	fi
+
 # The copy_toolchain_lib_root function copies a toolchain library and
 # its symbolic links from the sysroot directory to the target
 # directory. Note that this function is used both by the external
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 745b685..e20268e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -689,6 +689,14 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
 
+define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
+	$(call create_lib_symlinks,$(STAGING_DIR))
+endef
+
+define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
+	$(call create_lib_symlinks,$(TARGET_DIR))
+endef
+
 # Special installation target used on the Blackfin architecture when
 # FDPIC is not the primary binary format being used, but the user has
 # nonetheless requested the installation of the FDPIC libraries to the
@@ -803,6 +811,7 @@ endef
 TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
+	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
@@ -812,6 +821,7 @@ endef
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
+	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
-- 
1.9.5

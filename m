From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 14:20:10 +0100
Subject: [Buildroot] [git commit] toolchain-external: create symlink
	ARCH_LIB_DIR->lib
Message-ID: <20160201224702.9A9007F87D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cef3cd40b7a168f2e1f532f4b621a259f5ace095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, following symbolic links are created in both target and
staging directories:
- lib(32|64) --> lib
- usr/lib(32|64) --> lib

The decision for lib32 or lib64 is based on the target architecture
configuration in buildroot (BR2_ARCH_IS_64).

In at least one case this is not correct: when building for a Cavium Octeon
III processor using the toolchain from the Cavium Networks SDK, and
specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected
in directory 'lib32-fp' rather than 'lib32' (ABI=n32; likewise for
lib64-fp in case of ABI=n64)

More generally the correct symbolic link is from (usr/)${ARCH_LIB_DIR}->lib.
However, feedback from Arnout Vandecappelle is that there are packages that
do depend on the lib32/lib64 symlink, even if ARCH_LIB_DIR is different.
Hence, these links must be kept.

Fix the problem as follows:
- For internal toolchains: no change
- For external toolchains: create a symlink ARCH_LIB_DIR->lib if
  (usr/)ARCH_LIB_DIR does not exist yet.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index ddefd01..518afd6 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -517,6 +517,27 @@ endef
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
 endif
 
+# Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
+# Note: the skeleton package additionally creates lib32->lib or lib64->lib
+# (as appropriate)
+#
+# $1: destination directory (TARGET_DIR / STAGING_DIR)
+create_lib_symlinks = \
+       $(Q)DESTDIR="$(strip $1)" ; \
+       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+       if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
+               ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
+               ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
+       fi
+
+define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
+       $(call create_lib_symlinks,$(STAGING_DIR))
+endef
+
+define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
+       $(call create_lib_symlinks,$(TARGET_DIR))
+endef
+
 # Integration of the toolchain into Buildroot: find the main sysroot
 # and the variant-specific sysroot, then copy the needed libraries to
 # the $(TARGET_DIR) and copy the whole sysroot (libraries and headers)
@@ -732,6 +753,7 @@ endef
 TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
+	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
@@ -741,6 +763,7 @@ endef
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
+	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)

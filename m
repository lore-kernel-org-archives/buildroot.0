From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:56:50 +0100
Subject: [Buildroot] [PATCH v3 01/24] toolchain-external:
	TOOLCHAIN_EXTERNAL_CREATE_*_LIB_SYMLINK: use arguments
	instead of global variables
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new external toolchain package infrastructure will be introduced in a
followup patch, so TOOLCHAIN_EXTERNAL_{CC,CFLAGS...} global variables
will no longer exist since the toolchain-external package will be turned
into a virtual package. Each external-toolchain packages providers will
provide it's own <toolchain-external-name>_{CC,CFLAGS...} variables.

So additional arguments are needed to provide CC and CFLAG when calling
TOOLCHAIN_EXTERNAL_CREATE_*_LIB_SYMLINK.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: explain that the toolchain-external package will be a virtual package (Yann)
    use local variables for functions/macros (Yann)
v2: rework commit log/title (Arnout)
---
 toolchain/toolchain-external/toolchain-external.mk | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b7a36be..2b07da0 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -554,20 +554,32 @@ endif
 # (as appropriate)
 #
 # $1: destination directory (TARGET_DIR / STAGING_DIR)
+# $2: toolchain CC
+# $3: toolchain CFLAGS
 create_lib_symlinks = \
        $(Q)DESTDIR="$(strip $1)" ; \
-       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+       TOOLCHAIN_CC="$(strip $2)" ; \
+       TOOLCHAIN_CFLAGS="$(strip $3)" ; \
+       ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
        if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
                ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
                ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
        fi
 
+# $1: toolchain CC
+# $2: toolchain CFLAGS
 define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
-       $(call create_lib_symlinks,$(STAGING_DIR))
+       TOOLCHAIN_CC="$(strip $1)" ; \
+       TOOLCHAIN_CFLAGS="$(strip $2)" ; \
+       $(call create_lib_symlinks,$(STAGING_DIR),$${TOOLCHAIN_CC},$${TOOLCHAIN_CFLAGS})
 endef
 
+# $1: toolchain CC
+# $2: toolchain CFLAGS
 define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
-       $(call create_lib_symlinks,$(TARGET_DIR))
+       TOOLCHAIN_CC="$(strip $1)" ; \
+       TOOLCHAIN_CFLAGS="$(strip $2)" ; \
+       $(call create_lib_symlinks,$(TARGET_DIR),$${TOOLCHAIN_CC},$${TOOLCHAIN_CFLAGS})
 endef
 
 # Integration of the toolchain into Buildroot: find the main sysroot
@@ -781,7 +793,7 @@ TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_WRAPPER_INSTALL)
-	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
+	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
@@ -792,7 +804,7 @@ endef
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
-	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
+	$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
-- 
2.5.5

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 11 Jul 2012 13:49:19 +0200
Subject: [Buildroot] [PATCH v2] Remove -fPIC on x86_64
Message-ID: <1342007359-8910-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -fPIC breaks the purgatory of kexec (= the code that passes command-line
arguments to the kernel): kexec doesn't know how to handle the GOT and PLT
relocation entries.

There is also no reason at all to pass -fPIC.  Shared libraries that require
it will add it to their local Makefiles, and normal executables have no
business with -fPIC (plus it adds overhead...).

The -fPIC was added by Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
in commit 8027784c.  That commit adds sysroot parameters to CFLAGS.
There is no explanation why -fPIC is also added for x86_64.

The removal of -fPIC exposes a problem in the configuration of some packages
when ccache is enabled, because the compilation of conftest.c is reused.
To circumvent this problem, disable ccache in the configure step.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Build-tested with Sourcery toolchain and full-featured internal toolchain
on a x86_64 host with allyesconfig (but without the packages that fail to
build in the first place).

v2:
 - Add CCACHE_DISABLE to TARGET_CONFIGURE_ARGS
 - Test with allyesconfig

 package/Makefile.in            |    9 ++-------
 package/libgcrypt/libgcrypt.mk |    9 ---------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c5ad00a..4a59d64 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -87,12 +87,6 @@ endif
 
 TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
-ifeq ($(BR2_x86_64),y)
-TARGET_CFLAGS+=-fPIC -DPIC
-endif # PIC for dynamic objects on x86_64
-endif
-
 ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
 TARGET_CFLAGS+=-fno-pic -mno-abicalls
 endif
@@ -269,7 +263,8 @@ TARGET_CONFIGURE_ARGS= \
 	ac_cv_func_calloc_0_nonnull=yes \
 	ac_cv_func_realloc_0_nonnull=yes \
 	lt_cv_sys_lib_search_path_spec="" \
-	$(BR2_AC_CV_C_BIGENDIAN)
+	$(BR2_AC_CV_C_BIGENDIAN) \
+	CCACHE_DISABLE=1
 
 #######################################################################
 
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 2671819..68c6c47 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -17,13 +17,4 @@ LIBGCRYPT_CONF_OPT = \
 
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 
-# libgcrypt doesn't use pkg-config but instead has its own
-# libgcrypt-config.  Install this in the host directory so
-# packages depending on libgcrypt can find it.
-define LIBGCRYPT_HOST_INSTALL_LIBGCRYPT_CONFIG
-	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/libgcrypt-config $(HOST_DIR)/usr/bin/libgcrypt-config
-endef
-
-LIBGCRYPT_POST_INSTALL_STAGING_HOOKS += LIBGCRYPT_HOST_INSTALL_LIBGCRYPT_CONFIG
-
 $(eval $(call AUTOTARGETS))
-- 
tg: (f61dcea..) t/pic (depends on: t/force-cross)

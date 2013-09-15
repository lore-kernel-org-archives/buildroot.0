From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 22:58:37 +0200
Subject: [Buildroot] [git commit] toolchain: add support for glibc
Message-ID: <20130915213314.96CCE9B76A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14a2d0b5ab87d16fa405b52612b181bfca03da20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The support for eglibc 2.17 was added to the internal toolchain
backend for 2013.08. This commit now adds glibc 2.18 support to the
internal toolchain backend.

Since the building procedure is very similar to the one of eglibc, we
have renamed the 'eglibc' package to 'glibc', and made it capable of
handling either glibc or eglibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/Config.in.host                   |    2 +-
 package/gcc/gcc-final/gcc-final.mk           |    4 +-
 package/{eglibc/eglibc.mk => glibc/glibc.mk} |   62 ++++++++++++++++----------
 toolchain/toolchain-buildroot/Config.in      |   24 ++++++++++-
 4 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index dbf0f20..111da3b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -145,7 +145,7 @@ config BR2_INSTALL_FORTRAN
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
-	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC
+	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	help
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 2dbdfab..f627767 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -80,11 +80,11 @@ endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_SIMPLE_SYMLINKS
 
-# In gcc 4.7.x, the ARM EABIhf library loader path for eglibc was not
+# In gcc 4.7.x, the ARM EABIhf library loader path for (e)glibc was not
 # correct, so we create a symbolic link to make things work
 # properly. eglibc installs the library loader as ld-linux-armhf.so.3,
 # but gcc creates binaries that reference ld-linux.so.3.
-ifeq ($(BR2_arm)$(BR2_ARM_EABIHF)$(BR2_GCC_VERSION_4_7_X)$(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),yyyy)
+ifeq ($(BR2_arm)$(BR2_ARM_EABIHF)$(BR2_GCC_VERSION_4_7_X)$(BR2_TOOLCHAIN_USES_GLIBC),yyyy)
 define HOST_GCC_FINAL_LD_LINUX_LINK
 	ln -sf ld-linux-armhf.so.3 $(TARGET_DIR)/lib/ld-linux.so.3
 	ln -sf ld-linux-armhf.so.3 $(STAGING_DIR)/lib/ld-linux.so.3
diff --git a/package/eglibc/eglibc.mk b/package/glibc/glibc.mk
similarity index 59%
rename from package/eglibc/eglibc.mk
rename to package/glibc/glibc.mk
index 0ed908d..4dd2e63 100644
--- a/package/eglibc/eglibc.mk
+++ b/package/glibc/glibc.mk
@@ -1,32 +1,46 @@
 ################################################################################
 #
-# eglibc
+# glibc/eglibc
 #
 ################################################################################
 
-EGLIBC_VERSION = 2.17-svnr22064
-EGLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
-EGLIBC_SOURCE = eglibc-$(EGLIBC_VERSION).tar.bz2
-EGLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
-EGLIBC_LICENSE_FILES = libc/COPYING libc/COPYING.LIB libc/LICENSES
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
+GLIBC_VERSION = 2.17-svnr22064
+GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
+GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
+GLIBC_SRC_SUBDIR = libc
+else
+GLIBC_VERSION = 2.18
+GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
+GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
+GLIBC_SRC_SUBDIR = .
+endif
+
+GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
+GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
 
-# Before eglibc is configured, we must have the first stage
+# Before (e)glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
-EGLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-gawk
+GLIBC_DEPENDENCIES = host-gcc-initial linux-headers
+
+# eglibc also needs host-gawk
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
+GLIBC_DEPENDENCIES += host-gawk
+endif
 
-# Before eglibc is built, we must have the second stage
+# Before (e)glibc is built, we must have the second stage
 # cross-compiler, for some gcc versions
-eglibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
+glibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
 
-EGLIBC_SUBDIR = build
+GLIBC_SUBDIR = build
 
-EGLIBC_INSTALL_STAGING = YES
+GLIBC_INSTALL_STAGING = YES
 
-EGLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
+GLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
 
 # Thumb build is broken, build in ARM mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-EGLIBC_EXTRA_CFLAGS += -marm
+GLIBC_EXTRA_CFLAGS += -marm
 endif
 
 # Even though we use the autotools-package infrastructure, we have to
@@ -38,16 +52,16 @@ endif
 #  2. We have to execute the configure script with bash and not sh.
 #
 # Note that as mentionned in
-# http://patches.openembedded.org/patch/38849/, eglibc must be built
-# with -O2, so we pass our own CFLAGS and CXXFLAGS below.
-define EGLIBC_CONFIGURE_CMDS
+# http://patches.openembedded.org/patch/38849/, eglibc/glibc must be
+# built with -O2, so we pass our own CFLAGS and CXXFLAGS below.
+define GLIBC_CONFIGURE_CMDS
 	mkdir -p $(@D)/build
 	# Do the configuration
 	(cd $(@D)/build; \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="-O2 $(EGLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
-		CXXFLAGS="-O2 $(EGLIBC_EXTRA_CFLAGS)" \
-		$(SHELL) $(@D)/libc/configure \
+		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
+		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
+		$(SHELL) $(@D)/$(GLIBC_SRC_SUBDIR)/configure \
 		ac_cv_path_BASH_SHELL=/bin/bash \
 		libc_cv_forced_unwind=yes \
 		--target=$(GNU_TARGET_NAME) \
@@ -81,17 +95,17 @@ endef
 # to install the libraries, and nothing more.
 #
 
-EGLIBC_LIBS_LIB = \
+GLIBC_LIBS_LIB = \
 	ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so	   \
 	libnsl.so libpthread.so libresolv.so librt.so libutil.so   \
 	libnss_files.so libnss_dns.so
 
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
-EGLIBC_LIBS_LIB += libthread_db.so
+GLIBC_LIBS_LIB += libthread_db.so
 endif
 
-define EGLIBC_INSTALL_TARGET_CMDS
-	for libs in $(EGLIBC_LIBS_LIB); do \
+define GLIBC_INSTALL_TARGET_CMDS
+	for libs in $(GLIBC_LIBS_LIB); do \
 		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
 	done
 endef
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 7a26441..060b494 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -35,12 +35,34 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 
 	  http://eglibc.org
 
+config BR2_TOOLCHAIN_BUILDROOT_GLIBC
+	bool "glibc (experimental)"
+	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
+		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
+		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
+		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
+		   BR2_x86_64
+	select BR2_TOOLCHAIN_USES_GLIBC
+	# our glibc.mk enables RPC support
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  This option selects glibc as the C library for the
+	  cross-compilation toolchain.
+
+	  The glibc support in the Buildroot toolchain backend is
+	  very recent, and therefore marked experimental.
+
+	  http://www.gnu.org/software/libc/
+
 endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	string
 	default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-	default "eglibc" if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
+	# Both glibc and eglibc are handled by the package called
+	# 'glibc'
+	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
+	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 source "package/uclibc/Config.in"
 

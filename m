From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 8 Apr 2015 10:54:55 +0200
Subject: [Buildroot] [PATCH v3] sh4: fix toolchain creation
Message-ID: <20150408085455.GA26812@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux kernel does force compile with -m4-nofpu, which is only
available when building a multilib toolchain.
The interesting part here is, that buildroot use --disable-multilib for
gcc configure, but enables --with-multilib-list=m4,m4-nofpu in
the default configuration for Qemu targeting r2d emulation.
This results in a toolchain, which can be used for the kernel and
for userland without creating a multilib toolchain with different
kinds of libgcc version. In the multilib case there would be
subdirectories created (!m4 and m4-nofpu). As buildroot uses a
short version of toolchain creation, a multilib enabled gcc build
fails when creating libgcc.

So the best solution is to just keep multilib disabled, but always
add --with-multilib-list when sh4/sh4eb/sh4a/sh4aeb is choosen.

Tested with sh4/sh4a toolchain build and qemu defconfig with
gcc 4.8.x/4.9.x (with and without C++ enabled), uClibc and glibc.

Disable sh4a/sh4aeb for uClibc, as it does not implemented, yet.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Changes v3:
 - add local variable for complete directory as suggested by Thomas Pettazoni
 - disable sh4a/sh4aeb for uClibc as suggested by Thomas Pettazoni

Changes v2:
 - fix build when C++ is enabled, reported by Thomas Pettazoni
 - tested with sh4a/sh4aeb

---
 configs/qemu_sh4_r2d_defconfig          |    4 ----
 package/gcc/gcc-final/gcc-final.mk      |   22 +++++++++++++++++-----
 toolchain/toolchain-buildroot/Config.in |    4 ++--
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 88bf914..586c400 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,10 +10,6 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# The kernel wants to use the -m4-nofpu option to make sure that it
-# doesn't use floating point operations.
-BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
-
 # Lock to 3.19 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.19"
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index d76eb31..11a2142 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -52,6 +52,18 @@ HOST_GCC_FINAL_CONF_OPTS = \
 	--enable-poison-system-directories \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
+# The kernel wants to use the -m4-nofpu option to make sure that it
+# doesn't use floating point operations.
+ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
+HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
+endif
+ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
+HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
+HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
+endif
+
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 ifeq ($(BR2_STATIC_LIBS),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-shared
@@ -110,9 +122,9 @@ endif
 # Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
 # libgcc_s to be installed in /lib and not /usr/lib.
 define HOST_GCC_FINAL_INSTALL_LIBGCC
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
+	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libgcc_s* \
 		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
+	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libgcc_s* \
 		$(TARGET_DIR)/lib/
 endef
 
@@ -140,7 +152,7 @@ endif
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
-		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.a \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.a \
 			$(STAGING_DIR)/usr/lib/ ; \
 	done
 endef
@@ -148,9 +160,9 @@ endef
 ifeq ($(BR2_STATIC_LIBS),)
 define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
-		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
 			$(STAGING_DIR)/usr/lib/ ; \
-		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
+		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
 			$(TARGET_DIR)/usr/lib/ ; \
 	done
 endef
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index e909092..f788ec7 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -32,8 +32,8 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
 		   BR2_bfin    || BR2_i386   || BR2_m68k   || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_powerpc || BR2_sh     || BR2_sparc  || BR2_xtensa   || \
-		   BR2_x86_64
+		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
+		   BR2_sparc   || BR2_xtensa || BR2_x86_64
 	help
 	  This option selects uClibc as the C library for the
 	  cross-compilation toolchain.
-- 
1.7.10.4

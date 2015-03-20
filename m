From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 20 Mar 2015 19:22:15 +0100
Subject: [Buildroot] [PATCH] sh4: fix toolchain creation
Message-ID: <20150320182214.GA3086@waldemar-brodkorb.de>
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
kinds of libgcc version. In the multilib case there would be some
subdirectories created like !m4 or m4-nofpu. As buildroot uses a
short version of toolchain creation, a multilib enabled gcc build
fails when creating libgcc.

So the best solution is to just keep multilib disabled, but always
add --with-multilib-list=m4,m4-nofpu when sh4/sh4eb is choosen.

Tested with sh4 minimal toolchain build and qemu defconfig with
gcc 4.8.x and uClibc.

To sum up, compiling gcc with disabled multilib, but with a mulitlib-list
provides a working toolchain which can create sh4 nofpu code without trying to
create a libgcc for every variant.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 configs/qemu_sh4_r2d_defconfig     |    4 ----
 package/gcc/gcc-final/gcc-final.mk |    6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

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
index c014bc5..607e850 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -53,6 +53,12 @@ HOST_GCC_FINAL_CONF_OPTS = \
 	--enable-poison-system-directories \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
+# The kernel wants to use the -m4-nofpu option to make sure that it
+# doesn't use floating point operations.
+ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
+HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
+endif
+
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 ifeq ($(BR2_STATIC_LIBS),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-shared
-- 
1.7.10.4

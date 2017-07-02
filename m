From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 15:41:06 +0200
Subject: [Buildroot] [PATCH 3/4] toolchain-external: copy ld*.so* for all C
	libraries
In-Reply-To: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
References: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702134107.11488-4-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, for the dynamic loader, we're copying ld*.so* for glibc and
uClibc, except for glibc/EABIhf where we are explicitly copying
ld-linux-armhf.so.*. For musl, we're not copying the dynamic linker
because it's simply a symbolic link to libc.so. However, the name of
the musl dynamic linker changes from one architecture to the other,
and we don't handle all cases.

Since handling the musl dynamic linker symlink creation is becoming
more and more annoying to maintain, this commit makes musl use the
same mechanism as glibc/uClibc: put the dynamic linker in
TOOLCHAIN_EXTERNAL_LIBS.

In addition, the special condition on glibc/EABIhf was added in
11ec38b6950cf3337b52fb97f27c2fd7c776c5c2 ("toolchain-external: fix
Linaro ARM toolchain support") because an old Linaro toolchain had two
dynamic loaders, and we wanted to copy only one. But 1/ this is old
and 2/ having the two dynamic linkers doesn't really matter.

So this commit simply unconditionally adds "ld*.so*" to
TOOLCHAIN_EXTERNAL_LIBS, regardless of the C library being chosen. It
re-uses the musl dynamic linker symlink from the sysroot, which makes
it always correct, and allows us to remove the
TOOLCHAIN_EXTERNAL_MUSL_LD_LINK hook, and all the related logic.

This commit therefore solves two problems with the musl dynamic linker
symbolic link creation logic:

 1 We support all architectures, without having to hardcode in
   Buildroot the mapping between the CPU architecture and the
   corresponding dynamic linker name. For example, our current logic
   was not handling the mips64+n32 ABI case, where the dynamic linker
   is named ld-musl-mipsn32el.so.1.

 2 We support Crosstool-NG musl toolchains, where the dynamic linker
   is in /lib, but libc.so is in /usr/lib.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This commit therefore replaces:

 - https://patchwork.ozlabs.org/patch/780411/ (was another solution
   for solving problem 1 above)

 - https://patchwork.ozlabs.org/patch/763977/ and
   https://patchwork.ozlabs.org/patch/748974/ (was another solution
   for solving problem 2 above)
---
 .../toolchain-external/pkg-toolchain-external.mk   | 32 ++--------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 8460e37..c1c3900 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -107,13 +107,11 @@ endif
 #
 # Definitions of the list of libraries that should be copied to the target.
 #
+
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so*
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
-TOOLCHAIN_EXTERNAL_LIBS += ld-linux-armhf.so.*
-else
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so.*
-endif
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
 ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
@@ -470,30 +468,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
 	fi
 endef
 
-# Various utility functions used by the external toolchain based on musl.
-
-# With the musl C library, the libc.so library directly plays the role
-# of the dynamic library loader. We just need to create a symbolic
-# link to libc.so with the appropriate name.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL):$(BR2_STATIC_LIBS),y:)
-ifeq ($(BR2_i386),y)
-MUSL_ARCH = i386
-else ifeq ($(BR2_ARM_EABIHF),y)
-MUSL_ARCH = armhf
-else ifeq ($(BR2_mips):$(BR2_SOFT_FLOAT),y:y)
-MUSL_ARCH = mips-sf
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
-MUSL_ARCH = mipsel-sf
-else ifeq ($(BR2_sh),y)
-MUSL_ARCH = sh
-else
-MUSL_ARCH = $(ARCH)
-endif
-define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
-endef
-endif
-
 # uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
 # patched specifically for uClibc-ng, so it continues to generate
 # binaries that expect the dynamic loader to be named ld-uClibc.so.0,
-- 
2.9.4

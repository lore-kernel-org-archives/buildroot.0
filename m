From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Jan 2019 14:09:31 +0100
Subject: [Buildroot] [git commit] arch: add support for RISC-V 32-bit
 (riscv32) architecture
Message-ID: <20190106131034.33423805B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae99fa6d641c5726f6e3b2dc977ff958fc863a41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This enables a riscv32 system to be built with a Buildroot generated
toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).

This requires a custom version of glibc 2.26 from the riscv-glibc
repository. Note that there are no tags in this repository, so the
glibc version just consists of the 40 character commit id string.

Thanks to Fabrice Bellard for pointing me towards the 32-bit glibc
repository and for providing the necessary patch to get it to build.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.riscv                               | 31 ++++++++++--
 arch/arch.mk.riscv                                 |  4 +-
 configs/qemu_riscv64_virt_defconfig                |  1 +
 ...x-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch | 59 ++++++++++++++++++++++
 .../glibc.hash                                     |  7 +++
 package/glibc/glibc.mk                             |  7 +++
 .../autobuild/br-riscv64-internal-glibc.config     |  1 +
 7 files changed, 106 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 4361890bf4..097719e846 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -65,14 +65,35 @@ config BR2_RISCV_ISA_CUSTOM_RVC
 	select BR2_RISCV_ISA_RVC
 endif
 
+choice
+	prompt "Target Architecture Size"
+	default BR2_RISCV_64
+
+config BR2_RISCV_32
+	bool "32-bit"
+
 config BR2_RISCV_64
-	bool
-	default y
+	bool "64-bit"
 	select BR2_ARCH_IS_64
 
+endchoice
+
 choice
 	prompt "Target ABI"
-	default BR2_RISCV_ABI_LP64
+	default BR2_RISCV_ABI_ILP32 if !BR2_ARCH_IS_64
+	default BR2_RISCV_ABI_LP64 if BR2_ARCH_IS_64
+
+config BR2_RISCV_ABI_ILP32
+	bool "ilp32"
+	depends on !BR2_ARCH_IS_64
+
+config BR2_RISCV_ABI_ILP32F
+	bool "ilp32f"
+	depends on !BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
+
+config BR2_RISCV_ABI_ILP32D
+	bool "ilp32d"
+	depends on !BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVD
 
 config BR2_RISCV_ABI_LP64
 	bool "lp64"
@@ -88,12 +109,16 @@ config BR2_RISCV_ABI_LP64D
 endchoice
 
 config BR2_ARCH
+	default "riscv32" if !BR2_ARCH_IS_64
 	default "riscv64" if BR2_ARCH_IS_64
 
 config BR2_ENDIAN
 	default "LITTLE"
 
 config BR2_GCC_TARGET_ABI
+	default "ilp32" if BR2_RISCV_ABI_ILP32
+	default "ilp32f" if BR2_RISCV_ABI_ILP32F
+	default "ilp32d" if BR2_RISCV_ABI_ILP32D
 	default "lp64" if BR2_RISCV_ABI_LP64
 	default "lp64f" if BR2_RISCV_ABI_LP64F
 	default "lp64d" if BR2_RISCV_ABI_LP64D
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index 022d1a6809..f3bf2b3467 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -5,8 +5,10 @@
 
 ifeq ($(BR2_riscv),y)
 
-ifeq ($(BR2_ARCH_IS_64),y)
+ifeq ($(BR2_RISCV_64),y)
 GCC_TARGET_ARCH := rv64i
+else
+GCC_TARGET_ARCH := rv32i
 endif
 
 ifeq ($(BR2_RISCV_ISA_RVM),y)
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 59343ee98f..e15f804341 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -1,5 +1,6 @@
 # Architecture
 BR2_riscv=y
+BR2_RISCV_64=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-Fix-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-Fix-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch
new file mode 100644
index 0000000000..ab157e9e7b
--- /dev/null
+++ b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-Fix-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch
@@ -0,0 +1,59 @@
+From 4909cfbbe8dd512b8fc0892859549c26e1b14d30 Mon Sep 17 00:00:00 2001
+From: Mark Corbin <mark.corbin@embecosm.com>
+Date: Sun, 21 Oct 2018 10:38:18 +0100
+Subject: [PATCH] Fix RISC-V 32-bit build of riscv-glibc 2.26
+
+This patch fixes two build errors with the 32-bit version of
+glibc-2.26 from the riscv-glibc repository.
+
+A void reference to 'refsym' has been added to dl-runtime.c to avoid
+an 'unused variable' error when building with '-Werror'.
+
+Some data types were hard-coded for 64-bit in ldsodefs.h. These have
+been modified to allow 32-bit builds.
+
+This patch was provided by Fabrice Bellard as part of his RISC-V
+Buildroot development source.
+
+Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
+---
+ elf/dl-runtime.c         | 1 +
+ sysdeps/riscv/ldsodefs.h | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
+index 51d3819d4a..e728e8907e 100644
+--- a/elf/dl-runtime.c
++++ b/elf/dl-runtime.c
+@@ -146,6 +146,7 @@ _dl_fixup (
+   if (__glibc_unlikely (GLRO(dl_bind_not)))
+     return value;
+ 
++  (void)refsym;
+   return elf_machine_fixup_plt (l, result, refsym, sym, reloc, rel_addr, value);
+ }
+ 
+diff --git a/sysdeps/riscv/ldsodefs.h b/sysdeps/riscv/ldsodefs.h
+index db993df80a..91e7a8c88f 100644
+--- a/sysdeps/riscv/ldsodefs.h
++++ b/sysdeps/riscv/ldsodefs.h
+@@ -25,14 +25,14 @@ struct La_riscv_regs;
+ struct La_riscv_retval;
+ 
+ #define ARCH_PLTENTER_MEMBERS						\
+-    Elf64_Addr (*riscv_gnu_pltenter) (Elf64_Sym *, unsigned int,	\
++    ElfW(Addr) (*riscv_gnu_pltenter) (ElfW(Sym) *, unsigned int,	\
+ 				      uintptr_t *, uintptr_t *,		\
+ 				      const struct La_riscv_regs *,	\
+ 				      unsigned int *, const char *name,	\
+ 				      long int *framesizep);
+ 
+ #define ARCH_PLTEXIT_MEMBERS						\
+-    unsigned int (*riscv_gnu_pltexit) (Elf64_Sym *, unsigned int,	\
++    unsigned int (*riscv_gnu_pltexit) (ElfW(Sym) *, unsigned int,	\
+ 				       uintptr_t *, uintptr_t *,	\
+ 				       const struct La_riscv_regs *,	\
+ 				       struct La_riscv_retval *,	\
+-- 
+2.17.1
+
diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash
new file mode 100644
index 0000000000..3eb5e04e96
--- /dev/null
+++ b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash
@@ -0,0 +1,7 @@
+# Locally calculated (fetched from Github)
+sha256 a40f908125135bad2cf92c18d07ad25b3091b161b3a5d3aea46c23ffd2ac90b8  glibc-4e2943456e690d89f48e6e710757dd09404b0c9a.tar.gz
+
+# Hashes for license files
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
+sha256 61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431 LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 345d257d03..ec5b3cedc9 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,6 +7,9 @@
 ifeq ($(BR2_arc),y)
 GLIBC_VERSION =  arc-2018.09-release
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
+else ifeq ($(BR2_RISCV_32),y)
+GLIBC_VERSION = 4e2943456e690d89f48e6e710757dd09404b0c9a
+GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
@@ -75,7 +78,11 @@ GLIBC_CONF_ENV = \
 # Override the default library locations of /lib64/<abi> and
 # /usr/lib64/<abi>/ for RISC-V.
 ifeq ($(BR2_riscv),y)
+ifeq ($(BR2_RISCV_64),y)
 GLIBC_CONF_ENV += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
+else
+GLIBC_CONF_ENV += libc_cv_slibdir=/lib32 libc_cv_rtlddir=/lib
+endif
 endif
 
 # glibc requires make >= 4.0 since 2.28 release.
diff --git a/support/config-fragments/autobuild/br-riscv64-internal-glibc.config b/support/config-fragments/autobuild/br-riscv64-internal-glibc.config
index 75aa5dd915..d952c73a86 100644
--- a/support/config-fragments/autobuild/br-riscv64-internal-glibc.config
+++ b/support/config-fragments/autobuild/br-riscv64-internal-glibc.config
@@ -1,2 +1,3 @@
 BR2_riscv=y
+BR2_RISCV_64=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:03:54 +0200
Subject: [Buildroot] [git commit] toolchain: add support for the internal
 IBM s390x and Z toolchain
Message-ID: <20200924213039.A0DFC80E36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29353bbef754a154831a75f211258e4df96aad6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in                          | 1 -
 package/gcc/gcc.mk                      | 5 +++++
 toolchain/toolchain-buildroot/Config.in | 6 +++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index eb9b6007c9..155403c363 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -223,7 +223,6 @@ config BR2_s390x
 	bool "s390x"
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	help
 	  s390x is a big-endian architecture made by IBM.
 	  http://www.ibm.com/
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index df5bf22b96..948fd76646 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -248,6 +248,11 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
+ifeq ($(BR2_s390x),y)
+HOST_GCC_COMMON_CONF_OPTS += \
+	--with-long-double-128
+endif
+
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 
 # For gcc-initial, we need to tell gcc that the C library will be
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 418d5cb387..1c4705600e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -46,9 +46,9 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
-		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
+		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
+		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
+		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2

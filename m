From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Jun 2016 11:26:51 +0100
Subject: [Buildroot] [PATCH v7] openblas: new package
Message-ID: <1466764011-10998-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenBLAS is optimised for specific CPU models, which don't fully match
with the GCC code generation options. Therefore, we can't automatically
select BR2_PACKAGE_OPENBLAS_TARGET based on the CPU choice. Instead, let
the user select the TARGET name, but offer a sensible default. Other
possible solutions were deemed too complicated: adding choice options in
the ambiguous cases, or only making the option user-visible when there
is ambiguity.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v6 -> v7:
 - Change license to BSD-3c. (Baruch)
 - Fix indentation for ARM variants. (Yann)
 - Don't use += for the first OPENBLAS_MAKE_OPTS assignment. (Yann)
 - Use ':' as a separator instead of 'x'. (Yann)
 - Move CROSS=1 and TARGET=$(BR2_PACKAGE_OPENBLAS_TARGET) in OPENBLAS_MAKE_OPTS. (Yann)
 - Use BR2_ARM_CPU_ARMV7A for ARMV7 OpenBLAS target. (Thomas)
 - Use BR2_X86_CPU_HAS_SSE for SSE_GENERIC OpenBLAS target. (Arnout)
 - Improve commit log. (Arnout)
 - Improve help text for BR2_PACKAGE_OPENBLAS_TARGET. (Arnout)
 - Add ARMV5 and ARMV6 OpenBLAS targets. (Arnout)

Changes v5 -> v6:
 - Add BR2_PACKAGE_OPENBLAS_ARCH_SUPPORT
 - Put openblas targets that depend on "Target Architecture" at bottom.
   We want the ones depeding on "Target Architecture Variant" first as
   they are more specific and Buildroot will use the one that matches
   first.
Changes v4 -> v5:
 - Do not use a huge choice with new Buildroot options for every
   OpenBLAS target. Instead, use a string option with a default value
   depending on the existing options in arch/Config.in*.

Changes v3 -> v4:
 - Disable Fortran by default. It can be added back in the future when
   we have a BR2_TOOLCHAIN_HAS_FORTRAN hidden symbol.
 - Bump version so we can get rid of the patch.
 - Match OpenBLAS target cores with Buildroot target cores as much as
   possible, and drop the ones unsupported in Buildroot.
 - Drop the OpenMP bits in the openblas.mk file. It can be added back
   in the future when we have a BR2_TOOLCHAIN_HAS_OPENMP hidden symbol.

Changes v2 -> v3:
 - Switch version to HEAD of develop branch as it contains support for
   MIPS32.
 - Add a patch to fix build failure of P5600 and I6400 targets.
 - Add support for OpenMP when toolchain has NPTL threads.

Changes v1 -> v2:
 - Multi-threading is not available for static-only since it uses
   dlfcn.h, so modify the "ifeq" statement accordingly.

 package/Config.in              |  1 +
 package/openblas/Config.in     | 62 ++++++++++++++++++++++++++++++++++++++++++
 package/openblas/openblas.hash |  2 ++
 package/openblas/openblas.mk   | 52 +++++++++++++++++++++++++++++++++++
 4 files changed, 117 insertions(+)
 create mode 100644 package/openblas/Config.in
 create mode 100644 package/openblas/openblas.hash
 create mode 100644 package/openblas/openblas.mk

diff --git a/package/Config.in b/package/Config.in
index 171f4ad..eefc7e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1293,6 +1293,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/netbsd-queue/Config.in"
+	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
 	source "package/poco/Config.in"
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
new file mode 100644
index 0000000..14d7e3b
--- /dev/null
+++ b/package/openblas/Config.in
@@ -0,0 +1,62 @@
+config BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
+
+config BR2_PACKAGE_OPENBLAS
+	bool "openblas"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	help
+	  An optimized BLAS library based on GotoBLAS2 1.13 BSD version.
+
+	  https://www.openblas.net/
+
+if BR2_PACKAGE_OPENBLAS
+
+config BR2_PACKAGE_OPENBLAS_TARGET
+	string "OpenBLAS target CPU"
+	default "P2"           if BR2_x86_pentium2
+	default "KATMAI"       if BR2_x86_pentium3
+	default "NORTHWOOD"    if BR2_x86_pentium4
+	default "PRESCOTT"     if BR2_x86_prescott
+	default "BANIAS"       if BR2_x86_pentium_m
+	default "CORE2"        if BR2_x86_core2
+	default "NEHALEM"      if BR2_x86_corei7
+	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
+	default "HASWELL"      if BR2_x86_core_avx2
+	default "ATOM"         if BR2_x86_atom
+	default "ATHLON"       if BR2_x86_athlon || BR2_x86_athlon_4
+	default "OPTERON"      if BR2_x86_opteron
+	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
+	default "BARCELONA"    if BR2_x86_barcelona
+	default "STEAMROLLER"  if BR2_x86_steamroller
+	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
+	default "SSE_GENERIC"  if BR2_X86_CPU_HAS_SSE
+	default "POWER4"       if BR2_powerpc_power4
+	default "POWER5"       if BR2_powerpc_power5
+	default "POWER6"       if BR2_powerpc_power6
+	default "POWER7"       if BR2_powerpc_power7
+	default "POWER8"       if BR2_powerpc_power8
+	default "PPCG4"        if BR2_powerpc_7400 || BR2_powerpc_7450
+	default "PPC970"       if BR2_powerpc_970
+	default "PPC440"       if BR2_powerpc_440
+	default "PPC440FP2"    if BR2_powerpc_440fp
+	default "P5600"        if BR2_mips_32r2
+	default "SICORTEX"     if BR2_mips_64
+	default "I6400"        if BR2_mips_64r6
+	default "SPARC"        if BR2_sparc
+	default "CORTEXA15"    if BR2_cortex_a15
+	default "CORTEXA9"     if BR2_cortex_a9
+	default "ARMV5"        if BR2_ARM_CPU_ARMV5
+	default "ARMV6"        if BR2_ARM_CPU_ARMV6
+	default "ARMV7"        if BR2_ARM_CPU_ARMV7A
+	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
+	help
+	  OpenBLAS target CPU. See TargetList.txt in the source tree for
+	  the possible target strings. A possible value is set
+	  automatically based on your Target Architecture Variant.
+
+endif
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
new file mode 100644
index 0000000..b402cac
--- /dev/null
+++ b/package/openblas/openblas.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2ad0270a39dbaf891b439baacf198ea4ab149cd6ed39a5f50c494723f1936be5  openblas-f04af36ad0e85b64f12a7c38095383192cc52345.tar.gz
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
new file mode 100644
index 0000000..85c3c19
--- /dev/null
+++ b/package/openblas/openblas.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# openblas
+#
+################################################################################
+
+OPENBLAS_VERSION = f04af36ad0e85b64f12a7c38095383192cc52345
+OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
+OPENBLAS_LICENSE = BSD-3c
+OPENBLAS_LICENSE_FILES = LICENSE
+OPENBLAS_INSTALL_STAGING = YES
+
+# Enable cross-compiling
+OPENBLAS_MAKE_OPTS = CROSS=1
+
+# Set OpenBLAS target
+OPENBLAS_MAKE_OPTS += TARGET=$(BR2_PACKAGE_OPENBLAS_TARGET)
+
+# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
+# hidden symbol to our toolchain infrastructure
+OPENBLAS_MAKE_OPTS += ONLY_CBLAS=1
+
+# Enable/Disable multi-threading (not for static-only since it uses dlfcn.h)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_STATIC_LIBS),y:)
+OPENBLAS_MAKE_OPTS += USE_THREAD=1
+else
+OPENBLAS_MAKE_OPTS += USE_THREAD=0
+endif
+
+# Static-only/Shared-only toggle
+ifeq ($(BR2_STATIC_LIBS),y)
+OPENBLAS_MAKE_OPTS += NO_SHARED=1
+else ifeq ($(BR2_SHARED_LIBS),y)
+OPENBLAS_MAKE_OPTS += NO_STATIC=1
+endif
+
+define OPENBLAS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(OPENBLAS_MAKE_OPTS) \
+		-C $(@D)
+endef
+
+define OPENBLAS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
+		-C $(@D) install PREFIX=$(STAGING_DIR)/usr
+endef
+
+define OPENBLAS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
+		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
2.7.3

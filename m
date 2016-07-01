From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:21:37 +0200
Subject: [Buildroot] [git commit] openblas: new package
Message-ID: <20160701142937.EA2E381E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea22b78d4bb8779a17519dc81a4a7a0c05ad59e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenBLAS is optimised for specific CPU models, which don't fully match
with the GCC code generation options. Therefore, we can't automatically
select BR2_PACKAGE_OPENBLAS_TARGET based on the CPU choice. Instead, let
the user select the TARGET name, but offer a sensible default. Other
possible solutions were deemed too complicated: adding choice options in
the ambiguous cases, or only making the option user-visible when there
is ambiguity.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/openblas/Config.in     | 62 ++++++++++++++++++++++++++++++++++++++++++
 package/openblas/openblas.hash |  2 ++
 package/openblas/openblas.mk   | 55 +++++++++++++++++++++++++++++++++++++
 4 files changed, 120 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ead675b..f120025 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1304,6 +1304,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/netbsd-queue/Config.in"
+	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
 	source "package/poco/Config.in"
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
new file mode 100644
index 0000000..51afaec
--- /dev/null
+++ b/package/openblas/Config.in
@@ -0,0 +1,62 @@
+config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
+	string
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
+config BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET != ""
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
+	default BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
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
index 0000000..d07d09d
--- /dev/null
+++ b/package/openblas/openblas.mk
@@ -0,0 +1,55 @@
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
+# Initialise OpenBLAS make options to $(TARGET_CONFIGURE_OPTS)
+OPENBLAS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
+
+# Enable cross-compiling
+OPENBLAS_MAKE_OPTS += CROSS=1
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
+	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
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

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 20 Jun 2016 10:33:15 +0100
Subject: [Buildroot] [PATCH] openblas: new package
Message-ID: <1466415195-59003-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in              |  1 +
 package/openblas/Config.in     | 58 ++++++++++++++++++++++++++++++++++++++++++
 package/openblas/openblas.hash |  2 ++
 package/openblas/openblas.mk   | 46 +++++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 package/openblas/Config.in
 create mode 100644 package/openblas/openblas.hash
 create mode 100644 package/openblas/openblas.mk

diff --git a/package/Config.in b/package/Config.in
index 02cc3bd..e7aa6fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1291,6 +1291,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/netbsd-queue/Config.in"
+	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
 	source "package/poco/Config.in"
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
new file mode 100644
index 0000000..8c7fea7
--- /dev/null
+++ b/package/openblas/Config.in
@@ -0,0 +1,58 @@
+config BR2_PACKAGE_OPENBLAS
+	bool "openblas"
+	depends on BR2_i386 || BR2_x86_64 || \
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_mips || BR2_mipsel || \
+		BR2_mips64 || BR2_mips64el || \
+		BR2_sparc || BR2_sparc64 || \
+		BR2_arm || BR2_armeb || \
+		BR2_aarch64 || BR2_aarch64_be
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
+	default "SSE_GENERIC"  if BR2_i386 || BR2_x86_64
+	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
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
+	default "ARMV7"        if BR2_cortex_a5 || BR2_cortex_a7 || \
+	                          BR2_cortex_a8 || BR2_cortex_a9 || \
+				  BR2_cortex_a12 || BR2_cortex_a17
+	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
+	help
+	  OpenBLAS target CPU
+
+endif
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
new file mode 100644
index 0000000..1fdb0ba
--- /dev/null
+++ b/package/openblas/openblas.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 fa32d00dfca6b7e7580dbc8696daa5bf8fee4ad7771f52450ab9dc1e9c87fe73  openblas-a8fcd89d6d1666185c8c27ea46672b9897630f21.tar.gz
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
new file mode 100644
index 0000000..02dc361
--- /dev/null
+++ b/package/openblas/openblas.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# openblas
+#
+################################################################################
+
+OPENBLAS_VERSION = a8fcd89d6d1666185c8c27ea46672b9897630f21
+OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
+OPENBLAS_LICENSE = BSD-3
+OPENBLAS_LICENSE_FILES = LICENSE
+OPENBLAS_INSTALL_STAGING = YES
+
+# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
+# hidden symbol to our toolchain infrastructure
+OPENBLAS_MAKE_OPTS += ONLY_CBLAS=1
+
+# Enable/Disable multi-threading (not for static-only since it uses dlfcn.h)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_STATIC_LIBS),yx)
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
+		CROSS=1 TARGET=$(BR2_PACKAGE_OPENBLAS_TARGET) -C $(@D)
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

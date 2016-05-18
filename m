From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 18 May 2016 17:56:53 +0100
Subject: [Buildroot] [PATCH v2 next] openblas: new package
Message-ID: <1463590613-55223-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Multi threading is not available for static-only since it uses
   dlfcn.h, so modify the "ifeq" statement accordingly.


 package/Config.in              |   1 +
 package/openblas/Config.in     | 231 +++++++++++++++++++++++++++++++++++++++++
 package/openblas/openblas.hash |   2 +
 package/openblas/openblas.mk   |  48 +++++++++
 4 files changed, 282 insertions(+)
 create mode 100644 package/openblas/Config.in
 create mode 100644 package/openblas/openblas.hash
 create mode 100644 package/openblas/openblas.mk

diff --git a/package/Config.in b/package/Config.in
index 0056beb..b59c2f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1270,6 +1270,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/netbsd-queue/Config.in"
+	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
 	source "package/poco/Config.in"
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
new file mode 100644
index 0000000..6f182bc
--- /dev/null
+++ b/package/openblas/Config.in
@@ -0,0 +1,231 @@
+config BR2_PACKAGE_OPENBLAS
+	bool "openblas"
+	depends on BR2_i386 || BR2_x86_64 || \
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
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
+choice
+	prompt "OpenBLAS target CPU"
+	help
+	  OpenBLAS target CPU
+
+config BR2_PACKAGE_OPENBLAS_TARGET_P2
+	bool "P2"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_KATMAI
+	bool "KATMAI"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_COPPERMINE
+	bool "COPPERMINE"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_NORTHWOOD
+	bool "NORTHWOOD"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_PRESCOTT
+	bool "PRESCOTT"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_BANIAS
+	bool "BANIAS"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_YONAH
+	bool "YONAH"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_CORE2
+	bool "CORE2"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_PENRYN
+	bool "PENRYN"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_DUNNINGTON
+	bool "DUNNINGTON"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_NEHALEM
+	bool "NEHALEM"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_SANDYBRIDGE
+	bool "SANDYBRIDGE"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_HASWELL
+	bool "HASWELL"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_ATOM
+	bool "ATOM"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_ATHLON
+	bool "ATHLON"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_OPTERON
+	bool "OPTERON"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_OPTERON_SSE3
+	bool "OPTERON_SSE3"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_BARCELONA
+	bool "BARCELONA"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_SHANGHAI
+	bool "SHANGHAI"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_ISTANBUL
+	bool "ISTANBUL"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_BOBCAT
+	bool "BOBCAT"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_BULLDOZER
+	bool "BULLDOZER"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_PILEDRIVER
+	bool "PILEDRIVER"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_STEAMROLLER
+	bool "STEAMROLLER"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_EXCAVATOR
+	bool "EXCAVATOR"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_SSE_GENERIC
+	bool "SSE_GENERIC"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_VIAC3
+	bool "VIAC3"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_NANO
+	bool "NANO"
+	depends on BR2_i386 || BR2_x86_64
+config BR2_PACKAGE_OPENBLAS_TARGET_POWER4
+	bool "POWER4"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_POWER5
+	bool "POWER5"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_POWER6
+	bool "POWER6"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_POWER7
+	bool "POWER7"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_POWER8
+	bool "POWER8"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_PPCG4
+	bool "PPCG4"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_PPC970
+	bool "PPC970"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_PPC970MP
+	bool "PPC970MP"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_PPC440
+	bool "PPC440"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_PPC440FP2
+	bool "PPC440FP2"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_CELL
+	bool "CELL"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+config BR2_PACKAGE_OPENBLAS_TARGET_SICORTEX
+	bool "SICORTEX"
+	depends on BR2_mips64 || BR2_mips64el
+config BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3A
+	bool "LOONGSON3A"
+	depends on BR2_mips64 || BR2_mips64el
+config BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3B
+	bool "LOONGSON3B"
+	depends on BR2_mips64 || BR2_mips64el
+config BR2_PACKAGE_OPENBLAS_TARGET_SPARC
+	bool "SPARC"
+	depends on BR2_sparc || BR2_sparc64
+config BR2_PACKAGE_OPENBLAS_TARGET_SPARCV7
+	bool "SPARCV7"
+	depends on BR2_sparc || BR2_sparc64
+config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA15
+	bool "CORTEXA15"
+	depends on BR2_arm || BR2_armeb
+config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA9
+	bool "CORTEXA9"
+	depends on BR2_arm || BR2_armeb
+config BR2_PACKAGE_OPENBLAS_TARGET_ARMV7
+	bool "ARMV7"
+	depends on BR2_arm || BR2_armeb
+config BR2_PACKAGE_OPENBLAS_TARGET_ARMV6
+	bool "ARMV6"
+	depends on BR2_arm || BR2_armeb
+config BR2_PACKAGE_OPENBLAS_TARGET_ARMV5
+	bool "ARMV5"
+	depends on BR2_arm || BR2_armeb
+config BR2_PACKAGE_OPENBLAS_TARGET_ARMV8
+	bool "ARMV8"
+	depends on BR2_aarch64 || BR2_aarch64_be
+config BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA57
+	bool "CORTEXA57"
+	depends on BR2_aarch64 || BR2_aarch64_be
+
+endchoice
+
+config BR2_PACKAGE_OPENBLAS_TARGET
+	string
+	default "P2"           if BR2_PACKAGE_OPENBLAS_TARGET_P2
+	default "KATMAI"       if BR2_PACKAGE_OPENBLAS_TARGET_KATMAI
+	default "COPPERMINE"   if BR2_PACKAGE_OPENBLAS_TARGET_COPPERMINE
+	default "NORTHWOOD"    if BR2_PACKAGE_OPENBLAS_TARGET_NORTHWOOD
+	default "PRESCOTT"     if BR2_PACKAGE_OPENBLAS_TARGET_PRESCOTT
+	default "BANIAS"       if BR2_PACKAGE_OPENBLAS_TARGET_BANIAS
+	default "YONAH"        if BR2_PACKAGE_OPENBLAS_TARGET_YONAH
+	default "CORE2"        if BR2_PACKAGE_OPENBLAS_TARGET_CORE2
+	default "PENRYN"       if BR2_PACKAGE_OPENBLAS_TARGET_PENRYN
+	default "DUNNINGTON"   if BR2_PACKAGE_OPENBLAS_TARGET_DUNNINGTON
+	default "NEHALEM"      if BR2_PACKAGE_OPENBLAS_TARGET_NEHALEM
+	default "SANDYBRIDGE"  if BR2_PACKAGE_OPENBLAS_TARGET_SANDYBRIDGE
+	default "HASWELL"      if BR2_PACKAGE_OPENBLAS_TARGET_HASWELL
+	default "ATOM"         if BR2_PACKAGE_OPENBLAS_TARGET_ATOM
+	default "ATHLON"       if BR2_PACKAGE_OPENBLAS_TARGET_ATHLON
+	default "OPTERON"      if BR2_PACKAGE_OPENBLAS_TARGET_OPTERON
+	default "OPTERON_SSE3" if BR2_PACKAGE_OPENBLAS_TARGET_OPTERON_SSE3
+	default "BARCELONA"    if BR2_PACKAGE_OPENBLAS_TARGET_BARCELONA
+	default "SHANGHAI"     if BR2_PACKAGE_OPENBLAS_TARGET_SHANGHAI
+	default "ISTANBUL"     if BR2_PACKAGE_OPENBLAS_TARGET_ISTANBUL
+	default "BOBCAT"       if BR2_PACKAGE_OPENBLAS_TARGET_BOBCAT
+	default "BULLDOZER"    if BR2_PACKAGE_OPENBLAS_TARGET_BULLDOZER
+	default "PILEDRIVER"   if BR2_PACKAGE_OPENBLAS_TARGET_PILEDRIVER
+	default "STEAMROLLER"  if BR2_PACKAGE_OPENBLAS_TARGET_STEAMROLLER
+	default "EXCAVATOR"    if BR2_PACKAGE_OPENBLAS_TARGET_EXCAVATOR
+	default "SSE_GENERIC"  if BR2_PACKAGE_OPENBLAS_TARGET_SSE_GENERIC
+	default "VIAC3"        if BR2_PACKAGE_OPENBLAS_TARGET_VIAC3
+	default "NANO"         if BR2_PACKAGE_OPENBLAS_TARGET_NANO
+	default "POWER4"       if BR2_PACKAGE_OPENBLAS_TARGET_POWER4
+	default "POWER5"       if BR2_PACKAGE_OPENBLAS_TARGET_POWER5
+	default "POWER6"       if BR2_PACKAGE_OPENBLAS_TARGET_POWER6
+	default "POWER7"       if BR2_PACKAGE_OPENBLAS_TARGET_POWER7
+	default "POWER8"       if BR2_PACKAGE_OPENBLAS_TARGET_POWER8
+	default "PPCG4"        if BR2_PACKAGE_OPENBLAS_TARGET_PPCG4
+	default "PPC970"       if BR2_PACKAGE_OPENBLAS_TARGET_PPC970
+	default "PPC970MP"     if BR2_PACKAGE_OPENBLAS_TARGET_PPC970MP
+	default "PPC440"       if BR2_PACKAGE_OPENBLAS_TARGET_PPC440
+	default "PPC440FP2"    if BR2_PACKAGE_OPENBLAS_TARGET_PPC440FP2
+	default "CELL"         if BR2_PACKAGE_OPENBLAS_TARGET_CELL
+	default "SICORTEX"     if BR2_PACKAGE_OPENBLAS_TARGET_SICORTEX
+	default "LOONGSON3A"   if BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3A
+	default "LOONGSON3B"   if BR2_PACKAGE_OPENBLAS_TARGET_LOONGSON3B
+	default "SPARC"        if BR2_PACKAGE_OPENBLAS_TARGET_SPARC
+	default "SPARCV7"      if BR2_PACKAGE_OPENBLAS_TARGET_SPARCV7
+	default "CORTEXA15"    if BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA15
+	default "CORTEXA9"     if BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA9
+	default "ARMV7"        if BR2_PACKAGE_OPENBLAS_TARGET_ARMV7
+	default "ARMV6"        if BR2_PACKAGE_OPENBLAS_TARGET_ARMV6
+	default "ARMV5"        if BR2_PACKAGE_OPENBLAS_TARGET_ARMV5
+	default "ARMV8"        if BR2_PACKAGE_OPENBLAS_TARGET_ARMV8
+	default "CORTEXA57"    if BR2_PACKAGE_OPENBLAS_TARGET_CORTEXA57
+
+endif
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
new file mode 100644
index 0000000..f7488ab
--- /dev/null
+++ b/package/openblas/openblas.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7d9f8d4ea4a65ab68088f3bb557f03a7ac9cb5036ef2ba30546c3a28774a4112  v0.2.18.tar.gz
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
new file mode 100644
index 0000000..cf07ed7
--- /dev/null
+++ b/package/openblas/openblas.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# openblas
+#
+################################################################################
+
+OPENBLAS_VERSION = v0.2.18
+OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/archive
+OPENBLAS_SOURCE = $(OPENBLAS_VERSION).tar.gz
+OPENBLAS_LICENSE = BSD-3
+OPENBLAS_LICENSE_FILES = LICENSE
+OPENBLAS_INSTALL_STAGING = YES
+
+# Disable fortran if the fortran compiler doesn't actually exist.
+ifeq ($(wildcard $(TARGET_FC)),)
+OPENBLAS_MAKE_OPTS += ONLY_CBLAS=1
+endif
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

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 22:17:57 +0200
Subject: [Buildroot] [git commit] arch: allow GCC target options to be
 optionally overwritten
Message-ID: <20180923212853.C6BF988C78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd0640a2139119e2fdb4b384ebf32d1edcb0fdaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_GCC_TARGET_* configuration variables are copied to
corresponding GCC_TARGET_* variables which may then be optionally
modified or overwritten by architecture specific makefiles.

All makefiles must use the new GCC_TARGET_* variables instead
of the BR2_GCC_TARGET_* versions.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
[Thomas: simplify include of arch/arch.mk]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                                           |  4 ++--
 arch/arch.mk                                       | 17 ++++++++++++++
 package/ffmpeg/ffmpeg.mk                           |  8 +++----
 package/freerdp/freerdp.mk                         |  2 +-
 package/gcc/gcc.mk                                 | 27 ++++++++++------------
 package/kodi/kodi.mk                               |  2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk           |  2 +-
 package/meson/meson.mk                             |  2 +-
 package/nodejs/nodejs.mk                           |  2 +-
 package/tvheadend/tvheadend.mk                     |  2 +-
 package/valgrind/valgrind.mk                       |  2 +-
 .../toolchain-external/pkg-toolchain-external.mk   | 22 +++++++++---------
 12 files changed, 53 insertions(+), 39 deletions(-)

diff --git a/Makefile b/Makefile
index 18afa36b28..600b5245f0 100644
--- a/Makefile
+++ b/Makefile
@@ -493,9 +493,9 @@ include Makefile.legacy
 
 include system/system.mk
 include package/Makefile.in
-# arch/arch.mk.* must be after package/Makefile.in because it may need to
+# arch/arch.mk must be after package/Makefile.in because it may need to
 # complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
--include $(sort $(wildcard arch/arch.mk.*))
+include arch/arch.mk
 include support/dependencies/dependencies.mk
 
 include $(sort $(wildcard toolchain/*.mk))
diff --git a/arch/arch.mk b/arch/arch.mk
new file mode 100644
index 0000000000..2429567b24
--- /dev/null
+++ b/arch/arch.mk
@@ -0,0 +1,17 @@
+# Allow GCC target configuration settings to be optionally
+# overwritten by architecture specific makefiles.
+
+# Makefiles must use the GCC_TARGET_* variables below instead
+# of the BR2_GCC_TARGET_* versions.
+GCC_TARGET_ARCH := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
+GCC_TARGET_ABI := $(call qstrip,$(BR2_GCC_TARGET_ABI))
+GCC_TARGET_NAN := $(call qstrip,$(BR2_GCC_TARGET_NAN))
+GCC_TARGET_FP32_MODE := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
+GCC_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU))
+GCC_TARGET_CPU_REVISION := $(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION))
+GCC_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
+GCC_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+GCC_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
+
+# Include any architecture specific makefiles.
+-include $(sort $(wildcard arch/arch.mk.*))
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index cf9abeb102..b8cc696f83 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -511,10 +511,10 @@ endif
 # warning from ffmpeg's configure script.
 ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
 FFMPEG_CONF_OPTS += --cpu=generic
-else ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
-FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
-else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
+else ifneq ($(GCC_TARGET_CPU),)
+FFMPEG_CONF_OPTS += --cpu="$(GCC_TARGET_CPU)"
+else ifneq ($(GCC_TARGET_ARCH),)
+FFMPEG_CONF_OPTS += --cpu="$(GCC_TARGET_ARCH)"
 endif
 
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 48c407b6b5..91e4ae47ee 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -77,7 +77,7 @@ FREERDP_CONF_OPTS += -DWITH_SSE2=OFF
 endif
 
 ifeq ($(BR2_arm)$(BR2_armeb),y)
-FREERDP_CONF_OPTS += -DARM_FP_ABI=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+FREERDP_CONF_OPTS += -DARM_FP_ABI=$(GCC_TARGET_FLOAT_ABI)
 endif
 
 #---------------------------------------
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1ae9b7edd9..5f6d53f106 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -200,39 +200,36 @@ HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
 endif
 
 # Determine arch/tune/abi/cpu options
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
+ifneq ($(GCC_TARGET_ARCH),)
+HOST_GCC_COMMON_CONF_OPTS += --with-arch="$(GCC_TARGET_ARCH)"
 endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
-HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
+ifneq ($(GCC_TARGET_ABI),)
+HOST_GCC_COMMON_CONF_OPTS += --with-abi="$(GCC_TARGET_ABI)"
 endif
 ifeq ($(BR2_TOOLCHAIN_HAS_MNAN_OPTION),y)
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_NAN)),)
-HOST_GCC_COMMON_CONF_OPTS += --with-nan=$(BR2_GCC_TARGET_NAN)
+ifneq ($(GCC_TARGET_NAN),)
+HOST_GCC_COMMON_CONF_OPTS += --with-nan="$(GCC_TARGET_NAN)"
 endif
 endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_FP32_MODE)),)
-HOST_GCC_COMMON_CONF_OPTS += --with-fp-32=$(BR2_GCC_TARGET_FP32_MODE)
+ifneq ($(GCC_TARGET_FP32_MODE),)
+HOST_GCC_COMMON_CONF_OPTS += --with-fp-32="$(GCC_TARGET_FP32_MODE)"
 endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+ifneq ($(GCC_TARGET_CPU),)
+ifneq ($(GCC_TARGET_CPU_REVISION),)
+HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(GCC_TARGET_CPU)-$(GCC_TARGET_CPU_REVISION)
 else
-HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
+HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(GCC_TARGET_CPU)
 endif
 endif
 
-GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
 ifneq ($(GCC_TARGET_FPU),)
 HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(GCC_TARGET_FPU)
 endif
 
-GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 ifneq ($(GCC_TARGET_FLOAT_ABI),)
 HOST_GCC_COMMON_CONF_OPTS += --with-float=$(GCC_TARGET_FLOAT_ABI)
 endif
 
-GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
 ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 8e8d53d6b0..8d2430ea55 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -88,7 +88,7 @@ KODI_DEPENDENCIES += rpi-userland
 # These CPU-specific options are only used on rbpi:
 # https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L13
 ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
-KODI_CONF_OPTS += -DWITH_CPU=$(BR2_GCC_TARGET_CPU)
+KODI_CONF_OPTS += -DWITH_CPU="$(GCC_TARGET_CPU)"
 endif
 else
 ifeq ($(BR2_arceb)$(BR2_arcle),y)
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 54614e2643..92d67fb34b 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -28,7 +28,7 @@ endif
 
 KVM_UNIT_TESTS_CONF_OPTS =\
 	--arch="$(KVM_UNIT_TESTS_ARCH)" \
-	--processor="$(call qstrip,$(BR2_GCC_TARGET_CPU))" \
+	--processor="$(GCC_TARGET_CPU)" \
 	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
 
 # For all architectures but x86-64, we use the target
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d110e594f5..08e5c505c9 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -14,7 +14,7 @@ HOST_MESON_DEPENDENCIES = host-ninja
 HOST_MESON_NEEDS_HOST_PYTHON = python3
 
 HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
-HOST_MESON_TARGET_CPU = $(call qstrip,$(BR2_GCC_TARGET_CPU))
+HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
 
 HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
 HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index f9a604f747..29462cb979 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -96,7 +96,7 @@ NODEJS_CPU = arm
 else ifeq ($(BR2_aarch64),y)
 NODEJS_CPU = arm64
 # V8 needs to know what floating point ABI the target is using.
-NODEJS_ARM_FP = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+NODEJS_ARM_FP = $(GCC_TARGET_FLOAT_ABI)
 endif
 
 # MIPS architecture specific options
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4c9cda4d9a..5ebb98b941 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -114,7 +114,7 @@ define TVHEADEND_CONFIGURE_CMDS
 		./configure \
 			--prefix=/usr \
 			--arch="$(ARCH)" \
-			--cpu="$(BR2_GCC_TARGET_CPU)" \
+			--cpu="$(GCC_TARGET_CPU)" \
 			--nowerror \
 			--python="$(HOST_DIR)/bin/python" \
 			--enable-dvbscan \
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 11dec607dd..b1ab7e72fc 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -31,7 +31,7 @@ VALGRIND_CFLAGS = \
 # and pass the right -march option, so they take precedence over
 # Valgrind's wrongfully detected value.
 ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
-VALGRIND_CFLAGS += -march=$(BR2_GCC_TARGET_ARCH)
+VALGRIND_CFLAGS += -march="$(GCC_TARGET_ARCH)"
 endif
 
 VALGRIND_CONF_ENV = CFLAGS="$(VALGRIND_CFLAGS)"
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 02d992531d..08e61af00b 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -151,18 +151,18 @@ TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 # Definition of the CFLAGS to use with the external toolchain, as well as the
 # common toolchain wrapper build arguments
 #
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
+ifeq ($(GCC_TARGET_CPU_REVISION),)
+CC_TARGET_CPU_ := $(GCC_TARGET_CPU)
 else
-CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
-endif
-CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
-CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
-CC_TARGET_NAN_ := $(call qstrip,$(BR2_GCC_TARGET_NAN))
-CC_TARGET_FP32_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
-CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
-CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
-CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
+CC_TARGET_CPU_ := $(GCC_TARGET_CPU)-$(GCC_TARGET_CPU_REVISION)
+endif
+CC_TARGET_ARCH_ := $(GCC_TARGET_ARCH)
+CC_TARGET_ABI_ := $(GCC_TARGET_ABI)
+CC_TARGET_NAN_ := $(GCC_TARGET_NAN)
+CC_TARGET_FP32_MODE_ := $(GCC_TARGET_FP32_MODE)
+CC_TARGET_FPU_ := $(GCC_TARGET_FPU)
+CC_TARGET_FLOAT_ABI_ := $(GCC_TARGET_FLOAT_ABI)
+CC_TARGET_MODE_ := $(GCC_TARGET_MODE)
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant

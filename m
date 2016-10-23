From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:26 +0200
Subject: [Buildroot] [PATCH 25/30] toolchain/toolchain-external: move the
	definition of various variables into a separate file
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-26-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-toolchain-external-vars.mk for the definition of various variables:
list of libraries to copy to the target, wrapper arguments and cflags

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../pkg-toolchain-external-vars.mk                 | 120 +++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 101 -----------------
 2 files changed, 120 insertions(+), 101 deletions(-)
 create mode 100644 toolchain/toolchain-external/pkg-toolchain-external-vars.mk

diff --git a/toolchain/toolchain-external/pkg-toolchain-external-vars.mk b/toolchain/toolchain-external/pkg-toolchain-external-vars.mk
new file mode 100644
index 0000000..af8c146
--- /dev/null
+++ b/toolchain/toolchain-external/pkg-toolchain-external-vars.mk
@@ -0,0 +1,120 @@
+#
+# This file contains various variable definitions that are used by the
+# external toolchain infrastructure:
+#
+#  - Definitions of the list of libraries that should be copied to the
+#    target.
+#  - Definition of the CFLAGS to use with the external toolchain, as
+#    well as the common toolchain wrapper build arguments
+#
+
+#
+# Define the list of libraries to copy
+#
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+LIB_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
+LIB_EXTERNAL_LIBS += ld-linux-armhf.so.*
+else
+LIB_EXTERNAL_LIBS += ld*.so.*
+endif
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIB_EXTERNAL_LIBS += libpthread.so.*
+ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
+LIB_EXTERNAL_LIBS += libthread_db.so.*
+endif # gdbserver
+endif # ! no threads
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
+LIB_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.*
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+LIB_EXTERNAL_LIBS += libc.so libgcc_s.so.*
+endif
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+USR_LIB_EXTERNAL_LIBS += libstdc++.so.*
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+USR_LIB_EXTERNAL_LIBS += libgfortran.so.*
+# fortran needs quadmath on x86 and x86_64
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBQUADMATH),y)
+USR_LIB_EXTERNAL_LIBS += libquadmath.so*
+endif
+endif
+
+LIB_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
+
+#
+# Calculate the common CFLAGS and wrapper arguments
+#
+
+ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
+CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
+else
+CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+endif
+
+CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
+CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
+CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
+CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
+
+# march/mtune/floating point mode needs to be passed to the external toolchain
+# to select the right multilib variant
+ifeq ($(BR2_x86_64),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -m64
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_64
+endif
+ifneq ($(CC_TARGET_ARCH_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
+endif
+ifneq ($(CC_TARGET_CPU_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
+endif
+ifneq ($(CC_TARGET_ABI_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
+endif
+ifneq ($(CC_TARGET_FPU_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
+endif
+ifneq ($(CC_TARGET_FLOAT_ABI_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_ABI_)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
+endif
+ifneq ($(CC_TARGET_MODE_),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_MODE_)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
+endif
+ifeq ($(BR2_BINFMT_FLAT),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_BINFMT_FLAT
+endif
+ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
+TOOLCHAIN_EXTERNAL_CFLAGS += -EL
+endif
+ifeq ($(BR2_mips)$(BR2_mips64),y)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
+TOOLCHAIN_EXTERNAL_CFLAGS += -EB
+endif
+ifeq ($(BR2_arceb),y)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
+TOOLCHAIN_EXTERNAL_CFLAGS += -EB
+endif
+
+TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
+endif
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index ea8bc36..f56f049 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -63,43 +63,6 @@
 #  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
 #  of Buildroot is handled identical for the 2 toolchain types.
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
-TOOLCHAIN_EXTERNAL_LIBS += ld-linux-armhf.so.*
-else
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so.*
-endif
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
-ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
-TOOLCHAIN_EXTERNAL_LIBS += libthread_db.so.*
-endif # gdbserver
-endif # ! no threads
-endif
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.*
-endif
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-TOOLCHAIN_EXTERNAL_LIBS += libc.so libgcc_s.so.*
-endif
-
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-TOOLCHAIN_EXTERNAL_LIBS += libgfortran.so.*
-# fortran needs quadmath on x86 and x86_64
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBQUADMATH),y)
-TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
-endif
-endif
-
-TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
-
 # Details about sysroot directory selection.
 #
 # To find the sysroot directory, we use the trick of looking for the
@@ -183,70 +146,6 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
 	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
 endif
 
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
-else
-CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
-endif
-CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
-CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
-CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
-CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
-CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
-
-# march/mtune/floating point mode needs to be passed to the external toolchain
-# to select the right multilib variant
-ifeq ($(BR2_x86_64),y)
-TOOLCHAIN_EXTERNAL_CFLAGS += -m64
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
-endif
-ifneq ($(CC_TARGET_ARCH_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
-endif
-ifneq ($(CC_TARGET_CPU_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
-endif
-ifneq ($(CC_TARGET_ABI_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
-endif
-ifneq ($(CC_TARGET_FPU_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
-endif
-ifneq ($(CC_TARGET_FLOAT_ABI_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_ABI_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
-endif
-ifneq ($(CC_TARGET_MODE_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_MODE_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
-endif
-ifeq ($(BR2_BINFMT_FLAT),y)
-TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_BINFMT_FLAT
-endif
-ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
-TOOLCHAIN_EXTERNAL_CFLAGS += -EL
-endif
-ifeq ($(BR2_mips)$(BR2_mips64),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
-TOOLCHAIN_EXTERNAL_CFLAGS += -EB
-endif
-ifeq ($(BR2_arceb),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
-TOOLCHAIN_EXTERNAL_CFLAGS += -EB
-endif
-
-TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
-
-ifeq ($(BR2_SOFT_FLOAT),y)
-TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
-endif
 
 # musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
 # So, add the musl-compat-headers package that will install those files,
-- 
2.5.5

From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 10 Jul 2018 16:42:10 -0700
Subject: [Buildroot] [PATCH v6 2/4] llvm: add config to build backend for
 host arch
In-Reply-To: <20180710234212.4297-1-joseph.kogut@gmail.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
Message-ID: <20180710234212.4297-3-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/Config.in.host      |  1 +
 package/llvm/Config.in.host | 18 ++++++++++++++++++
 package/llvm/llvm.mk        |  9 ++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 package/llvm/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 7838ffc219..3725c2c81d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -30,6 +30,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
+	source "package/llvm/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/llvm/Config.in.host b/package/llvm/Config.in.host
new file mode 100644
index 0000000000..4d73fb8c75
--- /dev/null
+++ b/package/llvm/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HOST_LLVM
+	bool "host llvm"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	help
+	  The LLVM Project is a collection of modular and reusable
+	  compiler and toolchain technologies.
+
+	  http://llvm.org
+
+config BR2_PACKAGE_HOST_LLVM_HOST_ARCH
+	string
+	default "AArch64" if BR2_HOSTARCH="aarch64"
+	default "X86" if BR2_HOSTARCH = "x86" || BR2_HOSTARCH = "x86_64"
+	default "ARM" if BR2_HOSTARCH = "arm"
+
+config BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH
+	bool
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index fb0ae4ce5c..31c31630ad 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -39,8 +39,9 @@ LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
 LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
 # Build backend for target architecture. This include backends like AMDGPU.
+HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
 LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
-HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(HOST_LLVM_TARGETS_TO_BUILD))"
 LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 
 # LLVM target to use for native code generation. This is required for JIT generation.
@@ -56,9 +57,15 @@ LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)
 # output only $(LLVM_TARGET_ARCH) if not, and mesa3d won't build as
 # it thinks AMDGPU backend is not installed on the target.
 ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
+HOST_LLVM_TARGETS_TO_BUILD += AMDGPU
 LLVM_TARGETS_TO_BUILD += AMDGPU
 endif
 
+# Build backend for host architecture
+ifeq ($(BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH),y)
+HOST_LLVM_TARGETS_TO_BUILD += $(call qstrip,$(BR2_PACKAGE_HOST_LLVM_HOST_ARCH))
+endif
+
 # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
 LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
 
-- 
2.18.0

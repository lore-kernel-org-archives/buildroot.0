From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 14 Jun 2018 15:48:16 -0700
Subject: [Buildroot] [RFC PATCH v4 5/9] llvm: add config to build backend
 for host arch
In-Reply-To: <20180614224820.27126-1-joseph.kogut@gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
Message-ID: <20180614224820.27126-6-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/llvm/Config.in | 11 +++++++++++
 package/llvm/llvm.mk   |  9 ++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 83e94660eb..dd07b23e07 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -11,6 +11,12 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
 	default "ARM" if BR2_arm || BR2_armeb
 	default "X86" if BR2_i386 || BR2_x86_64
 
+config BR2_PACKAGE_LLVM_HOST_ARCH
+	string
+	default "AArch64" if BR2_HOSTARCH="aarch64"
+	default "X86" if BR2_HOSTARCH = "x86" || BR2_HOSTARCH = "x86_64"
+	default "ARM" if BR2_HOSTARCH = "arm"
+
 config BR2_PACKAGE_LLVM
 	bool "llvm"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
@@ -27,6 +33,11 @@ config BR2_PACKAGE_LLVM
 
 	  http://llvm.org
 
+config BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH
+	bool "Build backend for host architecture"
+	help
+	  Build code generator for host machine.
+
 if BR2_PACKAGE_LLVM
 
 config BR2_PACKAGE_LLVM_AMDGPU
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 3abf428989..50cc74d299 100644
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
+ifeq ($(BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH),y)
+HOST_LLVM_TARGETS_TO_BUILD += $(call qstrip,$(BR2_PACKAGE_LLVM_HOST_ARCH))
+endif
+
 # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
 LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
 
-- 
2.17.1

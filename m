From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:00 +0100
Subject: [Buildroot] [RFC PATCH v1 05/25] llvm: add config to build backend
 for host arch
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-6-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joseph Kogut <joseph.kogut@gmail.com>

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Config.in.host      |  1 +
 package/llvm/Config.in.host | 18 ++++++++++++++++++
 package/llvm/llvm.mk        |  9 ++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 package/llvm/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 1501889b72..3122f5abca 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -34,6 +34,7 @@ menu "Host utilities"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
 	source "package/libp11/Config.in.host"
+	source "package/llvm/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
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
index 3c62285188..5c413064c0 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -41,8 +41,9 @@ HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
 LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
 # Build backend for target architecture. This include backends like AMDGPU.
+HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
 LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
-HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(HOST_LLVM_TARGETS_TO_BUILD))"
 LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 
 # LLVM target to use for native code generation. This is required for JIT generation.
@@ -58,9 +59,15 @@ LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)
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
2.20.1

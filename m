From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:38 +0200
Subject: [Buildroot] [PATCH v4 03/11] package/llvm: enable AMDGPU
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-4-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AMDGPU backend provides ISA code generation for AMD GPU's,
starting with the R600 family up until the current GCN families.

It should not be confused with the AMDGPU Linux kernel DRM driver.

For more info: https://llvm.org/docs/AMDGPUUsage.html

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Tested-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
---

Tested on HD6480 using Gallium Radeon R600 driver.

 package/llvm/Config.in | 7 +++++++
 package/llvm/llvm.mk   | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 1d80498d53..7f36bc802b 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -16,3 +16,10 @@ config BR2_PACKAGE_LLVM
 	  compiler and toolchain technologies.
 
 	  http://llvm.org
+
+config BR2_PACKAGE_LLVM_AMDGPU
+	bool "AMDGPU backend"
+	depends on BR2_PACKAGE_LLVM
+	help
+	  Build AMDGPU target. Select this option if you are going
+	  to install mesa3d with llvm and use Gallium Radeon driver.
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 4e58c96e0f..c819487bdf 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -226,9 +226,15 @@ LLVM_CONF_OPTS += -DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF
 # Get target architecture
 HOST_LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
+# Build AMDGPU backend
+ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH);AMDGPU"
+LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH);AMDGPU"
+else
 # Build backend for target architecture
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
 LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
+endif
 
 # LLVM target to use for native code generation.
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(HOST_LLVM_TARGET_ARCH)
-- 
2.14.3

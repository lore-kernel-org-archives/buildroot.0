From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  4 Apr 2018 18:31:19 +0200
Subject: [Buildroot] [PATCH v5 2/7] package/llvm: enable AMDGPU
In-Reply-To: <20180404163124.27934-1-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
Message-ID: <20180404163124.27934-3-valentin.korenblit@smile.fr>
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

 package/llvm/Config.in | 10 ++++++++++
 package/llvm/llvm.mk   |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index f222b196cb..41e8e940bb 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -22,6 +22,16 @@ config BR2_PACKAGE_LLVM
 
 	  http://llvm.org
 
+if BR2_PACKAGE_LLVM
+
+config BR2_PACKAGE_LLVM_AMDGPU
+	bool "AMDGPU backend"
+	help
+	  Build AMDGPU target. Select this option if you are going
+	  to install mesa3d with llvm and use Gallium Radeon driver.
+
+endif
+
 comment "llvm needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_HOST_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 525e0f98f8..9c8bf5c820 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -45,6 +45,15 @@ LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_B
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)
 LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)
 
+# Build AMDGPU backend
+# We need to build AMDGPU backend for both host and target because
+# llvm-config --targets built (host variant installed in STAGING) will
+# output only $(LLVM_TARGET_ARCH) if not, and mesa3d won't build as
+# it thinks AMDGPU backend is not installed on the target.
+ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
+LLVM_TARGETS_TO_BUILD += AMDGPU
+endif
+
 # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
 LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
 
-- 
2.14.3

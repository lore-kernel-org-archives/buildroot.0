From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:52:04 +0200
Subject: [Buildroot] [git commit] package/llvm: enable AMDGPU
Message-ID: <20180404205246.91E5583FB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29f04d7934b46502f856bb84f91b74b0d8c066d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AMDGPU backend provides ISA code generation for AMD GPU's,
starting with the R600 family up until the current GCN families.

It should not be confused with the AMDGPU Linux kernel DRM driver.

For more info: https://llvm.org/docs/AMDGPUUsage.html

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Tested-by: J??r??me Oufella <jerome.oufella@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/Config.in | 10 ++++++++++
 package/llvm/llvm.mk   |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 408fde2e39..70f73f4858 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -24,6 +24,16 @@ config BR2_PACKAGE_LLVM
 
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
 comment "llvm needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
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
 

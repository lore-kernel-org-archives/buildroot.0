From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:19 +0000
Subject: [Buildroot] [RFC PATCH v3 05/30] package/llvm: add config to build
 backend for host arch
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-6-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joseph Kogut <joseph.kogut@gmail.com>

When cross-compiling for a different architecture to the host,
LLVM only has target architecture support.  This change adds
support for compiling for the host architecture as well.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/llvm/Config.in | 6 ++++++
 package/llvm/llvm.mk   | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 1d21d879da..ae96d30a64 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -28,6 +28,12 @@ config BR2_PACKAGE_LLVM
 
 if BR2_PACKAGE_LLVM
 
+config BR2_PACKAGE_HOST_LLVM_HOST_ARCH
+	string
+	default "X86" if BR2_HOSTARCH = "x86" || BR2_HOSTARCH = "x86_64"
+	default "AArch64" if BR2_HOSTARCH="aarch64"
+	default "ARM" if BR2_HOSTARCH = "arm"
+
 config BR2_PACKAGE_LLVM_AMDGPU
 	bool "AMDGPU backend"
 	help
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 2b2bcf336e..300ac3e300 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -42,7 +42,10 @@ LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
 # Build backend for target architecture. This include backends like AMDGPU.
 LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
-HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+HOST_LLVM_TARGETS_TO_BUILD = \
+	$(LLVM_TARGETS_TO_BUILD) \
+	$(call qstrip,$(BR2_PACKAGE_HOST_LLVM_HOST_ARCH))
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(HOST_LLVM_TARGETS_TO_BUILD))"
 LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 
 # LLVM target to use for native code generation. This is required for JIT generation.
@@ -58,6 +61,7 @@ LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)
 # output only $(LLVM_TARGET_ARCH) if not, and mesa3d won't build as
 # it thinks AMDGPU backend is not installed on the target.
 ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
+HOST_LLVM_TARGETS_TO_BUILD += AMDGPU
 LLVM_TARGETS_TO_BUILD += AMDGPU
 endif
 
-- 
2.20.1

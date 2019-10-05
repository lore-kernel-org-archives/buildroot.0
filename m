From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Oct 2019 11:48:15 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/llvm: add llvm RTTI option
Message-ID: <20191005094818.1956334-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to build LLVM with run-time type information
when this feature is needed (for example) by mesa3d's
Gallium Nouveau driver or the Clover OpenCL state
tracker when llvm support is enabled in mesa3d.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: rebase the patch on master

 package/llvm/Config.in | 12 ++++++++++++
 package/llvm/llvm.mk   |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 83e94660eb..4eaca3df58 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -35,6 +35,18 @@ config BR2_PACKAGE_LLVM_AMDGPU
 	  Build AMDGPU target. Select this option if you are going
 	  to install mesa3d with llvm and use Gallium Radeon driver.
 
+config BR2_PACKAGE_LLVM_RTTI
+	bool "enable rtti"
+	help
+	  Build LLVM with run-time type information. LLVM can be
+	  built without rtti, but turning it off rtti changes the
+	  ABI of C++ programs.
+	  This features is needed to build the Gallium Nouveau
+	  driver or the Clover OpenCL state tracker when llvm
+	  support is enabled.
+
+	  https://llvm.org/docs/HowToSetUpLLVMStyleRTTI.html
+
 endif
 
 comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index f14b537d94..27a9f41860 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -216,6 +216,14 @@ LLVM_CONF_OPTS += \
 	-DLLVM_INCLUDE_TOOLS=ON \
 	-DLLVM_BUILD_TOOLS=OFF
 
+ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=ON
+else
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
+endif
+
 # Compiler-rt not in the source tree.
 # llvm runtime libraries are not in the source tree.
 # Polly is not in the source tree.
-- 
2.23.0

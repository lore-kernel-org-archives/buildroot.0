From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Oct 2019 11:30:06 +0200
Subject: [Buildroot] [PATCH 1/4] package/llvm: add llvm RTTI option
Message-ID: <20191005093009.1020308-1-romain.naour@gmail.com>
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
 package/llvm/Config.in | 12 ++++++++++++
 package/llvm/llvm.mk   |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 72d920e226..534d3d03f3 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -41,6 +41,18 @@ config BR2_PACKAGE_LLVM_BPF
 	  Build BPF target. Select this option if you are going
 	  to install bcc on the target.
 
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
index 027c0ad712..e8a755ad2a 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -235,6 +235,14 @@ LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_TOOLS=OFF
 endif
 
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

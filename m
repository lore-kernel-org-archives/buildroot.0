From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 10 Jun 2018 13:44:45 -0700
Subject: [Buildroot] [RFC PATCH v2 5/9] llvm: add config to build backend
 for host arch
In-Reply-To: <20180610204449.13646-1-joseph.kogut@gmail.com>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
 <20180610204449.13646-1-joseph.kogut@gmail.com>
Message-ID: <20180610204449.13646-7-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/llvm/Config.in | 9 +++++++++
 package/llvm/llvm.mk   | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 83e94660eb..e9c461b92f 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -11,6 +11,15 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
 	default "ARM" if BR2_arm || BR2_armeb
 	default "X86" if BR2_i386 || BR2_x86_64
 
+config BR2_PACKAGE_LLVM_HOST_ARCH
+	string
+	default "AArch64" if BR2_HOSTARCH="aarch64"
+	default "X86" if BR2_HOSTARCH = "x86" || BR2_HOSTARCH = "x86_64"
+	default "ARM" if BR2_HOSTARCH = "arm"
+
+config BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH
+	bool
+
 config BR2_PACKAGE_LLVM
 	bool "llvm"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 3abf428989..04e99eb5b4 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -59,6 +59,11 @@ ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
 LLVM_TARGETS_TO_BUILD += AMDGPU
 endif
 
+# Build backend for host architecture
+ifeq ($(BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH),y)
+LLVM_TARGETS_TO_BUILD += $(call qstrip,$(BR2_PACKAGE_LLVM_HOST_ARCH))
+endif
+
 # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
 LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
 
-- 
2.17.1

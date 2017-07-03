From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Jul 2017 12:18:43 +0200
Subject: [Buildroot] [RFC 6/9] package/llvm: add AMDGPU support
In-Reply-To: <20170703101846.1158-1-romain.naour@gmail.com>
References: <20170703101846.1158-1-romain.naour@gmail.com>
Message-ID: <20170703101846.1158-7-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Limit the number of supported target for mesa3d when openCL support is enabled.
With -DLLVM_TARGETS_TO_BUILD="all" mesa3d fail to build on x86_64 target with AMDGPU target:

 CXXLD    libOpenCL.la
../../../../src/gallium/state_trackers/clover/.libs/libclover.a(libclllvm_la-invocation.o): In function `(anonymous namespace)::create_context(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)':
invocation.cpp:(.text+0x1a8): undefined reference to `LLVMInitializeAArch64Target'
invocation.cpp:(.text+0x1b2): undefined reference to `LLVMInitializeARMTarget'
invocation.cpp:(.text+0x1b7): undefined reference to `LLVMInitializeBPFTarget'
invocation.cpp:(.text+0x1bc): undefined reference to `LLVMInitializeHexagonTarget'
invocation.cpp:(.text+0x1c1): undefined reference to `LLVMInitializeLanaiTarget'
invocation.cpp:(.text+0x1c6): undefined reference to `LLVMInitializeMipsTarget'
invocation.cpp:(.text+0x1cb): undefined reference to `LLVMInitializeMSP430Target'
invocation.cpp:(.text+0x1d0): undefined reference to `LLVMInitializeNVPTXTarget'
invocation.cpp:(.text+0x1d5): undefined reference to `LLVMInitializePowerPCTarget'
invocation.cpp:(.text+0x1da): undefined reference to `LLVMInitializeRISCVTarget'
invocation.cpp:(.text+0x1df): undefined reference to `LLVMInitializeSparcTarget'
invocation.cpp:(.text+0x1e4): undefined reference to `LLVMInitializeSystemZTarget'
invocation.cpp:(.text+0x1ee): undefined reference to `LLVMInitializeXCoreTarget'
invocation.cpp:(.text+0x1f3): undefined reference to `LLVMInitializeAArch64TargetInfo'
invocation.cpp:(.text+0x1fd): undefined reference to `LLVMInitializeARMTargetInfo'
invocation.cpp:(.text+0x202): undefined reference to `LLVMInitializeBPFTargetInfo'
invocation.cpp:(.text+0x207): undefined reference to `LLVMInitializeHexagonTargetInfo'
invocation.cpp:(.text+0x20c): undefined reference to `LLVMInitializeLanaiTargetInfo'
invocation.cpp:(.text+0x211): undefined reference to `LLVMInitializeMipsTargetInfo'
invocation.cpp:(.text+0x216): undefined reference to `LLVMInitializeMSP430TargetInfo'
invocation.cpp:(.text+0x21b): undefined reference to `LLVMInitializeNVPTXTargetInfo'
invocation.cpp:(.text+0x220): undefined reference to `LLVMInitializePowerPCTargetInfo'
invocation.cpp:(.text+0x225): undefined reference to `LLVMInitializeRISCVTargetInfo'
invocation.cpp:(.text+0x22a): undefined reference to `LLVMInitializeSparcTargetInfo'
invocation.cpp:(.text+0x22f): undefined reference to `LLVMInitializeSystemZTargetInfo'
invocation.cpp:(.text+0x239): undefined reference to `LLVMInitializeXCoreTargetInfo'
invocation.cpp:(.text+0x23e): undefined reference to `LLVMInitializeAArch64TargetMC'
invocation.cpp:(.text+0x248): undefined reference to `LLVMInitializeARMTargetMC'
invocation.cpp:(.text+0x24d): undefined reference to `LLVMInitializeBPFTargetMC'
invocation.cpp:(.text+0x252): undefined reference to `LLVMInitializeHexagonTargetMC'
invocation.cpp:(.text+0x257): undefined reference to `LLVMInitializeLanaiTargetMC'
invocation.cpp:(.text+0x25c): undefined reference to `LLVMInitializeMipsTargetMC'
invocation.cpp:(.text+0x261): undefined reference to `LLVMInitializeMSP430TargetMC'
invocation.cpp:(.text+0x266): undefined reference to `LLVMInitializeNVPTXTargetMC'
invocation.cpp:(.text+0x26b): undefined reference to `LLVMInitializePowerPCTargetMC'
invocation.cpp:(.text+0x270): undefined reference to `LLVMInitializeRISCVTargetMC'
invocation.cpp:(.text+0x275): undefined reference to `LLVMInitializeSparcTargetMC'
invocation.cpp:(.text+0x27a): undefined reference to `LLVMInitializeSystemZTargetMC'
invocation.cpp:(.text+0x284): undefined reference to `LLVMInitializeXCoreTargetMC'
invocation.cpp:(.text+0x289): undefined reference to `LLVMInitializeAArch64AsmPrinter'
invocation.cpp:(.text+0x293): undefined reference to `LLVMInitializeARMAsmPrinter'
invocation.cpp:(.text+0x298): undefined reference to `LLVMInitializeBPFAsmPrinter'
invocation.cpp:(.text+0x29d): undefined reference to `LLVMInitializeHexagonAsmPrinter'
invocation.cpp:(.text+0x2a2): undefined reference to `LLVMInitializeLanaiAsmPrinter'
invocation.cpp:(.text+0x2a7): undefined reference to `LLVMInitializeMipsAsmPrinter'
invocation.cpp:(.text+0x2ac): undefined reference to `LLVMInitializeMSP430AsmPrinter'
invocation.cpp:(.text+0x2b1): undefined reference to `LLVMInitializeNVPTXAsmPrinter'
invocation.cpp:(.text+0x2b6): undefined reference to `LLVMInitializePowerPCAsmPrinter'
invocation.cpp:(.text+0x2bb): undefined reference to `LLVMInitializeSparcAsmPrinter'
invocation.cpp:(.text+0x2c0): undefined reference to `LLVMInitializeSystemZAsmPrinter'
invocation.cpp:(.text+0x2ca): undefined reference to `LLVMInitializeXCoreAsmPrinter'
collect2: error: ld returned 1 exit status

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/llvm/Config.in | 9 +++++++++
 package/llvm/llvm.mk   | 9 +++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 84dde8d..417af6e 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -27,3 +27,12 @@ config BR2_PACKAGE_LLVM
 	  compiler and toolchain technologies.
 
 	  http://llvm.org
+
+if BR2_PACKAGE_LLVM
+
+config BR2_PACKAGE_LLVM_TARGET_ARCH_AMDGPU
+	bool "AMDGPU"
+	help
+	  TODO
+
+endif # BR2_PACKAGE_LLVM
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 45ce4b4..0e381ff 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -228,8 +228,13 @@ HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF
 LLVM_CONF_OPTS += -DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF
 
 HOST_LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
-HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD=$(HOST_LLVM_TARGET_ARCH)
-LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD=$(HOST_LLVM_TARGET_ARCH)
+
+ifeq ($(BR2_PACKAGE_LLVM_TARGET_ARCH_AMDGPU),y)
+HOST_LLVM_TARGET_TO_BUILD = "$(HOST_LLVM_TARGET_ARCH);AMDGPU"
+endif
+
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD=$(HOST_LLVM_TARGET_TO_BUILD)
+LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD=$(HOST_LLVM_TARGET_TO_BUILD)
 # LLVM target to use for native code generation.
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(HOST_LLVM_TARGET_ARCH)
 LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(HOST_LLVM_TARGET_ARCH)
-- 
2.9.4

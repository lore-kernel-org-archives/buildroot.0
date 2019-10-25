From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 23:27:36 +0200
Subject: [Buildroot] [git commit] package/llvm: add llvm RTTI option
Message-ID: <20191025212112.087B2881AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edad1d9f79a46dbdb25d2d7adaecd455014f9d62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow to build LLVM with run-time type information as this feature is
needed (for example) by mesa3d's Gallium Nouveau driver or the Clover
OpenCL state tracker when llvm support is enabled in mesa3d.

While we only care about RTTI support in the target, we also need to
enable it in the host LLVM, so that llvm-config gives the proper
result.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/Config.in | 13 +++++++++++++
 package/llvm/llvm.mk   |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 83e94660eb..e235efed9a 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -35,6 +35,19 @@ config BR2_PACKAGE_LLVM_AMDGPU
 	  Build AMDGPU target. Select this option if you are going
 	  to install mesa3d with llvm and use Gallium Radeon driver.
 
+config BR2_PACKAGE_LLVM_RTTI
+	bool "enable rtti"
+	help
+	  Build LLVM with run-time type information. LLVM can be built
+	  without rtti, but turning it off changes the ABI of C++
+	  programs.
+
+	  This features is needed to build the Gallium Nouveau driver
+	  or the Clover OpenCL state tracker when llvm support is
+	  enabled.
+
+	  https://llvm.org/docs/HowToSetUpLLVMStyleRTTI.html
+
 endif
 
 comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 4d9bb1d12f..2b2bcf336e 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -219,6 +219,14 @@ LLVM_CONF_OPTS += \
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

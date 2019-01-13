From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 13 Jan 2019 22:21:17 +0100
Subject: [Buildroot] [PATCH 1/2] package/llvm: add BPF backend
Message-ID: <20190113212118.14512-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

The BPF backend is needed for bcc tool.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/llvm/Config.in | 6 ++++++
 package/llvm/llvm.mk   | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 83e94660eb..72d920e226 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -35,6 +35,12 @@ config BR2_PACKAGE_LLVM_AMDGPU
 	  Build AMDGPU target. Select this option if you are going
 	  to install mesa3d with llvm and use Gallium Radeon driver.
 
+config BR2_PACKAGE_LLVM_BPF
+	bool "BPF backend"
+	help
+	  Build BPF target. Select this option if you are going
+	  to install bcc on the target.
+
 endif
 
 comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 613f5f5d47..9999389651 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -54,6 +54,11 @@ ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
 LLVM_TARGETS_TO_BUILD += AMDGPU
 endif
 
+# Build BPF backend
+ifeq ($(BR2_PACKAGE_LLVM_BPF),y)
+LLVM_TARGETS_TO_BUILD += BPF
+endif
+
 # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
 LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
 
-- 
2.14.5

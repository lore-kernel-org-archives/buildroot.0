From: Qais Yousef <qais.yousef@arm.com>
Date: Tue, 29 Sep 2020 11:26:15 +0100
Subject: [Buildroot] [RFC PATCH 1/4] llvm: Add BPF backend
In-Reply-To: <20200929102618.28571-1-qais.yousef@arm.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
Message-ID: <20200929102618.28571-2-qais.yousef@arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need BPF backend to enable BPF Compiler Collection (BCC) and bpftrace
packager in later commits.

Signed-off-by: Qais Yousef <qais.yousef@arm.com>
---
 package/llvm/Config.in | 6 ++++++
 package/llvm/llvm.mk   | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 1d21d879da..22d51b4e3c 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -34,6 +34,12 @@ config BR2_PACKAGE_LLVM_AMDGPU
 	  Build AMDGPU target. Select this option if you are going
 	  to install mesa3d with llvm and use Gallium Radeon driver.
 
+config BR2_PACKAGE_LLVM_BPF
+	bool "BPF backend"
+	help
+	  Build BPF target. Select this option if you want to use BPF tools
+	  like BCC on the target.
+
 config BR2_PACKAGE_LLVM_RTTI
 	bool "enable rtti"
 	help
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 24d033d124..48a298191c 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -61,6 +61,11 @@ ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
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
2.17.1

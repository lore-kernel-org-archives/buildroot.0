From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  2 May 2019 10:20:05 +0200
Subject: [Buildroot] [PATCH 2/7] package/llvm: add BPF backend
In-Reply-To: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556785210-18237-3-git-send-email-jugurtha.belkalem@smile.fr>
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
index 83e9466..72d920e 100644
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
index 3c62285..ad4f3c4 100644
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
2.7.4

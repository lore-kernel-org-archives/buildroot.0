From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu,  3 Jan 2019 15:52:43 -0600
Subject: [Buildroot] [PATCH v6 2/7] package/llvm: install target
 binary/debug tools
In-Reply-To: <1546552368-50707-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1546552368-50707-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1546552368-50707-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The compiler-rt fuzzer and address sanitizer tools require additional
LLVM binary tools installed to allow stack trace decoding actively during
executable analysis.

https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
Changes
v1 -> v3
 - None

v4
 - Added new patch for llvm dependency on libxml2 which was noticed
   during testing

v5
 - Rebased post 2018.11 on master
---
 package/llvm/llvm.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index f33ec11..49034e0 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -197,8 +197,17 @@ HOST_LLVM_CONF_OPTS += \
 # We need to activate LLVM_INCLUDE_TOOLS, otherwise it does not generate
 # libLLVM.so
 LLVM_CONF_OPTS += \
-	-DLLVM_INCLUDE_TOOLS=ON \
+	-DLLVM_INCLUDE_TOOLS=ON
+
+# The llvm-symbolizer binary is used by the Compiler-RT Fuzzer
+# and AddressSanitizer tools for stack traces.
+ifeq ($(BR2_PACKAGE_COMPILER_RT),y)
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_TOOLS=ON
+else
+LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_TOOLS=OFF
+endif
 
 # Compiler-rt not in the source tree.
 # llvm runtime libraries are not in the source tree.
-- 
1.9.1

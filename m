From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:02 +0100
Subject: [Buildroot] [RFC PATCH v1 07/25] package/llvm: install target
 binary/debug tools
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-8-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

The compiler-rt fuzzer and address sanitizer tools require additional
LLVM binary tools installed to allow stack trace decoding actively during
executable analysis.

https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/llvm/llvm.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 5c413064c0..e20c909175 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -214,8 +214,17 @@ HOST_LLVM_CONF_OPTS += \
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
2.20.1
